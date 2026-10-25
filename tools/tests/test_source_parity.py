"""Change source values and formulas to check that mismatches stop the export."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import drops, effects, ph_rules, placeholders, source_parity


class LotteryReaderTests(unittest.TestCase):
    def test_seconds_and_random_window(self):
        self.assertEqual(ph_rules.seconds('math.randomInt(1, 5) * 60 * 60'), (3600, 18000))
        self.assertEqual(ph_rules.seconds('utils.hours(2)'), (7200, 7200))
        self.assertEqual(ph_rules.seconds('1'), (1, 1))
        self.assertIsNone(ph_rules.seconds('mob:getLocalVar("cooldown")'))

    def test_unknown_is_not_an_unconditional_known_chance(self):
        rule = ph_rules.read('if ready then xi.mob.phOnDespawn(mob, ID.mob.NM, chance, cooldown) end')[0][1]
        self.assertNotIn('chance', rule)
        self.assertNotIn('cooldown_min', rule)
        self.assertIn('Additional scripted eligibility applies.', rule['conditions'])

    def test_night_and_broken_day_option_are_distinct(self):
        for flag, expected in [('nightOnly', 'at night'), ('dayOnly', 'not enforced')]:
            text = 'local params = {}\nparams.%s = true\nxi.mob.phOnDespawn(mob, ID.mob.NM, 10, 3600, params)' % flag
            self.assertTrue(any(expected in note for note in ph_rules.read(text)[0][1]['conditions']))

    def test_replaced_dynamis_callback_has_no_lottery_rules(self):
        reader = placeholders.Reader.__new__(placeholders.Reader)
        reader.dynamis = SimpleNamespace(zone_dirs={'Dynamis-Buburimu'}, keeps=lambda *args: False)
        self.assertEqual(reader.despawn_rules(None, 'Dynamis-Buburimu', 'Vanguard_Impaler'), {})

    def test_new_nm_state_module_requires_review(self):
        with tempfile.TemporaryDirectory(prefix='checkmate_nm_test_') as folder:
            path = Path(folder) / 'new_module.lua'
            path.write_text("mob:setLocalVar('pop', GetSystemTime() + 45)", encoding='utf8')
            with mock.patch.object(ph_rules.aggro, 'lua_files_loaded', return_value=['new_module.lua']):
                with self.assertRaisesRegex(RuntimeError, 'changes NM lottery state'):
                    ph_rules.NmRules(folder)


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class SourceParityTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.runtime = source_parity.check_math(cls.tree)

    def source_change(self, path, before, after):
        original = effects.source

        def changed(tree, file):
            text = original(tree, file)
            if file == path:
                self.assertIn(before, text)
                text = text.replace(before, after, 1)
            return text

        return mock.patch.object(effects, 'source', side_effect=changed)

    def test_current_source_values_match(self):
        source_parity.check_tables(self.tree, self.runtime)

    def test_th_source_change_fails_without_relying_on_hash(self):
        with self.source_change(source_parity.TH, '2400, 1500', '2401, 1500'):
            with self.assertRaisesRegex(RuntimeError, 'TH 0'):
                source_parity.check_math(self.tree)

    def test_resistance_rank_source_change_fails(self):
        with self.source_change(source_parity.MAGIC, '[-3] = 0.95', '[-3] = 0.94'):
            with self.assertRaisesRegex(RuntimeError, 'resistance rank -3'):
                source_parity.check_math(self.tree)

    def test_hit_formula_source_change_fails(self):
        with self.source_change(source_parity.MAGIC, 'params.targetMagicEvasion + 25', 'params.targetMagicEvasion + 24'):
            with self.assertRaisesRegex(RuntimeError, 'magic hit rate'):
                source_parity.check_math(self.tree)

    def test_spell_bonus_source_change_fails(self):
        path = 'scripts/globals/spells/enfeebling_spell.lua'
        before = '[xi.magic.spell.STUN          ] = { xi.effect.STUN,               1, xi.mod.INT,    1,   0,   5, 0, false, 200 }'
        with self.source_change(path, before, before.replace('200', '201')):
            with self.assertRaisesRegex(RuntimeError, 'STUN bonus'):
                source_parity.check_tables(self.tree, self.runtime)

    def test_source_behavior_guard_fails(self):
        with self.source_change(source_parity.STATUS, 'isTargetImmune = function', 'isTargetImmune = function_CHANGED'):
            with self.assertRaisesRegex(RuntimeError, 'behavior guard'):
                source_parity.check_guards(self.tree)

    def test_real_lottery_examples(self):
        cases = [('Konschtat_Highlands/Tremor_Ram', 10, 1200, 1200),
                 ('Konschtat_Highlands/Rampaging_Ram', 10, 75600, 75600),
                 ('RuAun_Gardens/Groundskeeper', 5, 7200, 7200)]
        for name, chance, low, high in cases:
            zone, mob = name.split('/')
            path = Path(self.tree) / 'scripts/zones' / zone / 'mobs' / (mob + '.lua')
            rule = ph_rules.read(path.read_text(encoding='utf8'))[0][1]
            self.assertEqual((rule['chance'], rule['cooldown_min'], rule['cooldown_max']), (chance, low, high))

    def test_effective_nm_cooldowns_replace_helper_arguments(self):
        rules = ph_rules.NmRules(self.tree)
        # The PH passes twenty minutes; the loaded era callback sets an hour.
        path = Path(self.tree) / 'scripts/zones/Konschtat_Highlands/mobs/Tremor_Ram.lua'
        base = ph_rules.read(path.read_text(encoding='utf8'))[0][1]
        self.assertEqual(base['cooldown_min'], 1200)
        actual = rules.apply('Konschtat_Highlands', 'Rampaging_Ram', base)
        self.assertEqual((actual['chance'], actual['cooldown_min'], actual['cooldown_max']), (10, 3600, 3600))
        self.assertEqual(rules.cooldowns, {('Konschtat_Highlands', 'Rampaging_Ram'): 3600,
                                           ('La_Theine_Plateau', 'Lumbering_Lambert'): 3600})
        self.assertTrue(any('ignores' in note for note in actual['conditions']))
        self.assertEqual(base['cooldown_min'], 1200)

    def test_native_slot_nms_do_not_inherit_removed_lua_cooldowns(self):
        rules = ph_rules.NmRules(self.tree)
        base = {'chance': 10, 'cooldown_min': 10800, 'cooldown_max': 21600, 'conditions': []}
        for zone, mob in [*ph_rules.NM_SCRIPTS, ('Jugner_Forest', 'Fradubio')]:
            with self.subTest(zone=zone, mob=mob):
                self.assertEqual(rules.apply(zone, mob, base), base)
        self.assertEqual(ph_rules.read((Path(self.tree) / 'scripts/zones/South_Gustaberg/mobs/Rock_Lizard.lua')
                                     .read_text(encoding='utf8')), [])

    def test_changed_nm_override_and_reviewed_script_stop_export(self):
        original = Path.read_text
        for relative, before, after in [(ph_rules.ERA_TIMERS, "'Rampaging_Ram',     3600", "'Rampaging_Ram',     3601"),
                ('scripts/zones/Attohwa_Chasm/mobs/Citipati.lua', 'xi.hunts.checkHunt', 'xi.hunts.changedHunt')]:
            path = Path(self.tree) / relative
            self.assertIn(before, original(path, encoding='utf8'))

            def changed(file, *args, **kwargs):
                text = original(file, *args, **kwargs)
                return text.replace(before, after, 1) if file == path else text

            with mock.patch.object(Path, 'read_text', changed):
                with self.assertRaisesRegex(RuntimeError, 'changes NM lottery state'):
                    ph_rules.NmRules(self.tree).apply('Attohwa_Chasm', 'Citipati', {'conditions': []})

    def test_prudence_condition_and_changed_source_gate(self):
        self.assertEqual(drops.conditions(self.tree, 'AlTaieu', 'Jailer_of_Prudence'),
                         ['Only the surviving Jailer drops these items after the other one is defeated.'])
        with tempfile.TemporaryDirectory(prefix='checkmate_loot_test_') as folder:
            path = Path(folder) / drops.PRUDENCE
            path.parent.mkdir(parents=True)
            text = (Path(self.tree) / drops.PRUDENCE).read_text(encoding='utf8')
            self.assertIn('xi.mobMod.NO_DROPS, 1', text)
            path.write_text(text.replace('xi.mobMod.NO_DROPS, 1', 'xi.mobMod.NO_DROPS, 0'), encoding='utf8')
            with self.assertRaisesRegex(RuntimeError, 'Prudence loot rules changed'):
                drops.conditions(folder, 'AlTaieu', 'Jailer_of_Prudence')


if __name__ == '__main__':
    unittest.main()
