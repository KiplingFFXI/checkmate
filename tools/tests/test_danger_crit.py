"""Critical capability follows the effective helper gate, not physical damage alone."""
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import danger_crit, danger_effects


def callback(body, helper='mobPhysicalMove', parameter='params'):
    return ('mobskillObject.onMobWeaponSkill = function(target, mob, skill)\n' + ''.join('    ' + line + '\n' for line in body.splitlines()) +
            '    xi.mobskills.' + helper + '(mob, target, skill, action, ' + parameter + ')\nend')


class CriticalFactsTests(unittest.TestCase):
    def test_physical_default_has_only_mighty_strikes_path(self):
        fact = danger_crit.critical_facts(callback('local params = {}'))
        self.assertFalse(fact['can_crit'])
        self.assertTrue(fact['mighty_strikes'])
        self.assertEqual(fact['labels'], [])
        self.assertEqual(fact['notes'], [])
        self.assertEqual(fact['mighty_notes'], ['Requires Mighty Strikes to be active, with the move still usable.'])
        self.assertEqual(fact['unknown'], [])

    def test_ranged_default_has_no_mighty_strikes_override(self):
        fact = danger_crit.critical_facts(callback('local params = {}', 'mobRangedMove'))
        self.assertFalse(fact['can_crit'])
        self.assertFalse(fact['mighty_strikes'])
        self.assertEqual(fact['mighty_notes'], [])

    def test_chance_table_does_not_enable_roll(self):
        for helper in ('mobPhysicalMove', 'mobRangedMove'):
            with self.subTest(helper=helper):
                fact = danger_crit.critical_facts(callback('local params = {}\nparams.criticalChance = {1,1,1}', helper))
                self.assertFalse(fact['can_crit'])

    def test_enabled_roll_needs_no_tp_bonus(self):
        fact = danger_crit.critical_facts(callback('local params = {}\nparams.canCrit = true'))
        self.assertTrue(fact['can_crit'])
        self.assertEqual(fact['labels'], ['Can crit'])
        self.assertEqual(fact['notes'], ['This move can crit. Its current critical chance is not known.'])
        self.assertNotIn('Mighty Strikes', ' '.join(fact['notes']))
        self.assertTrue(fact['mighty_notes'])
        self.assertEqual(fact['unknown'], [])

    def test_false_or_nil_field_uses_false_default(self):
        for value in ('false', 'nil'):
            with self.subTest(value=value):
                fact = danger_crit.critical_facts(callback('local params = {}\nparams.canCrit = ' + value))
                self.assertFalse(fact['can_crit'])

    def test_literal_table_and_lua_numeric_truthiness(self):
        for value in ('true', '0', '1', '-1'):
            with self.subTest(value=value):
                fact = danger_crit.critical_facts(callback('', parameter='{canCrit=' + value + '}'))
                self.assertTrue(fact['can_crit'])
                self.assertEqual(fact['unknown'], [])

    def test_inline_initial_table_value(self):
        self.assertTrue(danger_crit.critical_facts(callback('local params = {canCrit=true}'))['can_crit'])

    def test_multiline_initial_table_value(self):
        body = 'local params =\n{\n    canCrit = true,\n    criticalChance = {0,0,0},\n}'
        self.assertTrue(danger_crit.critical_facts(callback(body))['can_crit'])

    def test_final_top_level_value_replaces_earlier_value(self):
        body = 'local params = {}\nparams.canCrit = true\nparams.canCrit = false'
        self.assertFalse(danger_crit.critical_facts(callback(body))['can_crit'])

    def test_whole_table_reset_clears_earlier_enablement(self):
        body = 'local params = {}\nparams.canCrit = true\nparams = {}'
        self.assertFalse(danger_crit.critical_facts(callback(body))['can_crit'])

    def test_later_assignment_cannot_change_earlier_call(self):
        text = callback('local params = {}').replace('\nend', '\n    params.canCrit = true\nend')
        self.assertFalse(danger_crit.critical_facts(text)['can_crit'])

    def test_conditional_enablement_is_labeled(self):
        body = 'local params = {}\nif condition then\n    params.canCrit = true\nend'
        fact = danger_crit.critical_facts(callback(body))
        self.assertEqual(fact['labels'], ['Can crit conditionally'])
        self.assertEqual(fact['notes'], ['This move can crit under script conditions. Its current critical chance is not known.'])
        self.assertEqual(fact['unknown'], [])

    def test_final_assignment_after_branch_clears_enablement(self):
        body = 'local params = {}\nif condition then\n    params.canCrit = true\nend\nparams.canCrit = false'
        self.assertFalse(danger_crit.critical_facts(callback(body))['can_crit'])

    def test_unknown_expression_preserves_uncertainty(self):
        fact = danger_crit.critical_facts(callback('local params = {}\nparams.canCrit = condition'))
        self.assertFalse(fact['can_crit'])
        self.assertEqual(fact['labels'], [])
        self.assertTrue(fact['unknown'])

    def test_unreadable_table_is_not_assumed_noncritical(self):
        fact = danger_crit.critical_facts(callback('local params = getParams()'))
        self.assertFalse(fact['can_crit'])
        self.assertTrue(fact['unknown'])

    def test_unknown_signature_and_legacy_argument_are_reported(self):
        fact = danger_crit.critical_facts('xi.mobskills.mobPhysicalMove(mob,target,skill,1,1,1,xi.mobskills.physicalTpBonus.CRIT_VARIES)')
        self.assertFalse(fact['can_crit'])
        self.assertEqual(len(fact['unknown']), 2)

    def test_comments_and_strings_are_not_calls_or_assignments(self):
        text = callback('local params = {}\n-- params.canCrit = true\nlocal unused = "params.canCrit = true"')
        fact = danger_crit.critical_facts(text)
        self.assertFalse(fact['can_crit'])
        self.assertFalse(danger_crit.critical_facts('local s = "xi.mobskills.mobPhysicalMove(mob,target,skill,action,{canCrit=true})"')['can_crit'])
        self.assertFalse(danger_crit.critical_facts('local s = [=[xi.mobskills.mobPhysicalMove(mob,target,skill,action,{canCrit=true})]=]')['can_crit'])

    def test_multiple_helpers_keep_any_critical_route(self):
        text = callback('local params = {}') + '\n' + callback('local params = {canCrit=true}', 'mobRangedMove')
        fact = danger_crit.critical_facts(text)
        self.assertTrue(fact['can_crit'])
        self.assertTrue(fact['mighty_strikes'])

    def test_mighty_strikes_requires_grant_to_actor(self):
        grants = ('xi.mobskills.mobBuffMove(mob, xi.effect.MIGHTY_STRIKES, 1, 0, 45)',
                  'mob:addStatusEffect(xi.effect.MIGHTY_STRIKES, 1, 0, 45)',
                  'mobArg:addStatusEffectEx(xi.effect.MIGHTY_STRIKES, 0, 1, 0, 45)')
        for text in grants:
            with self.subTest(text=text):
                self.assertTrue(danger_crit.grants_mighty_strikes(text))
        for text in ('target:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)',
                     'mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES)',
                     '-- mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)',
                     'local s = "mob:addStatusEffect(xi.effect.MIGHTY_STRIKES,1,0,45)"'):
            with self.subTest(text=text):
                self.assertFalse(danger_crit.grants_mighty_strikes(text))

    def test_other_critical_status_grants_are_separate(self):
        text = 'xi.mobskills.mobBuffMove(mob, xi.effect.AZURE_LORE,1,0,45)\nmob:addStatusEffect(xi.effect.CHAIN_AFFINITY,1,0,30)'
        fact = danger_crit.critical_facts(text)
        self.assertEqual(fact['grants_statuses'], ['AZURE_LORE', 'CHAIN_AFFINITY'])
        self.assertFalse(fact['grants_mighty_strikes'])

    def test_status_rejection_is_not_a_negative_or_partial_condition(self):
        self.assertEqual(danger_crit.blocked_statuses('if mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) then\n return 1\nend'), ['MIGHTY_STRIKES'])
        for condition in ('not mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES)',
                          'mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) and anotherCondition'):
            self.assertEqual(danger_crit.blocked_statuses('if ' + condition + ' then\n return 1\nend'), [])

    def test_physical_blue_requires_actual_buff_route(self):
        fact = danger_crit.spell_facts('local params = xi.spells.blue.getDefaultParams(caster)\nparams.attackType = xi.attackType.PHYSICAL\nreturn xi.spells.blue.usePhysicalSpell(caster,target,spell,params)')
        self.assertFalse(fact['can_crit'])
        self.assertEqual(fact['required_statuses'], ['AZURE_LORE', 'EFFLUX', 'CHAIN_AFFINITY'])
        self.assertTrue(fact['sneak_attack'])
        self.assertIn('single target', fact['notes'][1])

    def test_ranged_blue_cannot_use_sneak_attack_path(self):
        fact = danger_crit.spell_facts('params.attackType = xi.attackType.RANGED\nreturn xi.spells.blue.usePhysicalSpell(caster,target,spell,params)')
        self.assertTrue(fact['required_statuses'])
        self.assertFalse(fact['sneak_attack'])

    def test_nonphysical_blue_does_not_inherit_critical_path(self):
        fact = danger_crit.spell_facts('params.critChance = 100\nreturn xi.spells.blue.useMagicalSpell(caster,target,spell,params)')
        self.assertFalse(fact['required_statuses'])
        self.assertFalse(fact['can_crit'])

    def test_unknown_physical_blue_params_are_reported(self):
        fact = danger_crit.spell_facts('xi.spells.blue.usePhysicalSpell(caster,target,spell,makeParams())')
        self.assertTrue(fact['unknown'])


