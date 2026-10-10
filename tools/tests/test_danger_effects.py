"""Danger effects describe possible harmful outcomes without counting self buffs."""
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import content, danger_effects as dangers, effects, overlays

IDS = {name: index + 1 for index, name in enumerate(sorted(dangers.HARMFUL | dangers.BENEFICIAL | {'FOOD', 'TELEPORT'}))}
IDS.update({name: 136 + index for index, name in enumerate('STR_DOWN DEX_DOWN VIT_DOWN AGI_DOWN INT_DOWN MND_DOWN CHR_DOWN'.split())})


def analyze(text, name='fixture'):
    return dangers.analyze(text, IDS, name)[0]


class EffectFactsTests(unittest.TestCase):
    def test_target_debuff_and_self_buff_are_separate(self):
        row = analyze('xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.POISON, 1, 3, 30)\n'
                      'xi.mobskills.mobBuffMove(mob, xi.effect.HASTE, 10, 0, 30)')
        self.assertEqual(row['effects'], ['Poison'])
        self.assertEqual(row['unknown'], [])

    def test_beneficial_target_effect_is_not_a_debuff(self):
        row = analyze('target:addStatusEffect(xi.effect.ELEMENTAL_SEAL, 1, 0, 30)\n'
                      'target:addStatusEffect(xi.effect.SUPER_BUFF, 1, 0, 30)')
        self.assertEqual(row['effects'], [])
        self.assertEqual(row['unknown'], [])

    def test_status_table_and_direct_effect_both_survive(self):
        row = analyze('local effectTable = { { effect = xi.effect.SLOW }, {effect = xi.effect.PARALYSIS} }\n'
                      'xi.combat.action.executeMobskillStatusEffect(mob, target, skill, effectTable)\n'
                      'target:addStatusEffect(xi.effect.BIO, {power=10})')
        self.assertEqual(row['effects'], ['Bio', 'Paralysis', 'Slow'])
        self.assertEqual(row['unknown'], [])

    def test_random_stat_range_lists_possible_outcomes(self):
        row = analyze('local effect = xi.effect.STR_DOWN + math.randomInt(0, 6)\n'
                      'xi.mobskills.mobStatusEffectMove(mob, target, effect, 1, 0, 30)')
        self.assertEqual(row['effects'], ['AGI down', 'CHR down', 'DEX down', 'INT down', 'MND down', 'STR down', 'VIT down'])
        self.assertTrue('Random effects may not all happen on the same use.' in row['notes'])
        self.assertEqual(row['unknown'], [])

    def test_conditional_effect_assignments_retain_all_possible_values(self):
        row = analyze('local effect = xi.effect.POISON\nif mob:isNM() then\n effect = xi.effect.PARALYSIS\nend\n'
                      'xi.mobskills.mobStatusEffectMove(mob, target, effect, 1, 0, 30)')
        self.assertEqual(row['effects'], ['Paralysis', 'Poison'])

    def test_transfer_requires_existing_ailment(self):
        row = analyze('local choices = { xi.effect.BIO, xi.effect.POISON }\n'
                      'for _, effect in ipairs(choices) do\n local status = mob:getStatusEffect(effect)\n target:copyStatusEffect(status)\nend')
        self.assertEqual(row['effects'], ['Bio', 'Poison'])
        self.assertIn('Transferred ailments must already be present on the monster.', row['notes'])
        self.assertEqual(row['unknown'], [])

    def test_removing_an_ailment_is_not_a_threat(self):
        row = analyze('target:delStatusEffect(xi.effect.BIO)\ntarget:delStatusEffect(xi.effect.HASTE)')
        self.assertEqual(row['effects'], ['Buff removal'])
        self.assertEqual(analyze('target:delStatusEffect(xi.effect.BIO)')['effects'], [])

    def test_dispel_and_theft_are_distinct(self):
        row = analyze('target:dispelAllStatusEffect()\nmob:stealStatusEffect(target)')
        self.assertEqual(row['effects'], ['Buff removal', 'Buff theft'])

    def test_charm_costume_does_not_add_a_fake_debuff(self):
        row = analyze('mob:charm(target)\ntarget:addStatusEffect(xi.effect.COSTUME, 1, 0, 30)')
        self.assertEqual(row['effects'], ['Charm'])
        self.assertEqual(row['unknown'], [])

    def test_harmful_food_has_explicit_reviewed_context(self):
        text = 'target:addStatusEffect(xi.effect.FOOD, 255, 0, 30)'
        self.assertEqual(analyze(text, 'saucepan')['effects'], ['Harmful food'])
        self.assertTrue(analyze(text)['unknown'])

    def test_forced_escape_is_conditional(self):
        row = analyze('target:addStatusEffect(xi.effect.TELEPORT, 1, 0, 30)', 'substitute')
        self.assertEqual(row['effects'], ['Forced Escape'])
        self.assertTrue(any('living player' in note for note in row['notes']))

    def test_unknown_effect_or_recipient_is_not_silently_safe(self):
        self.assertTrue(analyze('target:addStatusEffect(getEffect(), 1, 0, 30)')['unknown'])
        self.assertTrue(analyze('victim:addStatusEffect(xi.effect.POISON, 1, 0, 30)')['unknown'])
        self.assertTrue(analyze('xi.other.applyStatusEffect(mob, target)')['unknown'])

    def test_random_drains_cover_hp_mp_tp(self):
        row = analyze('local drain = math.randomInt(xi.mobskills.drainType.HP, xi.mobskills.drainType.TP)\n'
                      'xi.mobskills.mobDrainMove(mob, target, drain, 100)')
        self.assertEqual(row['effects'], ['HP drain', 'MP drain', 'TP drain'])
        self.assertEqual(row['unknown'], [])

    def test_direct_death_and_healing_are_separate(self):
        self.assertEqual(analyze('target:setHP(0)')['effects'], ['Instant KO'])
        self.assertEqual(analyze('target:setHP(target:getMaxHP())')['effects'], [])

    def test_blue_spell_additional_effect(self):
        row = analyze('local params = {}\nparams.effect = xi.effect.STUN\n'
                      'xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params)')
        self.assertEqual(row['effects'], ['Stun'])

    def test_elemental_debuff_names_the_reduced_resistance(self):
        row = analyze('target:addStatusEffect(xi.effect.NINJUTSU_ELE_DEBUFF, { subPower = xi.mod.WATER_MEVA })')
        self.assertEqual(row['effects'], ['Water magic evasion down'])

    def test_nonhostile_context_has_no_harmful_record(self):
        row, _ = dangers.analyze('target:addStatusEffect(xi.effect.POISON, 1, 0, 30)', IDS, hostile=False)
        self.assertEqual(row['effects'], [])
        self.assertEqual(row['unknown'], [])


class SourcesTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory(prefix='checkmate_danger_effect_tests_')
        self.addCleanup(self.folder.cleanup)
        self.tree = Path(self.folder.name)

    def write(self, rel, text):
        path = self.tree / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def test_only_called_local_helpers_enter_effect_body(self):
        self.write('scripts/actions/mobskills/test.lua', '''local function used(target)
    target:addStatusEffect(xi.effect.POISON, 1, 0, 30)
end
local function unused(target)
    target:addStatusEffect(xi.effect.DOOM, 1, 0, 30)
end
mobskillObject.onMobWeaponSkill = function(mob, target, skill, action)
    used(target)
end
mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end''')
        text, unknown = dangers.Sources(self.tree, []).move('test')
        self.assertEqual(analyze(text)['effects'], ['Poison'])
        self.assertEqual(unknown, [])

    def test_loaded_replacement_and_super_follow_init_order(self):
        self.write('scripts/actions/mobskills/test.lua', '''mobskillObject.onMobWeaponSkill = function(mob, target, skill, action)
    target:addStatusEffect(xi.effect.POISON, 1, 0, 30)
end''')
        self.write('modules/replaced.lua', '''m:addOverride('xi.actions.mobskills.test.onMobWeaponSkill', function(mob, target, skill, action)
    target:addStatusEffect(xi.effect.SLOW, 1, 0, 30)
end)''')
        self.write('modules/wrapped.lua', '''m:addOverride('xi.actions.mobskills.test.onMobWeaponSkill', function(mob, target, skill, action)
    super(mob, target, skill, action)
    target:addStatusEffect(xi.effect.BIO, 1, 0, 30)
end)''')
        text, unknown = dangers.Sources(self.tree, ['modules/replaced.lua', 'modules/wrapped.lua']).move('test')
        self.assertEqual(analyze(text)['effects'], ['Bio', 'Slow'])
        self.assertEqual(unknown, [])

    def test_literal_forwarding_resolves_other_action(self):
        self.write('scripts/actions/mobskills/test.lua', '''mobskillObject.onMobWeaponSkill = function(mob, target, skill, action)
    return xi.actions.weaponskills.other.onUseWeaponSkill(mob, target, skill, action)
end''')
        self.write('scripts/actions/weaponskills/other.lua', '''weaponskillObject.onUseWeaponSkill = function(mob, target, skill, action)
    target:addStatusEffect(xi.effect.PARALYSIS, 1, 0, 30)
end''')
        text, unknown = dangers.Sources(self.tree, []).move('test')
        self.assertEqual(analyze(text)['effects'], ['Paralysis'])
        self.assertEqual(unknown, [])

    def test_missing_handler_stays_unknown(self):
        text, unknown = dangers.Sources(self.tree, []).move('absent')
        self.assertEqual(text, '')
        self.assertTrue(unknown)

    def test_guard_rejects_changed_census(self):
        with patch.object(dangers, 'source_digest', return_value=('changed', 1)):
            with self.assertRaisesRegex(RuntimeError, 'complete harmful-effect census'):
                dangers.check_source(self.tree, [])


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'pinned source tree not supplied')
class PinnedSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.sources = dangers.Sources(cls.tree)
        cls.rows = effects.sql_rows(cls.tree, 'mob_skills')
        allowed = content.Content(True, ['rotz', 'cop', 'toau'])
        cls.spells = [row for row in effects.sql_rows(cls.tree, 'spell_list') if allowed.allows(row['content_tag'])]
        cls.result = dangers.build(cls.tree, cls.rows, cls.spells)
        status = overlays.load_merged(cls.tree, overlays.data_roots(cls.tree), 'status_effects')['status_effects']
        cls.ids = {name.upper(): row['id'] for name, row in status.items()}

    def move(self, name):
        return self.result['coverage']['by_script'][name]

    def test_complete_current_script_census(self):
        coverage = self.result['coverage']
        self.assertEqual(coverage['scripts'], 1687)
        self.assertEqual(coverage['harmful_scripts'], 752)
        self.assertEqual(coverage['unresolved_scripts'], {})
        self.assertEqual(coverage['watched_files'], 3007)

    def test_sql_missing_handlers_remain_explicit(self):
        coverage = self.result['coverage']
        self.assertEqual(coverage['harmful_skill_records'], 941)
        self.assertEqual(len(coverage['unresolved_skills']), 484)
        self.assertTrue(all('missing' in reasons[0] for reasons in coverage['unresolved_skills'].values()))

    def test_known_ailments_and_beneficial_negative_controls(self):
        self.assertEqual(self.move('nightmare')['effects'], ['Bio', 'Sleep'])
        self.assertEqual(self.move('battle_dance')['effects'], ['DEX down'])
        self.assertEqual(self.move('cimicine_discharge')['effects'], ['Slow'])
        for name in ('frog_cheer', 'glittering_ruby', 'goblin_rush', 'head_butt'):
            with self.subTest(name=name):
                self.assertEqual(self.move(name)['effects'], [])
                self.assertEqual(self.move(name)['unknown'], [])

    def test_random_and_transfer_cases(self):
        self.assertEqual(len(self.move('microspores')['effects']), 41)
        self.assertEqual(self.move('drain_whip')['effects'], ['HP drain', 'MP drain', 'TP drain'])
        self.assertEqual(self.move('saucepan')['effects'], ['Buff removal', 'Harmful food'])
        self.assertEqual(self.move('substitute')['effects'], ['Forced Escape'])

    def test_any_allegiance_move_keeps_enemy_effects(self):
        self.assertEqual(self.result['skills'][2166]['effects'], ['Sleep'])
        self.assertTrue(any('allegiance' in note for note in self.result['skills'][2166]['notes']))
        for skill_id in (1083, 1087, 3541):
            self.assertNotIn(skill_id, self.result['skills'])

    def test_direct_ko_does_not_inherit_a_separate_gaze_condition(self):
        row = self.move('Mortal_Blast')
        self.assertEqual(row['effects'], ['Instant KO'])
        self.assertFalse(any('face the monster' in note for note in row['notes']))

    def test_loaded_poison_breath_is_effective_handler(self):
        text, unknown = self.sources.move('poison_breath_crawler')
        self.assertEqual(unknown, [])
        self.assertIn('mobStatusEffectMove', text)
        self.assertEqual(self.move('poison_breath_crawler')['effects'], ['Poison'])

    def test_harmful_spells_include_shared_and_direct_helpers(self):
        rows = {row['name']: self.result['spells'].get(row['spellid']) for row in self.spells}
        self.assertEqual(rows['head_butt']['effects'], ['Stun'])
        self.assertEqual(rows['flare']['effects'], ['Water magic evasion down'])
        self.assertEqual(rows['sleep']['effects'], ['Sleep'])
        self.assertEqual(rows['dispel']['effects'], ['Buff removal'])
        self.assertEqual(rows['absorb-str']['effects'], ['STR down'])
        self.assertEqual(rows['aspir']['effects'], ['MP drain'])

    def test_missing_enabled_spell_handlers_are_not_safe(self):
        self.assertEqual(set(self.result['coverage']['unresolved_spells']), {
            'banish_v', 'banishga_v', 'poison_iv', 'poison_v', 'poisonga_iv', 'poisonga_v', 'meteor_ii', 'foe_requiem_viii'})
        self.assertEqual(self.result['coverage']['harmful_spell_records'], 191)


if __name__ == '__main__':
    unittest.main()
