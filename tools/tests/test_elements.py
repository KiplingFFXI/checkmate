"""Keep Elements uncertainty limited to fields that its readout uses."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import battlefields, dynamis, lua_source, mobscripts, outside, zones


class ElementScriptTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory(prefix='checkmate_element_scripts_')
        self.addCleanup(self.folder.cleanup)
        self.tree = Path(self.folder.name)

    def write(self, name, text):
        path = self.tree / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')
        return str(path)

    def index(self):
        return mobscripts.ScriptIndex(str(self.tree), {'sleep': 1}, {'xi.mobMod.ALIAS': 'fire_meva'})

    def read_call(self, call):
        source = lua_source.LuaFile('mob.lua', 'entity.onMobFight = function(mob)\n    %s\nend' % call)
        return self.index().file_effects(source)

    def test_element_ranks_and_meva_keep_both_flags(self):
        for mod in ('xi.mod.FIRE_RES_RANK', 'xi.mod.THUNDER_RES_RANK', 'xi.mod.ICE_MEVA',
                    'xi.mod.LIGHT_MEVA', 'xi.mobMod.ALIAS'):
            with self.subTest(mod=mod):
                result = self.read_call('mob:setMod(%s, 4)' % mod)
                self.assertTrue(result.runtime)
                self.assertTrue(result.element_runtime)

    def test_non_element_stats_do_not_mark_elements(self):
        for call in ('mob:addMod(xi.mod.ACC, 30)', 'mob:addMod(xi.mod.MEVA, 30)',
                     'mob:setMod(xi.mod.SLEEP_MEVA, 20)', 'mob:setMod(xi.mod.BIND_RES_RANK, 9)',
                     'mob:addImmunity(xi.immunity.SLEEP)', 'mob:setStatRank(xi.stat.INT, 2)'):
            with self.subTest(call=call):
                result = self.read_call(call)
                self.assertTrue(result.runtime)
                self.assertFalse(result.element_runtime)

    def test_damage_absorb_and_null_keep_the_marker(self):
        for mod in ('DMGMAGIC', 'UDMGMAGIC', 'THUNDER_SDT', 'LTNG_ABSORB', 'FIRE_NULL', 'MAGIC_ABSORB'):
            with self.subTest(mod=mod):
                self.assertTrue(self.read_call('mob:setMod(xi.mod.%s, 30)' % mod).element_runtime)

    def test_unknown_mods_and_whole_stat_changes_stay_conservative(self):
        for call in ('mob:setMod(changingMod, 30)', 'mob:setMod(', 'mob:setMobLevel(50)',
                     'mob:changeJob(xi.job.BLM)', 'mob:setPetStats(50)', 'mob:recalculateStats()'):
            with self.subTest(call=call):
                result = self.read_call(call)
                self.assertTrue(result.runtime)
                self.assertTrue(result.element_runtime)

    def test_known_spawn_rank_stays_static(self):
        source = lua_source.LuaFile('mob.lua', 'entity.onMobSpawn = function(mob)\n'
                                   '    mob:setMod(xi.mod.FIRE_RES_RANK, 4)\nend')
        result = self.index().file_effects(source)
        self.assertEqual(result.spawn_ops, [('set', 'fire_res_rank', 4)])
        self.assertFalse(result.runtime)
        self.assertFalse(result.element_runtime)

    def helper_fixture(self, call='mob:setMod(xi.mod.ICE_RES_RANK, 4)'):
        self.write('scripts/globals/audit.lua', 'xi.audit.rank = function(mob)\n    %s\nend' % call)
        return self.index()

    def test_runtime_and_conditional_helpers_keep_both_flags(self):
        index = self.helper_fixture()
        for text in ('entity.onMobFight = function(mob)\n    xi.audit.rank(mob)\nend',
                     'entity.onMobSpawn = function(mob)\n    if ready then\n        xi.audit.rank(mob)\n    end\nend'):
            result = index.file_effects(lua_source.LuaFile('mob.lua', text))
            self.assertTrue(result.runtime)
            self.assertTrue(result.element_runtime)

    def test_unknown_helper_at_runtime_stays_conservative(self):
        index = self.helper_fixture('mob:setMod(changingMod, 4)')
        result = index.file_effects(lua_source.LuaFile('mob.lua',
            'entity.onMobFight = function(mob)\n    xi.audit.rank(mob)\nend'))
        self.assertTrue(result.runtime)
        self.assertTrue(result.element_runtime)

    def test_mixin_and_battlefield_mixin_follow_helpers(self):
        self.helper_fixture()
        self.write('scripts/mixins/audit.lua', 'g_mixins.audit = function(mob)\n    xi.audit.rank(mob)\nend')
        index = self.index()
        self.assertEqual(index.mixin_kind('audit'), (True, False, True))
        self.write('scripts/battlefields/Temenos/audit.lua', "mobs = { 'Airi' }, mixins = { require('scripts/mixins/audit') }")
        marks = outside.scan(str(self.tree), index, {'Temenos'})
        self.assertEqual(marks[('Temenos', 'Airi')], {'scripted_stats', 'scripted_elements'})

    def test_dynamis_runtime_helper_keeps_both_flags(self):
        index = self.helper_fixture()
        self.write('scripts/zones/Dynamis-Test/mobs/Fixture.lua', 'entity.onMobSpawn = function(mob)\nend')
        reader = dynamis.Dynamis.__new__(dynamis.Dynamis)
        reader.types = {('Dynamis-Test', 'Fixture'): 'normal'}
        reader.kept, reader.hooks = {}, {}
        reader.events = ['onMobFight']
        reader.handlers = {'normal': {'onMobFight': ['xi.audit.rank']}}
        result = reader.effects(index, 'Dynamis-Test', 'Fixture')
        self.assertTrue(result.runtime)
        self.assertTrue(result.element_runtime)

    def test_group_rank_and_meva_variants_keep_both_flags(self):
        group = SimpleNamespace(mods=[('xi.mod.ICE_RES_RANK', '4'), ('xi.mod.FIRE_MEVA', '30')])
        self.assertEqual(zones.group_damage_mods(group, {}, 'Temenos'),
                         [('ice_res_rank', 4), ('fire_meva', 30)])
        kind = SimpleNamespace(name='Fixture', group_mods={'ice_res_rank': {4, 5}}, effects=mobscripts.Effects())
        zones.apply_group_mods(kind)
        self.assertTrue(kind.effects.runtime)
        self.assertTrue(kind.effects.element_runtime)

    def test_group_detection_keeps_the_mods_namespace(self):
        aliases, detects = {'xi.mobMod.DETECTION': 'ice_meva'}, {'hearing': 2}
        for field, expected in (('mods', [('ice_meva', 2)]), ('mobMods', [])):
            with self.subTest(field=field):
                group = battlefields.read_group('%s = { [xi.mobMod.DETECTION] = xi.detects.HEARING }' % field,
                                                1, battlefields.Fight('temenos', 1), {}, 'fixture')
                self.assertEqual(zones.group_damage_mods(group, aliases, 'Temenos', detects), expected)
                if field == 'mods':
                    kind = SimpleNamespace(group_mods={'ice_meva': {2}}, effects=mobscripts.Effects())
                    zones.apply_group_mods(kind)
                    self.assertEqual(kind.effects.init_ops, [('set', 'ice_meva', 2)])
                else:
                    self.assertEqual(group.mob_mods, [('detection', 'xi.detects.HEARING')])

    def test_unknown_element_group_value_still_fails(self):
        group = SimpleNamespace(mods=[('xi.mod.ICE_MEVA', 'changingValue')])
        with self.assertRaisesRegex(RuntimeError, 'changingValue'):
            zones.group_damage_mods(group, {}, 'Temenos', {'hearing': 2})


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class PinnedElementTests(unittest.TestCase):
    def test_airi_has_no_element_changes_but_uragnite_does(self):
        tree = os.environ['CHECKMATE_SOURCE_TREE']
        index = mobscripts.ScriptIndex(tree, {'paralyze': 1}, {})
        result = index.mob_effects('Temenos', 'Airi')
        self.assertFalse(result.element_runtime)
        self.assertEqual(outside.HAND['battlefields/Temenos/central_temenos_1st_floor.lua'][0][2], 'scripted_stats')
        self.assertTrue(index.mixin_kind('families/uragnite')[2])


if __name__ == '__main__':
    unittest.main()
