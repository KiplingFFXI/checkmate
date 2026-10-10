"""Static monster facts, conservative uncertainties and native maximum estimates."""
import copy
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import info, lua_source, mobscripts, species


class InfoTests(unittest.TestCase):
    def test_hp_native_thresholds(self):
        # WAR/WAR, native B scales (33,8,1); hand-calculated integer boundaries.
        expected = {1: 33, 2: 46, 3: 62, 4: 79, 5: 99, 6: 113, 24: 536,
                    25: 589, 30: 773, 31: 872, 40: 1641, 49: 2373, 50: 2521, 75: 4611}
        for level, hp in expected.items():
            self.assertEqual(info.base_hp(level, 2, 2), hp, level)

    def test_hp_mp_conversion_and_percent_order(self):
        self.assertEqual(info.final_health(100, 50, {}), (100, 50))
        self.assertEqual(info.final_health(100, 50, {'hp': 10, 'hpp': 20, 'mp': 5, 'mpp': 10}), (132, 60))
        self.assertEqual(info.final_health(100, 50, {'convmptohp': 20, 'hpp': 10}), (132, 30))
        self.assertEqual(info.final_health(100, 50, {'convhptomp': 500}), (1, 149))
        self.assertEqual(info.final_health(100, 50, {'curse_pct': -50, 'food_hp': 10}), (60, 25))

    def test_raw_attributes_keep_inheritance_and_do_not_mutate_parent(self):
        parent = species.apply(species.new_attributes(), {'speed': 40, 'stats': {'hp': 500},
                                                         'combat': {'delay': 300}, 'charmable': True})
        child = species.apply(parent, {'speed': 60, 'stats': {'mp': 100}, 'charmable': False})
        self.assertEqual(child['source']['stats'], {'hp': 500, 'mp': 100})
        self.assertFalse(child['source']['charmable'])
        self.assertEqual(parent['source']['speed'], 40)

    def reader(self, text=''):
        folder = tempfile.TemporaryDirectory(prefix='checkmate_info_tests_')
        self.addCleanup(folder.cleanup)
        tree = Path(folder.name)
        (tree / 'scripts/zones/Test/mobs').mkdir(parents=True)
        (tree / 'scripts/zones/Test/mobs/Mob.lua').write_text(text, encoding='utf8')
        reader = info.Reader.__new__(info.Reader)
        reader.tree, reader.settings, reader.module_text, reader.cache = tree, {}, '', {}
        reader.scripts = mobscripts.ScriptIndex(str(tree), {}, {})
        reader.tables = SimpleNamespace(traits_by_job={}, mob_excluded_traits=set(), resist_traits=set(),
            grades={'war': {'hp': 2}, 'blm': {'hp': 6}}, detects={'scent': 16})
        return reader

    def kind(self, **raw):
        return SimpleNamespace(zone_dir='Test', script='Mob', group_mixins=[],
            effects=mobscripts.Effects(), attributes=species.apply(species.new_attributes(), raw),
            jobs=('war', 'war'), ecosystem='beast', family=1, family_name='rabbit', species_name='rabbit', species_id=2,
            types=[], flags=set(), levels={1, 2}, ids=[1, 2], pet_indexes=set(), nm=False)

    def test_charm_eligibility_never_claims_chance(self):
        reader, kind = self.reader(), self.kind(charmable=True)
        self.assertEqual(reader.read(kind)[0]['charm']['value'], 'Charm eligible')
        kind.types = ['notorious']
        self.assertEqual(reader.read(kind)[0]['charm']['value'], 'Not charm eligible')
        kind.types, kind.pet_indexes = [], {1, 2}
        self.assertEqual(reader.read(kind)[0]['charm']['value'], 'Not charm eligible')

    def test_conditional_charm_stays_unknown(self):
        reader = self.reader('entity.onMobFight = function(mob)\n    mob:setMobMod(xi.mobMod.CHARMABLE, 1)\nend')
        self.assertEqual(reader.read(self.kind(charmable=False))[0]['charm']['value'], 'Eligibility can change')

    def test_flat_hp_and_mp_have_final_modifier_pass(self):
        reader, kind = self.reader(), self.kind(stats={'hp': 230, 'mp': 70}, mods={'hp': 20, 'hpp': 10, 'mpp': 20})
        kind.jobs = ('blm', 'war')
        vitals = reader.read(kind)[0]['vitals']
        self.assertEqual(vitals['hp'], {1: 275, 2: 275})
        self.assertEqual(vitals['mp'], {1: 84, 2: 84})

    def test_spawn_health_mod_waits_for_recalculation(self):
        reader = self.reader('entity.onMobSpawn = function(mob)\n    mob:addMod(xi.mod.HP, 500)\nend')
        vitals = reader.read(self.kind(stats={'hp': 230}))[0]['vitals']
        self.assertEqual(vitals['hp'][1], 230)
        self.assertTrue(vitals['uncertain'])

    def test_initialize_health_mod_applies(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n    mob:addMod(xi.mod.HP, 500)\nend')
        self.assertEqual(reader.read(self.kind(stats={'hp': 230}))[0]['vitals']['hp'][1], 730)

    def test_pet_derived_hp_reduction_does_not_reduce_fixed_hp(self):
        reader, kind = self.reader(), self.kind()
        kind.pet_indexes = {1, 2}
        self.assertEqual(reader.read(kind)[0]['vitals']['hp'][1], 9)
        kind.attributes = species.apply(species.new_attributes(), {'stats': {'hp': 230}})
        self.assertEqual(reader.read(kind)[0]['vitals']['hp'][1], 230)

    def test_per_spawn_details_only_override_changed_sections(self):
        reader, kind = self.reader(), self.kind(speed=40)
        kind.source_by_index = {1: {'speed': 40}, 2: {'speed': 60}}
        _, by_index = reader.read(kind)
        self.assertEqual(set(by_index), {2})
        self.assertEqual(set(by_index[2]), {'movement'})

    def test_no_level_has_no_fabricated_maximum(self):
        reader, kind = self.reader(), self.kind()
        kind.levels = set()
        self.assertEqual(reader.read(kind)[0]['vitals']['hp'], {})

    def test_reward_modifiers_and_mug_are_qualified(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n    mob:setMobMod(xi.mobMod.MUG_GIL, 15500)\n'
                             '    mob:setMobMod(xi.mobMod.GIL_MIN, 20000)\n    mob:setMobMod(xi.mobMod.GIL_MAX, 20000)\nend')
        reward = reader.read(self.kind())[0]['rewards']
        self.assertIn('Mug purse set at spawn', reward['value'])
        self.assertNotIn('15500', reward['value'])
        self.assertIn('remaining purse', ' '.join(reward['notes']))

    def test_crystals_are_not_th_and_scent_is_not_a_deaggro_promise(self):
        out = self.reader().read(self.kind(element='earth', detects=['scent']))[0]
        self.assertEqual(out['crystal']['value'], 'Earth crystal (conditional)')
        self.assertIn('not ordinary Treasure Hunter', ' '.join(out['crystal']['notes']))
        self.assertIn('does not guarantee', ' '.join(out['pursuit']['notes']))

    def test_unknown_mod_is_not_silently_exact(self):
        reader = self.reader('entity.onMobFight = function(mob)\n    mob:setMod(bonusMod, amount)\nend')
        self.assertTrue(reader.read(self.kind())[0]['vitals']['uncertain'])

    def test_module_callback_remains_qualified(self):
        reader = self.reader()
        reader.module_text = 'xi.zones.Test.mobs.Mob.onMobSpawn'
        self.assertTrue(reader.read(self.kind())[0]['vitals']['uncertain'])

    def test_helpers_keep_order_and_repeated_calls(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n    mob:setMod(xi.mod.HP, 10)\n'
                             '    xi.test.hp(mob)\n    xi.test.hp(mob)\n    mob:addMod(xi.mod.HP, 1)\nend')
        path = reader.tree / 'scripts/globals/hp.lua'
        path.parent.mkdir(parents=True)
        path.write_text('xi.test.hp = function(mob)\n    mob:addMod(xi.mod.HP, 20)\nend', encoding='utf8')
        reader.scripts.helpers['xi.test.hp'] = str(path)
        self.assertEqual(reader.read(self.kind(stats={'hp': 100}))[0]['vitals']['hp'][1], 151)

    def test_scent_uses_resolved_detection_including_script_override(self):
        reader, kind = self.reader(), self.kind(detects=['scent'])
        kind.state = SimpleNamespace(mob_mods={'detection': 0})
        self.assertEqual(reader.read(kind)[0]['pursuit']['value'], 'No base scent tracking')

    def test_instance_fixed_hp_is_overridden_by_species_hp(self):
        reader, kind = self.reader(), self.kind(stats={'hp': 230})
        kind.instance_pool = {'cmbDelay': 300}
        kind.instance_group = {'HP': 1000, 'MP': 0}
        self.assertEqual(reader.read(kind)[0]['vitals']['hp'][1], 230)

    def test_unknown_hp_mp_maps_are_explicit(self):
        reader, kind = self.reader(), self.kind()
        kind.levels = set()
        out = reader.read(kind)[0]['vitals']
        self.assertTrue(out['hp_unknown'])
        self.assertTrue(out['mp_unknown'])

    def test_known_crystal_and_seal_exclusions(self):
        reader, kind = self.reader(), self.kind(element='fire', mob_mods={'no_drops': 1})
        self.assertEqual(reader.read(kind)[0]['crystal']['value'], 'Crystal reward disabled')
        kind = self.kind(element='fire')
        kind.zone_dir = 'AlTaieu'
        self.assertEqual(reader.read(kind)[0]['crystal']['value'], 'Crystal reward disabled')

    def test_spawn_mug_override_survives_native_reset(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n    mob:setMobMod(xi.mobMod.GIL_MIN, 100)\nend\n'
                             'entity.onMobSpawn = function(mob)\n    mob:setMobMod(xi.mobMod.MUG_GIL, 55)\nend')
        self.assertIn('Mug purse 55 gil', reader.read(self.kind())[0]['rewards']['value'])

    def test_thief_beastmen_native_gil_default_and_fixed_amount_bypass(self):
        reader, kind = self.reader(), self.kind()
        reader.tables.grades['thf'] = {'hp': 4}
        kind.ecosystem, kind.jobs = 'beastmen', ('thf', 'war')
        out = reader.read(kind)[0]['rewards']
        self.assertIn('150%', ' '.join(out['notes']))
        kind.attributes = species.apply(species.new_attributes(), {'mob_mods': {'gil_min': 100, 'gil_max': 100}})
        out = reader.read(kind)[0]['rewards']
        self.assertIn('Base gil 100', out['value'])
        self.assertNotIn('multiplier', ' '.join(out['notes']))

    def test_trait_values_do_not_promise_swings_or_disabled_delay_benefits(self):
        out = self.reader().read(self.kind(mods={'martial_arts': 100, 'dual_wield': 15},
                                          mob_mods={'multi_hit': 8}))[0]['traits']
        self.assertIn('Multi-hit modifier 8', out['value'])
        self.assertNotIn('Attack count 8', out['value'])
        self.assertNotIn('Martial Arts', out['value'])
        self.assertIn('excludes monsters', ' '.join(out['notes']))
        self.assertIn('does not enable', ' '.join(out['notes']))

    def test_instance_delay_comes_from_pool_not_species_combat(self):
        reader, kind = self.reader(), self.kind(combat={'delay': 360})
        kind.instance_pool = {'cmbDelay': 240}
        self.assertIn('Base delay 240', reader.read(kind)[0]['traits']['value'])

    def test_native_gil_gate(self):
        for mob, expected in [({}, False), ({'gil_bonus': -100}, False),
                ({'gil_bonus': 100}, True), ({'gil_min': 20}, True), ({'gil_max': 20}, True),
                ({'gil_min': 100, 'gil_max': -1, 'gil_bonus': 150}, False)]:
            self.assertEqual(info.can_drop_gil(mob), expected, mob)

    def assert_no_gil(self, reward):
        self.assertNotIn('gil', (reward['value'] + ' '.join(reward['notes'])).lower())
        self.assertNotIn('Mug', reward['value'])

    def test_ordinary_monster_does_not_imply_gil(self):
        self.assert_no_gil(self.reader().read(self.kind())[0]['rewards'])

    def test_negative_max_blocks_amount_bonus_and_mug(self):
        kind = self.kind(mob_mods={'gil_min': 100, 'gil_max': -1, 'gil_bonus': 150, 'mug_gil': 50})
        self.assert_no_gil(self.reader().read(kind)[0]['rewards'])

    def test_mug_purse_alone_is_not_a_gil_drop(self):
        self.assert_no_gil(self.reader().read(self.kind(mob_mods={'mug_gil': 500}))[0]['rewards'])

    def test_no_drops_does_not_block_native_gil(self):
        reader, kind = self.reader(), self.kind(mob_mods={'no_drops': 1, 'exp_bonus': -100})
        kind.ecosystem = 'beastmen'
        self.assertIn('Drops gil', reader.read(kind)[0]['rewards']['value'])
        reader.settings['MOB_GIL_MULTIPLIER'] = 0
        self.assert_no_gil(reader.read(kind)[0]['rewards'])

    def test_conditional_gil_change_is_not_a_confirmed_drop(self):
        reader = self.reader('entity.onMobFight = function(mob)\n'
                             '    if mob:getHPP() < 50 then\n'
                             '        mob:setMobMod(xi.mobMod.GIL_MAX, -1)\n    end\nend')
        kind = self.kind(mob_mods={'gil_min': 100, 'gil_max': 100})
        self.assert_no_gil(reader.read(kind)[0]['rewards'])

    def test_spawn_can_disable_a_purse_created_at_initialization(self):
        reader = self.reader('entity.onMobSpawn = function(mob)\n'
                             '    mob:setMobMod(xi.mobMod.GIL_MAX, -1)\nend')
        kind = self.kind(mob_mods={'gil_min': 100, 'gil_max': 100})
        self.assert_no_gil(reader.read(kind)[0]['rewards'])

    def test_encounter_and_module_overrides_do_not_inherit_gil_claims(self):
        for zone in ('Dynamis-Bastok', 'Apollyon', 'Temenos'):
            reader, kind = self.reader(), self.kind(mob_mods={'gil_bonus': 100})
            kind.zone_dir = zone
            self.assert_no_gil(reader.read(kind)[0]['rewards'])
        reader, kind = self.reader(), self.kind(mob_mods={'gil_bonus': 100})
        reader.module_text = 'xi.zones.Test.mobs.Mob.onMobSpawn'
        self.assert_no_gil(reader.read(kind)[0]['rewards'])

    def test_gil_eligibility_is_per_spawn(self):
        reader, kind = self.reader(), self.kind(mob_mods={'gil_bonus': 100})
        kind.source_by_index = {1: {'mob_mods': {'gil_bonus': 100}},
                                2: {'mob_mods': {'gil_bonus': 100, 'gil_max': -1}}}
        details, by_index = reader.read(kind)
        self.assertIn('Drops gil', details['rewards']['value'])
        self.assert_no_gil(by_index[2]['rewards'])

    def test_instance_does_not_inherit_species_gil_modifiers(self):
        reader, kind = self.reader(), self.kind(mob_mods={'gil_bonus': 1000})
        kind.instance_pool = {'cmbDelay': 240}
        kind.attributes['mob_mods'] = {}
        self.assert_no_gil(reader.read(kind)[0]['rewards'])
        kind.ecosystem = 'beastmen'
        self.assertIn('Drops gil', reader.read(kind)[0]['rewards']['value'])

    @unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
    def test_pinned_information_source_guards(self):
        info.check_source(os.environ['CHECKMATE_SOURCE_TREE'])


if __name__ == '__main__':
    unittest.main()
