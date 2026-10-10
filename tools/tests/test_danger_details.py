"""Move detail notes use source distances and qualified removal options."""
import os
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import danger_details


def callback(body='', helper='mobPhysicalMove', parameter='params'):
    return ('mobskillObject.onMobWeaponSkill = function(mob, target, skill, action)\n' +
            ''.join('    ' + line + '\n' for line in body.splitlines()) +
            '    xi.mobskills.' + helper + '(mob, target, skill, action, ' + parameter + ')\nend')


class GeometryTests(unittest.TestCase):
    def test_move_range_does_not_become_radial_radius(self):
        value = danger_details.geometry(dict(mob_skill_aoe=1, mob_skill_distance=20, mob_skill_aoe_radius=8))
        self.assertEqual(value['activation_range'], 20)
        self.assertEqual(value['effect_radius'], 8)
        self.assertEqual(value['shape'], 'area around the monster')
        self.assertIn('not its affected area', ' '.join(value['notes']))
        self.assertIn('do not establish a safe', ' '.join(value['notes']))

    def test_radial_zero_radius_native_fallbacks(self):
        for aoe, expected in ((1, 17), (2, 8)):
            value = danger_details.geometry(dict(mob_skill_aoe=aoe, mob_skill_distance=17, mob_skill_aoe_radius=0))
            self.assertEqual(value['effect_radius'], expected)

    def test_rear_cone_uses_distance_and_never_radial_field(self):
        value = danger_details.geometry(dict(mob_skill_aoe=8, mob_skill_distance=15, mob_skill_aoe_radius=2))
        self.assertEqual(value['shape'], 'rear cone')
        self.assertEqual(value['cone_length'], 15)
        self.assertNotIn('effect_radius', value)
        self.assertIn('primary target is handled separately', ' '.join(value['notes']))

    def test_single_target_does_not_claim_an_area(self):
        value = danger_details.geometry(dict(mob_skill_aoe=0, mob_skill_distance=7, mob_skill_aoe_radius=0))
        self.assertEqual(value['shape'], 'single target')
        self.assertNotIn('effect_radius', value)

    def test_spell_sql_distances_are_tenths(self):
        value = danger_details.geometry(dict(AOE=1, spell_range=250, radius=100), spell=True)
        self.assertEqual(value['activation_range'], 25)
        self.assertEqual(value['effect_radius'], 10)
        self.assertIn('both hitboxes', ' '.join(value['notes']))
        self.assertIn('28.5-yalm', ' '.join(value['notes']))

    def test_monsters_do_not_gain_player_stratagem_areas(self):
        for aoe in (3, 4, 6):
            value = danger_details.geometry(dict(AOE=aoe, spell_range=200, radius=100), spell=True)
            self.assertEqual(value['shape'], 'single target')
            self.assertNotIn('effect_radius', value)

    def test_monster_pianissimo_type_is_radial(self):
        value = danger_details.geometry(dict(AOE=5, spell_range=200, radius=100), spell=True)
        self.assertEqual(value['effect_radius'], 10)

    def test_spell_cone_uses_scaled_radius(self):
        value = danger_details.geometry(dict(AOE=2, spell_range=120, radius=60), spell=True)
        self.assertEqual(value['cone_length'], 6)
        self.assertNotIn('effect_radius', value)

    def test_unknown_and_nonfinite_fields_stay_unknown(self):
        value = danger_details.geometry(dict(mob_skill_aoe=99, mob_skill_distance=float('nan')))
        self.assertNotIn('activation_range', value)
        self.assertNotIn('shape', value)
        self.assertEqual(len(value['unknown']), 2)

    def test_scripted_targeting_does_not_publish_exact_geometry(self):
        value = danger_details.geometry(dict(targeting_scripted=True, AOE=0, spell_range=200, radius=0), spell=True)
        self.assertNotIn('activation_range', value)
        self.assertNotIn('shape', value)
        self.assertTrue(value['unknown'])


