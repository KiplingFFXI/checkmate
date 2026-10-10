"""The catalogue keeps per-spawn BLU spells and confirmed source spawn routes."""
from copy import deepcopy
from pathlib import Path
import sys
import tempfile
import os
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import blue_finder, exists

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
        builder.add_zone(100, 'West Ronfaure', list(rows), {1, 2})
        return builder.finish()

    def test_identical_spawns_group_without_losing_disjoint_levels(self):
        data = self.build(monster())
        place = data['spells'][0]['monsters'][0]
        self.assertEqual(place['indices'], [1, 2])
        self.assertEqual(place['level_ranges'], [[1, 2], [5, 5]])
        self.assertEqual((place['low'], place['high']), (1, 5))
        self.assertEqual(data['version'], 2)

    def test_per_index_lesson_replaces_base_instead_of_adding_to_it(self):
        row = monster(info_by_index={2: {'blue': {'value': 'Other', 'spells': [lesson(626, 'Bomb Toss')]}}})
        data = self.build(row)
        by_id = {spell['id']: spell for spell in data['spells']}
        self.assertEqual(by_id[577]['monsters'][0]['indices'], [1])
        self.assertEqual(by_id[626]['monsters'][0]['indices'], [2])

    def test_resolved_empty_override_removes_that_source(self):
        row = monster(info_by_index={2: {'blue': {'value': 'No learnable BLU spells'}}})
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

    def test_unavailable_spawns_do_not_create_spell_locations(self):
        builder = blue_finder.Builder()
        builder.add_zone(100, 'West Ronfaure', [monster()], set())
        self.assertEqual(builder.finish()['spells'], [])

    def test_availability_is_applied_to_each_spawn_before_grouping(self):
        builder = blue_finder.Builder()
        builder.add_zone(100, 'West Ronfaure', [monster()], {2, 900})
        places = builder.finish()['spells'][0]['monsters']
        self.assertEqual(len(places), 1)
        self.assertEqual(places[0]['indices'], [2])

    def test_unknown_spawn_identity_is_not_a_location(self):
        builder = blue_finder.Builder()
        builder.add_zone(100, 'West Ronfaure', [monster(ids=[])], {1})
        self.assertEqual(builder.finish()['spells'], [])

    def test_missing_availability_cannot_fall_back_to_every_row(self):
        with self.assertRaisesRegex(RuntimeError, 'available spawn IDs'):
            blue_finder.Builder().add_zone(100, 'West Ronfaure', [monster()], None)

    @unittest.skipIf(luajit21 is None, 'LuaJIT is required for the generated-file load check')
    def test_written_schema_loads_in_luajit(self):
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / 'blue_finder.lua'
            text = blue_finder.write(path, self.build(monster()), SimpleNamespace(built='pin 465ac4c', content='Original'))
            lua = luajit21.LuaRuntime()
            data = lua.execute(text)
            self.assertEqual(data.version, 2)
            self.assertEqual(data.spells[1].id, 577)
            self.assertEqual(data.spells[1].monsters[1].indices[2], 2)
            self.assertEqual(data.built, 'pin 465ac4c')
            self.assertIn('A missing entry', data.coverage)


