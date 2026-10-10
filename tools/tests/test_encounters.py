"""Encounter facts keep source conditions beside the useful information."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import aggro, content, encounters, lua_source, mobscripts, overlays


def kind(zone='Test', mob='Fixture', **values):
    out = dict(zone_dir=zone, script=mob, template=mob, group_mixins=[], ids=[1], levels=[10],
               attributes={'source': {}}, nm=False, ecosystem='beast')
    out.update(values)
    return SimpleNamespace(**out)


class EncounterTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory(prefix='checkmate_encounter_tests_')
        self.addCleanup(self.folder.cleanup)
        self.tree = Path(self.folder.name)
        self.reader = encounters.Reader.__new__(encounters.Reader)
        self.reader.tree = str(self.tree)
        self.reader.trades, self.reader.sources, self.reader.documents = {}, {}, {}
        self.reader.scripts = SimpleNamespace(helpers={})
        self.reader.loaded, self.reader.module_targets, self.reader.claims = [], set(), {}
        self.reader.skill_lists, self.reader.spell_lists, self.reader.skills = {}, {}, {}
        self.reader.spells, self.reader.blue = {}, {}
        self.reader.move_sources, self.reader.module_overrides = {}, {}
        self.reader.move_enum, self.reader.spell_enum = {}, {}

    def write(self, path, text):
        path = self.tree / path
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def test_claimshield_uses_per_entry_duration(self):
        text = "local claimshieldTime = 5000\nlocal shieldedEntities = { ['Camp'] = { 'Normal', {name='Long', time=8000} } }"
        self.assertEqual(encounters.claim_rules(text), {('Camp', 'Normal'): 5, ('Camp', 'Long'): 8})

    def test_kit_sql_overlays_apply_in_order_and_reject_unknown_syntax(self):
        rows = [{'skill_list_id': 1, 'mob_skill_id': 2}]
        rows = encounters.apply_sql(rows, list(rows[0]), 'UPDATE mob_skill_lists SET mob_skill_id = 3 WHERE skill_list_id = 1', 'fixture')
        self.assertEqual(rows[0]['mob_skill_id'], 3)
        rows = encounters.apply_sql(rows, list(rows[0]), 'DELETE FROM mob_skill_lists WHERE mob_skill_id = 3', 'fixture')
        self.assertEqual(rows, [])
        with self.assertRaisesRegex(RuntimeError, 'unreadable'):
            encounters.apply_sql([], [], 'TRUNCATE TABLE mob_skill_lists', 'fixture')

    def test_blue_level_and_minimum_follow_blu_job_byte_and_skill_cap(self):
        jobs = bytearray(22)
        jobs[14], jobs[15], jobs[16] = 75, 50, 99
        calls = []
        def cap(skill, job, level):
            calls.append((skill, job, level))
            return 153
        spell = dict(spellid=533, name='self-destruct', jobs=int.from_bytes(jobs, 'big'))
        entry = encounters.blue_entry(spell, SimpleNamespace(max_skill=cap), 43)
        self.assertEqual(entry, dict(id=533, name='Self-Destruct', level=50, min_skill=122))
        self.assertEqual(calls, [(43, 'blu', 50)])
        entry = encounters.blue_entry(spell, SimpleNamespace(max_skill=lambda *_: 5), 43)
        self.assertEqual(entry['min_skill'], 0)
        spell['jobs'] = 0
        self.assertEqual(encounters.blue_entry(spell, SimpleNamespace(max_skill=cap), 43)['level'], 255)
        self.assertEqual(calls[-1], (43, 'blu', 255))

    def test_unreadable_blue_job_bytes_fail_instead_of_inventing_requirements(self):
        for jobs in (None, 'unknown', -1, 1 << 176):
            with self.subTest(jobs=jobs), self.assertRaisesRegex(RuntimeError, 'Unreadable Blue'):
                encounters.blue_entry(dict(spellid=1, name='fixture', jobs=jobs), None, 43)

    def test_loaded_spell_levels_apply_in_order_and_unsupported_changes_fail(self):
        rows = [dict(spellid=533, name='self-destruct', jobs=0, AOE=1)]
        for level in (40, 50):
            jobs = bytearray(22)
            jobs[15] = level
            encounters.apply_spell_jobs(rows, "UPDATE spell_list SET jobs = 0x%s WHERE name = 'self-destruct'" % jobs.hex(), 'fixture')
        self.assertEqual(rows[0]['jobs'].to_bytes(22, 'big')[15], 50)
        encounters.apply_spell_jobs(rows, "UPDATE spell_list SET AOE = 0 WHERE name IN ('self-destruct','other')", 'fixture')
        self.assertEqual(rows[0]['AOE'], 0)
        encounters.apply_spell_jobs(rows, 'UPDATE spell_list SET JOBS = 12 WHERE SPELLID = 533', 'fixture')
        self.assertEqual(rows[0]['jobs'], 12)
        for statement in ("UPDATE spell_list SET jobs = jobs + 1 WHERE spellid = 533",
                          "UPDATE spell_list SET jobs = 1 WHERE spellid > 0",
                          "UPDATE spell_list SET content_tag = 'SOA' WHERE spellid = 533",
                          "UPDATE spell_list SET CONTENT_TAG = 'SOA' WHERE spellid = 533",
                          "DELETE FROM spell_list WHERE spellid = 533"):
            with self.subTest(statement=statement), self.assertRaises(RuntimeError):
                encounters.apply_spell_jobs(rows, statement, 'fixture')

    def test_danger_targeting_follows_the_move_row_not_the_shared_script_name(self):
        for aoe, expected in ((0, 'single target'), (1, 'area around the monster'),
                              (2, 'area around the target'), (4, 'cone'), (8, 'rear cone')):
            with self.subTest(aoe=aoe):
                danger = encounters.move_danger(dict(mob_skill_name='bad_breath', mob_skill_aoe=aoe))
                self.assertIn('Source targeting: ' + expected + '.', danger[1])
        self.assertIsNone(encounters.move_danger(dict(mob_skill_name='unreviewed_move', mob_skill_aoe=1)))

    def test_every_catalogued_move_and_spell_has_a_source_guard(self):
        for name in encounters.DANGERS:
            self.assertIn('scripts/actions/mobskills/' + name + '.lua', encounters.GUARDS)
        for name in encounters.SPELL_DANGERS:
            self.assertTrue(any(path.endswith('/' + name + '.lua') and '/spells/' in path
                                for path in encounters.GUARDS), name)
        self.assertIn('scripts/globals/mobskills.lua', encounters.GUARDS)
        self.assertIn('scripts/globals/spells/enfeebling_spell.lua', encounters.GUARDS)

    def test_source_dangers_include_debuffs_and_critical_moves_without_a_manual_entry(self):
        effect = {'effects': ['Poison', 'Stun'], 'notes': ['The extra effect needs a successful hit.']}
        entry = encounters.danger_entry('New Move', None, effect, {'can_crit': True}, targeting='cone')
        self.assertEqual(entry[0], 'New Move: Poison, Stun, can crit')
        self.assertIn('successful hit', entry[1])
        self.assertIn('Source targeting: cone.', entry[1])
        self.assertIsNone(encounters.danger_entry('Self Buff', None, {}))

    def test_mighty_strikes_only_move_needs_a_route_to_the_buff(self):
        crit = {'mighty_strikes': True, 'mighty_notes': ['Mighty Strikes must be active.']}
        self.assertIsNone(encounters.danger_entry('Physical Move', None, {}, crit))
        entry = encounters.danger_entry('Physical Move', None, {}, crit, mighty_strikes=True)
        self.assertEqual(entry[0], 'Physical Move: can crit during Mighty Strikes')
        self.assertIn('must be active', entry[1])

    def test_reviewed_conditions_survive_the_broader_danger_list(self):
        reviewed = ('Known Move: poison', 'Only used below half HP.')
        entry = encounters.danger_entry('Known Move', reviewed, {'effects': ['Poison']}, {'can_crit': True})
        self.assertEqual(entry[0], 'Known Move: poison, can crit')
        self.assertIn('Only used below half HP.', entry[1])
        self.assertIn('Possible effects: Poison.', entry[1])

    def test_unknown_effects_are_not_presented_as_a_confirmed_debuff(self):
        self.assertIsNone(encounters.danger_entry('Unknown Move', None, {'unknown': ['Unresolved effect.']}))
        entry = encounters.danger_entry('Partial Move', None, {'effects': ['Stun'], 'unknown': ['Other effects unknown.']})
        self.assertEqual(entry[0], 'Partial Move: Stun')
        self.assertIn('Other effects unknown.', entry[1])

    def test_per_spawn_window_preserves_midnight_wrap_and_filters_row_ids(self):
        fixture = kind(ids=[1, 2], data_zone='test', source_by_index={
            1: {'spawn': {'window': {'start': 20, 'end': 4}}},
            2: {'spawn': {'window': {'start': 18, 'end': 6}}},
            3: {'spawn': {'window': {'start': 0, 'end': 24}}}})
        self.reader.documents['test'] = {'spawns': {1: {}, 2: {}, 3: {}}}
        # Real spawn blocks contain placement or a template.
        self.reader.documents['test']['spawns'] = {n: {'template': 'Fixture'} for n in (1, 2, 3)}
        info, by_index = self.reader.read(fixture)
        self.assertEqual(info['spawn']['value'], 'Spawn rules vary by spawn')
        self.assertEqual(set(by_index), {1, 2})
        self.assertEqual(by_index[1]['spawn']['value'], '20:00-04:00')
        self.assertIn('end hour is excluded', ' '.join(by_index[1]['spawn']['notes']))

    def test_fog_and_weather_are_not_invented_time_windows(self):
        fog = self.reader.spawn(kind(), {'spawn': {'type': ['fog']}}, '')
        self.assertEqual(fog['value'], 'Fog')
        weather = self.reader.spawn(kind(ecosystem='elemental'), {'spawn': {'type': ['weather']}, 'element': 'fire'}, '')
        self.assertEqual(weather['value'], 'Fire weather')
        self.assertIsNone(self.reader.spawn(kind(), {'spawn': {'type': ['weather']}}, ''))

    def test_night_fallback_yields_to_explicit_window(self):
        attrs = {'spawn': {'type': ['at_night']}}
        self.assertEqual(self.reader.spawn(kind(), attrs, '')['value'], '20:00-04:00')
        attrs['spawn']['window'] = {'start': 6, 'end': 10}
        self.assertEqual(self.reader.spawn(kind(), attrs, '')['value'], '06:00-10:00')

    def test_unreadable_rage_timer_does_not_become_default(self):
        source = lua_source.LuaFile('fixture', "entity.onMobSpawn = function(mob)\n    mob:setLocalVar('[rage]timer', chooseTimer())\nend")
        info = self.reader.fight(kind(), source, source.text, {'rage'}, {})
        self.assertEqual(info['value'], 'Rage timer varies')
        source = lua_source.LuaFile('fixture', '')
        self.assertEqual(self.reader.fight(kind(), source, '', {'rage'}, {})['value'], 'Rage 20 minutes')

    def test_group_mixins_have_separate_cached_sources(self):
        self.write('scripts/mixins/fixture.lua', "g_mixins.fixture = function(mob)\n    mob:setSpellList(2)\nend")
        first = self.reader.source(kind())[1]
        second = self.reader.source(kind(group_mixins=['fixture']))[1]
        self.assertNotIn('setSpellList', first)
        self.assertIn('setSpellList', second)

    def test_helper_read_does_not_borrow_unrelated_functions(self):
        path = 'scripts/globals/fixture.lua'
        self.write(path, 'xi.fixture.own = function(mob)\n    return 1\nend\nxi.fixture.other = function(mob)\n    mob:setSpellList(2)\nend')
        self.write('scripts/zones/Test/mobs/Fixture.lua', 'entity.onMobSpawn = function(mob)\n    xi.fixture.own(mob)\nend')
        self.reader.scripts.helpers['xi.fixture.own'] = str(self.tree / path)
        combined = self.reader.source(kind())[1]
        self.assertNotIn('setSpellList', combined)

    def move(self, number, name=None, check='0'):
        name = name or 'move_%d' % number
        self.reader.skills[number] = {'mob_skill_name': name}
        self.write('scripts/actions/mobskills/%s.lua' % name,
                   'mobskill.onMobSkillCheck = function(target, mob, skill)\n    return %s\nend' % check)

    def test_spell_only_changes_do_not_hide_normal_lessons(self):
        self.reader.skill_lists[1] = {123}
        self.move(123)
        for text in ('entity.onMobSpellChoose = function(mob) end', 'mob:setSpellList(2)', 'mob:castSpell(3)'):
            with self.subTest(text=text):
                skills, _, reasons = self.reader.kit(kind(), {'skill_list_id': 1}, text)
                self.assertEqual(skills, {123})
                self.assertEqual(reasons, [])

    def test_forced_moves_add_to_normal_pool_and_bypass_normal_check(self):
        self.reader.skill_lists[1] = {123}
        self.move(123)
        self.move(456, check='1')
        skills, _, reasons = self.reader.kit(kind(), {'skill_list_id': 1}, 'mob:useMobAbility(456)')
        self.assertEqual(skills, {123, 456})
        self.assertEqual(reasons, [])

    def test_unresolved_forced_move_keeps_known_candidates_with_reason(self):
        self.reader.skill_lists[1] = {123}
        self.move(123)
        skills, _, reasons = self.reader.kit(kind(), {'skill_list_id': 1}, 'mob:useMobAbility(selectedMove)')
        self.assertEqual(skills, {123})
        self.assertIn('scripted move argument', ' '.join(reasons))

    def test_positive_chooser_replaces_pool_but_zero_keeps_it(self):
        self.reader.skill_lists[1] = {123}
        self.move(123)
        self.move(456)
        body = 'entity.onMobMobskillChoose = function(mob, target, skillId)\n    return %s\nend'
        self.assertEqual(self.reader.kit(kind(), {'skill_list_id': 1}, body % '456')[0], {456})
        self.assertEqual(self.reader.kit(kind(), {'skill_list_id': 1}, body % '0')[0], {123})
        self.assertEqual(self.reader.kit(kind(), {'skill_list_id': 1}, body % 'skillId')[0], {123})
        skills, _, reasons = self.reader.kit(kind(), {'skill_list_id': 1}, body % 'pickUnknownMove()')
        self.assertEqual(skills, set())
        self.assertIn('chooser return', ' '.join(reasons))

    def test_chooser_requires_a_defined_nonempty_normal_list(self):
        self.move(456)
        self.reader.skill_lists[1] = {999}
        text = 'entity.onMobMobskillChoose = function(mob)\n    return 456\nend'
        self.assertEqual(self.reader.kit(kind(), {}, text)[0], set())
        self.assertEqual(self.reader.kit(kind(), {'skill_list_id': 1}, text)[0], set())

    def test_special_moves_check_but_do_not_use_ordinary_chooser(self):
        self.reader.skill_lists[1] = {123}
        for number in (123, 456, 789):
            self.move(number)
        text = 'entity.onMobMobskillChoose = function(mob)\n    return 456\nend'
        attrs = {'skill_list_id': 1, 'mob_mods': {'special_skill': 789}}
        self.assertEqual(self.reader.kit(kind(), attrs, text)[0], {456, 789})
        self.move(789, check='1')
        self.assertEqual(self.reader.kit(kind(), attrs, text)[0], {456})

    def test_attack_lists_use_chooser_and_normal_checks(self):
        self.reader.skill_lists[2] = {123}
        self.move(123, check='1')
        self.move(456)
        text = 'mob:setMobSkillAttack(2)'
        self.assertEqual(self.reader.kit(kind(), {}, text)[0], set())
        text += '\nentity.onMobMobskillChoose = function(mob)\n    return 456\nend'
        self.assertEqual(self.reader.kit(kind(), {}, text)[0], {456})

    def test_helper_chooser_follows_literal_table_and_inserts(self):
        text = '''entity.onMobMobskillChoose = function(mob, target, skillId)
    return xi.fixture.pick(mob)
end
xi.fixture.pick = function(mob)
    local moves = { 123, 456 }
    if mob:getHPP() < 20 then
        table.insert(moves, 789)
    end
    return moves[math.randomInt(1, #moves)]
end'''
        found, fallback, reasons = encounters.chooser(text, 'entity.onMobMobskillChoose', {}, 'xi.mobSkill')
        self.assertEqual(found, {123, 456, 789})
        self.assertFalse(fallback)
        self.assertEqual(reasons, [])

    def test_conflicting_external_tables_are_not_last_definition_wins(self):
        text = '''local moves = { 123 }
local moves = { 456 }
entity.onMobMobskillChoose = function(mob)
    return moves[math.randomInt(1, #moves)]
end'''
        found, _, reasons = encounters.chooser(text, 'entity.onMobMobskillChoose', {}, 'xi.mobSkill')
        self.assertEqual(found, set())
        self.assertIn('conflicting', ' '.join(reasons))

    def test_local_choice_table_does_not_borrow_unrelated_scope(self):
        text = '''local moves = { 999 }
entity.onMobMobskillChoose = function(mob)
    local moves = { 123 }
    return moves[math.randomInt(1, #moves)]
end'''
        found, _, reasons = encounters.chooser(text, 'entity.onMobMobskillChoose', {}, 'xi.mobSkill')
        self.assertEqual(found, {123})
        self.assertEqual(reasons, [])

    def test_effective_callback_replacement_drops_old_moves_and_super_keeps_them(self):
        self.write('scripts/zones/Test/mobs/Fixture.lua',
                   'entity.onMobFight = function(mob)\n    mob:useMobAbility(123)\nend')
        target = 'xi.zones.Test.mobs.Fixture.onMobFight'
        self.reader.module_overrides[target] = [('mob', '    mob:useMobAbility(456)')]
        text, reasons = self.reader.kit_source(kind())
        self.assertNotIn('useMobAbility(123)', text)
        self.assertIn('useMobAbility(456)', text)
        self.assertEqual(reasons, [])
        self.reader.move_sources.clear()
        self.reader.module_overrides[target] = [('mob', '    super(mob)\n    mob:useMobAbility(456)')]
        text, reasons = self.reader.kit_source(kind())
        self.assertIn('useMobAbility(123)', text)
        self.assertIn('useMobAbility(456)', text)
        self.assertEqual(reasons, [])

    def test_dotted_mixin_require_retains_reachable_forced_move(self):
        self.write('scripts/zones/Test/mobs/Fixture.lua', "require('scripts.mixins.families.fixture')")
        self.write('scripts/mixins/families/fixture.lua',
                   'g_mixins.families.fixture = function(mob)\n    mob:useMobAbility(123)\nend')
        text, reasons = self.reader.kit_source(kind())
        self.assertIn('useMobAbility(123)', text)
        self.assertEqual(reasons, [])

    def test_unknown_is_not_a_fake_danger_and_resolved_empty_is_explicit(self):
        info, _ = self.reader.read(kind())
        self.assertEqual(info['blue']['value'], 'No learnable Blue spells')
        self.assertEqual(info['dangers']['value'], 'No listed threats')
        self.assertEqual(info['dangers']['coverage'], 'resolved')
        self.write('scripts/zones/Test/mobs/Unknown.lua',
                   'entity.onMobFight = function(mob)\n    mob:useMobAbility(unknownMove)\nend')
        info, _ = self.reader.read(kind(mob='Unknown'))
        self.assertEqual(info['blue']['value'], 'Unknown')
        self.assertIn('scripted move argument', ' '.join(info['blue']['notes']))
        self.assertEqual(info['dangers']['value'], 'Move list unresolved')
        self.assertEqual(info['dangers']['coverage'], 'unresolved')

    def test_unresolved_encounter_callbacks_do_not_reuse_base_forced_moves(self):
        self.move(123)
        skills, _, reasons = self.reader.kit(kind(zone='Dynamis-Test'), {}, 'mob:useMobAbility(123)')
        self.assertEqual(skills, set())
        self.assertIn('Encounter setup', ' '.join(reasons))

    def test_rejected_skill_does_not_offer_a_lesson(self):
        self.reader.skill_lists[1] = {123}
        self.reader.skills[123] = {'mob_skill_name': 'fixture'}
        self.write('scripts/actions/mobskills/fixture.lua', 'mobskill.onMobSkillCheck = function(target, mob, skill)\n    return 1\nend')
        self.assertEqual(self.reader.kit(kind(), {'skill_list_id': 1}, '')[0], set())

    def test_missing_skill_check_and_bare_rejections_are_not_possible(self):
        self.assertFalse(encounters.possible_skill('mobskill.onMobWeaponSkill = function(mob)\n    return 0\nend'))
        for value in ('1', '-1', 'false', 'nil', 'unknownValue'):
            self.assertFalse(encounters.possible_skill('mobskill.onMobSkillCheck = function(mob)\n    return %s\nend' % value))
        self.assertTrue(encounters.possible_skill('mobskill.onMobSkillCheck = function(mob)\n    return 0\nend'))
        self.assertTrue(encounters.possible_skill('mobskill.onMobSkillCheck = function(mob)\n    if mob:getHPP() > 33 then\n        return 1\n    end\n    return 0\nend'))

    def test_spell_names_keep_roman_numerals(self):
        self.assertEqual(encounters.label('sleepga_ii'), 'Sleepga II')

    def test_unresolved_battlefield_and_changed_jobs_keep_unknown_kits(self):
        self.assertTrue(self.reader.kit(kind(types={'battlefield'}), {'skill_list_id': 1}, '')[2])
        self.assertTrue(self.reader.kit(kind(effects=SimpleNamespace(job_changes=['script'])), {'skill_list_id': 1}, '')[2])


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class EncounterSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = os.environ['CHECKMATE_SOURCE_TREE']
        cls.reader = encounters.Reader(cls.tree, None, mobscripts.ScriptIndex(cls.tree, {}, {}),
                                      overlays.data_roots(cls.tree), content.Content(True, ['rotz', 'cop', 'toau']))

    def test_actual_claimshield_list_and_trade_pop(self):
        self.assertEqual(len(self.reader.claims), 314)
        self.assertEqual(self.reader.claims['South_Gustaberg', 'Leaping_Lizzy'], 5)
        self.assertNotIn(('Upper_Delkfutts_Tower', 'Pallas'), self.reader.claims)
        info, _ = self.reader.read(kind('Upper_Delkfutts_Tower', 'Pallas', nm=True))
        self.assertIn('Hoary Battle Horn', ' '.join(info['spawn']['notes']))
        self.assertNotIn('claim', info)

    def test_rabbit_lesson_matches_enabled_actual_kit(self):
        info, _ = self.reader.read(kind('West_Ronfaure', 'Wild_Rabbit', attributes={'source': {'skill_list_id': 206}}))
        self.assertEqual([{key: value for key, value in spell.items() if key != 'skill_ids'} for spell in info['blue']['spells']], [{'id': 577, 'name': 'Foot Kick', 'level': 1, 'min_skill': 0}])
        self.assertTrue(info['blue']['spells'][0]['skill_ids'])
        self.assertFalse(info['blue']['incomplete'])
        self.assertNotIn('100 yalms', ' '.join(info['blue']['notes']))
        self.assertIn('100 yalms', ' '.join(info['blue']['requirements']))
        self.assertIn('not a minimum learning level', ' '.join(info['blue']['requirements']))
        self.assertIn('Foot Kick: can crit', info['dangers']['value'])

    def test_bomb_and_phoenix_final_sting_danger(self):
        info, _ = self.reader.read(kind('West_Ronfaure', 'Bomb', attributes={'source': {'skill_list_id': 56}}))
        self.assertIn('Self-Destruct', info['dangers']['value'])
        self.assertEqual([{key: value for key, value in spell.items() if key != 'skill_ids'} for spell in info['blue']['spells']], [{'id': 533, 'name': 'Self-Destruct', 'level': 50, 'min_skill': 122}])
        self.assertTrue(info['blue']['spells'][0]['skill_ids'])
        info, _ = self.reader.read(kind('North_Gustaberg', 'Huge_Hornet', attributes={'source': {'skill_list_id': 48}}))
        self.assertIn('33% HP', ' '.join(info['dangers']['notes']))

    def test_loaded_boreal_replacement_and_reviewed_tiamat(self):
        info, _ = self.reader.read(kind('Xarcabard', 'Boreal_Coeurl'))
        self.assertIn('Tunnel draw-in', info['fight']['value'])
        self.assertIn('2-second wait', ' '.join(info['fight']['notes']))
        info, _ = self.reader.read(kind('Attohwa_Chasm', 'Tiamat'))
        self.assertIn('Firaga III', info['dangers']['value'])
        self.assertIn('25% HP', ' '.join(info['fight']['notes']))
        self.assertNotIn('spells', info['blue'])

    def test_behemoth_rage_and_idle_delay(self):
        info, _ = self.reader.read(kind('Behemoths_Dominion', 'Behemoth'))
        self.assertIn('Rage 30 minutes', info['fight']['value'])
        self.assertIn('Idle despawn 90 seconds', info['fight']['value'])

    def test_loaded_table_changes_remove_post_era_casts(self):
        # Loaded era SQL removes Diaga III from the shared RDM list.
        self.assertNotIn(35, {row['spell_id'] for row in self.reader.spell_lists[3]})
        # The WotG adjustment adds Nonno moves and replaces Emperador's higher needle moves.
        self.assertEqual(self.reader.skill_lists[903], {300, 301, 302, 305, 306})
        self.assertEqual(self.reader.skill_lists[939], {321, 322})

    def test_real_scripted_mobs_keep_their_possible_blue_lessons(self):
        for zone, mob, expected in [('Aydeewa_Subterrane', 'Great_Ameretat', 'Bad Breath'),
                                    ('Arrapago_Reef', 'Bloody_Bones', 'Blood Saber')]:
            with self.subTest(mob=mob):
                fixture = kind(zone, mob, data_zone=zone, levels=[75])
                info, _ = self.reader.read(fixture)
                self.assertEqual(info['blue']['value'], expected)
                self.assertEqual([spell['name'] for spell in info['blue']['spells']], [expected])
                self.assertIn(expected, info['dangers']['value'])
                self.assertEqual(info['blue']['incomplete'], mob == 'Bloody_Bones')

    def test_actual_learning_requirements_and_loaded_spell_job_updates(self):
        self.assertEqual(self.reader.blue_skill, 43)
        self.assertEqual(self.reader.blue_entries[604], dict(id=604, name='Bad Breath', level=61, min_skill=176))
        self.assertTrue(all(1 <= row['level'] <= 75 and row['min_skill'] >= 0 for row in self.reader.blue_entries.values()))
        # The loaded RoV revert changes WHM Banishga from retail level10 to level15.
        banishga = next(row for row in self.reader.spells.values() if row['name'] == 'banishga')
        self.assertEqual(banishga['jobs'].to_bytes(22, 'big')[2], 15)

    def test_common_families_have_reviewed_status_and_targeting_notes(self):
        cases = [('sheep_song', 'Sleep', 'area around the monster'),
                 ('baleful_gaze_cockatrice', 'Petrification', 'single target'),
                 ('chaotic_eye', 'Silence', 'single target'),
                 ('roar', 'Paralysis', 'area around the monster'),
                 ('poison_breath_crawler', 'pre-WotG', 'cone'),
                 ('sand_trap', 'not a full enmity reset', 'area around the monster'),
                 ('radiant_breath', 'Silence and Slow', 'cone')]
        for name, effect, targeting in cases:
            with self.subTest(name=name):
                row = next(row for row in self.reader.skills.values() if row['mob_skill_name'] == name)
                entry = encounters.move_danger(row)
                self.assertIn(effect, entry[1])
                self.assertIn('Source targeting: ' + targeting, entry[1])
        self.assertIn('does not use the gaze-facing check', encounters.DANGERS['blaster'][1])

    def test_expanded_spell_dangers_follow_the_selected_enabled_kit(self):
        info, _ = self.reader.read(kind(attributes={'source': {'spell_list_id': 18}}, levels=[75]))
        self.assertIn('Sleepga', info['dangers']['value'])
        self.assertIn('Stun', info['dangers']['value'])
        self.assertNotIn('Scripted move selection', info['dangers']['value'])

    def test_new_danger_or_loaded_effect_helper_changes_are_guarded(self):
        original = encounters.text_at
        for path in ('scripts/actions/mobskills/bad_breath.lua',
                     'scripts/globals/spells/enfeebling_spell.lua',
                     'modules/phoenix/lua/globals/spells/enfeebling_spell.lua'):
            def changed(tree, rel):
                text = original(tree, rel)
                return text + '\nbehavior = 1' if rel == path else text
            with self.subTest(path=path), patch.object(encounters, 'text_at', changed):
                with self.assertRaisesRegex(RuntimeError, 'changed'):
                    encounters.check_source(self.tree, self.reader.loaded)

    def test_forger_replaces_bomb_pool_and_cannot_offer_self_destruct(self):
        info, _ = self.reader.read(kind('Konschtat_Highlands', 'Forger', data_zone='Konschtat_Highlands'))
        self.assertEqual(info['blue']['value'], 'No learnable Blue spells')
        self.assertNotIn('spells', info['blue'])
        self.assertEqual(info['dangers']['value'], 'No listed threats')
        self.assertEqual(info['dangers']['coverage'], 'resolved')

    def test_unresolved_encounter_has_specific_reason_without_fake_danger(self):
        info, _ = self.reader.read(kind('Dynamis-Valkurm', 'Nightmare_Bunny'))
        self.assertEqual(info['blue']['value'], 'Unknown')
        self.assertTrue(info['blue']['incomplete'])
        self.assertIn('Encounter setup', ' '.join(info['blue']['notes']))
        self.assertEqual(info['dangers']['value'], 'Move list unresolved')
        self.assertEqual(info['dangers']['coverage'], 'unresolved')

    def test_forced_touchdown_bypasses_rejecting_normal_check(self):
        row = self.reader.skills[1282]
        source = encounters.text_at(self.tree, 'scripts/actions/mobskills/%s.lua' % row['mob_skill_name'])
        self.assertFalse(encounters.possible_skill(source))
        skills, _, _ = self.reader.kit(kind(), {}, 'mob:useMobAbility(1282)')
        self.assertIn(1282, skills)

    def test_native_chooser_gate_and_forced_overload_are_guarded(self):
        rel = 'src/map/ai/controllers/mob_controller.cpp'
        text = Path(self.tree, rel).read_text(encoding='utf8')
        for before, after in [('if (skillList.empty())', 'if (false)'),
                              ('Internal_MobSkill(target, wsid, castTimeOverride)', 'Internal_MobSkill(target, 1, castTimeOverride)')]:
            with self.subTest(before=before):
                self.assertIn(before, text)
                self.assertNotEqual(encounters.native_digest(text.replace(before, after), 'CMobController::MobSkill'),
                                    encounters.NATIVE_GUARDS[rel, 'CMobController::MobSkill'])

    def test_behavior_mutation_is_rejected(self):
        original = encounters.text_at
        def changed(tree, rel):
            text = original(tree, rel)
            return text.replace('claimshieldTime = 5000', 'claimshieldTime = 9000') if rel == encounters.CLAIM else text
        with patch.object(encounters, 'text_at', changed):
            with self.assertRaisesRegex(RuntimeError, 'claim_shield.*changed'):
                encounters.check_source(self.tree, self.reader.loaded)

    def test_native_blue_learning_mutation_changes_guard(self):
        rel = 'src/map/utils/blueutils.cpp'
        text = Path(self.tree, rel).read_text(encoding='utf8')
        changed = text.replace('distance(PBlueMage->loc.p, PMob->loc.p) > 100', 'distance(PBlueMage->loc.p, PMob->loc.p) > 50')
        self.assertNotEqual(encounters.native_digest(changed, 'TryLearningSpells'),
                            encounters.NATIVE_GUARDS[rel, 'TryLearningSpells'])


if __name__ == '__main__':
    unittest.main()
