"""The catalogue follows final per-spawn lesson rows without inventing source places."""
from copy import deepcopy
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import blue_finder

try:
    from lupa import luajit21
except ImportError:
    luajit21 = None


def lesson(number=577, name='Foot Kick', **fields):
    return dict(id=number, name=name, level=1, min_skill=0, skill_ids=[257], **fields)


def monster(**fields):
    row = {'name': 'Wild Rabbit', 'ids': [1, 2], 'levels': {1: {}, 2: {}, 5: {}},
           'info': {'blue': {'value': 'Foot Kick', 'spells': [lesson()], 'incomplete': False,
                             'notes': ['The monster must use the move.']}}}
    row.update(fields)
    return row


class FinderTests(unittest.TestCase):
    def build(self, *rows):
        builder = blue_finder.Builder()
        builder.add_zone(100, 'West Ronfaure', list(rows))
        return builder.finish()

    def test_identical_spawns_group_without_losing_disjoint_levels(self):
        data = self.build(monster())
        place = data['spells'][0]['monsters'][0]
        self.assertEqual(place['indices'], [1, 2])
        self.assertEqual(place['level_ranges'], [[1, 2], [5, 5]])
        self.assertEqual((place['low'], place['high']), (1, 5))
        self.assertEqual(data['version'], 1)

    def test_per_index_lesson_replaces_base_instead_of_adding_to_it(self):
        row = monster(info_by_index={2: {'blue': {'value': 'Other', 'spells': [lesson(626, 'Bomb Toss')]}}})
        data = self.build(row)
        by_id = {spell['id']: spell for spell in data['spells']}
        self.assertEqual(by_id[577]['monsters'][0]['indices'], [1])
        self.assertEqual(by_id[626]['monsters'][0]['indices'], [2])

    def test_resolved_empty_override_removes_that_source(self):
        row = monster(info_by_index={2: {'blue': {'value': 'No learnable Blue spells'}}})
        self.assertEqual(self.build(row)['spells'][0]['monsters'][0]['indices'], [1])

    def test_unknown_without_candidates_is_not_a_catalogue_claim(self):
        row = monster(info={'blue': {'value': 'Unknown', 'incomplete': True, 'notes': ['Unresolved kit.']}})
        self.assertEqual(self.build(row)['spells'], [])

    def test_partial_candidate_keeps_reason_and_status(self):
        row = monster()
        row['info']['blue'].update(incomplete=True, notes=['Another move is unresolved.'])
        place = self.build(row)['spells'][0]['monsters'][0]
        self.assertTrue(place['incomplete'])
        self.assertEqual(place['notes'], ['Another move is unresolved.'])

    def test_spawn_levels_split_sources_and_keep_exact_levels(self):
        row = monster(spawn_levels={1: (1, 2), 2: (5, 5)})
        places = self.build(row)['spells'][0]['monsters']
        self.assertEqual([place['level_ranges'] for place in places], [[[1, 2]], [[5, 5]]])
        self.assertEqual([place['indices'] for place in places], [[1], [2]])

    def test_missing_level_is_unknown_not_zero(self):
        place = self.build(monster(levels={}))['spells'][0]['monsters'][0]
        self.assertNotIn('low', place)
        self.assertNotIn('high', place)
        self.assertNotIn('level_ranges', place)

    def test_encounter_context_prevents_same_name_merge(self):
        first = monster(ids=[1])
        first['info']['spawn'] = {'value': 'Battlefield spawn', 'notes': ['Only during one fight.']}
        second = monster(ids=[2])
        second['info']['spawn'] = {'value': 'Lottery spawn', 'notes': ['Weather gate applies.']}
        places = self.build(first, second)['spells'][0]['monsters']
        self.assertEqual(len(places), 2)
        self.assertIn('Only during one fight.', places[0]['context'])
        self.assertIn('Weather gate applies.', places[1]['context'])

    def test_per_index_context_uses_effective_override(self):
        row = monster()
        row['info']['fight'] = {'value': 'Default fight'}
        row['info_by_index'] = {2: {'fight': {'value': 'Different fight'}}}
        places = self.build(row)['spells'][0]['monsters']
        self.assertEqual(len(places), 2)
        self.assertEqual([place['context'] for place in places], [['Fight: Default fight'], ['Fight: Different fight']])

    def test_unknown_spell_conditions_fail_instead_of_being_hidden(self):
        row = monster()
        row['info']['blue']['spells'] = [lesson(forced=True)]
        with self.assertRaisesRegex(RuntimeError, 'cannot display.*forced'):
            self.build(row)

    def test_different_skill_routes_do_not_merge(self):
        first, second = monster(ids=[1]), monster(ids=[2])
        second['info']['blue']['spells'][0]['skill_ids'] = [258]
        self.assertEqual(len(self.build(first, second)['spells'][0]['monsters']), 2)

    def test_conflicting_spell_requirements_fail(self):
        first, second = monster(), monster()
        second['info']['blue']['spells'][0]['min_skill'] = 100
        with self.assertRaisesRegex(RuntimeError, 'conflicting'):
            self.build(first, second)

    def test_builder_does_not_mutate_final_rows(self):
        row = monster()
        before = deepcopy(row)
        self.build(row)
        self.assertEqual(row, before)

    @unittest.skipIf(luajit21 is None, 'LuaJIT is required for the generated-file load check')
    def test_written_schema_loads_in_luajit(self):
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / 'blue_finder.lua'
            text = blue_finder.write(path, self.build(monster()), SimpleNamespace(built='pin 465ac4c', content='Original'))
            lua = luajit21.LuaRuntime()
            data = lua.execute(text)
            self.assertEqual(data.version, 1)
            self.assertEqual(data.spells[1].id, 577)
            self.assertEqual(data.spells[1].monsters[1].indices[2], 2)
            self.assertEqual(data.built, 'pin 465ac4c')
            self.assertIn('Missing entries', data.coverage)


if __name__ == '__main__':
    unittest.main()
