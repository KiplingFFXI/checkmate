"""Effects use the native weapon-skill IDs after the loaded YAML overlays."""
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import effect_actions, effects


class WeaponSkillNamespaceTests(unittest.TestCase):
    def tree(self, entries):
        temporary = tempfile.TemporaryDirectory(prefix='checkmate_weapon_skills_')
        self.addCleanup(temporary.cleanup)
        folder = Path(temporary.name)
        (folder / 'data').mkdir()
        (folder / 'modules').mkdir()
        (folder / 'modules/init.txt').write_text('', encoding='ascii')
        document = {'meta': {'enum': [{'cpp': {'class': 'WeaponSkill', 'underlying': 'uint8_t'},
                                      'lua': {'table': 'xi.weaponskill'}}]}, 'weapon_skills': entries}
        (folder / 'data/weapon_skills.yaml').write_text(yaml.safe_dump(document), encoding='ascii')
        return folder

    def test_ids_are_not_list_positions_or_monster_ids(self):
        folder = self.tree({'armor_break': {'id': 83}, 'shield_break': {'id': 80}})
        self.assertEqual(effects.weapon_skill_rows(folder), [
            {'weaponskillid': 80, 'name': 'shield_break'},
            {'weaponskillid': 83, 'name': 'armor_break'},
        ])

    def test_loaded_overlays_follow_order_and_delete_rows(self):
        folder = self.tree({'shield_break': {'id': 80}, 'removed': {'id': 90}})
        (folder / 'modules/init.txt').write_text('first/data/extra\nsecond/data/extra\n', encoding='ascii')
        for name, entries in (
                ('first', {'runtime_move': {'id': 81}, 'removed': None}),
                ('second', {'runtime_move': {'id': 82}})):
            root = folder / 'modules' / name / 'data/extra'
            root.mkdir(parents=True)
            (root / 'weapon_skills.yaml').write_text(yaml.safe_dump({'weapon_skills': entries}), encoding='ascii')
        self.assertEqual(effects.weapon_skill_rows(folder), [
            {'weaponskillid': 80, 'name': 'shield_break'}, {'weaponskillid': 82, 'name': 'runtime_move'}])

    def test_loaded_overlay_cannot_remap_a_known_name(self):
        folder = self.tree({'shield_break': {'id': 80}})
        (folder / 'modules/init.txt').write_text('first/data\n', encoding='ascii')
        root = folder / 'modules/first/data'
        root.mkdir(parents=True)
        (root / 'weapon_skills.yaml').write_text('weapon_skills:\n  shield_break: {id: 81}\n', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'shield_break.*enum id 80'):
            effects.weapon_skill_rows(folder)

    def test_enum_ids_follow_current_base_data(self):
        folder = self.tree({'shield_break': {'id': 81}})
        self.assertEqual(effects.weapon_skill_rows(folder), [{'weaponskillid': 81, 'name': 'shield_break'}])

    def test_disabled_module_still_supplies_known_enum_names(self):
        folder = self.tree({'shield_break': {'id': 80}})
        root = folder / 'modules/disabled/data'
        root.mkdir(parents=True)
        (root / 'weapon_skills.yaml').write_text('weapon_skills:\n  module_move: {id: 88}\n', encoding='ascii')
        active = folder / 'modules/active/data/extra'
        active.mkdir(parents=True)
        (active / 'weapon_skills.yaml').write_text('weapon_skills:\n  module_move: {id: 89}\n', encoding='ascii')
        (folder / 'modules/init.txt').write_text('active/data/extra\n', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'module_move.*enum id 88'):
            effects.weapon_skill_rows(folder)

    def test_module_enum_additions_keep_the_first_id(self):
        folder = self.tree({'shield_break': {'id': 80}})
        for name, number in (('first', 88), ('second', 89)):
            root = folder / 'modules' / name / 'data'
            root.mkdir(parents=True)
            (root / 'weapon_skills.yaml').write_text('weapon_skills:\n  module_move: {id: %d}\n' % number, encoding='ascii')
        (folder / 'modules/init.txt').write_text('second/data\n', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'module_move.*enum id 88'):
            effects.weapon_skill_rows(folder)

    def test_mutually_exclusive_modules_can_reuse_an_enum_id(self):
        folder = self.tree({'shield_break': {'id': 80}})
        for name in ('first', 'second'):
            root = folder / 'modules' / name / 'data'
            root.mkdir(parents=True)
            (root / 'weapon_skills.yaml').write_text('weapon_skills:\n  %s_move: {id: 88}\n' % name, encoding='ascii')
        (folder / 'modules/init.txt').write_text('second/data\n', encoding='ascii')
        self.assertEqual(effects.weapon_skill_rows(folder), [
            {'weaponskillid': 80, 'name': 'shield_break'}, {'weaponskillid': 88, 'name': 'second_move'}])

    def test_deleting_a_row_does_not_hide_a_base_enum_collision(self):
        folder = self.tree({'shield_break': {'id': 80}, 'other': {'id': 80}})
        root = folder / 'modules/first/data'
        root.mkdir(parents=True)
        (root / 'weapon_skills.yaml').write_text('weapon_skills:\n  other: null\n', encoding='ascii')
        (folder / 'modules/init.txt').write_text('first/data\n', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'base weapon-skill enum reuses an id'):
            effects.weapon_skill_rows(folder)

    def test_only_loaded_sql_can_invalidate_the_yaml_namespace(self):
        folder = self.tree({'shield_break': {'id': 80}})
        root = folder / 'modules/old/sql'
        root.mkdir(parents=True)
        (root / 'weapon_skills.sql').write_text("UPDATE weapon_skills SET name = 'other' WHERE weaponskillid = 80;", encoding='ascii')
        self.assertEqual(effects.weapon_skill_rows(folder)[0]['name'], 'shield_break')
        (folder / 'modules/init.txt').write_text('old/sql\n', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'weapon_skills after its move to YAML'):
            effects.weapon_skill_rows(folder)

    def test_bad_names_ids_and_duplicate_ids_stop_the_read(self):
        for entries in (
                {'shield_break': {'id': True}}, {'shield_break': {'id': 256}},
                {'shield_break': {'id': -1}}, {'shield_break': {'id': 80.0}},
                {'shield_break': {}}, {'../shield_break': {'id': 80}},
                {'shield_break': None}, {'shield_break': {'id': 80}, 'other': {'id': 80}}, {}):
            with self.subTest(entries=entries), self.assertRaises(RuntimeError):
                effects.weapon_skill_rows(self.tree(entries))


