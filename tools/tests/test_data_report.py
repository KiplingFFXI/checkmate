"""A finder-only refresh must appear in the report without counting its source stamps."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
try:
    import data_report
except ModuleNotFoundError as error:
    if error.name != 'lupa':
        raise
    data_report = None


def folder(path, finder=True, zone=100, built='pin before', content='Original'):
    path.mkdir()
    (path / 'zones').mkdir()
    (path / 'bands.lua').write_text("return { built = 'same', content = 'Original', rows = {} }", encoding='ascii')
    (path / 'too_weak.lua').write_text('return { highest = {} }', encoding='ascii')
    (path / 'pets.lua').write_text('return { version = 1 }', encoding='ascii')
    if finder:
        (path / 'blue_finder.lua').write_text(
            "return { built = '%s', content = '%s', version = 1, spells = {"
            "{ id = 577, name = 'Foot Kick', min_skill = 0, monsters = {"
            "{ zone = %d, name = 'Wild Rabbit', indices = { 1 }, level_ranges = { { 1, 5 } } } } } } }"
            % (built, content, zone), encoding='ascii')
    return data_report.Folder(str(path))


@unittest.skipIf(data_report is None, 'LuaJIT is required to compare generated files')
class FinderReportTests(unittest.TestCase):
    def test_job_settings_changes_are_reported_without_build_stamps(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            absent = folder(root / 'old')
            folder(root / 'new')
            body = "return { built='%s', content='%s', traits={[19]=%d} }"
            for place, stamp in [('old', 'before'), ('new', 'after')]:
                (root / place / 'job_settings.lua').write_text(body % (stamp, stamp, 1), encoding='ascii')
            old = data_report.Folder(str(root / 'old'))
            new = data_report.Folder(str(root / 'new'))
            self.assertEqual(data_report.compare(old, new), (None, None))
            for before, after in ((absent, old), (old, absent)):
                report, bullets = data_report.compare(before, after)
                self.assertIn('job_settings.lua changed.', report)
                self.assertIn('Treasure Hunter traits or equipment bonuses changed.', bullets)
            (root / 'new/job_settings.lua').write_text(body % ('after', 'after', 2), encoding='ascii')
            report, bullets = data_report.compare(old, data_report.Folder(str(root / 'new')))
            self.assertIn('job_settings.lua changed.', report)
            self.assertIn('Treasure Hunter traits or equipment bonuses changed.', bullets)

    def test_merit_metadata_changes_are_reported_but_stamps_are_not(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            absent = folder(root / 'old')
            folder(root / 'new')
            body = "return { built='%s', content='%s', entries={shield_skill={id=226,most=%d}} }"
            for place, stamp in [('old', 'before'), ('new', 'after')]:
                (root / place / 'merits.lua').write_text(body % (stamp, stamp, 4), encoding='ascii')
            old = data_report.Folder(str(root / 'old'))
            new = data_report.Folder(str(root / 'new'))
            self.assertEqual(data_report.compare(old, new), (None, None))
            for before, after in ((absent, old), (old, absent)):
                report, bullets = data_report.compare(before, after)
                self.assertIn('merits.lua changed.', report)
                self.assertNotIn('monsters changed', report)
            (root / 'new/merits.lua').write_text(body % ('after', 'after', 5), encoding='ascii')
            report, bullets = data_report.compare(old, data_report.Folder(str(root / 'new')))
            self.assertIn('merits.lua changed.', report)
            self.assertIn('merit values, caps or input rules changed.', bullets)

    def test_pdif_rules_are_compared_without_build_stamps(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            folder(root / 'old')
            folder(root / 'new')
            for place, stamp in [('old', 'before'), ('new', 'after')]:
                (root / place / 'pdif.lua').write_text("return { built='%s', content='era', melee_cap=2 }" % stamp)
            old, new = data_report.Folder(str(root / 'old')), data_report.Folder(str(root / 'new'))
            self.assertEqual(data_report.compare(old, new), (None, None))
            (root / 'new/pdif.lua').write_text("return { built='after', melee_cap=3 }")
            report, bullets = data_report.compare(old, data_report.Folder(str(root / 'new')))
            self.assertIn('pdif.lua changed.', report)
            self.assertIn('physical damage multiplier rules changed.', bullets)

    def test_defense_rules_ignore_stamps_but_report_input_changes(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            folder(root / 'old')
            folder(root / 'new')
            for place, stamp in [('old', 'before'), ('new', 'after')]:
                (root / place / 'defenses.lua').write_text("return { built='%s', content='era', shield_rates={55} }" % stamp)
            old = data_report.Folder(str(root / 'old'))
            self.assertEqual(data_report.compare(old, data_report.Folder(str(root / 'new'))), (None, None))
            (root / 'new/defenses.lua').write_text("return { built='after', shield_rates={60} }")
            report, bullets = data_report.compare(old, data_report.Folder(str(root / 'new')))
            self.assertIn('defenses.lua changed.', report)
            self.assertIn('Shield and Parry inputs', bullets)

    def test_finder_only_source_change_is_reported(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old, new = folder(root / 'old'), folder(root / 'new', zone=101)
            report, bullets = data_report.compare(old, new)
        self.assertIn('blue_finder.lua changed.', report)
        self.assertEqual(bullets, '- The Blue Magic source catalogue changed.\n')
        self.assertNotIn('monsters changed', report)

    def test_finder_build_and_content_stamps_are_ignored(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old = folder(root / 'old')
            new = folder(root / 'new', built='pin after', content='Different stamp')
            self.assertEqual(data_report.compare(old, new), (None, None))
            self.assertNotIn('built', new.blue_finder)
            self.assertNotIn('content', new.blue_finder)

    def test_unchanged_finder_writes_no_report(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.assertEqual(data_report.compare(folder(root / 'old'), folder(root / 'new')), (None, None))

    def test_finder_addition_and_removal_are_reported_for_older_builds(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old, new = folder(root / 'old', finder=False), folder(root / 'new')
            for before, after in ((old, new), (new, old)):
                report, bullets = data_report.compare(before, after)
                self.assertIn('blue_finder.lua changed.', report)
                self.assertIn('Blue Magic source catalogue changed.', bullets)


if __name__ == '__main__':
    unittest.main()
