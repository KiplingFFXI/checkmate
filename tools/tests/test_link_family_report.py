"""Family labels are reportable without changing the underlying link lists or monster stats."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import data_report


def folder(path, families=None, built='same'):
    path.mkdir()
    (path / 'zones').mkdir()
    (path / 'bands.lua').write_text("return { built='same', content='era', rows={} }", encoding='ascii')
    (path / 'too_weak.lua').write_text('return { highest={} }', encoding='ascii')
    (path / 'pets.lua').write_text('return { version=1 }', encoding='ascii')
    field = '' if families is None else 'link_families = ' + families + ', '
    (path / 'zones/100.lua').write_text(
        "-- West Ronfaure (zone 100).\nreturn { built='%s', content='era', %s"
        "link_lists={ { sight={ 'Goblin A', 'Goblin B' } } },"
        "monsters={ { name='Goblin A', ids={1}, levels={ [10]={acc=50} }, links=1 } } }"
        % (built, field), encoding='ascii')
    return data_report.Folder(str(path))


class LinkFamilyReportTests(unittest.TestCase):
    def test_family_only_change_is_reported_without_monster_changes(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old = folder(root / 'old', "{ ['Goblin A']={id=133,name='Goblin'} }")
            new = folder(root / 'new', "{ ['Goblin A']={id=334,name='Moblin'} }")
            self.assertEqual(old.zones, new.zones)
            report, bullets = data_report.compare(old, new)
            self.assertIn('Link family labels changed in West Ronfaure (zone 100).', report)
            self.assertEqual(bullets, '- Updated family grouping for Links.\n')
            self.assertNotIn('monsters changed', report)
            self.assertNotIn('Accuracy', report)
            self.assertEqual(old.zones, new.zones)

    def test_family_addition_and_removal_are_both_reported(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old = folder(root / 'old')
            new = folder(root / 'new', "{ ['Goblin A']={id=133,name='Goblin'} }")
            for before, after in ((old, new), (new, old)):
                report, bullets = data_report.compare(before, after)
                self.assertIn('Link family labels changed', report)
                self.assertIn('family grouping for Links', bullets)

    def test_each_family_field_affects_report(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old = folder(root / 'old', "{ ['Goblin A']={id=133,name='Goblin'} }")
            for index, family in enumerate(("{ ['Goblin A']={id=334,name='Goblin'} }",
                                             "{ ['Goblin A']={id=133,name='Other label'} }",
                                             "{ ['Goblin B']={id=133,name='Goblin'} }")):
                report, _ = data_report.compare(old, folder(root / str(index), family))
                self.assertIn('Link family labels changed', report)

    def test_stamp_or_map_order_change_does_not_create_a_report(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            old = folder(root / 'old', "{ ['Goblin A']={id=133,name='Goblin'}, ['Goblin B']={id=133,name='Goblin'} }", 'before')
            new = folder(root / 'new', "{ ['Goblin B']={name='Goblin',id=133}, ['Goblin A']={name='Goblin',id=133} }", 'after')
            self.assertEqual(data_report.compare(old, new), (None, None))

    def test_missing_and_empty_metadata_have_the_same_meaning(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.assertEqual(data_report.compare(folder(root / 'old'), folder(root / 'new', '{}')), (None, None))


if __name__ == '__main__':
    unittest.main()
