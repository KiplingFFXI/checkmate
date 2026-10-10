"""Shield and Parry source inputs, uncertainty and rate parity."""
import os
from pathlib import Path
import sys
import subprocess
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import defenses, lua_writer, overlays


class DefenseInputTests(unittest.TestCase):
    def test_zone_reader_can_import_without_loading_writer_first(self):
        result = subprocess.run([sys.executable, '-c', 'from export import zones'],
                                cwd=Path(__file__).resolve().parents[1], capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_spawn_weapon_skill_differences_do_not_share_a_row(self):
        from export import zones
        first = {'attributes': {'combat': {'skill': 'sword', 'delay': 100}}}
        second = {'attributes': {'combat': {'skill': 'hand_to_hand', 'delay': 100}}}
        delay_only = {'attributes': {'combat': {'skill': 'sword', 'delay': 200}}}
        self.assertNotEqual(zones.spawn_key(first), zones.spawn_key(second))
        self.assertEqual(zones.spawn_key(first), zones.spawn_key(delay_only))

    def kind(self, skill='none', pool=None, changes=False):
        kind = SimpleNamespace(attributes={'source': {'combat': {'skill': skill}}},
                               effects=SimpleNamespace(job_changes=changes), flags=set())
        if pool is not None:
            kind.instance_pool = {'cmbSkill': pool}
        return kind

    def test_monster_none_skill_is_not_hand_to_hand(self):
        tables = SimpleNamespace(cap_by_rank=lambda rank, level: rank * 100 + level)
        self.assertEqual(defenses.attack_skill(self.kind(), tables, 75), 0)
        self.assertEqual(defenses.attack_skill(self.kind('hand_to_hand'), tables, 75), 375)
        self.assertEqual(defenses.attack_skill(self.kind('sword'), tables, 150), 399)
        self.assertEqual(defenses.attack_skill(self.kind('archery'), tables, 75), 0)
        self.assertEqual(defenses.attack_skill(self.kind('marksmanship'), tables, 75), 0)
        self.assertEqual(defenses.attack_skill(self.kind('throwing'), tables, 75), 0)

    def test_instance_weapon_overrides_the_species_weapon(self):
        tables = SimpleNamespace(cap_by_rank=lambda rank, level: 256)
        self.assertEqual(defenses.attack_skill(self.kind('none', pool=3), tables, 75), 256)
        self.assertEqual(defenses.attack_skill(self.kind('sword', pool=0), tables, 75), 0)

    def test_unknown_weapon_is_not_silently_a_zero_skill(self):
        kind = self.kind('unknown')
        self.assertIsNone(defenses.attack_skill(kind, None, 75))
        self.assertIn('scripted_attack_skill', kind.flags)

    def test_job_changes_qualify_the_stored_weapon_skill(self):
        kind = self.kind('none', changes=True)
        self.assertEqual(defenses.attack_skill(kind, None, 75), 0)
        self.assertIn('scripted_attack_skill', kind.flags)

    def test_latents_keep_positive_and_negative_uncertainty(self):
        rows = {'item_equipment': [{'itemId': 1, 'name': 'test', 'level': 50, 'shieldSize': 3}],
                'item_mods': [{'itemId': 1, 'modId': 110, 'value': 10}],
                'item_latents': [{'itemId': 1, 'modId': 110, 'value': 5},
                                {'itemId': 1, 'modId': 110, 'value': -3}]}
        ids = {'parry': 110, 'inquartata': 963, 'palisade_block_bonus': 1066, 'reprisal_block_bonus': 1067}
        with mock.patch.object(defenses.tables, 'read_enum', return_value=ids), \
             mock.patch.object(defenses.modifiers, 'sql_rows', side_effect=lambda _, name: rows[name]):
            shields, gear = defenses.equipment('tree')
        self.assertEqual(shields[1]['size'], 3)
        self.assertEqual(gear[1]['parry'], 10)
        self.assertEqual(gear[1]['conditional_parry'], {'low': -3, 'high': 5})

    def test_new_supported_trait_stops_the_export(self):
        ids = {'shield': 109, 'parry': 110, 'inquartata': 963,
               'palisade_block_bonus': 1066, 'reprisal_block_bonus': 1067}
        row = {'modifier': 963, 'value': 5, 'level': 50, 'content_tag': 'SOA', 'name': 'Inquartata'}
        with mock.patch.object(defenses.tables, 'read_enum', return_value=ids), \
             mock.patch.object(defenses.modifiers, 'sql_rows', return_value=[row]):
            allowed = SimpleNamespace(allows=lambda tag: tag != 'SOA')
            defenses.check_traits('tree', allowed)
            row['content_tag'] = ''
            with self.assertRaisesRegex(RuntimeError, 'enabled Shield or Parry'):
                defenses.check_traits('tree', allowed)

    def test_writer_keeps_zero_attack_skill_and_the_flag(self):
        values = dict.fromkeys(lua_writer.LEVEL_FIELDS, 20)
        values['attack_skill'] = 0
        self.assertIn('attack_skill = 0', '\n'.join(lua_writer.level_lines(75, values, '')))
        self.assertIn('scripted_attack_skill', lua_writer.FLAG_ORDER)
        values.pop('attack_skill')
        self.assertNotIn('attack_skill', '\n'.join(lua_writer.level_lines(75, values, '')))
        values.pop('def')
        with self.assertRaises(KeyError):
            lua_writer.level_lines(75, values, '')


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class DefenseSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']

    def test_native_rates_match_each_branch(self):
        self.assertGreater(defenses.check_math(self.tree, Path(__file__).resolve().parents[2] / 'checkmate'), 5000)

    def test_source_metadata_covers_shields_jobs_and_known_gates(self):
        data = defenses.build(self.tree, overlays.data_roots(self.tree))
        self.assertEqual(data['shield_rates'], {1: 55, 2: 40, 3: 45, 4: 30, 5: 50, 6: 100})
        self.assertEqual(data['parry_caps'][75], 276)
        self.assertEqual(data['parry_caps'][99], 424)
        self.assertEqual(data['parry_caps'][100], 425)
        self.assertEqual(data['parry_caps'][255], 580)
        self.assertGreater(data['job_ranks'][7]['block'], 0)
        self.assertEqual(data['job_ranks'][2]['block'], 0)
        self.assertIn('Charm', data['prevent_effects'].values())
        self.assertIn('Charm II', data['prevent_effects'].values())
        self.assertEqual(data['gear'][12514]['parry'], 10)
        self.assertEqual(data['gear'][12398]['conditional_parry'], {'low': 0, 'high': 5})
        self.assertTrue(any(row['level'] > 75 for row in data['shields'].values()))

    def test_changed_source_cannot_silently_change_rates(self):
        original = Path.read_text
        def changed(path, *args, **kwargs):
            text = original(path, *args, **kwargs)
            if path.as_posix().endswith(defenses.PHYSICAL):
                return text.replace('* 0.2325', '* 0.25')
            return text
        with mock.patch.object(Path, 'read_text', changed):
            with self.assertRaisesRegex(RuntimeError, 'Shield or Parry source changed'):
                defenses.check_source(self.tree)

    def test_parity_detects_changed_formula_separately_from_hash(self):
        original = defenses.effects.source
        def changed(tree, path):
            text = original(tree, path)
            return text.replace('* 0.2325', '* 0.25') if path == defenses.PHYSICAL else text
        with mock.patch.object(defenses.effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'Shield source parity failed'):
                defenses.check_math(self.tree, Path(__file__).resolve().parents[2] / 'checkmate')

    def test_generated_metadata_loads_in_luajit(self):
        from lupa import luajit21
        data = defenses.build(self.tree, overlays.data_roots(self.tree))
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / 'defenses.lua'
            text = defenses.write(path, data, SimpleNamespace(built='test', content='test'))
            loaded = luajit21.LuaRuntime().execute(text)
            self.assertEqual(loaded.version, 1)
            self.assertEqual(loaded.parry_caps[75], 276)


if __name__ == '__main__':
    unittest.main()
