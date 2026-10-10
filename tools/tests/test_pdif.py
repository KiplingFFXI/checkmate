"""Defense arithmetic, source qualifications and native pDIF parity."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import lua_source, lua_writer, mobscripts, overlays, pdif, species, stats, zones


class DefenseTests(unittest.TestCase):
    def read(self, text, handler='onMobFight'):
        with tempfile.TemporaryDirectory() as folder:
            index = mobscripts.ScriptIndex(folder, {}, {})
            return index.file_effects(lua_source.LuaFile('mob.lua',
                'entity.%s = function(mob)\n%s\nend' % (handler, text)))

    def test_negative_percent_uses_cpp_truncation(self):
        self.assertEqual(stats.defense(3, {'def': 100, 'defp': -25}), 82)
        self.assertEqual(stats.defense(3, {'def': 100, 'defp': 25}), 136)
        self.assertEqual(stats.defense(3, {'def': 100, 'defp': -200}), 1)

    def test_food_uses_base_and_its_cap_separately(self):
        self.assertEqual(stats.defense(3, {'def': 100, 'defp': 25, 'food_defp': 50, 'food_def_cap': 20}), 156)
        self.assertEqual(stats.defense(3, {'def': 100, 'food_defp': -25, 'food_def_cap': 99}), 82)
        self.assertEqual(stats.defense(0, {'def': 65535}), 7)

    def test_vit_rank_traits_and_spawn_defense(self):
        ranks = dict.fromkeys(species.STAT_KEYS, 1)
        tables = SimpleNamespace(grades={job: dict.fromkeys(stats.STATS, 1) for job in ('war', 'pld')},
            skill_ranks={stats.SKILL_EVASION: {'war': 1, 'pld': 1}},
            traits_by_job={'war': [], 'pld': [{'level': 1, 'id': 9, 'rank': 1, 'mod': 'def', 'value': 10}]},
            mob_excluded_traits=set(), resist_traits=set(), max_skill=lambda *args: 50,
            cap_by_rank=lambda *args: 50)
        monster = stats.Monster(('war', 'pld'), ranks, {'def': 20, 'vit': 3}, [('add', 'defp', -25)], False, 1, True)
        result, mods = stats.at_level(tables, monster, 1)
        self.assertEqual(mods['def'], 36)
        # VIT is 5 + 5 + floor(5/2) + 3; DEF is 8 + floor(15/2) + 36, then -25%.
        self.assertEqual(result['def'], 39)
        self.assertNotIn('vit', result)

    def test_static_defense_does_not_change_old_script_flags(self):
        result = self.read('    mob:setMod(xi.mod.DEF, 100)\n    mob:addMod(xi.mod.VIT, 5)', 'onMobSpawn')
        self.assertEqual(result.spawn_ops, [('set', 'def', 100), ('add', 'vit', 5)])
        self.assertFalse(result.runtime)
        self.assertFalse(result.defense_runtime)

    def test_defense_runtime_has_its_own_flag(self):
        for call in ('mob:addMod(xi.mod.DEFP, 30)', 'mob:setMod(xi.mod.DEF, unknown)',
                     'mob:setStatRank(xi.stat.VIT, 1)', 'mob:setStatRank(xi.stat.DEF, 1)'):
            result = self.read('    ' + call)
            self.assertTrue(result.defense_runtime, call)
            self.assertFalse(result.runtime, call)
            self.assertFalse(result.element_runtime, call)
        self.assertFalse(self.read('    mob:addMod(xi.mod.ACC, 30)').defense_runtime)

    def test_unknown_mod_and_restat_keep_defense_qualification(self):
        for call in ('mob:setMod(chosenMod, 30)', 'mob:recalculateStats()', 'mob:changeJob(2)'):
            self.assertTrue(self.read('    ' + call).defense_runtime)

    def test_conditional_helper_and_mixin_keep_defense(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            path = root / 'scripts/globals/helper.lua'
            path.parent.mkdir(parents=True)
            path.write_text('xi.defense.change = function(mob)\n    mob:addMod(xi.mod.DEF, 30)\nend')
            mixin = root / 'scripts/mixins/test.lua'
            mixin.parent.mkdir(parents=True)
            mixin.write_text('g_mixins.test = function(mob)\n    xi.defense.change(mob)\nend')
            index = mobscripts.ScriptIndex(folder, {}, {})
            file = lua_source.LuaFile('mob.lua', 'entity.onMobFight = function(mob)\n    xi.defense.change(mob)\nend')
            result = index.file_effects(file)
            self.assertTrue(result.defense_runtime)
            self.assertFalse(result.runtime)
            self.assertTrue(index.mixin_defense('test'))

    def test_battlefield_group_defense_variants_are_uncertain(self):
        group = SimpleNamespace(mods=[('xi.mod.DEF', '100')])
        self.assertEqual(zones.group_damage_mods(group, {}, 'Test'), [('def', 100)])
        kind = SimpleNamespace(name='Boss', group_mods={'def': {100, 200}}, effects=mobscripts.Effects())
        zones.apply_group_mods(kind)
        self.assertTrue(kind.effects.defense_runtime)
        self.assertFalse(kind.effects.runtime)
        self.assertFalse(kind.effects.init_ops)

    def test_writer_emits_defense(self):
        numbers = dict.fromkeys(lua_writer.LEVEL_FIELDS, 20)
        text = '\n'.join(lua_writer.level_lines(75, numbers, ''))
        self.assertIn('def = 20', text)

    def test_enabled_cap_trait_and_era_gear_cannot_silently_use_base_cap(self):
        allowed = SimpleNamespace(allows=lambda tag: tag != 'ROV')
        base = {'traits': [{'modifier': 1080, 'value': 10, 'content_tag': 'ROV'}],
                'item_equipment': [{'itemId': 1, 'level': 99}],
                'item_mods': [{'itemId': 1, 'modId': 1081, 'value': 10}], 'item_latents': []}
        with mock.patch.object(pdif.tables, 'read_enum', return_value={'damage_limit': 1080, 'damage_limitp': 1081}), \
             mock.patch.object(pdif.modifiers, 'sql_rows', side_effect=lambda _, name: base[name]):
            pdif.check_cap_inputs('tree', allowed)
            base['traits'][0]['content_tag'] = ''
            with self.assertRaisesRegex(RuntimeError, 'enabled Damage Limit trait'):
                pdif.check_cap_inputs('tree', allowed)
            base['traits'][0]['content_tag'] = 'ROV'
            base['item_equipment'][0]['level'] = 75
            with self.assertRaisesRegex(RuntimeError, 'era equipment Damage Limit'):
                pdif.check_cap_inputs('tree', allowed)


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class PDifSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']

    def test_native_endpoints_match_every_branch(self):
        self.assertGreater(pdif.check_math(self.tree, Path(__file__).resolve().parents[2] / 'checkmate'), 10000)

    def test_effect_map_is_specific_and_keeps_native_counterstance(self):
        data = pdif.build(self.tree, overlays.data_roots(self.tree))
        self.assertEqual(data['melee_cap'], 2)
        self.assertEqual(data['ranged_cap'], 3)
        self.assertEqual(data['defense_effects'][61], 'counterstance')
        self.assertEqual(data['defense_effects'][134], 'dia')
        self.assertNotIn(55, data['defense_effects'])  # Astral Flow modifies pets, not the actor.
        self.assertNotIn(303, data['defense_effects'])  # Earth Maneuver modifies the automaton.
        self.assertEqual(data['ignore_ranged_level_effects'], {351: 'flashy shot'})
        self.assertNotIn(4, data['level_corrected_zones'])
        self.assertIn(103, data['level_corrected_zones'])

    def test_changed_native_or_effect_source_stops_export(self):
        original = Path.read_text
        for path, before, after in [(pdif.PHYSICAL, '3 / 64', '4 / 64'),
                                    ('scripts/effects/dia.lua', 'DEFP', 'DEF')]:
            def changed(file, *args, **kwargs):
                text = original(file, *args, **kwargs)
                return text.replace(before, after) if file.as_posix().endswith(path) else text
            with mock.patch.object(Path, 'read_text', changed):
                with self.assertRaisesRegex(RuntimeError, 'source changed'):
                    pdif.check_source(self.tree)

    def test_native_curve_change_fails_the_numeric_comparison(self):
        original = pdif.effects.source
        def changed(tree, path):
            text = original(tree, path)
            return text.replace('pDif = pDif * meleeRandom', 'pDif = pDif * meleeRandom * 1.01') if path == pdif.PHYSICAL else text
        with mock.patch.object(pdif.effects, 'source', side_effect=changed):
            with self.assertRaisesRegex(RuntimeError, 'pDIF source parity failed'):
                pdif.check_math(self.tree, Path(__file__).resolve().parents[2] / 'checkmate')


if __name__ == '__main__':
    unittest.main()
