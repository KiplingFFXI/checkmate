"""Explicit and implicit module data roots follow the native merge order."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import overlays


class OverlayRootsTests(unittest.TestCase):
    def test_every_non_data_entry_enables_its_module_data(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root / 'modules').mkdir()
            (root / 'modules/init.txt').write_text(
                'phoenix/lua\nera/data/wotg\ncustom/cpp/example.cpp\nphoenix/data\nera/lua\n', encoding='ascii')
            actual = [Path(path).relative_to(root).as_posix() for path in overlays.data_roots(root)]
            self.assertEqual(actual, ['modules/phoenix/data', 'modules/era/data/wotg',
                                      'modules/custom/data', 'modules/era/data'])

    def test_overlay_files_keep_first_occurrence_and_merge_in_order(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root / 'modules').mkdir()
            (root / 'modules/init.txt').write_text('era/lua\nphoenix/data\nera/data\nera/data/wotg\n', encoding='ascii')
            for module, body in [('era/data', 'facts:\n  value: 1\n  keep: 2\n'),
                                 ('phoenix/data', 'facts:\n  value: 3\n'), ('era/data/wotg', 'facts:\n  keep: null\n')]:
                path = root / 'modules' / module / 'fixture.yaml'
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(body, encoding='ascii')
            roots = overlays.data_roots(root)
            self.assertEqual(len(overlays.overlay_files(roots, 'fixture')), 3)
            self.assertEqual(overlays.merge_overlays({}, roots, 'fixture'), {'facts': {'value': 3}})


if __name__ == '__main__':
    unittest.main()
