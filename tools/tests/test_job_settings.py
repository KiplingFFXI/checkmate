"""Automatic TH keeps conditional bonuses and unreadable trait values out of exact totals."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import content, job_settings


class JobSettingsTests(unittest.TestCase):
    def test_traits_use_client_bits_without_double_counting_blue_traits(self):
        rows = {'traits': [dict(traitid=19, modifier=303, value=1, level=15, content_tag=None),
                           dict(traitid=64, modifier=303, value=1, level=45, content_tag=None),
                           dict(traitid=65, modifier=303, value=1, level=90, content_tag='ABYSSEA')],
                'blue_traits': [dict(traitid=19, modifier=303, value=1, job_points_only=0)]}
        with mock.patch.object(job_settings.modifiers, 'sql_rows', side_effect=lambda _, name: rows[name]):
            self.assertEqual(job_settings.traits('unused', content.Content(True, content.DEFAULT_ON), 303), {19: 1, 64: 1})
            rows['blue_traits'][0]['value'] = 2
            with self.assertRaisesRegex(RuntimeError, 'cannot distinguish'):
                job_settings.traits('unused', content.Content(True, content.DEFAULT_ON), 303)

    def test_disabled_content_and_job_points_do_not_add_traits(self):
        rows = {'traits': [dict(traitid=19, modifier=303, value=1, level=15, content_tag=None),
                           dict(traitid=65, modifier=303, value=1, level=70, content_tag='ABYSSEA')],
                'blue_traits': [dict(traitid=88, modifier=303, value=7, job_points_only=1)]}
        with mock.patch.object(job_settings.modifiers, 'sql_rows', side_effect=lambda _, name: rows[name]):
            self.assertEqual(job_settings.traits('unused', content.Content(True, content.DEFAULT_ON), 303), {19: 1})

    def test_equipment_uses_merged_values_and_keeps_latents_separate(self):
        rows = {'item_equipment': [dict(itemId=1, level=70), dict(itemId=2, level=75)],
                'item_mods': [dict(itemId=1, modId=303, value=1), dict(itemId=2, modId=303, value=-1)],
                'item_latents': [dict(itemId=2, modId=303, value=2)]}
        with mock.patch.object(job_settings.modifiers, 'sql_rows', side_effect=lambda _, name: rows[name]):
            self.assertEqual(job_settings.equipment('unused', 303),
                             ({1: {'level': 70, 'value': 1}, 2: {'level': 75, 'value': -1}}, {2: 75}))
            rows['item_mods'].append(dict(itemId=1, modId=303, value=2))
            with self.assertRaisesRegex(RuntimeError, 'Duplicate'):
                job_settings.equipment('unused', 303)
            rows['item_mods'][-1]['itemId'] = 3
            with self.assertRaisesRegex(RuntimeError, 'no equipment level'):
                job_settings.equipment('unused', 303)

    def test_changed_source_stops_the_build(self):
        with mock.patch.object(job_settings, 'source_digest', return_value='changed'):
            with self.assertRaisesRegex(RuntimeError, 'source changed'):
                job_settings.build('unused', None)

    def test_source_guard_follows_relevant_function_and_hooks(self):
        with tempfile.TemporaryDirectory(prefix='checkmate_job_settings_') as folder:
            root = Path(folder)
            (root / 'scripts').mkdir()
            (root / 'modules').mkdir()
            (root / 'modules/init.txt').write_text('', encoding='ascii')
            source = root / 'equipment.cpp'
            source.write_text('int32 GetScaledItemModifier() { return 1; }\nvoid Other() { int unrelated = 0; }', encoding='ascii')
            with mock.patch.object(job_settings, 'PATHS', (('equipment.cpp', 'int32 GetScaledItemModifier('),)), \
                    mock.patch.object(job_settings.aggro, 'lua_files_loaded', return_value=[]):
                before = job_settings.source_digest(folder)
                source.write_text(source.read_text().replace('unrelated = 0', 'unrelated = 42'), encoding='ascii')
                self.assertEqual(before, job_settings.source_digest(folder))
                source.write_text(source.read_text().replace('return 1', 'return 2'), encoding='ascii')
                self.assertNotEqual(before, job_settings.source_digest(folder))
                before = job_settings.source_digest(folder)
                (root / 'scripts/unrelated.lua').write_text('mob:setHP(42)', encoding='ascii')
                self.assertEqual(before, job_settings.source_digest(folder))
                (root / 'scripts/bonus.lua').write_text('player:addMod(xi.mod.TREASURE_HUNTER, 1)', encoding='ascii')
                self.assertNotEqual(before, job_settings.source_digest(folder))

    def test_native_module_hook_changes_are_checked(self):
        with tempfile.TemporaryDirectory(prefix='checkmate_job_settings_') as folder:
            root = Path(folder)
            (root / 'scripts').mkdir()
            (root / 'modules').mkdir()
            (root / 'modules/init.txt').write_text('bonus.cpp\n', encoding='ascii')
            source = root / 'modules/bonus.cpp'
            source.write_text('void bonus() { player.addMod(xi::Mod::TREASURE_HUNTER, 1); }', encoding='ascii')
            with mock.patch.object(job_settings, 'PATHS', ()), \
                    mock.patch.object(job_settings.aggro, 'lua_files_loaded', return_value=[]):
                before = job_settings.source_digest(folder)
                source.write_text(source.read_text().replace(', 1', ', 2'), encoding='ascii')
                self.assertNotEqual(before, job_settings.source_digest(folder))


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class PinnedJobSettingsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.data = job_settings.build(cls.tree, content.Content(True, content.DEFAULT_ON))

    def test_era_traits_and_gear_match_reviewed_source(self):
        self.assertEqual(self.data['traits'], {19: 1, 64: 1})
        era = {number: item for number, item in self.data['items'].items() if item['level'] <= 75}
        self.assertEqual(era, {14914: {'level': 75, 'value': 1}, 15107: {'level': 75, 'value': 1},
                               16480: {'level': 70, 'value': 1}, 25679: {'level': 1, 'value': 1}})
        self.assertEqual(self.data['conditional_items'], {})

    def test_bundled_metadata_matches_source_and_uses_lf(self):
        bundled = Path(__file__).resolve().parents[2] / 'checkmate/data/job_settings.lua'
        with tempfile.TemporaryDirectory(prefix='checkmate_job_settings_') as folder:
            target = Path(folder) / 'job_settings.lua'
            job_settings.write(target, self.data, SimpleNamespace(built='phoenix/live 9a4494d505',
                               content='RESTRICT_CONTENT on, rotz cop toau on, the rest off'))
            self.assertEqual(target.read_bytes(), bundled.read_bytes())
            self.assertNotIn(b'\r', target.read_bytes())


if __name__ == '__main__':
    unittest.main()
