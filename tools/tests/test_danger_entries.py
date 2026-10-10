"""Structured threats retain conditions, level bounds and source gaps."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import encounters, content, mobscripts, overlays


def kind(**values):
    data = dict(zone_dir='Test', script='Fixture', template='Fixture', group_mixins=[], ids=[1],
                levels=[10], attributes={'source': {}}, nm=False, ecosystem='beast')
    data.update(values)
    return SimpleNamespace(**data)


class DangerEntryTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory(prefix='checkmate_danger_entries_')
        self.addCleanup(self.folder.cleanup)
        self.tree = Path(self.folder.name)
        self.reader = encounters.Reader.__new__(encounters.Reader)
        self.reader.tree = str(self.tree)
        self.reader.skills, self.reader.spells = {}, {}
        self.reader.skill_lists, self.reader.spell_lists = {}, {}
        self.reader.move_enum, self.reader.spell_enum = {}, {}
        self.reader.module_overrides = {}
        self.reader.danger_effects = {'skills': {}, 'spells': {}}

    def skill(self, number, effects=()):
        self.reader.skills[number] = {'mob_skill_id': number, 'mob_skill_name': 'fixture_%s' % number, 'mob_valid_targets': 4}
        path = self.tree / ('scripts/actions/mobskills/fixture_%s.lua' % number)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text('mobskill.onMobSkillCheck = function(target, mob, skill)\n    return 0\nend', encoding='utf8')
        if effects:
            self.reader.danger_effects['skills'][number] = {'effects': list(effects)}

    def spell(self, number, ranges):
        self.reader.spells[number] = {'spellid': number, 'name': 'spell_%s' % number}
        self.reader.spell_lists.setdefault(1, []).extend(dict(spell_id=number, min_level=low, max_level=high) for low, high in ranges)
        self.reader.danger_effects['spells'][number] = {'effects': ['Poison']}

    def test_categories_are_parallel_filters_with_real_identity(self):
        out = encounters.structured_danger('skill', 123, 'Test', ('Test: effects', 'Specific condition.'),
              {'effects': ['Poison', 'HP drain', 'Buff removal']}, True, {'shape': 'cone'})
        self.assertEqual((out['kind'], out['id'], out['name']), ('skill', 123, 'Test'))
        self.assertEqual(out['categories'], ['crit', 'debuff', 'dispel', 'drain'])
        self.assertEqual(out['notes'], ['Specific condition.'])
        self.assertEqual(out['details'], {'shape': 'cone'})

    def test_empty_resolved_and_unknown_are_not_the_same(self):
        known = self.reader.dangers(kind(), {}, '', set(), [], [])
        self.assertEqual(known['value'], 'No listed threats')
        self.assertEqual(known['coverage'], 'resolved')
        self.assertFalse(known['incomplete'])
        unknown = self.reader.dangers(kind(), {}, '', set(), [], ['The selected list is unresolved.'])
        self.assertEqual(unknown['value'], 'Move list unresolved')
        self.assertEqual(unknown['coverage'], 'unresolved')
        self.assertTrue(unknown['incomplete'])
        self.assertTrue(any('does not mean' in line for line in known['notes']))

    def test_known_entries_survive_partial_kit(self):
        self.skill(1, ['Stun'])
        out = self.reader.dangers(kind(), {}, '', {1}, [], ['Other moves unknown.'])
        self.assertEqual(out['coverage'], 'partial')
        self.assertEqual(out['entries'][0]['id'], 1)
        self.assertEqual(out['entries'][0]['effects'], ['Stun'])
        self.assertEqual(out['reasons'], ['Other moves unknown.'])

    def test_global_conditions_are_separate_from_uncertainty(self):
        out = encounters.danger_section([], [], ['A known global condition.'])
        self.assertEqual(out['coverage'], 'resolved')
        self.assertEqual(out['general_notes'], ['A known global condition.'])
        self.assertEqual(out['reasons'], [])

    def test_missing_effect_handler_marks_partial_or_unknown(self):
        self.skill(1)
        self.reader.danger_effects['skills'][1] = {'unknown': ['Missing handler.']}
        out = self.reader.dangers(kind(), {}, '', {1}, [], [])
        self.assertEqual(out['coverage'], 'unresolved')
        self.assertEqual(out['entries'], [])
        self.assertIn('Missing handler.', out['reasons'])

    def test_unresolved_critical_enabling_buff_marks_coverage(self):
        self.reader.danger_crit = SimpleNamespace()
        note = 'Some job-special buff choices depend on script values that could not be resolved.'
        with patch.object(encounters.danger_jobs, 'available_statuses', return_value=(set(), [note])):
            out = self.reader.dangers(kind(), {}, '', set(), [], [])
        self.assertEqual(out['coverage'], 'unresolved')
        self.assertEqual(out['reasons'], [note])

    def test_metadata_and_its_unknowns_survive(self):
        self.skill(1, ['Poison'])
        self.reader.danger_details = SimpleNamespace(skill=lambda row, effect: {'notes': ['Base distance only.'], 'unknown': ['Radius changes.']})
        out = self.reader.dangers(kind(), {}, '', {1}, [], [])
        self.assertEqual(out['entries'][0]['details']['notes'], ['Base distance only.'])
        self.assertEqual(out['coverage'], 'partial')
        self.assertIn('Radius changes.', out['reasons'])

    def test_ordinary_spell_keeps_all_overlapping_level_windows(self):
        self.spell(100, [(1, 10), (8, 20), (30, 40)])
        _, spells, reasons = self.reader.kit(kind(levels=[10, 35]), {'spell_list_id': 1}, '')
        self.assertEqual(spells[0]['level_ranges'], [[1, 20], [30, 40]])
        self.assertNotIn('forced', spells[0])
        out = self.reader.dangers(kind(), {}, '', set(), spells, reasons)
        self.assertEqual(out['entries'][0]['level_ranges'], [[1, 20], [30, 40]])

    def test_explicit_cast_bypasses_ordinary_level_window(self):
        self.spell(100, [(30, 40)])
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, 'mob:castSpell(100)')
        self.assertEqual(len(spells), 1)
        self.assertTrue(spells[0]['forced'])
        self.assertNotIn('level_ranges', spells[0])

    def test_forced_and_ordinary_overlap_keeps_provenance(self):
        self.spell(100, [(1, 20)])
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, 'mob:castSpell(100)')
        self.assertTrue(spells[0]['forced'])
        self.assertEqual(spells[0]['level_ranges'], [[1, 20]])

    def test_script_chooser_is_not_bound_to_ordinary_window(self):
        self.spell(100, [(30, 40)])
        text = 'entity.onMobSpellChoose = function(mob)\n    return 100\nend'
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, text)
        self.assertTrue(spells[0]['scripted'])
        self.assertNotIn('forced', spells[0])
        self.assertNotIn('level_ranges', spells[0])

    def test_spell_gaps_do_not_falsely_change_blue_kit_resolution(self):
        _, spells, reasons = self.reader.kit(kind(), {}, 'mob:castSpell(selectedSpell)')
        self.assertEqual(reasons, [])
        self.assertIn('scripted spell argument', ' '.join(spells.reasons))
        out = self.reader.dangers(kind(), {}, '', set(), spells, reasons)
        self.assertEqual(out['coverage'], 'unresolved')

    def test_spell_list_replacement_preserves_explicit_same_list_cast(self):
        self.spell(100, [(1, 20)])
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, 'mob:setSpellList(nextList)\nmob:castSpell(100)')
        self.assertEqual([row['spellid'] for row in spells], [100])
        self.assertTrue(spells[0]['forced'])
        self.assertTrue(spells.reasons)

    def test_fixed_spawn_spell_list_replaces_base_list(self):
        self.spell(100, [(1, 20)])
        self.reader.spells[200] = {'spellid': 200, 'name': 'spell_200'}
        self.reader.spell_lists[2] = [dict(spell_id=200, min_level=5, max_level=25)]
        text = 'entity.onMobSpawn = function(mob)\n    mob:setSpellList(2)\nend'
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, text)
        self.assertEqual([row['spellid'] for row in spells], [200])
        self.assertEqual(spells[0]['level_ranges'], [[5, 25]])
        self.assertEqual(spells.reasons, [])

    def test_fixed_phase_lists_union_without_claiming_current_phase(self):
        self.spell(100, [(1, 20)])
        self.reader.spells[200] = {'spellid': 200, 'name': 'spell_200'}
        self.reader.spell_lists[2] = [dict(spell_id=200, min_level=5, max_level=25)]
        text = 'entity.onMobFight = function(mob)\n    if phase then\n        mob:setSpellList(2)\n    else\n        mob:setSpellList(0)\n    end\nend'
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, text)
        self.assertEqual([row['spellid'] for row in spells], [100, 200])
        self.assertTrue(all(row['conditional_list'] for row in spells))
        self.assertEqual(spells.reasons, [])

    def test_fixed_list_does_not_resolve_mimic_cast(self):
        self.spell(100, [(1, 20)])
        text = 'entity.onMobFight = function(mob)\n    mob:setSpellList(1)\n    mob:castSpell(copied)\nend'
        _, spells, _ = self.reader.kit(kind(), {}, text)
        self.assertEqual([row['spellid'] for row in spells], [100])
        self.assertTrue(any('scripted spell argument' in note for note in spells.reasons))

    def test_fixed_list_keeps_level_and_chooser_gates(self):
        self.spell(100, [(30, 40)])
        text = 'entity.onMobSpawn = function(mob)\n    mob:setSpellList(1)\nend'
        _, spells, _ = self.reader.kit(kind(), {}, text)
        self.assertEqual(spells, [])
        self.spell(101, [(1, 20)])
        text += '\nentity.onMobSpellChoose = function(mob)\n    return 100\nend'
        _, spells, _ = self.reader.kit(kind(), {}, text)
        self.assertEqual([row['spellid'] for row in spells], [100])
        self.assertTrue(spells[0]['scripted'])
        self.assertNotIn('level_ranges', spells[0])

    def test_spell_list_ids_never_replace_validated_skill_ids(self):
        self.skill(10)
        self.reader.skill_lists[1] = {10}
        text = 'entity.onMobSpawn = function(mob)\n    mob:setSpellList(0)\nend'
        skills, _, _ = self.reader.kit(kind(), {'skill_list_id': 1}, text)
        self.assertEqual(skills, {10})

    def test_missing_native_list_preserves_the_existing_container(self):
        self.spell(100, [(1, 20)])
        text = 'entity.onMobSpawn = function(mob)\n    mob:setSpellList(999)\nend'
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, text)
        self.assertEqual([row['spellid'] for row in spells], [100])
        self.assertIn('previous list is retained', ' '.join(spells.reasons))

    def test_unknown_top_replacement_does_not_offer_old_default(self):
        self.spell(100, [(1, 20)])
        text = 'entity.onMobSpawn = function(mob)\n    mob:setSpellList(chosen)\nend'
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, text)
        self.assertEqual(spells, [])
        self.assertTrue(spells.reasons)

    def test_monster_geometry_override_is_passed_to_details_reader(self):
        self.spell(100, [(1, 20)])
        _, spells, _ = self.reader.kit(kind(), {'spell_list_id': 1}, 'spell:setAoE(xi.magic.aoe.RADIAL)')
        self.assertTrue(spells[0]['targeting_scripted'])

    def test_literal_localvars_resolve_multiple_possible_phase_lists(self):
        self.skill(1)
        self.skill(2)
        self.reader.skill_lists = {10: {1}, 20: {2}}
        text = "mob:setLocalVar('phaseA', 10)\nmob:setLocalVar('phaseB', 20)\nif phase then\n mob:setMobMod(xi.mobMod.SKILL_LIST, mob:getLocalVar('phaseA'))\nelse\n mob:setMobMod(xi.mobMod.SKILL_LIST, mob:getLocalVar('phaseB'))\nend"
        skills, _, reasons = self.reader.kit(kind(), {}, text)
        self.assertEqual(skills, {1, 2})
        self.assertEqual(reasons, [])

    def test_dynamic_localvar_write_preserves_uncertainty(self):
        text = "mob:setLocalVar('list', 10)\nmob:setLocalVar('list', choice)"
        self.assertEqual(encounters.list_values("mob:getLocalVar('list')", text, {}, 'xi.mobSkill'), (set(), True))
        self.assertEqual(encounters.list_values("mob:getLocalVar('absent')", text, {}, 'xi.mobSkill'), (set(), True))

    def test_overwritten_default_does_not_offer_the_old_list(self):
        text = "mob:setLocalVar('list', 10)\nmob:setLocalVar('list', 20)"
        self.assertEqual(encounters.list_values("mob:getLocalVar('list')", text, {}, 'xi.mobSkill'), (set(), True))

    def test_listener_alias_writes_belong_to_the_monster(self):
        text = "g_mixins.fixture = function(mob)\n mob:addListener('SPAWN', 'TEST', function(creature)\n  creature:setLocalVar('list', 10)\n end)\nend"
        self.assertEqual(encounters.list_values("mob:getLocalVar('list')", text, {}, 'xi.mobSkill'), ({10}, False))
        self.assertEqual(encounters.list_values("mob:getLocalVar('list')", "target:setLocalVar('list', 20)", {}, 'xi.mobSkill'), (set(), True))


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'pinned source tree not supplied')
class DangerEntrySourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.reader = encounters.Reader(cls.tree, None, mobscripts.ScriptIndex(cls.tree, {}, {}),
              overlays.data_roots(cls.tree), content.Content(True, ['rotz', 'cop', 'toau']))

    def test_native_spell_list_replacement_and_level_gates_are_guarded(self):
        paths = [('src/map/lua/lua_base_entity.cpp', 'CLuaBaseEntity::setSpellList'), ('src/map/utils/mobutils.cpp', 'SetSpellList'), ('src/map/utils/mobutils.cpp', 'RecalculateSpellContainer'), ('src/map/mob_spell_list.cpp', 'LoadMobSpellList'), ('src/map/mob_spell_list.cpp', 'GetMobSpellList')]
        for rel, name in paths:
            source = (Path(self.tree) / rel).read_text(encoding="utf8")
            self.assertEqual(encounters.native_digest(source, name), encounters.NATIVE_GUARDS[rel, name])

    def test_blue_observation_native_paths_are_guarded(self):
        paths = [('src/map/entities/battle_entity.cpp', 'CBattleEntity::OnMobSkillFinished'),
                 ('src/map/action/action.cpp', 'action_t::normalize'),
                 ('src/map/packets/s2c/0x028_battle2.cpp', 'GP_SERV_COMMAND_BATTLE2::pack'),
                 ('src/map/action/interrupts.cpp', 'AbilityInterrupt'),
                 ('src/map/action/interrupts.cpp', 'MobSkillNoTargetInRange'),
                 ('src/map/action/interrupts.cpp', 'MobSkillOutOfRange')]
        for rel, name in paths:
            with self.subTest(function=name):
                source = (Path(self.tree) / rel).read_text(encoding='utf8')
                self.assertEqual(encounters.native_digest(source, name), encounters.NATIVE_GUARDS[rel, name])
        source = (Path(self.tree) / paths[0][0]).read_text(encoding='utf8')
        changed = source.replace('PMob->m_UsedSkillIds[PSkill->getID()] = GetMLevel();', 'PMob->m_UsedSkillIds[0] = GetMLevel();')
        self.assertNotEqual(source, changed)
        self.assertNotEqual(encounters.native_digest(changed, paths[0][1]), encounters.NATIVE_GUARDS[paths[0]])

    def test_blue_finish_category_numbers_are_guarded(self):
        rel = 'src/map/enums/action/category.h'
        source = encounters.text_at(self.tree, rel)
        self.assertEqual(encounters.digest(source), encounters.GUARDS[rel])
        self.assertRegex(source, r'SkillFinish\s*=\s*3\s*,')
        self.assertRegex(source, r'MobSkillFinish\s*=\s*11\s*,')
        self.assertNotEqual(encounters.digest(source.replace('MobSkillFinish = 11', 'MobSkillFinish = 12')), encounters.GUARDS[rel])

    def test_uragnite_fixed_shell_lists_resolve(self):
        fixture = kind(zone_dir='Bibiki_Bay', script='Coralline_Uragnite', levels=[34], attributes={'source': {'skill_list_id': 251}})
        info, _ = self.reader.read(fixture)
        self.assertFalse(info['blue'].get('incomplete', False))
        self.assertNotEqual(info['blue']['value'], 'Unknown')
        self.assertEqual(info['dangers']['coverage'], 'resolved')
        self.assertTrue(info['dangers']['entries'])

    def test_ladybug_fixed_day_and_night_lists_resolve(self):
        fixture = kind(group_mixins=['families/ladybug'])
        text, reasons = self.reader.kit_source(fixture)
        skills, _, unresolved = self.reader.kit(fixture, {}, text, reasons)
        expected = self.reader.skill_lists[170] | self.reader.skill_lists[1173]
        self.assertEqual(skills, expected)
        self.assertEqual(unresolved, [])

    def test_blue_skill_ids_are_scoped_to_usable_monster_moves(self):
        fixture = kind(zone_dir='West_Ronfaure', script='Wild_Rabbit', attributes={'source': {'skill_list_id': 206}})
        info, _ = self.reader.read(fixture)
        for spell in info['blue']['spells']:
            self.assertTrue(spell['skill_ids'])
            for number in spell['skill_ids']:
                self.assertIn(spell['id'], self.reader.blue[number])
                self.assertIn(number, self.reader.skill_lists[206])

    def test_named_fight_conditions_keep_their_own_identity(self):
        info, _ = self.reader.read(kind(zone_dir='Attohwa_Chasm', script='Tiamat'))
        entry = next(row for row in info['dangers']['entries'] if row['kind'] == 'fight')
        self.assertEqual(entry['id'], 0)
        self.assertIn('25% HP', ' '.join(entry['notes']))
        self.assertEqual(entry['categories'], ['other'])


if __name__ == '__main__':
    unittest.main()