@unittest.skipUnless(os.environ.get('CHECKMATE_EFFECTS_TREE'), 'CHECKMATE_EFFECTS_TREE not set')
class PinnedWeaponSkillNamespaceTests(unittest.TestCase):
    def test_breaks_keep_the_native_player_ids(self):
        rows = {row['name']: row['weaponskillid'] for row in effects.weapon_skill_rows(os.environ['CHECKMATE_EFFECTS_TREE'])}
        self.assertEqual({name: rows[name] for name in ('shield_break', 'armor_break', 'weapon_break', 'full_break')},
                         {'shield_break': 80, 'armor_break': 83, 'weapon_break': 85, 'full_break': 87})

    def test_native_id_decoder_and_packet_namespace_stay_guarded(self):
        tree = os.environ['CHECKMATE_EFFECTS_TREE']
        loaded = effects.aggro.lua_files_loaded(tree)
        original = Path.read_text
        for suffix, function in (
                ('/data/datasets/weapon_skills/dataset.cpp', 'Dataset::decode'),
                ('/entities/battle_entity.cpp', 'CBattleEntity::OnWeaponSkillFinished')):
            def changed(path, *args, **kwargs):
                text = original(path, *args, **kwargs)
                if path.as_posix().endswith(suffix):
                    start = text.index(function)
                    at = text.index('{', start)
                    text = text[:at + 1] + '\n changedNamespace();\n' + text[at + 1:]
                return text
            with self.subTest(source=suffix), mock.patch.object(Path, 'read_text', changed):
                with self.assertRaisesRegex(RuntimeError, 'Review Effects action namespaces'):
                    effect_actions.check_source(tree, loaded)

    def test_enum_generator_and_validation_helpers_stay_guarded(self):
        tree = os.environ['CHECKMATE_EFFECTS_TREE']
        loaded = effects.aggro.lua_files_loaded(tree)
        original = Path.read_text
        for suffix in effect_actions.NAMESPACE_GUARDS:
            def changed(path, *args, **kwargs):
                text = original(path, *args, **kwargs)
                return text + '\nchangedNamespace()\n' if path.as_posix().endswith(suffix) else text
            with self.subTest(source=suffix), mock.patch.object(Path, 'read_text', changed):
                with self.assertRaisesRegex(RuntimeError, 'Review the weapon-skill YAML namespace'):
                    effect_actions.check_source(tree, loaded)


if __name__ == '__main__':
    unittest.main()
