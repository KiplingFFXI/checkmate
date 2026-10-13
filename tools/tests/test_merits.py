"""Merit caps, input routes and source stamps stay consistent with their consumers."""
import copy
import os
from pathlib import Path
import re
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import crit, effects, lua_source, merits, modifiers, overlays, pets


def fixture():
    source = {'level_caps': [{'level': 0, 'cap': 0}, {'level': 10, 'cap': 1}, {'level': 75, 'cap': 10}],
              'upgrade_costs': {'general': [1] * 8, 'job': [1] * 3}, 'categories': {}}
    skills = {}
    for number, (key, (category, _, kind, fields)) in enumerate(merits.selections().items(), 1):
        job = category not in ('attributes', 'combat_skills', 'magic_skills', 'others')
        group = source['categories'].setdefault(category, {'max_upgrades': 8, 'merits': {}})
        if job:
            group['jobs'] = ['rdm']
        row = {'id': number, 'value': 2, 'upgrade_cost': 'job' if job else 'general'}
        if '_skill' in fields:
            row['skills'] = [fields['_skill']]
            row['jobs'] = ['war']
            skills[fields['_skill']] = number
        group['merits'][key] = row
    return {'merits': source}, skills


class MeritCatalogueTests(unittest.TestCase):
    def test_routes_include_only_estimated_inputs(self):
        document, skills = fixture()
        data = merits.catalogue(document, skills)
        entries = data['entries']
        self.assertEqual(len(entries), 47)
        self.assertEqual(entries['str']['kind'], 'parameter')
        for key in ('hand_to_hand_skill', 'throwing_skill', 'evasion_skill'):
            self.assertEqual(entries[key]['kind'], 'parameter')
            self.assertIn('server stat readings', entries[key]['conditions'][0])
        for key in ('shield_skill', 'parrying_skill', 'blue_magic_skill', 'wind_instrument_skill'):
            self.assertEqual(entries[key]['kind'], 'skill')
        self.assertEqual(entries['dex']['stat'], 'dex')
        for key in ('guarding_skill', 'enhancing_magic_skill', 'summoning_magic_skill', 'ambush', 'max_hp', 'vit'):
            self.assertNotIn(key, entries)

    def test_general_job_lists_do_not_become_calculation_gates(self):
        document, skills = fixture()
        data = merits.catalogue(document, skills)
        for key in ('shield_skill', 'dagger_skill', 'blue_magic_skill'):
            self.assertNotIn('job', data['entries'][key])
            self.assertNotIn('level', data['entries'][key])
        self.assertEqual(data['entries']['dia_iii']['job'], 5)
        self.assertEqual(data['entries']['dia_iii']['level'], 75)

    def test_own_cap_category_cap_and_cost_count_are_respected(self):
        document, skills = fixture()
        source = document['merits']
        source['categories']['combat_skills']['merits']['shield_skill']['max_upgrades'] = 4
        source['categories']['attributes']['max_upgrades'] = 5
        data = merits.catalogue(document, skills)
        self.assertEqual(data['entries']['shield_skill']['most'], 4)
        self.assertEqual(data['entries']['dex']['most'], 5)
        self.assertEqual(data['entries']['troubadour']['most'], 3)

    def test_disabled_missing_duplicate_or_mismatched_merits_stop(self):
        original, skills = fixture()
        for change in ('disabled', 'missing', 'duplicate', 'skill', 'job'):
            with self.subTest(change=change):
                document = copy.deepcopy(original)
                groups = document['merits']['categories']
                if change == 'disabled': groups['others']['merits']['crit_hit_rate']['max_upgrades'] = 0
                elif change == 'missing': del groups['attributes']['merits']['dex']
                elif change == 'duplicate': groups['attributes']['merits']['dex']['id'] = groups['attributes']['merits']['str']['id']
                elif change == 'skill': groups['combat_skills']['merits']['shield_skill']['skills'] = ['parry']
                else: groups['rdm_group_2']['jobs'] = ['rdm', 'blm']
                with self.assertRaises(RuntimeError): merits.catalogue(document, skills)

    def test_bad_level_caps_stop(self):
        for caps in ([], [(1, 0)], [(0, 0), (10, 2), (20, 1)], [(0, 0), (0, 1)], [(0, 0), (75, -1)]):
            with self.subTest(caps=caps):
                document, skills = fixture()
                document['merits']['level_caps'] = [dict(level=level, cap=cap) for level, cap in caps]
                with self.assertRaisesRegex(RuntimeError, 'level caps'): merits.catalogue(document, skills)

    def test_native_guard_is_path_independent_and_detects_changed_rule(self):
        with tempfile.TemporaryDirectory() as first, tempfile.TemporaryDirectory() as second:
            for folder in (first, second):
                for relative in merits.NATIVE_PATHS:
                    path = Path(folder, relative)
                    path.parent.mkdir(parents=True, exist_ok=True)
                    path.write_text('int rule() { return 75; } // comment\n', encoding='ascii')
                Path(folder, 'modules').mkdir()
                Path(folder, 'modules/init.txt').write_text('# no modules\n', encoding='ascii')
            baseline = merits.source_digest(first)
            self.assertEqual(baseline, merits.source_digest(second))
            with mock.patch.object(merits, 'SOURCE_GUARD', baseline):
                merits.check_source(second)
                Path(second, merits.NATIVE_PATHS[0]).write_text('int rule() { return 74; }', encoding='ascii')
                with self.assertRaisesRegex(RuntimeError, 'Merit source changed'): merits.check_source(second)

    def test_writer_keeps_metadata_arrays_and_stamp_and_is_deterministic(self):
        from lupa import luajit21
        document, skills = fixture()
        data = merits.catalogue(document, skills)
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'merits.lua')
            stamp = SimpleNamespace(built='pin hash', content='restricted content')
            first = merits.write(path, data, stamp)
            self.assertEqual(first, merits.write(path, data, stamp))
            decoded = luajit21.LuaRuntime().execute(first)
            self.assertEqual(decoded.built, stamp.built)
            self.assertEqual(decoded.content, stamp.content)
            self.assertEqual(decoded.level_caps[2][1], 10)
            self.assertEqual(decoded.entries.shield_skill.skill, skills['shield'])
            self.assertEqual(decoded.entries.troubadour.conditions[1], merits.CONDITIONS['troubadour'][0])


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class MeritSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.roots = overlays.data_roots(cls.tree)
        cls.data = merits.build(cls.tree, cls.roots)

    def test_pinned_caps_and_real_skill_ids(self):
        entries = self.data['entries']
        self.assertEqual(len(entries), 47)
        self.assertEqual({key: entries[key]['most'] for key in ('dex', 'shield_skill', 'sword_skill', 'blue_magic_skill')},
                         {'dex': 5, 'shield_skill': 4, 'sword_skill': 8, 'blue_magic_skill': 8})
        self.assertEqual({entries[key]['skill'] for key in entries if entries[key]['kind'] == 'skill'},
                         {30, 31, 32, 33, 35, 36, 37, 39, 40, 42, 43})
        self.assertEqual(entries['shield_skill']['id'], 226)
        self.assertEqual(entries['beast_affinity']['job'], 9)
        self.assertEqual(entries['angon']['job'], 14)

    def test_existing_direct_consumers_match_the_central_catalogue(self):
        entries = self.data['entries']
        crit_rows, caps = crit.merits(self.tree, self.roots)
        self.assertEqual(self.data['level_caps'], caps)
        rows = dict(crit_rows)
        rows.update(modifiers.merit_rows(self.tree, self.roots))
        effect_rows = effects.merit_rows(self.tree, self.roots)
        # These two durations use observed ranks, not editable merit choices.
        observed_only = {'penance', 'tomahawk'}
        self.assertTrue(observed_only <= effect_rows.keys())
        rows.update({key: row for key, row in effect_rows.items() if key not in observed_only})
        rows['beast_affinity'] = pets.beast_affinity(self.tree, self.roots)
        self.assertEqual(len(rows), 14)
        self.assertEqual(set(rows), {key for key, row in entries.items() if row['kind'] == 'direct'})
        for key, row in rows.items():
            self.assertEqual(entries[key]['id'], row['id'], key)
            self.assertEqual(entries[key]['most'], row['most'], key)
            self.assertEqual(entries[key]['per_rank'], row.get('per_rank', row.get('per_merit')), key)

    def test_observed_effect_merits_match_source_and_runtime_without_settings(self):
        from lupa import luajit21
        expected = {
            'penance': {'id': 2118, 'job': 2, 'level': 75, 'most': 3, 'base': 0, 'per_rank': 20},
            'tomahawk': {'id': 2050, 'job': 1, 'level': 75, 'most': 3, 'base': 15, 'per_rank': 15},
        }
        source = effects.merit_rows(self.tree, self.roots)
        path = Path(__file__).resolve().parents[2] / 'checkmate/core/effects.lua'
        text = path.read_text(encoding='utf8')
        start = re.search(r'\blocal\s+PREREQUISITE_MERITS\s*=\s*(?=\{)', text)
        self.assertIsNotNone(start, 'Effects must declare its observed merit rules')
        body = lua_source.block(text, start.end(), 'observed merits')
        rules = luajit21.LuaRuntime().execute('return {' + body + '}')
        self.assertEqual(set(rules.keys()), set(expected))
        for key, row in expected.items():
            with self.subTest(merit=key):
                self.assertNotIn(key, self.data['entries'])
                self.assertEqual(source[key], row)
                self.assertEqual(dict(rules[key]), {field: row[field] for field in ('id', 'job', 'level', 'most')})

    def test_bundled_catalogue_is_exactly_the_pinned_build(self):
        from lupa import luajit21
        path = Path(__file__).resolve().parents[2] / 'checkmate/data/merits.lua'
        text = path.read_text(encoding='ascii')
        decoded = luajit21.LuaRuntime().execute(text)
        with tempfile.TemporaryDirectory() as folder:
            regenerated = merits.write(Path(folder, 'merits.lua'), self.data,
                                       SimpleNamespace(built=decoded.built, content=decoded.content))
        self.assertEqual(text, regenerated)


if __name__ == '__main__':
    unittest.main()
