"""Status timers retain their effective action and leave variable inputs unknown."""
import os
from pathlib import Path
import sys
import tempfile
import unittest
from types import SimpleNamespace
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import content, effect_actions, effects, overlays, lua_writer


class ActionDurationTests(unittest.TestCase):
    IDS = {'NONE': 0, 'SLEEP_I': 2, 'STUN': 10, 'SLOW': 13, 'EVASION_DOWN': 148, 'DEFENSE_DOWN': 149}

    def test_blue_enfeeble_uses_its_params(self):
        text = '''params.effect = xi.effect.SLEEP_I
params.duration = 90
return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params)'''
        self.assertEqual(effect_actions.choices(text, self.IDS, 'yawn'), {2: {'effect': 2, 'seconds': 90}})

    def test_blue_multistatus_random_and_unknown_are_separate(self):
        text = '''local effects = {
 [1] = { xi.effect.STUN, 1, 0, math.randomFloat(2, 8) },
 [2] = { xi.effect.SLOW, 20, 0, caster:getMainLvl() },
}
xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effects)'''
        self.assertEqual(effect_actions.choices(text, self.IDS, 'blue'),
                         {10: {'effect': 10, 'seconds': 8, 'top': 8}, 13: {'effect': 13}})

    def test_weapon_skill_table_and_unobserved_tp(self):
        text = '''local effects = { [1] = { xi.effect.EVASION_DOWN, 40 }, [2] = { xi.effect.DEFENSE_DOWN, 25 } }
local effectId = effects[index][1]
local duration = math.floor((120 + 6 * tp / 100) * resistanceRate)
xi.weaponskills.handleWeaponskillEffect(player, target, effectId, element, damage, power, duration)'''
        self.assertEqual(effect_actions.choices(text, self.IDS, 'break'),
                         {148: {'effect': 148}, 149: {'effect': 149}})

    def test_conflicting_blue_duration_stays_unknown(self):
        text = '''params.effect = xi.effect.SLEEP_I
params.duration = 90
if condition then
 params.duration = 45
end
return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params)'''
        self.assertEqual(effect_actions.choices(text, self.IDS, 'branch'), {2: {'effect': 2}})

    def test_damage_inference_is_target_only_and_needs_damage(self):
        text = '''local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params, action)
caster:addStatusEffect(xi.effect.SLOW, { duration = 30 })
target:addStatusEffect(xi.effect.STUN, { duration = 5 })'''
        statuses = effect_actions.choices(text, self.IDS, 'test')
        effect_actions.infer_damage(statuses, text, self.IDS, 'test', 'spells')
        self.assertEqual(statuses[10]['infer'], 'damage')
        self.assertNotIn('infer', statuses[13])
        text = text[text.index('caster:addStatusEffect'):]
        statuses = effect_actions.choices(text, self.IDS, 'test')
        effect_actions.infer_damage(statuses, text, self.IDS, 'test', 'spells')
        self.assertTrue(all('infer' not in row for row in statuses.values()))

    def test_random_effect_choice_is_not_inferred(self):
        text = '''local damage = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action)
local choices = { xi.effect.STUN, xi.effect.SLOW }
local effect = choices[math.random(1, 2)]
xi.weaponskills.handleWeaponskillEffect(player, target, effect, element, damage, power, 10)'''
        statuses = {10: {'effect': 10}, 13: {'effect': 13}}
        effect_actions.infer_damage(statuses, text, self.IDS, 'random', 'weaponskills')
        self.assertTrue(all('infer' not in row for row in statuses.values()))

    def test_selected_blue_effect_table_is_not_inferred(self):
        text = '''local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
local effects = { { xi.effect.STUN, 1, 0, 5 }, { xi.effect.SLOW, 10, 0, 60 } }
xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effects[choice])'''
        statuses = {10: {'effect': 10}, 13: {'effect': 13}}
        effect_actions.infer_damage(statuses, text, self.IDS, 'random', 'spells')
        self.assertTrue(all('infer' not in row for row in statuses.values()))

    def test_shared_ability_helper_is_not_inferred(self):
        text = '''target:takeDamage(damage, player)
target:addStatusEffect(xi.effect.SLEEP_I, { duration = 90 })'''
        statuses = {2: {'effect': 2, 'seconds': 90}}
        effect_actions.infer_damage(statuses, text, self.IDS, 'fire_shot', 'abilities')
        self.assertNotIn('infer', statuses[2])

    def test_landed_zero_pet_damage_is_separate_from_positive_only_branch(self):
        text = '''local info = xi.mobskills.mobPhysicalMove(pet, target, skill, action, params)
if xi.mobskills.processDamage(pet, target, skill, action, info) then
 target:addStatusEffect(xi.effect.STUN, { duration = 6 })
end'''
        rows = {10: {'effect': 10, 'infer': 'damage'}}
        effect_actions.infer_completion(rows, text, self.IDS, 'example', 'pacts')
        self.assertEqual(rows[10]['success_messages'], [185, 264])
        rows = {10: {'effect': 10, 'infer': 'damage'}}
        text = text.replace(' target:addStatusEffect', ' if info.damage > 0 then target:addStatusEffect')
        effect_actions.infer_completion(rows, text, self.IDS, 'example', 'pacts')
        self.assertEqual(rows[10]['infer'], 'damage')
        self.assertNotIn('success_messages', rows[10])