class ShadowTests(unittest.TestCase):
    def test_physical_default_is_one_image_per_hit(self):
        value = danger_details.shadows(callback('local params = {}'))
        self.assertEqual(value['rules'], [dict(mode='absorb', count=1, per_hit=True)])
        self.assertEqual(value['unknown'], [])

    def test_breath_default_ignores_shadows(self):
        value = danger_details.shadows(callback('local params = {}', 'mobBreathMove'))
        self.assertEqual(value['rules'][0]['mode'], 'ignore')

    def test_magical_default_is_per_use(self):
        value = danger_details.shadows(callback('local params = {}', 'mobMagicalMove'))
        self.assertFalse(value['rules'][0]['per_hit'])

    def test_wipe_does_not_claim_absorption(self):
        value = danger_details.shadows(callback('local params = {}\nparams.shadowBehavior = xi.mobskills.shadowBehavior.WIPE_SHADOWS'))
        self.assertEqual(value['rules'][0]['mode'], 'wipe')
        self.assertIn('without letting them absorb', ' '.join(value['notes']))

    def test_conditional_override_retains_both_rules(self):
        value = danger_details.shadows(callback('local params = {}\nif condition then\n    params.shadowBehavior = xi.mobskills.shadowBehavior.IGNORE_SHADOWS\nend'))
        self.assertEqual({v['mode'] for v in value['rules']}, {'ignore', 'absorb'})
        self.assertIn('script conditions', ' '.join(value['notes']))

    def test_final_top_level_override_replaces_old_rule(self):
        value = danger_details.shadows(callback('local params = {}\nparams.shadowBehavior = 1\nparams.shadowBehavior = 999'))
        self.assertEqual([v['mode'] for v in value['rules']], ['wipe'])

    def test_reset_and_later_write_do_not_change_call(self):
        text = callback('local params = {}\nparams.shadowBehavior = 999\nparams = {}')
        text = text.replace('\nend', '\n    params.shadowBehavior = 0\nend')
        value = danger_details.shadows(text)
        self.assertEqual(value['rules'][0]['count'], 1)

    def test_dynamic_rule_is_not_invented(self):
        value = danger_details.shadows(callback('local params = {}\nparams.shadowBehavior = getShadows()'))
        self.assertEqual(value['rules'], [])
        self.assertTrue(value['unknown'])

    def test_inline_parameter_table_is_read(self):
        value = danger_details.shadows(callback(parameter='{shadowBehavior=3}'))
        self.assertEqual(value['rules'][0]['count'], 3)

    def test_aoe_notes_blink_and_mitigation(self):
        value = danger_details.shadows(callback('local params = {}\nparams.shadowBehavior = 4'), aoe=True)
        text = ' '.join(value['notes'])
        self.assertIn('removes Blink', text)
        self.assertIn('mitigation', text)

    def test_direct_gaze_bypasses_images(self):
        value = danger_details.shadows('xi.mobskills.mobGazeMove(mob, target, xi.effect.PETRIFICATION, 1, 0, 60)')
        self.assertEqual(value['rules'], [dict(mode='ignore')])
        self.assertEqual(value['unknown'], [])

    def test_unrecognized_helper_stays_unknown(self):
        self.assertTrue(danger_details.shadows('xi.unknown.applySomething(mob,target)')['unknown'])

    def test_legacy_random_check_is_a_range_before_the_effect(self):
        value = danger_details.shadows('local dmg = utils.takeShadows(target,1,math.randomInt(2,3))\nif dmg > 0 then target:copyStatusEffect(effect) end')
        self.assertEqual(value['rules'][0]['count_min'], 2)
        self.assertEqual(value['rules'][0]['count_max'], 3)
        self.assertIn('2-3 images before the effect', ' '.join(value['notes']))
        self.assertEqual(value['unknown'], [])


