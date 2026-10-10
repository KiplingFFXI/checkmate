"""Weapon damage types remain separate from general damage reductions."""
from pathlib import Path
import os
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import dynamis, instances, lua_source, lua_writer, mobscripts, outside, rows, species, stats, weapons, zones


class WeaponTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory(prefix='checkmate_weapon_tests_')
        self.addCleanup(self.folder.cleanup)
        self.tree = Path(self.folder.name)

    def write(self, name, text):
        path = self.tree / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def index(self):
        return mobscripts.ScriptIndex(str(self.tree), {}, {'xi.mobMod.ALIAS': 'impact_sdt'})

    def read(self, call, handler='onMobFight'):
        return self.index().file_effects(lua_source.LuaFile('mob.lua',
            'entity.%s = function(mob)\n    %s\nend' % (handler, call)))

    def test_types_and_general_reductions_remain_separate(self):
        types, guard = rows.weapon_damage({'slash_sdt': -5000, 'pierce_sdt': 2500, 'impact_sdt': 1250,
                                         'hth_sdt': -2500, 'dmgphys': -5000})
        self.assertEqual(types, {'slashing': -50, 'piercing': 25, 'blunt': 12.5, 'hand_to_hand': -25})
        self.assertEqual(guard, {'physical': -50})

    def test_native_generic_reductions_use_their_own_mods(self):
        _, guard = rows.weapon_damage({'dmg': -2000, 'dmgphys': -4000, 'dmgphys_ii': -1800,
                                      'udmgphys': -5000, 'dmgrange': 1000, 'udmgrange': 5000})
        self.assertEqual(guard, {'physical': -84, 'ranged': 35})
        self.assertEqual(rows.weapon_damage({'udmgphys': -12000})[1], {'physical': -100})

    def test_absorb_and_null_are_distinct_chances(self):
        _, guard = rows.weapon_damage({'absorb_dmg_chance': 10, 'phys_absorb': 20, 'null_damage': 25,
                                      'null_physical_damage': 40, 'null_ranged_damage': 20})
        self.assertEqual(guard, {'absorb': 28, 'nullify_physical': 55, 'nullify_ranged': 40})

    def test_static_ops_apply_after_inherited_values(self):
        result = self.read('mob:setMod(xi.mod.SLASH_SDT, -5000)\n    mob:addMod(xi.mod.PIERCE_SDT, 2500)', 'onMobSpawn')
        mods = {'slash_sdt': 1000, 'pierce_sdt': -5000}
        stats.apply_ops(mods, result.spawn_ops, [])
        self.assertEqual(rows.weapon_damage(mods)[0], {'slashing': -50, 'piercing': -25})
        self.assertFalse(result.weapon_runtime)

    def test_yaml_parent_child_and_zero_overrides(self):
        parent = species.apply(species.new_attributes(), {'resists': {'dmg_physical': {
            'slashing': -5000, 'piercing': 2500, 'blunt': -2500, 'h2h': -1250}}})
        child = species.apply(parent, {'resists': {'dmg_physical': {'slashing': 0, 'h2h': 5000}}})
        self.assertEqual(rows.weapon_damage(child['resists'])[0], {'piercing': 25, 'blunt': -25, 'hand_to_hand': 50})
        self.assertEqual(parent['resists']['slash_sdt'], -5000)
        self.assertEqual(instances.SDT_COLUMNS['h2h_sdt'], 'hth_sdt')
        for name in ('slash_sdt', 'pierce_sdt', 'impact_sdt'):
            self.assertEqual(instances.SDT_COLUMNS[name], name)

    def test_runtime_weapon_mods_and_aliases_are_marked(self):
        for mod in ('SLASH_SDT', 'PIERCE_SDT', 'IMPACT_SDT', 'HTH_SDT', 'DMGPHYS', 'DMGPHYS_II',
                    'UDMGPHYS', 'DMGRANGE', 'UDMGRANGE', 'PHYS_ABSORB', 'NULL_PHYSICAL_DAMAGE', 'NULL_RANGED_DAMAGE'):
            with self.subTest(mod=mod):
                result = self.read('mob:setMod(xi.mod.%s, 5000)' % mod)
                self.assertTrue(result.weapon_runtime)
                self.assertFalse(result.element_runtime)
        self.assertTrue(self.read('mob:setMod(xi.mobMod.ALIAS, 5000)').weapon_runtime)

    def test_shared_damage_mods_mark_both_parts(self):
        for mod in ('DMG', 'ABSORB_DMG_CHANCE', 'NULL_DAMAGE'):
            result = self.read('mob:setMod(xi.mod.%s, 10)' % mod)
            self.assertTrue(result.weapon_runtime)
            self.assertTrue(result.element_runtime)

    def test_unknown_calls_and_recalculation_stay_marked(self):
        for call in ('mob:setMod(whichMod, 10)', 'mob:setMod(', 'mob:recalculateStats()', 'mob:changeJob(xi.job.MNK)'):
            with self.subTest(call=call):
                self.assertTrue(self.read(call).weapon_runtime)
        self.assertTrue(self.read('mob:setMod(xi.mod.SLASH_SDT, amount)', 'onMobSpawn').weapon_runtime)
        self.assertFalse(self.read('mob:setMod(xi.mod.ACC, 20)').weapon_runtime)

    def test_runtime_helpers_and_mixins_keep_weapon_flags(self):
        self.write('scripts/globals/audit.lua', 'xi.audit.change = function(mob)\n    mob:setMod(xi.mod.HTH_SDT, -5000)\nend')
        self.write('scripts/mixins/audit.lua', 'g_mixins.audit = function(mob)\n    xi.audit.change(mob)\nend')
        index = self.index()
        result = index.file_effects(lua_source.LuaFile('mob.lua',
            'entity.onMobFight = function(mob)\n    xi.audit.change(mob)\nend'))
        self.assertTrue(result.weapon_runtime)
        self.assertTrue(index.mixin_weapons('audit'))
        self.assertFalse(index.mixin_kind('audit')[2])

    def test_dynamis_runtime_helpers_keep_weapon_flags(self):
        self.write('scripts/globals/audit.lua', 'xi.audit.change = function(mob)\n    mob:setMod(xi.mod.HTH_SDT, -5000)\nend')
        self.write('scripts/zones/Dynamis-Test/mobs/Fixture.lua', 'entity.onMobSpawn = function(mob)\nend')
        reader = dynamis.Dynamis.__new__(dynamis.Dynamis)
        reader.types, reader.kept, reader.hooks = {('Dynamis-Test', 'Fixture'): 'normal'}, {}, {}
        reader.events, reader.handlers = ['onMobFight'], {'normal': {'onMobFight': ['xi.audit.change']}}
        self.assertTrue(reader.effects(self.index(), 'Dynamis-Test', 'Fixture').weapon_runtime)

    def test_group_modifiers_and_variants_keep_only_relevant_flags(self):
        group = SimpleNamespace(mods=[('xi.mod.SLASH_SDT', '-5000'), ('xi.mod.UDMGPHYS', '-2500')])
        self.assertEqual(zones.group_damage_mods(group, {}, 'Fixture'), [('slash_sdt', -5000), ('udmgphys', -2500)])
        kind = SimpleNamespace(name='Fixture', group_mods={'slash_sdt': {-5000, 0}}, effects=mobscripts.Effects())
        zones.apply_group_mods(kind)
        self.assertTrue(kind.effects.weapon_runtime)
        self.assertFalse(kind.effects.element_runtime)

    def test_varying_group_mod_does_not_hide_a_fixed_mod(self):
        for varying, fixed in (('slash_sdt', 'fire_sdt'), ('fire_sdt', 'slash_sdt')):
            with self.subTest(varying=varying):
                kind = SimpleNamespace(name='Fixture', group_mods={varying: {-5000, 0}, fixed: {2500}}, effects=mobscripts.Effects())
                zones.apply_group_mods(kind)
                self.assertEqual(kind.effects.init_ops, [('set', fixed, 2500)])
                self.assertEqual(bool(kind.effects.weapon_runtime), varying == 'slash_sdt')
                self.assertEqual(bool(kind.effects.element_runtime), varying == 'fire_sdt')

    def test_writer_keeps_every_type_and_script_flag(self):
        self.assertIn(('weapon_dmg', ['slashing', 'piercing', 'blunt', 'hand_to_hand']), lua_writer.EXTRA_FIELDS)
        self.assertIn('scripted_weapons', lua_writer.FLAG_ORDER)

    def test_outside_script_targets_keep_weapon_changes(self):
        wanted = {
            'battlefields/Temenos/central_temenos_2nd_floor.lua': {'Mystic_Avatar_Carbuncle'},
            'battlefields/Temenos/central_temenos_3rd_floor.lua': {'Abyssdweller_Jhabdebb', 'Orichalcum_Quadav', 'Pee_Qoho_the_Python'},
            'battlefields/Apollyon/nw_apollyon.lua': {'Cynoprosopi'},
            'battlefields/Apollyon/se_apollyon.lua': {'Evil_Armory'},
        }
        for path, expected in wanted.items():
            self.assertEqual({mob for _, mobs, flag in outside.HAND[path] if flag == 'scripted_weapons' for mob in mobs}, expected)
        self.assertFalse(any(flag == 'scripted_weapons' for _, _, flag in outside.HAND['battlefields/Apollyon/ne_apollyon.lua']))


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class WeaponSourceTests(unittest.TestCase):
    def test_pinned_native_and_loaded_modules_match(self):
        weapons.check_source(os.environ['CHECKMATE_SOURCE_TREE'])

    def test_native_formula_change_is_detected(self):
        text = (Path(os.environ['CHECKMATE_SOURCE_TREE']) / weapons.NATIVE).read_text(encoding='utf8')
        body = weapons.native_body(text, 'PhysicalDmgTaken')
        self.assertEqual(weapons.digest(body), weapons.GUARDS['PhysicalDmgTaken'])
        self.assertNotEqual(weapons.digest(body.replace('0.5f', '0.6f')), weapons.GUARDS['PhysicalDmgTaken'])


if __name__ == '__main__':
    unittest.main()
