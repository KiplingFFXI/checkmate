"""Static monster facts, conservative uncertainties and native maximum estimates."""
import copy
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import drops, info, lua_source, mobscripts, species


class InfoTests(unittest.TestCase):
    def test_hp_native_thresholds(self):
        # WAR/WAR, native B scales (33,8,1); hand-calculated integer boundaries.
        expected = {1: 33, 2: 46, 3: 62, 4: 79, 5: 99, 6: 113, 24: 536,
                    25: 589, 30: 773, 31: 872, 40: 1641, 49: 2373, 50: 2521, 75: 4611}
        for level, hp in expected.items():
            self.assertEqual(info.base_hp(level, 2, 2), hp, level)

    def test_hp_keeps_the_monster_main_job_base(self):
        # The weighted Monipulator base does not apply to ordinary monsters.
        self.assertEqual(info.base_hp(1, 1, 7), 36)
        self.assertEqual(info.base_hp(1, 7, 1), 22)
        self.assertEqual(info.base_hp(50, 1, 7), 2440)
        self.assertEqual(info.base_hp(50, 7, 1), 2275)

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
        self.assertIn('not part of the normal Treasure Hunter loot table', ' '.join(out['crystal']['notes']))
        self.assertIn('does not guarantee', ' '.join(out['pursuit']['notes']))

    def test_crystal_initialization_replaces_inherited_element(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.EARTH)\nend')
        out = reader.read(self.kind(element='fire'))[0]['crystal']
        self.assertEqual(out['value'], 'Earth crystal (conditional)')
        self.assertIn('Source crystal element: Earth.', out['notes'])

    def test_crystal_calls_keep_phase_and_source_order(self):
        reader = self.reader('entity.onMobSpawn = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.WATER)\n'
                             '    mob:setCrystalElement(xi.element.WIND)\nend\n'
                             'entity.onMobInitialize = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.EARTH)\nend')
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'],
                         'Wind crystal (conditional)')

    def test_crystal_none_is_a_known_override(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.NONE)\nend')
        out = reader.read(self.kind(element='fire'))[0]['crystal']
        self.assertEqual(out['value'], 'No base crystal element')
        self.assertIn('Source crystal element: None.', out['notes'])
        self.assertEqual(self.reader().read(self.kind())[0]['crystal']['value'], 'No base crystal element')

    def test_crystal_unknown_setup_does_not_keep_inherited_certainty(self):
        cases = [
            '    if condition then\n        mob:setCrystalElement(xi.element.EARTH)\n    end',
            '    if condition then mob:setCrystalElement(xi.element.EARTH) end',
            '    mob:setCrystalElement(chosenElement)',
            '    mob:setCrystalElement(\n        xi.element.EARTH\n    )',
            '    mob:setCrystalElement(xi.element.UNKNOWN)',
            '    alias:setCrystalElement(xi.element.EARTH)',
            '    mob = GetMobByID(otherId)\n    mob:setCrystalElement(xi.element.EARTH)',
            '    if condition then\n        return\n    end\n    mob:setCrystalElement(xi.element.EARTH)',
        ]
        for body in cases:
            with self.subTest(body=body):
                reader = self.reader('entity.onMobInitialize = function(mob)\n' + body + '\nend')
                out = reader.read(self.kind(element='fire'))[0]['crystal']
                self.assertEqual(out['value'], 'Crystal element unknown')
                self.assertNotIn('Source crystal element: Fire.', out['notes'])

    def test_crystal_last_unconditional_setup_can_replace_unknown(self):
        for between in ('', 'end\nentity.onMobSpawn = function(mob)\n'):
            reader = self.reader('entity.onMobInitialize = function(mob)\n'
                                 '    mob:setCrystalElement(chosenElement)\n' + between +
                                 '    mob:setCrystalElement(xi.element.EARTH)\nend')
            self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'],
                             'Earth crystal (conditional)')
        reader = self.reader('entity.onMobInitialize = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.EARTH)\nend\n'
                             'entity.onMobSpawn = function(mob)\n'
                             '    mob:setCrystalElement(chosenElement)\nend')
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Crystal element unknown')

    def test_crystal_runtime_and_mixins_remain_unknown(self):
        for handler in ('onMobFight', 'onMobDeath', 'onMobDespawn'):
            reader = self.reader('entity.' + handler + ' = function(mob)\n'
                                 '    mob:setCrystalElement(xi.element.EARTH)\nend')
            self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Crystal element unknown')
        reader, kind = self.reader(), self.kind(element='fire')
        path = reader.tree / 'scripts/mixins/crystal.lua'
        path.parent.mkdir(parents=True)
        path.write_text('g_mixins.crystal = function(mob)\n'
                        '    mob:setCrystalElement(xi.element.EARTH)\nend', encoding='utf8')
        kind.group_mixins = ['crystal']
        self.assertEqual(reader.read(kind)[0]['crystal']['value'], 'Crystal element unknown')

    def test_crystal_other_explicit_entity_does_not_change_own_element(self):
        reader = self.reader('entity.onMobDeath = function(mob, player)\n'
                             '    player:setCrystalElement(xi.element.EARTH)\n'
                             '    GetMobByID(otherId):setCrystalElement(xi.element.EARTH)\nend')
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Fire crystal (conditional)')

    def test_crystal_helpers_apply_at_the_call_site_and_overrides_stay_unknown(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.FIRE)\n'
                             '    xi.test.crystal(mob)\nend')
        path = reader.tree / 'scripts/globals/crystal.lua'
        path.parent.mkdir(parents=True)
        path.write_text('xi.test.crystal = function(mob)\n'
                        '    mob:setCrystalElement(xi.element.EARTH)\nend', encoding='utf8')
        reader.scripts.helpers['xi.test.crystal'] = str(path)
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Earth crystal (conditional)')
        reader.cache.clear()
        reader.module_text = 'm:addOverride("xi.test.crystal", function(mob) end)'
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Crystal element unknown')

    def test_crystal_loaded_callbacks_do_not_inherit_replaced_setters(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n'
                             '    mob:setCrystalElement(xi.element.EARTH)\nend')
        reader.module_text = 'm:addOverride("xi.zones.Test.mobs.Mob.onMobInitialize", function(mob) end)'
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Crystal element unknown')
        reader = self.reader()
        reader.module_text = 'm:addOverride("xi.zones.Test.mobs.Mob.onMobSpawn", function(mob)\n' \
                             '    mob:setCrystalElement(xi.element.EARTH)\nend)'
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Crystal element unknown')
        reader = self.reader()
        reader.module_text = 'xi.zones.Test.mobs.Mob.onMobSpawn'
        self.assertEqual(reader.read(self.kind(element='fire'))[0]['crystal']['value'], 'Fire crystal (conditional)')

    def test_crystal_parser_does_not_change_numeric_or_aggro_readers(self):
        file = lua_source.LuaFile('crystal.lua', 'entity.onMobInitialize = function(mob)\n'
                                  '    mob:setCrystalElement(\n        xi.element.EARTH\n    )\nend')
        self.assertEqual(len(file.calls), 1)
        call = file.calls[0]
        self.assertEqual(lua_source.call_effect(call, True, {}, {}), (None, None))
        self.assertEqual(lua_source.aggro_effect(call, True), (None, None, None))
        self.assertFalse(lua_source.changes_elements(call, {}))
        self.assertFalse(lua_source.changes_weapons(call, {}))

    def test_crystal_helper_module_change_is_guarded(self):
        reader = self.reader()
        path = reader.tree / 'crystal_override.lua'
        path.write_text('return module', encoding='utf8')
        with mock.patch.object(info.aggro, 'lua_files_loaded', return_value=['crystal_override.lua']):
            original = info.loaded_digest(reader.tree)
            path.write_text('m:addOverride("xi.test.crystal", function(mob)\n'
                            '    mob:setCrystalElement(xi.element.EARTH)\nend)', encoding='utf8')
            with mock.patch.object(info, 'GUARDS', {}), mock.patch.object(info, 'MODULE_GUARD', original):
                with self.assertRaisesRegex(RuntimeError, 'Loaded monster or reward modules changed'):
                    info.check_source(reader.tree)

    def test_changed_native_information_stays_guarded(self):
        reader = self.reader()
        path = reader.tree / 'native.cpp'
        original = 'int reward() { return 1; }'
        path.write_text(original, encoding='utf8')
        with mock.patch.object(info, 'GUARDS', {'native.cpp': info.fingerprint(original)}):
            path.write_text('int reward() { return 2; }', encoding='utf8')
            with self.assertRaisesRegex(RuntimeError, 'Monster information source changed: native.cpp'):
                info.check_source(reader.tree)

    @unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
    def test_actual_gustaberg_lizards_override_species_fire(self):
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        for zone in ('North_Gustaberg', 'South_Gustaberg'):
            with self.subTest(zone=zone):
                text = (tree / 'scripts/zones' / zone / 'mobs/Rock_Lizard.lua').read_text(encoding='utf8')
                out = self.reader(text).read(self.kind(element='fire'))[0]
                self.assertEqual(out['crystal']['value'], 'Earth crystal (conditional)')
                self.assertIn('Source crystal element: Earth.', out['crystal']['notes'])

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

    def test_conditional_no_drops_is_not_a_permanent_disabled_claim(self):
        reader = self.reader('entity.onMobInitialize = function(mob)\n'
                             '    mob:setMobMod(xi.mobMod.NO_DROPS, 1)\nend\n'
                             'entity.onMobFight = function(mob)\n'
                             '    if condition then\n'
                             '        mob:setMobMod(xi.mobMod.NO_DROPS, 0)\n    end\nend')
        reward = reader.read(self.kind())[0]['rewards']
        self.assertIn('Conditional item drops', reward['value'])
        self.assertNotIn('Ordinary item drops disabled', reward['value'])
        self.assertIn('Scripts can enable or disable ordinary item drops.', reward['notes'])

    def test_fixed_no_drops_survives_unrelated_reward_and_listener_changes(self):
        reader = self.reader('entity.onMobFight = function(mob)\n'
                             '    mob:setMobMod(xi.mobMod.GIL_BONUS, gilBonus)\n'
                             '    mob:setMobMod(xi.mobMod.EXP_BONUS, expBonus)\nend')
        kind = self.kind(mob_mods={'no_drops': 1})
        kind.flags.add('scripted_drops')
        kind.effects.scripted_drops = ['Mob.lua adds an ITEM_DROPS listener']
        self.assertIn('Ordinary item drops disabled', reader.read(kind)[0]['rewards']['value'])

    @unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
    def test_prudence_reuses_guarded_survivor_loot_condition(self):
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        text = (tree / 'scripts/zones/AlTaieu/mobs/Jailer_of_Prudence.lua').read_text(encoding='utf8')
        reader, kind = self.reader(text), self.kind()
        kind.loot_conditions = drops.conditions(str(tree), 'AlTaieu', 'Jailer_of_Prudence')
        reward = reader.read(kind)[0]['rewards']
        self.assertIn('Conditional item drops', reward['value'])
        self.assertNotIn('Ordinary item drops disabled', reward['value'])
        self.assertIn('Only the surviving Jailer drops these items after the other one is defeated.', reward['notes'])

    @unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
    def test_angler_orobon_keeps_fixed_no_drops_despite_loot_mixin(self):
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        text = (tree / 'scripts/zones/Talacca_Cove/mobs/Angler_Orobon.lua').read_text(encoding='utf8')
        reader, kind = self.reader(text), self.kind()
        kind.flags.add('scripted_drops')
        kind.effects.scripted_drops = ['Angler_Orobon.lua uses mixin families/orobon']
        reward = reader.read(kind)[0]['rewards']
        self.assertIn('Ordinary item drops disabled', reward['value'])

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
