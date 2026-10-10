"""Blue learning source changes must not silently change an exact displayed roll."""
import os
from copy import deepcopy
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import content, modifiers, overlays, source_parity


class LearningEquipmentTests(unittest.TestCase):
    def test_direct_and_conditional_learning_bonuses_are_separate(self):
        enums = {key: number for number, key in enumerate(modifiers.WANTED, 1)}
        number = enums['blue_learn_chance']
        rows = {'item_equipment': [dict(itemId=i, level=level, name=str(i)) for i, level in [(1, 56), (2, 74), (3, 99)]],
                'item_mods': [dict(itemId=1, modId=number, value=10), dict(itemId=3, modId=number, value=14)],
                'item_latents': [dict(itemId=2, modId=number, value=11)]}
        with mock.patch.object(modifiers.tables, 'read_enum', return_value=enums), \
                mock.patch.object(modifiers, 'sql_rows', side_effect=lambda _, name: rows[name]):
            out = modifiers.equipment('unused')
        self.assertEqual(out[1]['blue_learning'], 10)
        self.assertTrue(out[2]['conditional_blue_learning'])
        self.assertNotIn('blue_learning', out[2])
        self.assertNotIn('conditional_magic', out[2])
        self.assertNotIn(3, out)

    def test_changed_source_fails(self):
        with mock.patch.object(modifiers, 'learning_digest', return_value='changed'):
            with self.assertRaisesRegex(RuntimeError, 'Blue learning source changed'):
                modifiers.learning_rate('unused', None)

    def test_new_augment_requires_a_reader(self):
        with mock.patch.object(modifiers, 'learning_digest', return_value=modifiers.LEARNING_GUARD), \
                mock.patch.object(modifiers.tables, 'read_enum', return_value={'blue_learn_chance': 945}), \
                mock.patch.object(modifiers, 'sql_rows', return_value=[{'modId': 945, 'value': 1, 'isPet': 0}]):
            with self.assertRaisesRegex(RuntimeError, 'augment needs'):
                modifiers.learning_rate('unused', None)

    def test_new_enabled_trait_requires_a_reader(self):
        rows = {'augments': [], 'traits': [{'modifier': 945, 'value': 1, 'level': 75, 'content_tag': None}]}
        with mock.patch.object(modifiers, 'learning_digest', return_value=modifiers.LEARNING_GUARD), \
                mock.patch.object(modifiers.tables, 'read_enum', return_value={'blue_learn_chance': 945}), \
                mock.patch.object(modifiers, 'sql_rows', side_effect=lambda _, name: rows[name]):
            with self.assertRaisesRegex(RuntimeError, 'trait needs'):
                modifiers.learning_rate('unused', content.Content(True, ['rotz', 'cop', 'toau']))

    def test_scripted_learning_route_changes_guard(self):
        with tempfile.TemporaryDirectory(prefix='checkmate_learning_') as folder:
            root = Path(folder)
            (root / 'scripts/effects').mkdir(parents=True)
            (root / 'modules').mkdir()
            (root / 'modules/init.txt').write_text('', encoding='utf8')
            with mock.patch.object(modifiers, 'LEARNING_PATHS', ()), \
                    mock.patch.object(modifiers.aggro, 'lua_files_loaded', return_value=[]):
                before = modifiers.learning_digest(folder)
                (root / 'scripts/new_bonus.lua').write_text('player:addMod(xi.mod.BLUE_LEARN_CHANCE, 10)', encoding='utf8')
                self.assertNotEqual(before, modifiers.learning_digest(folder))

    def test_loaded_native_module_changes_guard(self):
        with tempfile.TemporaryDirectory(prefix='checkmate_learning_') as folder:
            root = Path(folder)
            (root / 'scripts/effects').mkdir(parents=True)
            (root / 'modules').mkdir()
            (root / 'modules/init.txt').write_text('learning.cpp\n', encoding='utf8')
            module = root / 'modules/learning.cpp'
            module.write_text('void learning() {}', encoding='utf8')
            with mock.patch.object(modifiers, 'LEARNING_PATHS', ()), \
                    mock.patch.object(modifiers.aggro, 'lua_files_loaded', return_value=[]):
                before = modifiers.learning_digest(folder)
                module.write_text('void learning() { chance = 50; }', encoding='utf8')
                self.assertNotEqual(before, modifiers.learning_digest(folder))


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class PinnedLearningTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.allowed = content.Content(True, ['rotz', 'cop', 'toau'])
        cls.data = modifiers.build(cls.tree, overlays.data_roots(cls.tree), cls.allowed)

    def test_native_roll_is33_from100(self):
        self.assertEqual(self.data['learning_rate'], {'base': 33, 'outcomes': 100, 'main_job': 16})

    def test_only_the_two_era_gloves_contribute(self):
        found = {number: item['blue_learning'] for number, item in self.data['items'].items() if 'blue_learning' in item}
        self.assertEqual(found, {14928: 10, 15024: 11})
        self.assertFalse(any(item.get('conditional_blue_learning') for item in self.data['items'].values()))

    def test_generated_learning_values_match_independent_parity(self):
        source_parity.check_modifiers(self.tree, self.data)

    def test_wrong_generated_learning_base_fails_parity(self):
        changed = deepcopy(self.data)
        changed['learning_rate']['base'] = 34
        with self.assertRaisesRegex(RuntimeError, 'generated Blue learning roll'):
            source_parity.check_modifiers(self.tree, changed)

    def test_wrong_generated_learning_bonus_fails_parity(self):
        changed = deepcopy(self.data)
        changed['items'][14928]['blue_learning'] = 11
        with self.assertRaisesRegex(RuntimeError, 'generated Blue learning equipment'):
            source_parity.check_modifiers(self.tree, changed)

    def test_invented_conditional_learning_bonus_fails_parity(self):
        changed = deepcopy(self.data)
        changed['items'][14928]['conditional_blue_learning'] = True
        with self.assertRaisesRegex(RuntimeError, 'generated Blue learning equipment'):
            source_parity.check_modifiers(self.tree, changed)


if __name__ == '__main__':
    unittest.main()