class RemovalTests(unittest.TestCase):
    def test_silence_is_not_mute(self):
        value = danger_details.removal_options(['Silence', 'Mute'], {}, set())
        self.assertEqual([v['effect'] for v in value], ['Silence'])
        self.assertIn('Echo Drops', value[0]['options'])

    def test_doom_has_chance_qualifiers(self):
        value = danger_details.removal_options(['Doom'], {}, set())
        self.assertEqual(value[0]['options'], ['Cursna (can fail)', 'Holy Water (can fail)'])

    def test_erase_requires_timed_eligible_flag_and_random_qualifier(self):
        rows = {'bind': {'flags': ['erasable']}, 'paralysis': {'flags': ['waltzable']}}
        value = danger_details.removal_options(['Bind', 'Paralysis'], rows, set())
        bind = next(v for v in value if v['effect'] == 'Bind')
        para = next(v for v in value if v['effect'] == 'Paralysis')
        self.assertEqual(bind['options'], ['Erase (one random eligible timed ailment)'])
        self.assertFalse(any('Erase' in option for option in para['options']))

    def test_ambiguous_label_does_not_assume_all_erasable(self):
        rows = {'curse_i': {'flags': ['erasable']}, 'curse_ii': {'flags': []}}
        value = danger_details.removal_options(['Curse'], rows, set())
        self.assertFalse(any('Erase' in option for option in value[0]['options']))

    def test_panacea_only_uses_its_actual_removal_list(self):
        value = danger_details.removal_options(['Bind', 'Accuracy down'], {}, {'Bind'})
        self.assertEqual(value, [{'effect': 'Bind', 'options': ['Panacea']}])

    def test_guard_fails_closed(self):
        with patch.object(danger_details, 'source_digest', return_value=('changed', 1)):
            with self.assertRaisesRegex(RuntimeError, 'review their rules'):
                danger_details.check_source('unused')


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'set CHECKMATE_SOURCE_TREE for pinned source checks')
class PinnedSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.reader = danger_details.Reader(os.environ['CHECKMATE_SOURCE_TREE'])

    def test_pinned_sources_match(self):
        self.assertGreater(danger_details.check_source(os.environ['CHECKMATE_SOURCE_TREE']), 2000)

    @unittest.skipUnless(os.environ.get('CHECKMATE_SECOND_SOURCE_TREE'), 'set CHECKMATE_SECOND_SOURCE_TREE to a fresh extraction')
    def test_fresh_extraction_has_the_same_guard_at_a_different_root(self):
        original = Path(os.environ['CHECKMATE_SOURCE_TREE']).resolve()
        fresh = Path(os.environ['CHECKMATE_SECOND_SOURCE_TREE']).resolve()
        self.assertNotEqual(original, fresh)
        self.assertEqual(danger_details.source_digest(original), danger_details.source_digest(fresh))
        self.assertEqual(danger_details.check_source(fresh), danger_details.check_source(original))

    def test_loaded_final_sting_ignores_shadows(self):
        value = self.reader.skill(dict(mob_skill_id=319, mob_skill_name='final_sting', mob_skill_aoe=0,
                                      mob_skill_distance=7, mob_skill_aoe_radius=0), {})
        self.assertEqual(value['shadows'][0]['mode'], 'ignore')
        self.assertEqual(value['unknown'], [])

    def test_blood_drain_retains_pool_conditional_shadow_rule(self):
        value = self.reader.skill(dict(mob_skill_id=1, mob_skill_name='blood_drain', mob_skill_aoe=0,
                                      mob_skill_distance=7, mob_skill_aoe_radius=0), {})
        self.assertEqual({v['mode'] for v in value['shadows']}, {'ignore', 'absorb'})

    def test_death_casting_flag_bypasses_shadows(self):
        value = self.reader.spell(dict(spellid=367, name='death', group=2, AOE=0, spell_range=200, radius=0),
                                  {'effects': ['Instant KO']})
        self.assertEqual(value['shadows'], [dict(mode='ignore')])

    def test_sleepga_wipes_shadows(self):
        value = self.reader.spell(dict(spellid=273, name='sleepga', group=2, AOE=1, spell_range=200, radius=100),
                                  {'effects': ['Sleep']})
        self.assertEqual(value['shadows'], [dict(mode='wipe')])
        self.assertEqual(value['effect_radius'], 10)

    def test_direct_blue_dispel_does_not_use_native_single_spell_absorption(self):
        value = self.reader.spell(dict(spellid=537, name='blank_gaze', group=3, AOE=0, spell_range=200, radius=0),
                                  {'effects': ['Buff removal']})
        self.assertEqual(value['shadows'], [dict(mode='ignore')])
        self.assertEqual(value['unknown'], [])

    def test_emetic_discharge_retains_legacy_two_to_three_shadow_check(self):
        value = self.reader.skill(dict(mob_skill_id=2, mob_skill_name='emetic_discharge', mob_skill_aoe=0,
                                      mob_skill_distance=7, mob_skill_aoe_radius=0), {'effects': ['Poison']})
        self.assertEqual(value['shadows'][0]['count_min'], 2)
        self.assertEqual(value['shadows'][0]['count_max'], 3)
        self.assertEqual(value['unknown'], [])

    def test_remedy_interruption_and_doom_chance_are_visible(self):
        value = {'notes': []}
        self.reader.removals({'effects': ['Paralysis', 'Doom']}, value)
        self.assertIn('Paralysis can interrupt Remedy', ' '.join(value['notes']))
        self.assertIn('Doom removal is a chance', ' '.join(value['notes']))


if __name__ == '__main__':
    unittest.main()
