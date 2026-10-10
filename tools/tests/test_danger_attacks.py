"""Ordinary attacks keep recipient, activation and native proc rules explicit."""
import os
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import danger_attacks, danger_effects, danger_jobs, encounters, mobscripts, overlays, content

IDS = {'NONE': 0, 'POISON': 3, 'STUN': 10, 'PARALYSIS': 4, 'SLOW': 13, 'HASTE': 33}
LEGACY = {'POISON': ['Poison'], 'HP_DRAIN': ['HP drain'], 'MP_DRAIN': ['MP drain']}


def monster(**values):
    fields = dict(zone_dir='Fixture', script='Fixture', group_mixins=[], attributes={'source': {}},
                  jobs=['war', 'war'], ids=[1], levels=[75], template='Fixture', nm=False, ecosystem='beast')
    fields.update(values)
    return SimpleNamespace(**fields)


def callback(body):
    return 'entity.onAdditionalEffect = function(mob, target, damage)\n' + body + '\nend'


def spawn(body):
    return 'entity.onMobSpawn = function(mob)\n    ' + body + '\nend'


class OrdinaryAttackTests(unittest.TestCase):
    def read(self, body):
        return danger_attacks.analyze(callback(body), IDS, LEGACY)

    def test_modern_status_from_parameter_table(self):
        out = self.read('local p = { effectId = xi.effect.STUN }\nreturn xi.combat.action.executeAddEffectEnfeeblement(mob, target, p)')
        self.assertEqual(out['effects'], ['Stun'])
        self.assertEqual(out['unknown'], [])
        self.assertTrue(any('proc rate is not calculated' in line for line in out['notes']))

    def test_random_status_table_retains_possible_effects(self):
        out = self.read('local effects = { xi.effect.STUN, xi.effect.POISON }\nlocal p = { effectId = effects[math.randomInt(1,2)] }\nreturn xi.combat.action.executeAddEffectEnfeeblement(mob, target, p)')
        self.assertEqual(out['effects'], ['Poison', 'Stun'])
        self.assertEqual(out['unknown'], [])
        self.assertTrue(any('may not all happen' in line for line in out['notes']))

    def test_legacy_effect_and_undefined_selector(self):
        self.assertEqual(self.read('return xi.mob.onAddEffect(mob,target,damage,xi.mob.ae.POISON)')['effects'], ['Poison'])
        out = self.read('return xi.mob.onAddEffect(mob,target,damage,xi.mob.ae.DISEASE)')
        self.assertEqual(out['effects'], [])
        self.assertTrue(out['unknown'])

    def test_pure_damage_and_beneficial_status_are_not_debuffs(self):
        for helper, params in [('Damage', 'basePower=20,magicalElement=xi.element.FIRE'),
                               ('Enhancement', 'effectId=xi.effect.HASTE'),
                               ('Enfeeblement', 'effectId=xi.effect.STUN,aeTarget=mob'),
                               ('Enfeeblement', 'effectId=xi.effect.STUN,chance=0')]:
            out = self.read('return xi.combat.action.executeAddEffect' + helper + '(mob,target,{' + params + '})')
            self.assertEqual(out['effects'], [])
            self.assertEqual(out['unknown'], [])

    def test_drains_and_buff_theft_are_distinct(self):
        out = self.read('return xi.combat.action.executeAddEffectDamage(mob,target,{drainHP=true,drainTP=true})')
        self.assertEqual(out['effects'], ['HP drain', 'TP drain'])
        self.assertEqual(self.read('return xi.combat.action.executeAddEffectDispel(mob,target,{absorbEffect=true})')['effects'], ['Buff theft'])
        self.assertEqual(self.read('return xi.combat.action.executeAddEffectDispel(mob,target,{})')['effects'], ['Buff removal'])

    def test_dynamic_parameters_and_recipients_stay_unknown(self):
        for body in ('return xi.combat.action.executeAddEffectEnfeeblement(mob,target,chosen)',
                     'return xi.combat.action.executeAddEffectEnfeeblement(mob,target,{effectId=chosen})',
                     'return xi.combat.action.executeAddEffectEnfeeblement(mob,target,{effectId=xi.effect.STUN,aeTarget=chosen})',
                     'return xi.custom.attackEffect(mob,target)'):
            out = self.read(body)
            self.assertTrue(out['unknown'])
            self.assertEqual(out['effects'], [])

    def test_direct_target_status_but_not_self_grant(self):
        self.assertEqual(self.read('target:addStatusEffect(xi.effect.POISON,{})')['effects'], ['Poison'])
        self.assertEqual(self.read('mob:addStatusEffect(xi.effect.POISON,{})')['effects'], [])

    def test_gate_initialization_and_phase_changes(self):
        self.assertEqual(danger_attacks.enabled('', 0), (False, False, False))
        self.assertEqual(danger_attacks.enabled(spawn('mob:setMobMod(xi.mobMod.ADD_EFFECT,0)'), 1), (False, False, False))
        self.assertEqual(danger_attacks.enabled(spawn('mob:setMobMod(xi.mobMod.ADD_EFFECT,1)'), 0), (True, False, False))
        out = danger_attacks.enabled('entity.onMobFight = function(mob)\n if phase then mob:setMobMod(xi.mobMod.ADD_EFFECT,1) end\nend', 0)
        self.assertTrue(out[0])
        self.assertTrue(out[2])
        self.assertTrue(danger_attacks.enabled(spawn('mob:setMobMod(xi.mobMod.ADD_EFFECT,chosen)'), 0)[1])

    def test_additive_gate_uses_the_existing_value(self):
        self.assertEqual(danger_attacks.enabled(spawn('mob:addMobMod(xi.mobMod.ADD_EFFECT,1)'), -1), (False, False, False))
        self.assertEqual(danger_attacks.enabled(spawn('mob:addMobMod(xi.mobMod.ADD_EFFECT,-1)'), 1), (False, False, False))
        self.assertEqual(danger_attacks.enabled(spawn('mob:addMobMod(xi.mobMod.ADD_EFFECT,1)'), 0), (True, False, False))

    def test_disabled_callback_is_not_a_threat(self):
        reader = danger_attacks.Reader.__new__(danger_attacks.Reader)
        reader.callback = lambda kind: {'effects': ['Poison'], 'notes': [], 'unknown': []}
        self.assertEqual(reader.read(monster(), {}, '', set())['effects'], [])
        self.assertEqual(reader.read(monster(), {}, spawn('mob:setMobMod(xi.mobMod.ADD_EFFECT,1)'), set())['effects'], ['Poison'])

    def test_native_blood_weapon_and_morbol_conditions(self):
        reader = danger_attacks.Reader.__new__(danger_attacks.Reader)
        reader.callback = lambda kind: {'effects': [], 'notes': [], 'unknown': []}
        out = reader.read(monster(), {}, '', {'BLOOD_WEAPON'})
        self.assertEqual(out['effects'], ['HP drain'])
        self.assertTrue(any('while Blood Weapon is active' in line for line in out['notes']))
        self.assertEqual(reader.read(monster(), {}, 'mob:setMod(xi.mod.ENSPELL,1)')['effects'], [])
        self.assertEqual(reader.read(monster(), {}, 'mob:setMod(xi.mod.ENSPELL,17)')['effects'], ['HP drain'])
        out = reader.read(monster(), {}, "mob:addListener('ATTACK','MORBOL_TOAU_ATTACK',function() end)")
        self.assertEqual(out['effects'], ['HP drain'])
        self.assertTrue(any('outside its spawn area' in line for line in out['notes']))
        self.assertTrue(reader.read(monster(), {}, "mob:addListener('ATTACK','UNKNOWN',function() end)")['unknown'])

    def test_no_ordinary_swings_do_not_offer_hit_procs(self):
        reader = danger_attacks.Reader.__new__(danger_attacks.Reader)
        reader.callback = lambda kind: {'effects': ['Poison'], 'notes': [], 'unknown': []}
        kind = monster(effects=SimpleNamespace(no_swings=True, normal_swings=False))
        self.assertEqual(reader.read(kind, {}, spawn('mob:setMobMod(xi.mobMod.ADD_EFFECT,1)'), {'BLOOD_WEAPON'})['effects'], [])
        kind.effects.normal_swings = True
        self.assertEqual(reader.read(kind, {}, '', {'BLOOD_WEAPON'})['effects'], ['HP drain'])

    def test_native_proc_overwritten_before_combat_is_not_offered(self):
        reader = danger_attacks.Reader.__new__(danger_attacks.Reader)
        reader.callback = lambda kind: {'effects': [], 'notes': [], 'unknown': []}
        text = spawn('mob:setMod(xi.mod.ENSPELL,17)\n    mob:setMod(xi.mod.ENSPELL,0)')
        self.assertEqual(reader.read(monster(), {}, text)['effects'], [])

    def test_new_source_calls_are_ignored_by_unrelated_stat_classifiers(self):
        from export import lua_source
        parsed = lua_source.LuaFile('test', spawn('mob:setSpellList(2)\n    mob:addMobMod(xi.mobMod.ADD_EFFECT,1)'))
        self.assertEqual([call.method for call in parsed.calls], ['setSpellList','addMobMod'])
        for call in parsed.calls:
            self.assertEqual(lua_source.call_effect(call, True, {}, {}), (None,None))
            self.assertEqual(lua_source.aggro_effect(call, True), (None,None,None))

    def test_native_and_buff_source_checks_are_not_grants(self):
        reader = danger_attacks.Reader.__new__(danger_attacks.Reader)
        reader.callback = lambda kind: {'effects': [], 'notes': [], 'unknown': []}
        self.assertEqual(reader.read(monster(), {}, 'if mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) then return end')['effects'], [])
        self.assertEqual(reader.read(monster(), {}, 'target:addStatusEffect(xi.effect.BLOOD_WEAPON,{})')['effects'], [])

    def test_monster_override_replaces_or_wraps_callback(self):
        with tempfile.TemporaryDirectory() as folder:
            tree = Path(folder); path = tree/'scripts/zones/Fixture/mobs/Fixture.lua'; path.parent.mkdir(parents=True)
            path.write_text(callback('return xi.mob.onAddEffect(mob,target,damage,xi.mob.ae.POISON)'),encoding='utf8')
            source = danger_effects.Sources(tree, [])
            key = 'xi.zones.Fixture.mobs.Fixture.onAdditionalEffect'
            source.overrides[key] = [('mob,target,damage', 'return 0,0,0')]
            text, unknown = source.read(path.relative_to(tree).as_posix(),'xi.zones.Fixture.mobs.Fixture.','onAdditionalEffect')
            self.assertEqual(danger_attacks.analyze(text,IDS,LEGACY)['effects'], [])
            source.cache.clear();source.overrides[key]=[('mob,target,damage','super(mob,target,damage)\nreturn xi.mob.onAddEffect(mob,target,damage,xi.mob.ae.MP_DRAIN)')]
            text, unknown = source.read(path.relative_to(tree).as_posix(),'xi.zones.Fixture.mobs.Fixture.','onAdditionalEffect')
            self.assertEqual(danger_attacks.analyze(text,IDS,LEGACY)['effects'], ['MP drain','Poison'])

    def test_coverage_and_attack_identity_do_not_inherit_spell_geometry(self):
        reader = encounters.Reader.__new__(encounters.Reader)
        reader.skills = {};reader.danger_attacks = SimpleNamespace(read=lambda *args: {'effects':['Stun'],'notes':['Conditional.'],'unknown':['Another callback is unresolved.']})
        out = reader.dangers(monster(),{},'',set(),[],[])
        self.assertEqual(out['coverage'],'partial')
        entry=out['entries'][0]
        self.assertEqual((entry['kind'],entry['id']),('attack',0))
        self.assertEqual(entry['categories'],['debuff'])
        self.assertEqual(entry['details'],{})

    def test_guard_rejects_source_change(self):
        with patch.object(danger_attacks,'source_digest',return_value=('changed',1)):
            with self.assertRaisesRegex(RuntimeError,'Ordinary attack sources changed'):
                danger_attacks.check_source('unused',[])


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'Pinned source tree not supplied')
class OrdinaryAttackSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree=Path(os.environ['CHECKMATE_SOURCE_TREE'])
        cls.reader=danger_attacks.Reader(cls.tree)
        cls.encounters=encounters.Reader(str(cls.tree),None,mobscripts.ScriptIndex(str(cls.tree),{},{}),
              overlays.data_roots(str(cls.tree)),content.Content(True,['rotz','cop','toau']))

    def test_complete_callback_census_has_only_two_invalid_source_selectors(self):
        count=harmful=0;unknown=[]
        for path in sorted((self.tree/'scripts/zones').rglob('*.lua')):
            if 'onAdditionalEffect' not in danger_effects.clean(path):continue
            kind=monster(zone_dir=path.parent.parent.name,script=path.stem)
            out=self.reader.callback(kind);count+=1;harmful+=bool(out['effects'])
            if out['unknown']:unknown.append((kind.zone_dir,kind.script))
        self.assertEqual((count,harmful),(301,209))
        self.assertEqual(unknown,[('Balgas_Dais','King_of_Cups'),('Bhaflau_Remnants','Chigoe')])

    def test_jailer_stun_and_fixed_phase_spell_list(self):
        kind=monster(zone_dir='AlTaieu',script='Jailer_of_Hope',nm=True,levels=[80])
        text,reasons=self.encounters.kit_source(kind)
        skills,spells,reasons=self.encounters.kit(kind,{},text,reasons)
        self.assertTrue(spells)
        self.assertTrue(all(row.get('conditional_list') for row in spells))
        self.assertFalse(any('spell-list replacement' in note for note in spells.reasons))
        out=self.encounters.dangers(kind,{},text,skills,spells,reasons)
        attack=next(entry for entry in out['entries'] if entry['kind']=='attack')
        self.assertEqual(attack['effects'],['Stun'])
        self.assertNotIn('activation_range',attack['details'])

    def test_plague_chigoe_random_branches_and_vilma_table(self):
        out=self.reader.callback(monster(zone_dir='Bhaflau_Thickets',script='Plague_Chigoe'))
        self.assertEqual(out['effects'],['MP drain','Plague'])
        self.assertTrue(any('callback conditions' in line for line in out['notes']))
        out=self.reader.callback(monster(zone_dir='Yuhtunga_Jungle',script='Voluptuous_Vilma'))
        self.assertEqual(out['effects'],['Bind','Blindness','Paralysis','Poison','Silence','Slow','Weight'])

    def test_native_callback_is_mob_gated_and_pc_item_procs_are_separate(self):
        native=(self.tree/'src/map/utils/battleutils.cpp').read_text(encoding='utf8')
        self.assertIn('PAttacker->objtype == TYPE_PC',native)
        self.assertIn('getMobMod(xi::MobMod::AddEffect) > 0',native)
        self.assertIn('enspell == ENSPELL_BLOOD_WEAPON',native)
        self.assertEqual(danger_attacks.check_source(self.tree),606)


if __name__=='__main__':
    unittest.main()