class StrictRoutesTests(unittest.TestCase):
    def zone(self, strict):
        zone = exists.Zone.__new__(exists.Zone)
        zone.strict = strict
        zone.enum = 'TEST'
        zone.keys = {'FIRST': [100]}
        zone.tables = {'First': [100, 101, 102]}
        zone.placed = {number: SimpleNamespace(script='First') for number in range(100, 110)}
        zone.by_script = {'First': [100, 101, 102]}
        return zone

    def test_plain_first_id_does_not_prove_every_same_script_spawn(self):
        refs = exists.Refs('SpawnMob(ID.mob.FIRST)', 'TEST')
        self.assertEqual(self.zone(True).resolve(refs), {100})
        self.assertEqual(self.zone(False).resolve(refs), {100, 101, 102})

    def test_unrelated_named_and_literal_lookups_are_not_spawn_proof(self):
        zone = self.zone(True)
        zone.keys['OTHER'] = [103]
        zone.placed[17000000] = SimpleNamespace(script='Other')
        refs = exists.Refs('SpawnMob(ID.mob.FIRST)\nGetMobByID(ID.mob.OTHER)\nDespawnMob(17000000)', 'TEST')
        self.assertEqual(zone.resolve(refs), {100})
        zone.strict = False
        self.assertEqual(zone.resolve(refs), {100, 101, 102, 103, 17000000})

    def test_local_alias_and_positive_respawn_receiver_remain_proof(self):
        for text in ('local id = ID.mob.FIRST\nSpawnMob(id)',
                     'local nm = GetMobByID(ID.mob.FIRST)\nnm:setRespawnTime(60)',
                     'GetMobByID(ID.mob.FIRST):setRespawnTime(60)'):
            self.assertEqual(self.zone(True).resolve(exists.Refs(text, 'TEST')), {100}, text)

    def test_disabled_or_unreadable_respawn_does_not_enable_a_spawn(self):
        for value in ('0', 'waitTime'):
            refs = exists.Refs('GetMobByID(ID.mob.FIRST):setRespawnTime(%s)' % value, 'TEST')
            self.assertEqual(self.zone(True).resolve(refs), set())

    def test_ambiguous_local_and_loop_names_are_not_cross_scope_proof(self):
        zone = self.zone(True)
        zone.keys['OTHER'] = [103]
        text = ('local function a()\nlocal nm = ID.mob.FIRST\nSpawnMob(nm)\nend\n'
                'local function b()\nlocal nm = ID.mob.OTHER\nGetMobByID(nm)\nend')
        self.assertEqual(zone.resolve(exists.Refs(text, 'TEST')), set())
        text = ('for i = 1, 2 do\nSpawnMob(ID.mob.FIRST + i)\nend\n'
                'for i = 5, 8 do\nGetMobByID(ID.mob.OTHER + i)\nend')
        self.assertEqual(zone.resolve(exists.Refs(text, 'TEST')), set())

    def test_unknown_named_and_self_offsets_are_not_proof(self):
        for text in ('SpawnMob(ID.mob.FIRST + unknown)',
                     'SpawnMob(mob:getID() + unknown)',
                     'local base = mob:getID()\nSpawnMob(base + unknown)'):
            refs = exists.Refs(text, 'TEST')
            self.assertEqual(self.zone(True).resolve(refs, [100]), set(), text)
            self.assertTrue(self.zone(False).resolve(refs, [100]), text)

    def test_literal_and_bounded_loop_offsets_remain_proof(self):
        for text in ('for i = 1, 2 do SpawnMob(ID.mob.FIRST + i) end',
                     'for i = 1, 2 do SpawnMob(mob:getID() + i) end',
                     'local base = mob:getID()\nfor i = 1, 2 do SpawnMob(base + i) end'):
            self.assertEqual(self.zone(True).resolve(exists.Refs(text, 'TEST'), [100]), {101, 102})

    def test_unknown_astral_offset_does_not_fall_back_to_default(self):
        kind = SimpleNamespace(attributes={'mob_mods': {}})
        zone = self.zone(True)
        self.assertEqual(zone.astral_offsets(kind, 'mob:setMobMod(xi.mobMod.ASTRAL_PET_OFFSET, petData.offset)'), [])
        self.assertEqual(zone.astral_offsets(kind, ''), [2])
        self.assertEqual(zone.astral_offsets(kind, 'mob:setMobMod(xi.mobMod.ASTRAL_PET_OFFSET, 4)'), {4})


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class AvailabilitySourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import export_data
        from export import content, instances, zones
        cls.ctx = export_data.Context(os.environ['CHECKMATE_SOURCE_TREE'], content.Content(True, content.DEFAULT_ON))
        cls.kinds = {}
        for number, name, script, types in export_data.zone_list(cls.ctx):
            if number not in {2, 46, 47, 48, 51, 52, 58, 59, 66, 100, 103, 220, 221, 227, 228}:
                continue
            cls.kinds[number] = (instances.build(cls.ctx, number, script) if 'instanced' in types
                                 else zones.build(cls.ctx, name, script, 'dynamis' in types))

    def available(self, number, name):
        kinds = [kind for kind in self.kinds[number] if kind.name == name]
        self.assertTrue(kinds, 'fixture must remain a real source row')
        return set().union(*(kind.available_ids for kind in kinds))

    def test_unimplemented_besieged_spawns_remain_rows_but_not_locations(self):
        self.assertEqual(self.available(48, 'Fighting Flan'), set())
        self.assertEqual(self.available(51, 'Fighting Flan'), set())

    def test_natural_and_scripted_lottery_spawns_remain_locations(self):
        self.assertTrue(self.available(100, 'Wild Rabbit'))
        self.assertEqual(self.available(103, 'Valkurm Emperor'), {334})

    def test_native_slot_preserves_ph_output_with_current_rules(self):
        for ph_name, ph, nm in [('Damselfly', 330, 334), ('Giant Bat', 458, 460)]:
            kind = next(kind for kind in self.kinds[103] if kind.name == ph_name and ph in kind.ids)
            self.assertEqual(kind.ph_for[ph], {nm})
            rule = kind.ph_rules[ph][nm]
            self.assertEqual((rule['chance'], rule['cooldown_min'], rule['cooldown_max']), (15, 3600, 3600))

    def test_ferry_deck_and_separate_nm_routes_remain_available(self):
        for number in (220, 221):
            self.assertIn(10, self.available(number, 'Sea Monk'))
            self.assertTrue(self.available(number, 'Sea Horror'))
        self.assertTrue(self.available(59, 'Almighty Apkallu'))
        self.assertTrue(self.available(58, 'Proteus'))

    def test_ferry_spawn_notes_keep_night_and_weather_conditions(self):
        for number, name, expected in [(220, 'Phantom', '04:00'), (220, 'Water Elemental', 'weather ends')]:
            kind = next(kind for kind in self.kinds[number] if kind.name == name)
            info, _ = self.ctx.encounters.read(kind)
            self.assertIn('Ferry deck lottery', info['spawn']['value'])
            self.assertIn(expected, ' '.join(info['spawn']['notes']))
            self.assertNotIn('Base respawn delay:', ' '.join(info['spawn']['notes']))

    def test_unknown_clone_offsets_do_not_enable_orcfeltrap(self):
        self.assertEqual(self.available(2, 'Orcfeltrap'), set())

    def test_lottery_slots_do_not_enable_grand_marid(self):
        self.assertEqual(self.available(51, 'Grand Marid'), set())
        self.assertEqual(self.available(52, 'Grand Marid'), set())

    def test_instances_keep_only_spawns_from_accessible_encounters(self):
        from export import instances
        sql = self.ctx.instance_sql
        possible, blocked = set(), set()
        for instance in sql.instances:
            if instance['instance_zone'] != 66:
                continue
            destination = possible if instances.can_enter(self.ctx.tree, sql, instance, 'Mamool_Ja_Training_Grounds') else blocked
            destination.update(entity['id'] & 0xFFF for entity in sql.entities
                               if entity['instanceid'] == instance['instanceid'])
        actual = set().union(*(kind.available_ids for kind in self.kinds[66]))
        self.assertTrue(possible)
        self.assertTrue(blocked - possible)
        self.assertTrue(actual)
        self.assertTrue(actual <= possible)
        self.assertFalse(actual & (blocked - possible))


if __name__ == '__main__':
    unittest.main()
