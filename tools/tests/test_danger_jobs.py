"""A main job or an effect-name check alone does not prove an encounter buff."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import danger_jobs


def kind(job='war', mixin=True, zone='Fixture', script='Fixture'):
    return SimpleNamespace(jobs=[job, 'war'], effects=SimpleNamespace(mixins=['job_special'] if mixin else []),
                           group_mixins=[], zone_dir=zone, script=script)


def spawn(body):
    return 'entity.onMobSpawn = function(mob)\n' + '\n'.join('    ' + line for line in body.splitlines()) + '\nend'


def config(special='xi.mobSkill.MIGHTY_STRIKES_1', extra=''):
    return 'xi.mix.jobSpecial.config(mob, {specials={{id=' + special + '}},' + extra + '})'


class JobBuffTests(unittest.TestCase):
    def status(self, text='', monster=None, facts=None, attrs=None):
        return danger_jobs.available_statuses(monster or kind(), attrs or {}, text, facts or {})

    def test_default_needs_attached_mixin_and_main_job(self):
        self.assertEqual(self.status()[0], {'MIGHTY_STRIKES'})
        self.assertEqual(self.status(monster=kind(mixin=False))[0], set())
        self.assertEqual(self.status(monster=kind('thf'))[0], set())
        self.assertEqual(self.status(monster=kind('blu'))[0], {'AZURE_LORE'})
        self.assertEqual(self.status(attrs={'jobs': ['blu', 'war']})[0], {'AZURE_LORE'})

    def test_blood_weapon_uses_same_blocked_and_configured_routes(self):
        self.assertEqual(self.status(monster=kind('drk'))[0], {'BLOOD_WEAPON'})
        self.assertEqual(self.status(monster=kind('drk', mixin=False))[0], set())
        self.assertEqual(self.status(spawn(config('xi.mobSkill.BLOOD_WEAPON_1')),kind('war'))[0], {'BLOOD_WEAPON'})
        self.assertEqual(self.status(spawn(config('xi.mobSkill.BLOOD_WEAPON_1', 'chance=0,')),kind('drk'))[0], set())
        self.assertEqual(self.status(spawn(config('xi.mobSkill.HUNDRED_FISTS_1')),kind('drk'))[0], set())
        self.assertEqual(self.status(spawn('mob:useMobAbility(1015)'),kind(mixin=False))[0], {'BLOOD_WEAPON'})

    def test_battlefield_attached_mixin_is_supported(self):
        monster = kind(mixin=False)
        monster.group_mixins = ['job_special']
        self.assertEqual(self.status(monster=monster)[0], {'MIGHTY_STRIKES'})

    def test_explicit_config_replaces_default_including_empty_list(self):
        self.assertEqual(self.status(spawn(config('xi.mobSkill.HUNDRED_FISTS_1')))[0], set())
        self.assertEqual(self.status(spawn('xi.mix.jobSpecial.config(mob, {specials={}})'))[0], set())
        self.assertEqual(self.status(spawn(config('xi.mobSkill.AZURE_LORE')))[0], {'AZURE_LORE'})

    def test_later_unconditional_replacement_drops_previous_special(self):
        text = spawn(config() + '\n' + config('xi.mobSkill.HUNDRED_FISTS_1'))
        self.assertEqual(self.status(text)[0], set())

    def test_chance_zero_and_dead_hp_threshold_do_not_prove_buff(self):
        self.assertEqual(self.status(spawn(config(extra='chance=0,')))[0], set())
        self.assertEqual(self.status(spawn('xi.mix.jobSpecial.config(mob, {specials={{id=688,hpp=0}}})'))[0], set())
        self.assertEqual(self.status(spawn(config(extra='chance=0.5,')))[0], {'MIGHTY_STRIKES'})

    def test_direct_grant_does_not_depend_on_disabled_mixin(self):
        text = spawn(config(extra='chance=0,') + '\nmob:addStatusEffect(xi.effect.MIGHTY_STRIKES, {duration=10})')
        self.assertEqual(self.status(text)[0], {'MIGHTY_STRIKES'})
        self.assertEqual(self.status(spawn(config(extra='chance=0,')), facts={688: {'grants_mighty_strikes': True}})[0], {'MIGHTY_STRIKES'})

    def test_other_status_grants_and_explicit_ability_are_separate_from_job(self):
        text = spawn('mob:useMobAbility(xi.mobSkill.AZURE_LORE)\nmob:addStatusEffect(xi.effect.EFFLUX, {})')
        self.assertEqual(self.status(text, kind(mixin=False), {1: {'grants_statuses': ['CHAIN_AFFINITY']}})[0],
                         {'AZURE_LORE', 'EFFLUX', 'CHAIN_AFFINITY'})

    def test_checks_target_grants_and_generic_mixin_data_are_not_routes(self):
        text = ('local job2hr={[xi.job.WAR]=xi.mobSkill.MIGHTY_STRIKES_1}\n' +
                spawn('if mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) then\n    return\nend\n' +
                      'target:addStatusEffect(xi.effect.MIGHTY_STRIKES, {})'))
        self.assertEqual(self.status(text, kind(mixin=False))[0], set())

    def test_dynamic_or_conditional_configuration_does_not_assume_war_default(self):
        for body in ('xi.mix.jobSpecial.config(mob, chosen)',
                     'if mob:getLocalVar("phase") == 2 then\n    ' + config('xi.mobSkill.HUNDRED_FISTS_1') + '\nend'):
            statuses, notes = self.status(spawn(body))
            self.assertEqual(statuses, set())
            self.assertTrue(notes)

    def test_other_job_configuration_does_not_hide_war_default(self):
        body = ('local mJob = mob:getMainJob()\nif mJob == xi.job.RDM then\n    ' +
                config('xi.mobSkill.CHAINSPELL_1') + '\nelseif mJob == xi.job.WHM then\n    ' +
                config('xi.mobSkill.BENEDICTION_1') + '\nend')
        self.assertEqual(self.status(spawn(body))[0], {'MIGHTY_STRIKES'})

    def test_generic_job_special_functions_do_not_leak_constants_or_chance_reset(self):
        text = ('g_mixins.job_special = function(jobSpecialMob)\n' +
                "    mob:setLocalVar('[jobSpecial]chance', 100)\nend\n" +
                'xi.mix.jobSpecial.config = function(mob, params)\n    return params\nend\n' +
                spawn(config(extra='chance=0,')))
        self.assertEqual(self.status(text)[0], set())

    def test_table_route_needs_effective_use_not_just_monster_name(self):
        monster = kind(mixin=False, zone='Monarch_Linn', script='Hotupuku')
        self.assertEqual(self.status('local twoHours = {xi.mobSkill.MIGHTY_STRIKES_1}', monster)[0], set())
        text = 'local twoHours = {xi.mobSkill.MIGHTY_STRIKES_1}\n' + spawn('mob:useMobAbility(twoHours[math.randomInt(1, #twoHours)])')
        statuses, notes = self.status(text, monster)
        self.assertEqual(statuses, {'MIGHTY_STRIKES'})
        self.assertIn('random', notes[0])

    def test_nonexistent_enum_string_is_not_a_grant(self):
        text = "local phaseTable = {{'MIGHTY_STRIKES'}}\n" + spawn('mob:useMobAbility(xi.mobSkill[phaseData.mobSpecial] or 0)')
        self.assertEqual(self.status(text, kind(mixin=False))[0], set())

    def test_source_guard_rejects_changed_mixin_and_loaded_override(self):
        with tempfile.TemporaryDirectory() as folder:
            tree = Path(folder)
            (tree / 'mixin.lua').write_text('old', encoding='utf8')
            with patch.object(danger_jobs, 'GUARDS', {'mixin.lua': 'wrong'}):
                with self.assertRaisesRegex(RuntimeError, 'review monster'):
                    danger_jobs.check_source(tree, [])
            (tree / 'module.lua').write_text('xi.mix.jobSpecial.config = function() end', encoding='utf8')
            with patch.object(danger_jobs, 'GUARDS', {}):
                with self.assertRaisesRegex(RuntimeError, 'changes job specials'):
                    danger_jobs.check_source(tree, ['module.lua'])


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'Set CHECKMATE_SOURCE_TREE to inspect the pinned source')
class SourceJobBuffTests(unittest.TestCase):
    def test_pinned_guards_and_actual_configs(self):
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        danger_jobs.check_source(tree)
        for zone, name, job, expected in (
                ('AlTaieu', 'Jailer_of_Hope', 'war', {'MIGHTY_STRIKES'}),
                ('Ship_bound_for_Mhaura', 'Sea_Horror', 'war', set()),
                ('Grand_Palace_of_HuXzoi', 'Qnaern', 'war', {'MIGHTY_STRIKES'}),
                ('Apollyon', 'Zlatorog', 'war', {'MIGHTY_STRIKES'})):
            text = (tree / ('scripts/zones/%s/mobs/%s.lua' % (zone, name))).read_text(encoding='utf8')
            self.assertEqual(danger_jobs.available_statuses(kind(job, zone=zone, script=name), {}, text, {})[0], expected)

    def test_reviewed_table_routes_are_present_in_effective_callbacks(self):
        from export import encounters, mobscripts
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        reader = encounters.Reader.__new__(encounters.Reader)
        reader.tree = str(tree)
        reader.scripts = mobscripts.ScriptIndex(str(tree), {}, {})
        reader.module_overrides = {}
        for zone, name in danger_jobs.ROUTES:
            with self.subTest(zone=zone, name=name):
                monster = kind(mixin=False, zone=zone, script=name)
                text, unknown = reader.kit_source(monster)
                statuses, notes = danger_jobs.available_statuses(monster, {}, text, {})
                self.assertIn('MIGHTY_STRIKES', statuses)
                self.assertTrue(notes)


if __name__ == '__main__':
    unittest.main()