class EffectiveSourceTests(unittest.TestCase):
    def setUp(self):
        folder = tempfile.TemporaryDirectory(prefix='checkmate_critical_tests_')
        self.addCleanup(folder.cleanup)
        self.tree = Path(folder.name)
        self.write('scripts/actions/mobskills/example.lua', callback('local params = {canCrit=true}'))

    def write(self, rel, text):
        path = self.tree / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def facts(self, loaded=()):
        text, unknown = danger_effects.Sources(self.tree, loaded).move('example')
        self.assertEqual(unknown, [])
        return danger_crit.critical_facts(text)

    def test_replacement_discards_base_critical_path(self):
        self.write('module.lua', "m:addOverride('xi.actions.mobskills.example.onMobWeaponSkill', function(target,mob,skill)\n    return 0\nend)")
        self.assertFalse(self.facts(['module.lua'])['can_crit'])

    def test_super_keeps_base_critical_path(self):
        self.write('module.lua', "m:addOverride('xi.actions.mobskills.example.onMobWeaponSkill', function(target,mob,skill)\n    return super(target,mob,skill)\nend)")
        self.assertTrue(self.facts(['module.lua'])['can_crit'])

    def test_unused_other_callback_cannot_add_critical_path(self):
        text = callback('local params = {}') + '\n' + callback('local params = {canCrit=true}').replace('onMobWeaponSkill', 'onMobSkillCheck')
        self.write('scripts/actions/mobskills/example.lua', text)
        self.assertFalse(self.facts()['can_crit'])

    def test_called_local_helper_is_followed(self):
        text = callback('local params = {canCrit=true}').replace('mobskillObject.onMobWeaponSkill = function', 'local function hit')
        text += '\nmobskillObject.onMobWeaponSkill = function(target,mob,skill)\n    return hit(target,mob,skill)\nend'
        self.write('scripts/actions/mobskills/example.lua', text)
        self.assertTrue(self.facts()['can_crit'])

    def test_literal_forwarding_keeps_critical_path(self):
        self.write('scripts/actions/mobskills/other.lua', callback('local params = {canCrit=true}'))
        self.write('scripts/actions/mobskills/example.lua', 'mobskillObject.onMobWeaponSkill = function(target,mob,skill)\n    return xi.actions.mobskills.other.onMobWeaponSkill(target,mob,skill)\nend')
        self.assertTrue(self.facts()['can_crit'])

    def test_assigned_local_helper_scope_is_preserved(self):
        text = callback('local params = {canCrit=true}').replace('mobskillObject.onMobWeaponSkill', 'local hit')
        text += '\nmobskillObject.onMobWeaponSkill = function(target,mob,skill)\n    return hit(target,mob,skill)\nend'
        self.write('scripts/actions/mobskills/example.lua', text)
        self.assertTrue(self.facts()['can_crit'])

    def test_new_unreadable_gate_stops_reader(self):
        self.write('scripts/actions/mobskills/example.lua', callback('local params = {}\nparams.canCrit = newValue'))
        with patch.object(danger_crit, 'check_source'):
            reader = danger_crit.Reader(self.tree, [])
        with self.assertRaisesRegex(RuntimeError, 'critical-move parameters'):
            reader.read('example')

    def test_replaced_skill_check_removes_base_status_rejection(self):
        base = callback('local params = {}') + '\nmobskillObject.onMobSkillCheck = function(target,mob,skill)\n    if mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) then\n        return 1\n    end\n    return 0\nend'
        self.write('scripts/actions/mobskills/example.lua', base)
        self.write('module.lua', "m:addOverride('xi.actions.mobskills.example.onMobSkillCheck', function(target,mob,skill)\n    return 0\nend)")
        with patch.object(danger_crit, 'check_source'):
            self.assertEqual(danger_crit.Reader(self.tree, []).read('example')['blocked_statuses'], ['MIGHTY_STRIKES'])
            self.assertEqual(danger_crit.Reader(self.tree, ['module.lua']).read('example')['blocked_statuses'], [])


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'set CHECKMATE_SOURCE_TREE for pinned-source checks')
class PinnedCriticalTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        cls.reader = danger_crit.Reader(cls.tree)

    def test_real_intrinsic_examples(self):
        for name in ('foot_kick', 'power_attack', 'screwdriver', 'sickle_slash', 'hell_slash', 'heavy_shot', 'queasyshroom'):
            with self.subTest(name=name):
                fact = self.reader.read(name)
                self.assertTrue(fact['can_crit'])
                self.assertEqual(fact['unknown'], [])

    def test_real_noncritical_and_mighty_only_examples(self):
        for name in ('arching_arrow', 'dulling_arrow', 'bomb_toss', 'final_sting'):
            with self.subTest(name=name):
                fact = self.reader.read(name)
                self.assertFalse(fact['can_crit'])
                self.assertFalse(fact['mighty_strikes'])
        for name in ('howling_fist', 'blade_retsu', 'spike_flail'):
            with self.subTest(name=name):
                self.assertFalse(self.reader.read(name)['can_crit'])
                self.assertTrue(self.reader.read(name)['mighty_strikes'])
        self.assertTrue(self.reader.read('mighty_strikes')['grants_mighty_strikes'])
        self.assertFalse(self.reader.read('spike_flail')['grants_mighty_strikes'])
        self.assertEqual(self.reader.read('spike_flail')['blocked_statuses'], ['MIGHTY_STRIKES'])
        self.assertEqual(self.reader.read('azure_lore')['grants_statuses'], ['AZURE_LORE'])

    def test_real_blue_spells_require_buffs_and_ranged_excludes_sneak(self):
        for name in ('foot_kick', 'screwdriver', 'power_attack', 'sickle_slash', 'bludgeon'):
            with self.subTest(name=name):
                fact = self.reader.spell(name)
                self.assertFalse(fact['can_crit'])
                self.assertTrue(fact['required_statuses'])
                self.assertTrue(fact['sneak_attack'])
                self.assertEqual(fact['unknown'], [])
        for name in ('pinecone_bomb', 'queasyshroom', 'feather_storm'):
            self.assertFalse(self.reader.spell(name)['sneak_attack'])
        self.assertFalse(self.reader.spell('bomb_toss')['required_statuses'])

    def test_loaded_queasyshroom_replacement_is_used(self):
        text, unknown = self.reader.sources.move('queasyshroom')
        self.assertEqual(unknown, [])
        self.assertIn('0.10, 0.20, 0.25', text)
        self.assertTrue(danger_crit.critical_facts(text)['can_crit'])

    def test_complete_effective_callback_census(self):
        counts, rows = self.reader.census()
        self.assertEqual(counts, dict(files=1687, can_crit=96, mighty_strikes=603, grants_mighty_strikes=1, unresolved=0))
        self.assertEqual(len(rows), 1687)

    def test_changed_shared_gate_stops_export(self):
        original = Path.read_text
        def changed(path, *args, **kwargs):
            text = original(path, *args, **kwargs)
            return text.replace('canCrit            = false', 'canCrit            = true') if path.name == 'mobskills.lua' else text
        with patch.object(Path, 'read_text', changed), self.assertRaisesRegex(RuntimeError, 'helper semantics'):
            danger_crit.check_source(self.tree, self.reader.loaded)

    def test_changed_loaded_shared_override_stops_export(self):
        with patch.object(danger_crit, 'module_digest', return_value='changed'), self.assertRaisesRegex(RuntimeError, 'overrides changed'):
            danger_crit.check_source(self.tree, self.reader.loaded)


if __name__ == '__main__':
    unittest.main()