@unittest.skipUnless(os.environ.get('CHECKMATE_EFFECTS_TREE'), 'CHECKMATE_EFFECTS_TREE not set')
class PhoenixActionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_EFFECTS_TREE']
        cls.data = effects.build(cls.tree, overlays.data_roots(cls.tree), content.Content(True, ['rotz', 'cop', 'toau']))

    def test_absorb_uses_loaded_era_and_disabled_acc_is_excluded(self):
        for number, effect in zip(range(266, 273), range(136, 143)):
            self.assertEqual((self.data['spells'][number]['effect'], self.data['spells'][number]['seconds']), (effect, 90))
        self.assertNotIn(242, self.data['spells'])

    def test_blumagic_timer_examples(self):
        for number, effect, seconds in [(576, 2, 90), (584, 2, 60), (561, 149, 180), (575, 28, 5)]:
            row = self.data['spells'][number]
            self.assertEqual((row['effect'], row['seconds']), (effect, seconds))
        self.assertEqual(self.data['spells'][623]['top'], 8)
        self.assertEqual(set(self.data['spells'][604]['by_effect']), {3, 4, 5, 6, 11, 12, 13})

    def test_automaton_and_monster_flashbulb_are_distinct(self):
        self.assertEqual(self.data['automatons'][1947]['seconds'], 12)
        self.assertEqual(self.data['skills'][1947]['seconds'], 15)

    def test_weapon_skills_do_not_borrow_monster_durations(self):
        for number, effect in ((80, 148), (83, 149), (85, 147)):
            row = self.data['weaponskills'][number]
            self.assertEqual((row['effect'], row['seconds'], row['default_tp'], row['infer']),
                             (effect, 180, 1000, 'damage'))
        full = self.data['weaponskills'][87]
        self.assertEqual(set(full['by_effect']), {146, 147, 148, 149})
        self.assertEqual(full['infer'], 'damage')
        for row in full['by_effect'].values():
            self.assertEqual((row['seconds'], row['default_tp'], row['infer']), (180, 1000, 'damage'))

    def test_reviewed_damage_routes_and_non_damage_actions(self):
        for section, number in (('spells', 623), ('spells', 651)):
            row = self.data[section][number]
            self.assertEqual(row['infer'], 'damage', (section, number))
        for section, number in (('spells', 576), ('spells', 533), ('spells', 561),
                                ('pacts', 611), ('automatons', 1947)):
            row = self.data[section][number]
            self.assertTrue(all('infer' not in child for child in row.get('by_effect', {0: row}).values()),
                            (section, number))
        bash = self.data['automatons'][1944]['by_effect']
        self.assertEqual(bash[10]['infer'], 'success')
        self.assertEqual(bash[13]['success_messages'], [185, 264])
        self.assertIn('Hammermill', bash[13]['condition'])
        self.assertEqual(bash[13]['requires_owner_effect'], 303)
        self.assertEqual(self.data['pet_moves'][3840]['_name'], 'foot_kick')
        self.assertTrue(all('infer' not in row for row in self.data['skills'].values()))

    def test_zero_damage_completion_messages_and_prerequisites(self):
        for number in (46, 77, 168):
            for row in self.data['abilities'][number].get('by_effect', {0: self.data['abilities'][number]}).values():
                self.assertEqual((row['infer'], row['success_messages']), ('success', [110]))
        jump = self.data['abilities'][66]
        self.assertEqual((jump['seconds'], jump['requires_effect'], jump['success_messages']), (60, 126, [317]))
        penance = self.data['abilities'][82]
        self.assertEqual((penance['requires_merit'], penance['merit'], penance['success_messages']), ('penance', 'penance', [110]))
        self.assertEqual(self.data['abilities'][150]['success_messages'], [100])
        self.assertEqual(self.data['merits']['penance'], {'id': 2118, 'base': 0, 'per_rank': 20, 'most': 3, 'job': 2, 'level': 75})
        self.assertEqual(self.data['merits']['tomahawk'], {'id': 2050, 'base': 15, 'per_rank': 15, 'most': 3, 'job': 1, 'level': 75})
        for section, number in (('pacts', 513), ('pacts', 686), ('automatons', 2066), ('charmed_skills', 305)):
            row = self.data[section][number]
            self.assertEqual(row['infer'], 'success', (section, number))
            self.assertTrue(set(row['success_messages']) <= {185, 264, 317, 379, 747})

    def test_other_shots_cannot_borrow_light_shot_sleep(self):
        for number in (125, 126, 127, 128, 129, 130, 132):
            self.assertNotIn(number, self.data['abilities'])
        self.assertEqual(self.data['abilities'][131]['effect'], 2)

    def test_multi_status_success_keeps_each_possible_effect(self):
        for section, number, expected, messages in (
                ('spells', 633, {149, 167}, [236]), ('spells', 634, {5, 11}, [236]),
                ('pacts', 530, {146, 148}, [144]), ('pacts', 523, {6, 16}, [127])):
            rows = self.data[section][number]['by_effect']
            self.assertEqual(set(rows), expected)
            for row in rows.values():
                self.assertEqual((row['infer'], row['success_messages']), ('success', messages))
                self.assertTrue(row['condition'])

    def test_items_spikes_and_one_swing_feint_have_separate_triggers(self):
        for number, effect, seconds in ((5261, 22, 32), (5262, 804, 32), (5268, 16, 60)):
            row = self.data['items'][number]
            self.assertEqual((row['effect'], row['seconds'], row['success_messages']), (effect, seconds, [0]))
        self.assertEqual(set(self.data['items']), {5261, 5262, 5268})
        feint = self.data['reactive'][343]
        self.assertEqual((feint['effect'], feint['seconds'], feint['arm_seconds'], feint['arm_ability'], feint['arm_messages']),
                         (148, 30, 60, 156, [100]))
        self.assertTrue(feint['consume'])
        for kind, effect, seconds in ((2, 4, 30), (4, 9, 180), (5, 10, 3)):
            row = self.data['spikes'][kind]
            self.assertEqual((row['effect'], row['seconds'], row['infer']), (effect, seconds, 'reaction'))

    def test_server_only_effects_do_not_borrow_client_text_or_icons(self):
        for number, name in ((804, 'Hysteria'), (805, 'Tomahawk')):
            row = self.data['effects'][number]
            self.assertEqual(row['name'], name)
            self.assertTrue(row['description'])
            self.assertTrue(row['debuff'])
            self.assertFalse(row['icon'])
            self.assertNotIn(number, self.data['pictured'])

    def test_writer_preserves_per_effect_inference_and_tp_basis(self):
        stamp = SimpleNamespace(built='test', content='test')
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'effects.lua')
            lua_writer.write_effects(path, self.data, stamp)
            text = path.read_text(encoding='utf8')
        self.assertIn("[148] = { effect = 148, infer = 'damage', seconds = 180, default_tp = 1000 }", text)
        for section in ('charmed_skills', 'items', 'reactive', 'spikes'):
            self.assertIn('    ' + section + ' = {', text)
        self.assertIn('requires_merit', text)
        self.assertIn('success_messages', text)

    def test_loaded_job_era_and_pet_packet_namespaces(self):
        self.assertEqual(self.data['abilities'][161]['seconds'], 10)
        bash = self.data['abilities'][168]['by_effect']
        self.assertEqual((bash[10]['seconds'], bash[31]['seconds']), (6, 15))
        self.assertEqual(self.data['pet_moves'][3840]['_name'], 'foot_kick')
        self.assertNotIn('effect', self.data['pet_moves'][3840])

    def test_changed_blue_helper_stops_export(self):
        original = effects.source
        def changed(tree, rel):
            text = original(tree, rel)
            return text.replace('params.duration * resist', 'params.duration * 2 * resist') if rel.endswith('/bluemagic.lua') else text
        with mock.patch.object(effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'bluemagic.lua changed'):
                effect_actions.check_source(self.tree, effects.aggro.lua_files_loaded(self.tree))

    def test_changed_loaded_weapon_handler_stops_export(self):
        original = effects.source
        def changed(tree, rel):
            text = original(tree, rel)
            return text.replace('120 + 6 * tp', '600 + 6 * tp') if rel.endswith('/great_axe.lua') else text
        with mock.patch.object(effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'Loaded player-action overrides changed'):
                effect_actions.check_source(self.tree, effects.aggro.lua_files_loaded(self.tree))

    def test_changed_base_action_stops_inference_export(self):
        original = Path.read_text
        def changed(path, *args, **kwargs):
            text = original(path, *args, **kwargs)
            if path.as_posix().endswith('/blue/head_butt.lua'):
                text = text.replace('xi.effect.STUN', 'xi.effect.SLOW')
            return text
        with mock.patch.object(Path, 'read_text', changed):
            with self.assertRaisesRegex(RuntimeError, 'Player and pet action sources changed'):
                effect_actions.check_source(self.tree, effects.aggro.lua_files_loaded(self.tree))

    def test_changed_native_reaction_or_item_completion_stops_export(self):
        original = Path.read_text
        for suffix, before, after in (
                ('/utils/battleutils.cpp', 'std::chrono::seconds(30)', 'std::chrono::seconds(31)'),
                ('/entities/char_entity.cpp', 'ACTION_ITEM_FINISH', 'ACTION_ITEM_START')):
            def changed(path, *args, **kwargs):
                text = original(path, *args, **kwargs)
                if path.as_posix().endswith(suffix):
                    # Add a statement inside the guarded function even if enum spelling changes.
                    function = 'void HandleSpikesStatusEffect' if 'battleutils' in suffix else 'auto CCharEntity::OnItemFinish'
                    start = text.index(function)
                    brace = text.index('{', start)
                    text = text[:brace + 1] + '\n changedSource();\n' + text[brace + 1:]
                return text
            with self.subTest(source=suffix), mock.patch.object(Path, 'read_text', changed):
                with self.assertRaisesRegex(RuntimeError, 'Review Effects action namespaces'):
                    effect_actions.check_source(self.tree, effects.aggro.lua_files_loaded(self.tree))

    def test_changed_silent_item_callback_stops_export(self):
        original = effects.source
        def changed(tree, rel):
            text = original(tree, rel)
            return text.replace('xi.effect.HYSTERIA', 'xi.effect.STUN') if rel.endswith('/bottle_of_hysteroanima.lua') else text
        with mock.patch.object(effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'bottle_of_hysteroanima.lua changed'):
                effect_actions.check_source(self.tree, effects.aggro.lua_files_loaded(self.tree))


if __name__ == '__main__':
    unittest.main()
