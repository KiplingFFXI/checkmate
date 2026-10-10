"""Only identical complete danger subtrees share storage; loaded values stay the same."""
from copy import deepcopy
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import lua_writer

try:
    from lupa import luajit21
except ImportError:
    luajit21 = None


def danger(**fields):
    entry = {'kind': 'skill', 'id': 257, 'name': 'Foot Kick', 'summary': 'Foot Kick: can crit',
             'notes': ['This source move can crit; its current critical chance is not known.'],
             'level_ranges': [[10, 20]], 'details': {'shape': 'single target', 'notes': ['Source range is not a safe distance.']}}
    entry.update(fields)
    return {'value': entry['summary'], 'entries': [entry], 'coverage': 'resolved', 'incomplete': False,
            'notes': ['Possible moves from the source.'], 'general_notes': ['Skill checks still apply.'], 'reasons': []}


def rows(first, second):
    return [{'name': 'A', 'ids': [1], 'levels': {}, 'info': {'dangers': first}},
            {'name': 'B', 'ids': [2], 'levels': {}, 'info': {'dangers': second}}]


class SharingTests(unittest.TestCase):
    def test_identical_roots_share_one_reference(self):
        value = danger()
        pool = lua_writer.SharedDangers(rows(value, deepcopy(value)))
        self.assertEqual(pool.value(value), pool.value(deepcopy(value)))
        self.assertTrue(pool.value(value).startswith('danger['))

    def test_forced_level_and_condition_changes_never_share_full_entry(self):
        for changed in (dict(forced=True), dict(level_ranges=[[15, 20]]), dict(notes=['Different conditions.']),
                        dict(kind='attack', id=0), dict(details={'shape': 'front cone'})):
            first, second = danger(), danger(**changed)
            pool = lua_writer.SharedDangers(rows(first, second))
            self.assertNotEqual(pool.value(first['entries'][0]), pool.value(second['entries'][0]))

    def test_list_order_is_part_of_identity(self):
        self.assertNotEqual(lua_writer.identity({'notes': ['a', 'b']}), lua_writer.identity({'notes': ['b', 'a']}))

    def test_map_order_does_not_change_identity(self):
        self.assertEqual(lua_writer.identity({'a': 1, 'b': 2}), lua_writer.identity({'b': 2, 'a': 1}))

    def test_per_index_sections_also_share_without_changing_other_sections(self):
        row = rows(danger(), danger())[0]
        row['info_by_index'] = {1: {'dangers': deepcopy(row['info']['dangers']), 'blue': {'value': 'Unknown'}}}
        pool = lua_writer.SharedDangers([row])
        text = pool.sections(row['info_by_index'][1])
        self.assertIn('dangers = danger[', text)
        self.assertIn("blue = { value = 'Unknown' }", text)

    def test_no_pool_for_unique_small_values(self):
        pool = lua_writer.SharedDangers(rows({'value': 'a'}, {'value': 'b'}))
        self.assertEqual(pool.lines(), [])

    def test_pool_does_not_mutate_input(self):
        data = rows(danger(), danger())
        before = deepcopy(data)
        pool = lua_writer.SharedDangers(data)
        pool.lines()
        self.assertEqual(data, before)

    @unittest.skipIf(luajit21 is None, 'LuaJIT is required for hydrated-value checks')
    def test_loaded_zone_is_fully_hydrated_and_shared(self):
        data = rows(danger(), danger())
        data[1]['info_by_index'] = {2: {'dangers': danger(forced=True)}}
        with tempfile.TemporaryDirectory() as folder:
            text = lua_writer.write_zone(Path(folder) / '1.lua', 1, 'Test', data,
                                         SimpleNamespace(built='pin 465ac4c', content='Original'))
        lua = luajit21.LuaRuntime()
        loaded = lua.execute(text)
        first, second = loaded.monsters[1], loaded.monsters[2]
        same = lua.eval('function(a,b) return rawequal(a,b) end')
        self.assertTrue(same(first.info.dangers, second.info.dangers))
        self.assertFalse(same(first.info.dangers, second.info_by_index[2].dangers))
        self.assertTrue(second.info_by_index[2].dangers.entries[1].forced)
        self.assertEqual(first.info.dangers.entries[1].level_ranges[1][1], 10)
        self.assertEqual(first.info.dangers.entries[1].details.shape, 'single target')
        self.assertIsNone(loaded.danger)


if __name__ == '__main__':
    unittest.main()
