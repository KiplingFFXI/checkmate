"""Effects reader checks. Set CHECKMATE_EFFECTS_TREE for the pinned-source integration cases."""
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import content, effects, overlays


class ReaderTests(unittest.TestCase):
    def test_usual_ties_and_unknown(self):
        self.assertEqual(effects.mode([30, 60, 30, 60, None]), 60)
        self.assertEqual(effects.mode([30, 30, 60]), 30)
        self.assertIsNone(effects.mode([None, 0]))

    def test_tp_random_and_resist_duration(self):
        self.assertEqual(effects.duration_value('xi.mobskills.calculateDuration(skill:getTP(), 30, 90)', ''), 90)
        self.assertEqual(effects.duration_value('math.randomInt(80, 300)', ''), 300)
        self.assertEqual(effects.duration_value('math.floor(90 * resistRate)', ''), 90)
        self.assertIsNone(effects.duration_value('caster:getSkillLevel(xi.skill.MAGIC)', ''))

    def test_conflicting_local_branches_stay_unknown(self):
        self.assertIsNone(effects.duration_value('duration', 'local duration = 30\nlocal duration = 60'))
        self.assertEqual(effects.duration_value('duration', 'local base = 90\nlocal duration = base'), 90)

    def test_reassigned_local_stays_unknown(self):
        for before, after in ((4, 10), (180, 30), (30, 15), (120, 90)):
            text = 'local duration = %d\nif target:isPC() then\n    duration = %d\nend' % (before, after)
            self.assertIsNone(effects.duration_value('duration', text))

    def test_multistatus_move_preserves_each_duration(self):
        text = '''local duration = 120
xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 100, 0, duration)
target:addStatusEffect(xi.effect.POISON, { power = 1, duration = 30, tick = 3 })'''
        result = effects.move_effects(text, {'SLOW': 13, 'POISON': 3, 'NONE': 255}, 'test.lua')
        self.assertEqual(result, {13: {'effect': 13, 'seconds': 120}, 3: {'effect': 3, 'seconds': 30}})

    def test_unknown_move_duration_keeps_effect(self):
        text = 'mob:addStatusEffect(xi.effect.DEFENSE_BOOST, { power = 20, duration = mob:getMainLvl() })'
        self.assertEqual(effects.move_effects(text, {'DEFENSE_BOOST': 91, 'NONE': 255}, 'test.lua'),
                         {91: {'effect': 91}})

    def test_effect_table_statuses(self):
        text = '''local effectTable = { [1] = { effectId = xi.effect.STUN, power = 1, duration = 12 } }
xi.combat.action.executeMobskillStatusEffect(pet, target, skill, effectTable)'''
        self.assertEqual(effects.move_effects(text, {'STUN': 10, 'NONE': 255}, 'test.lua'),
                         {10: {'effect': 10, 'seconds': 12}})

    def test_gaze_duration_keeps_its_effect(self):
        text = 'skill:setMsg(xi.mobskills.mobGazeMove(mob, target, xi.effect.SILENCE, 1, 0, 60))'
        self.assertEqual(effects.move_effects(text, {'SILENCE': 6, 'NONE': 0}, 'gaze.lua'),
                         {6: {'effect': 6, 'seconds': 60}})

    def test_sql_move_names_need_the_exact_script_case(self):
        for archived in (False, True):
            with self.subTest(archived=archived), tempfile.TemporaryDirectory() as folder:
                root = Path(folder)
                script = root / 'scripts/actions/mobskills/Example.lua'
                script.parent.mkdir(parents=True)
                script.write_text('xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1, 0, 45)')
                if archived:
                    relative = script.relative_to(root).as_posix()
                    (root / effects.source_tree.SOURCE_PATHS).write_text(json.dumps({relative.casefold(): relative}))
                rows = [{'mob_skill_id': 1, 'mob_skill_name': 'example'},
                        {'mob_skill_id': 2, 'mob_skill_name': 'Example'}]
                is_file = Path.is_file

                def insensitive_file(path):
                    if path.parent == script.parent and path.name.casefold() == script.name.casefold():
                        return True
                    return is_file(path)

                with mock.patch.object(effects, 'sql_rows', return_value=rows), \
                     mock.patch.object(Path, 'is_file', insensitive_file):
                    result = effects.moves(root, {'SLOW': 13, 'NONE': 0}, {})
                self.assertEqual(result, {2: {'effect': 13, 'seconds': 45, '_name': 'Example'}})

    def test_pet_forwarding_uses_the_selected_era_callback(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            mob = root / 'scripts/actions/mobskills/example_jugpet.lua'
            mob.parent.mkdir(parents=True)
            mob.write_text('mobskill.onMobWeaponSkill = function(mob, target, skill)\n'
                           '    return xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1, 0, 300)\nend')
            pet = root / 'scripts/actions/abilities/pets/example.lua'
            pet.parent.mkdir(parents=True)
            pet.write_text("local skillName = 'example_jugpet'\n"
                           'ability.onPetAbility = function(target, pet, petskill, owner, action)\n'
                           '    return xi.actions.mobskills[skillName].onMobWeaponSkill(pet, target, petskill, action)\nend')
            module = root / 'modules/example.lua'
            module.parent.mkdir()
            module.write_text("m:addOverrideByEra('xi.actions.mobskills.example_jugpet.onMobWeaponSkill', {\n"
                              '    [xi.expansion.ROV] = function(mob, target, skill)\n'
                              '        return xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1, 0, 180)\n'
                              '    end,\n'
                              '    [xi.expansion.SOA] = function(mob, target, skill)\n'
                              '        return xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1, 0, 120)\n'
                              '    end,\n'
                              '    [xi.expansion.TOAU] = function(mob, target, skill)\n'
                              '        return xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1, 0, 15)\n'
                              '    end,\n})')
            overrides = effects.override_moves(root, ['modules/example.lua'])
            with mock.patch.object(effects, 'sql_rows', return_value=[{'pet_skill_id': 700, 'pet_skill_name': 'example'}]):
                result = effects.moves(root, {'SLOW': 13, 'NONE': 0}, overrides, pet=True)
            self.assertEqual(result[700]['seconds'], 120)

    def test_unknown_era_callback_stops_the_move_reader(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root / 'modules').mkdir()
            (root / 'modules/example.lua').write_text(
                "m:addOverrideByEra('xi.actions.mobskills.example.onMobWeaponSkill', {\n"
                '    [xi.expansion.FUTURE] = function(mob, target, skill)\n    end,\n})')
            with self.assertRaisesRegex(RuntimeError, 'unreadable era action override'):
                effects.override_moves(root, ['modules/example.lua'])

    def test_spell_table_rejects_unparsed_row(self):
        with self.assertRaisesRegex(RuntimeError, 'unreadable'):
            effects.table_rows('local pTable = { [xi.magic.spell.SLOW] = makeRow(120) }', 'pTable', 'test.lua')

    def test_new_module_cannot_silently_change_duration(self):
        with mock.patch.object(effects.aggro, 'lua_files_loaded', return_value=['modules/new.lua']), \
             mock.patch.object(effects, 'source', return_value="m:addOverride('xi.effects.slow.onEffectGain', f)"):
            with self.assertRaisesRegex(RuntimeError, 'modules/new.lua changes an Effects source'):
                effects.check_source('unused')

    def test_new_nadrs_override_cannot_silently_change_duration(self):
        with mock.patch.object(effects.aggro, 'lua_files_loaded', return_value=['modules/new.lua']), \
             mock.patch.object(effects, 'source', return_value="m:addOverride('xi.items.nadrs.onItemAdditionalEffect', f)"):
            with self.assertRaisesRegex(RuntimeError, 'modules/new.lua changes an Effects source'):
                effects.check_source('unused')

    def test_removal_metadata_uses_groups_negative_and_remove(self):
        rows = {'sleep': {'id': 2, 'exclusion_group': 'sleep', 'negative': 'sleep_ii'},
                'sleep_ii': {'id': 19, 'exclusion_group': 'sleep'},
                'lullaby': {'id': 193, 'exclusion_group': 'sleep'},
                'haste': {'id': 33, 'remove': 'slow'}, 'slow': {'id': 13, 'block': 'haste'}}
        with mock.patch.object(overlays, 'load_merged', return_value={'status_effects': rows}):
            result = effects.effect_rows('unused', [])
        self.assertEqual(result[2]['drops'], [19, 193])
        self.assertEqual(result[33]['drops'], [13])
        self.assertEqual(result[13]['drops'], [])


@unittest.skipUnless(os.environ.get('CHECKMATE_EFFECTS_TREE'), 'CHECKMATE_EFFECTS_TREE not set')
class PhoenixTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_EFFECTS_TREE']
        cls.data = effects.build(cls.tree, overlays.data_roots(cls.tree), content.Content(True, ['rotz', 'cop', 'toau']))

    def test_spell_duration_boundaries(self):
        spells = self.data['spells']
        for number, low, high in [(258, 13, 60), (252, 2, 7), (254, 80, 300), (58, 30, 120), (59, 30, 120)]:
            self.assertEqual((spells[number]['seconds'], spells[number]['top']), (low, high))
        self.assertEqual(spells[253]['seconds'], 60)
        self.assertEqual(spells[259]['seconds'], 90)
        self.assertEqual(spells[220]['seconds'], 30)
        self.assertEqual(spells[221]['seconds'], 120)
        self.assertEqual(spells[60]['seconds'], 150)
        self.assertEqual(spells[107]['seconds'], 120)

    def test_merit_caps_come_from_era_costs(self):
        self.assertEqual(self.data['merits']['dia_iii'], {'id': 2304, 'base': 0, 'per_rank': 30, 'most': 3})
        self.assertEqual(self.data['merits']['angon'], {'id': 2882, 'base': 15, 'per_rank': 15, 'most': 3})
        self.assertEqual(self.data['spells'][25]['merit'], 'dia_iii')
        self.assertEqual(self.data['spells'][232]['merit'], 'bio_iii')

    def test_pet_packet_ids_and_nightmare_companion(self):
        self.assertEqual(self.data['pacts'][692]['seconds'], 45)
        nightmare = self.data['pacts'][658]
        self.assertEqual((nightmare['effect'], nightmare['seconds'], nightmare['deep']), (2, 90, True))
        self.assertNotIn('by_effect', nightmare)
        self.assertEqual(self.data['pacts'][562]['seconds'], 120)
        self.assertEqual(self.data['pacts'][624]['seconds'], 12)

    def test_loaded_phoenix_mob_overrides(self):
        for number, seconds in [(305, 180), (310, 120), (345, 300), (371, 120)]:
            self.assertEqual(self.data['skills'][number]['seconds'], seconds)

    def test_era_jugpet_duration_and_gaze_forwarding(self):
        for number, effect, seconds in [(673, 5, 120), (676, 2, 60), (678, 3, 90),
                                        (730, 6, 60), (740, 147, 120), (750, 28, 15), (758, 13, 120)]:
            with self.subTest(pet_skill=number):
                row = self.data['pacts'][number]
                self.assertEqual((row['effect'], row['seconds']), (effect, seconds))
        self.assertEqual(self.data['pet_moves'][3841]['seconds'], 120)
        self.assertEqual(self.data['pet_moves'][3916]['seconds'], 15)

    def test_loaded_poison_range_keeps_its_upper_duration_estimate(self):
        text = effects.source(self.tree, 'modules/phoenix/lua/actions/mobskills/poison_breath_crawler_pre_wotg.lua')
        self.assertIn('math.random(60, 300)', text)
        self.assertEqual(effects.duration_value('duration', text), 300)
        self.assertEqual(self.data['skills'][345]['seconds'], 300)

    def test_branch_durations_are_not_reported_as_literals(self):
        names = {'hellsnap', 'charm', 'fragrant_breath', 'venom_spray'}
        found = {row['_name']: row for row in self.data['skills'].values() if row['_name'] in names}
        self.assertEqual(set(found), names)
        for row in found.values():
            self.assertNotIn('seconds', row)

    def test_module_sql_added_skill(self):
        self.assertEqual(self.data['skills'][1026]['_name'], 'arbor_storm')
        self.assertEqual(self.data['skills'][1026]['seconds'], 60)

    def test_proc_modes_and_matching_items(self):
        self.assertEqual({effect: self.data['proc_usual'][effect] for effect in (2, 10, 149)},
                         {2: 25, 10: 5, 149: 60})
        self.assertTrue(set(self.data['procs']) <= set(self.data['proc_effects']))
        self.assertEqual(len(self.data['procs']), 125)
        self.assertEqual(self.data['procs'][17650], 60)
        self.assertEqual(self.data['proc_effects'][17650], 3)
        self.assertNotIn(18198, self.data['procs'])

    def test_scripted_nadrs_requires_its_item_modifier(self):
        original = effects.sql_rows
        def without_nadrs(tree, table):
            return [row for row in original(tree, table)
                    if not (table == 'item_mods' and row['itemId'] == 17650)]
        with mock.patch.object(effects, 'sql_rows', side_effect=without_nadrs):
            _, procs, proc_effects, _ = effects.equipment(self.tree)
        self.assertNotIn(17650, procs)
        self.assertNotIn(17650, proc_effects)

    def test_changed_nadrs_script_stops_export(self):
        original = effects.source
        def changed(tree, relative):
            text = original(tree, relative)
            return text.replace('math.random(30, 60)', 'math.random(30, 90)') if relative == 'scripts/items/nadrs.lua' else text
        with mock.patch.object(effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'nadrs.lua changed'):
                effects.check_source(self.tree)

    def test_picture_ids_and_removal_rules(self):
        pictured = self.data['pictured']
        self.assertEqual(pictured, sorted(set(pictured)))
        self.assertNotIn(19, pictured)
        self.assertNotIn(193, pictured)
        self.assertEqual(self.data['effects'][2]['drops'], [19, 193])
        self.assertIn(33, self.data['effects'][13]['drops'])
        self.assertEqual(self.data['effects'][2]['usual'], 60)

    def test_changed_duration_helper_is_rejected(self):
        original = effects.source
        path = 'scripts/globals/spells/enfeebling_spell.lua'
        def changed(tree, relative):
            text = original(tree, relative)
            return text.replace('math.randomInt(13, 60)', 'math.randomInt(13, 90)') if relative == path else text
        with mock.patch.object(effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'enfeebling_spell.lua changed'):
                effects.check_source(self.tree)


if __name__ == '__main__':
    unittest.main()
