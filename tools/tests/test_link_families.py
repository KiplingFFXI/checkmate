"""Link family labels use exact source identities without changing link membership."""
from copy import deepcopy
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import lua_writer, mobscripts, rows

try:
    from lupa import luajit21
except ImportError:
    luajit21 = None


def member(link_name='Goblin', family=133, label='Goblin', nm=False, row_name=None):
    return {'name': row_name or link_name, 'ids': [1], 'levels': {}, 'nm': nm,
            '_link_family': {'link_name': link_name, 'id': family, 'name': label}}


def caller(*names):
    return {'name': 'Caller', 'ids': [2], 'levels': {},
            'links': {'sight': list(names), 'superlink': list(reversed(names))}}


class LinkFamilyTests(unittest.TestCase):
    def test_finish_preserves_exact_source_name_and_family(self):
        kind = rows.Kind('Akbaba HL', False, ('war', 'war'), {}, {}, {}, [], 'bird',
                         mobscripts.Effects(), False, 1, [])
        kind.link_name, kind.family, kind.family_name = 'Akbaba', 55, 'giant_bird'
        kind.attributes = {'mob_mods': {}}
        result = rows.finish(kind, None)
        self.assertEqual(result['_link_family'],
                         {'link_name': 'Akbaba', 'id': 55, 'name': 'Giant Bird'})
        self.assertEqual(result['name'], 'Akbaba HL')

    def test_alias_does_not_require_a_matching_row_name(self):
        result = lua_writer.link_families([member('Akbaba', 55, 'Bird', row_name='Akbaba HL'), caller('Akbaba')])
        self.assertEqual(result, {'Akbaba': {'id': 55, 'name': 'Bird'}})

    def test_repeated_identical_source_identities_share_one_entry(self):
        own = member()
        self.assertEqual(lua_writer.link_families([own, deepcopy(own), caller('Goblin')]),
                         {'Goblin': {'id': 133, 'name': 'Goblin'}})

    def test_family_and_label_collisions_are_omitted(self):
        for field, value in [('id', 134), ('name', 'Other')]:
            with self.subTest(field=field):
                first, second = member(), member()
                second['_link_family'][field] = value
                for candidates in ([first, second, first], [second, first, second]):
                    self.assertEqual(lua_writer.link_families(candidates + [caller('Goblin')]), {})

    def test_incomplete_candidate_blocks_an_otherwise_known_name(self):
        for field, value in [('id', 0), ('id', None), ('name', ''), ('name', None)]:
            with self.subTest(field=field):
                first, second = member(), member()
                second['_link_family'][field] = value
                self.assertEqual(lua_writer.link_families([first, second, caller('Goblin')]), {})
                self.assertEqual(lua_writer.link_families([second, first, caller('Goblin')]), {})

    def test_missing_and_unreferenced_names_are_not_inferred(self):
        self.assertEqual(lua_writer.link_families([member(), caller('Goblin Lookalike')]), {})
        self.assertEqual(lua_writer.link_families([member()]), {})

    def test_nm_status_does_not_change_family_identity(self):
        data = [member(nm=True), member(nm=False), caller('Goblin')]
        self.assertEqual(lua_writer.link_families(data), {'Goblin': {'id': 133, 'name': 'Goblin'}})
        self.assertTrue(data[0]['nm'])
        self.assertFalse(data[1]['nm'])

    def test_senses_and_membership_are_not_changed(self):
        data = [member(), member('Other Goblin'), caller('Goblin', 'Other Goblin')]
        before = deepcopy(data)
        lua_writer.link_families(data)
        self.assertEqual(data, before)
        self.assertEqual(lua_writer.link_numbers(data), lua_writer.link_numbers(before))

    def test_optional_metadata_has_no_empty_output(self):
        self.assertEqual(lua_writer.link_family_lines([caller('Missing')]), [])

    @unittest.skipIf(luajit21 is None, 'LuaJIT is required for hydrated-value checks')
    def test_serialized_metadata_is_shared_and_all_old_fields_match(self):
        data = [member("Goblin's Helper", nm=True), caller("Goblin's Helper")]
        old = deepcopy(data)
        for row in old:
            row.pop('_link_family', None)
        stamp = SimpleNamespace(built='pin 465ac4c', content='Original')
        with tempfile.TemporaryDirectory() as folder:
            new_text = lua_writer.write_zone(Path(folder) / 'new.lua', 1, 'Test', data, stamp)
            old_text = lua_writer.write_zone(Path(folder) / 'old.lua', 1, 'Test', old, stamp)
        lua = luajit21.LuaRuntime()
        new, old = lua.execute(new_text), lua.execute(old_text)
        self.assertEqual(new.link_families["Goblin's Helper"].name, 'Goblin')
        self.assertIsNone(new.link_families["Goblin's Helper"].nm)
        self.assertNotIn('_link_family', new_text)
        self.assertNotIn('link_families', old_text)
        def plain(value):
            return {k: plain(v) for k, v in value.items()} if hasattr(value, 'items') else value
        new = plain(new)
        new.pop('link_families')
        self.assertEqual(new, plain(old))


if __name__ == '__main__':
    unittest.main()
