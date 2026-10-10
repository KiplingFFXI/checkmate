"""The danger-storage benchmark must preserve unrelated zone-level family labels."""
from copy import deepcopy
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import benchmark_danger_sharing as benchmark
from export import lua_writer
from lupa import luajit21


def zone():
    return {'built': 'same', 'content': 'era', 'by_name': {},
            'link_lists': [{'sight': ["Goblin's Helper", 'Unresolved Name']}],
            'link_families': {"Goblin's Helper": {'id': 133, 'name': 'Goblin'}},
            'monsters': [{'name': 'Helper [Variant]', 'ids': [1], 'levels': {}, 'links': 1},
                         {'name': 'Caller', 'ids': [2], 'levels': {}, 'links': 1}]}


def zone_source():
    return """-- Test (zone 100).
return { built='same', content='era', by_name={},
    link_lists={ { sight={ "Goblin's Helper", 'Unresolved Name' } } },
    link_families={ ["Goblin's Helper"]={id=133,name='Goblin'} },
    monsters={
        {name='Helper [Variant]',ids={1},levels={},links=1},
        {name='Caller',ids={2},levels={},links=1}
    }
}
"""


class BenchmarkFamilyTests(unittest.TestCase):
    def test_round_trip_preserves_metadata_and_old_links_in_both_layouts(self):
        value = zone()
        before = deepcopy(value)
        lua = luajit21.LuaRuntime()
        original = lua.execute(zone_source())
        with tempfile.TemporaryDirectory() as temporary:
            inputs = benchmark.input_rows(value)
            for share in (False, True):
                text = lua_writer.write_zone(Path(temporary) / '100.lua', 100, 'Test', inputs,
                                             SimpleNamespace(built='same', content='era'), share_dangers=share)
                text = benchmark.carry_link_families(text, value)
                loaded = lua.execute(text)
                self.assertIsNone(benchmark.equality(lua)(original, loaded))
                self.assertEqual(loaded.link_families["Goblin's Helper"].id, 133)
                self.assertIsNone(loaded.link_families['Unresolved Name'])
                self.assertEqual(loaded.monsters[1].name, 'Helper [Variant]')
        self.assertEqual(value, before)

    def test_full_benchmark_accepts_zone_metadata(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / 'zones').mkdir()
            (root / 'zones/100.lua').write_text(zone_source(), encoding='ascii')
            result = benchmark.run(root, 3)
            self.assertEqual(result['zones'], 1)
            self.assertTrue(result['semantic_match'])
            self.assertTrue(result['finder']['all_source_contexts_match'])

    def test_older_zone_without_family_metadata_is_unchanged(self):
        text = 'return {\n    monsters = {}\n}\n'
        self.assertEqual(benchmark.carry_link_families(text, {}), text)

    def test_missing_writer_marker_fails_instead_of_dropping_metadata(self):
        with self.assertRaisesRegex(RuntimeError, 'Cannot place'):
            benchmark.carry_link_families('return {}', zone())


if __name__ == '__main__':
    unittest.main()
