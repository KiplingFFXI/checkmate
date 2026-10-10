"""Encounter danger labels need both a move path and an available monster buff."""
from pathlib import Path
import sys
from types import SimpleNamespace
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import encounters


class CriticalSource:
    def __init__(self):
        self.moves, self.spells = {}, {}

    def read(self, name):
        return self.moves.get(name, {})

    def spell(self, name):
        return self.spells.get(name, {})


class DangersIntegrationTests(unittest.TestCase):
    def setUp(self):
        self.reader = encounters.Reader.__new__(encounters.Reader)
        self.reader.skills = {1: dict(mob_skill_id=1, mob_skill_name='fixture_strike', mob_valid_targets=4, mob_skill_aoe=0)}
        self.reader.move_enum = {'FIXTURE_STRIKE': 1}
        self.reader.danger_crit = CriticalSource()
        self.reader.danger_effects = dict(skills={}, spells={})
        self.kind = SimpleNamespace(zone_dir='Test', script='Fixture', group_mixins=[], jobs=['war'])
        self.attrs = dict(jobs=['war'])
        self.reader.danger_crit.moves['fixture_strike'] = dict(can_crit=False, mighty_strikes=True,
                                                             blocked_statuses=[], mighty_notes=['The buff must still be active.'])
        self.blue = dict(spellid=519, name='fixture_blue', AOE=0)
        self.reader.danger_crit.spells['fixture_blue'] = dict(required_statuses=['AZURE_LORE', 'EFFLUX', 'CHAIN_AFFINITY'],
                                                            sneak_attack=True)

    def read(self, text='', skills=(1,), spells=(), reasons=()):
        return self.reader.dangers(self.kind, self.attrs, text, skills, spells, reasons)

    def assert_no_threats(self, result):
        self.assertEqual(result['entries'], [])
        self.assertEqual(result['coverage'], 'resolved')
        self.assertEqual(result['value'], 'No listed threats')
        self.assertFalse(result['incomplete'])

    def test_physical_helper_alone_does_not_assert_critical_capability(self):
        self.assert_no_threats(self.read())

    def test_war_job_without_special_mixin_does_not_supply_buff(self):
        self.assert_no_threats(self.read('entity.onMobSpawn = function(mob)\nend'))

    def test_attached_war_special_supplies_conditional_mighty_strikes(self):
        self.kind.group_mixins = ['job_special']
        result = self.read()
        self.assertIn('can crit during Mighty Strikes', result['value'])
        self.assertIn('The buff must still be active.', ' '.join(result['notes']))

    def test_mighty_strikes_check_is_not_a_grant(self):
        self.assert_no_threats(self.read('if mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) then\n    return\nend'))

    def test_rejected_normal_move_does_not_use_mighty_strikes_path(self):
        self.reader.danger_crit.moves['fixture_strike']['blocked_statuses'] = ['MIGHTY_STRIKES']
        self.assert_no_threats(self.read('mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)'))

    def test_forced_literal_id_can_bypass_move_check(self):
        self.reader.danger_crit.moves['fixture_strike']['blocked_statuses'] = ['MIGHTY_STRIKES']
        for expression in ('1', 'xi.mobSkill.FIXTURE_STRIKE'):
            with self.subTest(expression=expression):
                text = 'mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)\nmob:useMobAbility(' + expression + ')'
                self.assertIn('can crit during Mighty Strikes', self.read(text)['value'])

    def test_forcing_another_id_does_not_bypass_this_moves_check(self):
        self.reader.danger_crit.moves['fixture_strike']['blocked_statuses'] = ['MIGHTY_STRIKES']
        text = 'mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)\nmob:useMobAbility(2)'
        self.assert_no_threats(self.read(text))

    def test_tiamat_stops_mighty_strikes_moves_including_forced_phase_move(self):
        self.kind.zone_dir, self.kind.script = 'Attohwa_Chasm', 'Tiamat'
        text = 'mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)\nmob:useMobAbility(1)'
        self.assert_no_threats(self.read(text))

    def test_tiamat_rule_does_not_remove_intrinsic_critical_moves(self):
        self.kind.zone_dir, self.kind.script = 'Attohwa_Chasm', 'Tiamat'
        self.reader.danger_crit.moves['fixture_strike']['can_crit'] = True
        result = self.read('mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)')
        self.assertIn('can crit', result['value'])
        self.assertNotIn('during Mighty Strikes', result['value'])

    def test_intrinsic_critical_route_needs_no_available_buff(self):
        self.reader.danger_crit.moves['fixture_strike']['can_crit'] = True
        self.assertIn('can crit', self.read()['value'])

    def test_granting_move_enables_attack_but_is_not_itself_a_threat(self):
        self.reader.skills[2] = dict(mob_skill_id=2, mob_skill_name='fixture_buff', mob_valid_targets=1)
        self.reader.danger_crit.moves['fixture_buff'] = dict(grants_statuses=['MIGHTY_STRIKES'])
        result = self.read(skills=(1, 2))
        self.assertIn('Fixture Strike: can crit during Mighty Strikes', result['value'])
        self.assertNotIn('Fixture Buff', result['value'])

    def test_blue_physical_path_alone_does_not_assert_critical_capability(self):
        self.assert_no_threats(self.read(skills=(), spells=(self.blue,)))

    def test_blue_uses_only_available_status_names(self):
        text = 'mob:addStatusEffect(xi.effect.AZURE_LORE,1,0,45)'
        result = self.read(text, skills=(), spells=(self.blue,))
        self.assertIn('can crit during Azure Lore', result['value'])
        self.assertNotIn('Efflux', result['value'])
        self.assertNotIn('Chain Affinity', result['value'])

    def test_mighty_strikes_does_not_enable_blue_spell_critical_path(self):
        text = 'mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)'
        self.assert_no_threats(self.read(text, skills=(), spells=(self.blue,)))

    def test_blue_default_requires_attached_blue_mage_special(self):
        self.attrs['jobs'], self.kind.jobs = ['blu'], ['blu']
        self.assert_no_threats(self.read(skills=(), spells=(self.blue,)))
        self.kind.group_mixins = ['job_special']
        self.assertIn('Azure Lore', self.read(skills=(), spells=(self.blue,))['value'])

    def test_sneak_attack_requires_single_target(self):
        text = 'mob:addStatusEffect(xi.effect.SNEAK_ATTACK,1,0,45)'
        result = self.read(text, skills=(), spells=(self.blue,))
        self.assertIn('can crit during Sneak Attack', result['value'])
        self.assertIn('behind the target or have Hide', ' '.join(result['notes']))
        for aoe in (None, 1, 2, 4):
            with self.subTest(aoe=aoe):
                self.blue['AOE'] = aoe
                self.assert_no_threats(self.read(text, skills=(), spells=(self.blue,)))

    def test_sneak_attack_does_not_enable_ranged_blue_spell(self):
        self.reader.danger_crit.spells['fixture_blue']['sneak_attack'] = False
        text = 'mob:addStatusEffect(xi.effect.SNEAK_ATTACK,1,0,45)'
        self.assert_no_threats(self.read(text, skills=(), spells=(self.blue,)))

    def test_area_blue_can_still_use_azure_lore(self):
        self.blue['AOE'] = 1
        text = 'mob:addStatusEffect(xi.effect.AZURE_LORE,1,0,45)\nmob:addStatusEffect(xi.effect.SNEAK_ATTACK,1,0,45)'
        result = self.read(text, skills=(), spells=(self.blue,))
        self.assertIn('Azure Lore', result['value'])
        self.assertNotIn('Sneak Attack', result['value'])

    def test_debuff_stays_visible_without_critical_buff(self):
        self.reader.danger_effects['skills'][1] = dict(effects=['Poison'], notes=['A landed effect still needs its checks.'])
        result = self.read()
        self.assertIn('Poison', result['value'])
        self.assertNotIn('can crit', result['value'])

    def test_self_only_skill_is_excluded_even_with_harmful_label(self):
        self.reader.skills[1]['mob_valid_targets'] = 1
        self.reader.danger_effects['skills'][1] = dict(effects=['Sleep'])
        self.assert_no_threats(self.read('mob:useMobAbility(1)'))

    def test_forced_any_allegiance_move_can_harm_an_opponent(self):
        self.reader.skills[1]['mob_valid_targets'] = 2048
        self.reader.skills[1]['mob_skill_name'] = 'floral_bouquet'
        self.reader.danger_effects['skills'][1] = dict(effects=['Sleep'], notes=['Only opposing allegiance is affected.'])
        result = self.read('mob:useMobAbility(1)')
        self.assertIsNotNone(result)
        self.assertIn('Floral Bouquet', result['value'])
        self.assertIn('opposing allegiance', ' '.join(result['notes']))

    def test_any_allegiance_alone_does_not_resolve_an_ordinary_target(self):
        self.reader.skills[1]['mob_valid_targets'] = 2048
        self.reader.danger_effects['skills'][1] = dict(effects=['Sleep'])
        self.assert_no_threats(self.read())

    def test_enemy_flag_still_resolves_target_when_any_allegiance_is_also_set(self):
        self.reader.skills[1]['mob_valid_targets'] = 2048 | 4
        self.reader.danger_effects['skills'][1] = dict(effects=['Sleep'])
        self.assertIn('Sleep', self.read()['value'])

    def test_incomplete_effect_keeps_unknown_reason_beside_known_danger(self):
        self.reader.danger_effects['skills'][1] = dict(effects=['Poison'], unknown=['One additional effect is unresolved.'])
        result = self.read(reasons=['The encounter also has a conditional phase.'])
        notes = ' '.join(result['notes'])
        self.assertEqual(result['coverage'], 'partial')
        self.assertTrue(result['incomplete'])
        self.assertIn('One additional effect is unresolved.', notes)
        self.assertIn('conditional phase', notes)

    def test_reviewed_details_and_critical_label_are_both_retained(self):
        entry = encounters.danger_entry('Fixture', ('Existing threat summary', 'Existing source condition.'),
                                        dict(effects=['Poison']), dict(can_crit=True, notes=['A critical roll is possible.']))
        self.assertEqual(entry[0], 'Existing threat summary, can crit')
        self.assertIn('Existing source condition.', entry[1])
        self.assertIn('Possible effects: Poison.', entry[1])
        self.assertIn('A critical roll is possible.', entry[1])


if __name__ == '__main__':
    unittest.main()
