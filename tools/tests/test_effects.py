"""Effects reader checks. Set CHECKMATE_EFFECTS_TREE for the pinned-source integration cases."""
import os
from pathlib import Path
import sys
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

    def test_spell_table_rejects_unparsed_row(self):
        with self.assertRaisesRegex(RuntimeError, 'unreadable'):
            effects.table_rows('local pTable = { [xi.magic.spell.SLOW] = makeRow(120) }', 'pTable', 'test.lua')

    def test_new_module_cannot_silently_change_duration(self):
        with mock.patch.object(effects.aggro, 'lua_files_loaded', return_value=['modules/new.lua']), \
             mock.patch.object(effects, 'source', return_value="m:addOverride('xi.effects.slow.onEffectGain', f)"):
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
        for number, low, high in [(258, 13, 60), (252, 2, 7), (254, 80, 300), (58, 30, 120), (59, 2, 120)]:
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
