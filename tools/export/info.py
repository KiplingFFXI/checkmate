"""Source facts for optional monster details. None of these predict a live fight."""
import math
import hashlib
from pathlib import Path
import re

from . import aggro, lua_source, stats

HP_SCALES = ((0, 0, 0), (36, 9, 1), (33, 8, 1), (32, 7, 1), (29, 6, 0),
             (27, 5, 0), (24, 4, 0), (22, 3, 0))
MP_JOBS = {'pld', 'whm', 'blm', 'rdm', 'drk', 'blu', 'sch', 'smn'}
LUMORIA = {'AlTaieu', 'Empyreal_Paradox', 'The_Garden_of_RuHmet', 'Grand_Palace_of_HuXzoi'}
HEALTH = {'hp', 'mp', 'base_hp', 'base_mp', 'hpp', 'mpp', 'weakness_pct', 'curse_pct',
          'food_hp', 'food_mp', 'food_hpp', 'food_mpp', 'food_hp_cap', 'food_mp_cap',
          'convmptohp', 'convhptomp'}
TRAITS = {'double_attack', 'triple_attack', 'quad_attack', 'counter', 'storetp', 'regain', 'regen',
          'dual_wield', 'martial_arts', 'haste_magic', 'haste_ability', 'haste_gear', 'delay'}
MOVEMENT = {'move_speed_override', 'move_speed_stackable', 'move_speed_weight_penalty',
            'move_speed_flee', 'move_speed_gear', 'move_speed_status'}
MOB_NAMES = {'charmable', 'mp_base', 'hp_scale', 'gil_min', 'gil_max', 'mug_gil', 'gil_bonus',
             'exp_bonus', 'no_drops', 'no_move', 'speed', 'speed_run', 'multi_hit', 'tp_use_chance'}
GIL_MODS = {'gil_min', 'gil_max', 'gil_bonus', 'mug_gil'}
REGULAR = HEALTH | TRAITS | MOVEMENT | {'exp_lvl_mod'}
LABELS = {'double_attack': 'Double Attack', 'triple_attack': 'Triple Attack', 'quad_attack': 'Quadruple Attack',
          'counter': 'Counter', 'storetp': 'Store TP', 'regain': 'Regain', 'regen': 'Regen',
          'dual_wield': 'Dual Wield'}
EXTRA_METHODS = re.compile(r'\b(?:mob\w*)\s*:\s*(speed|setBaseSpeed|setAnimationSpeed|setDelay|'
                           r'setHP|setMaxHP|setMP|setMaxMP|setMobLevel|changeJob|setPetStats|'
                           r'recalculateStats|setMobSkillAttack|setAutoAttackEnabled)\s*\(')

# Changes here need a review of the stored facts and estimates.
GUARDS = {
    'src/map/utils/mobutils.cpp': '60cd8fca29f63bc3a4fcddba4f90022c1d7ad1ea50314493835b039bcc53e988',
    'src/map/entities/battle_entity.cpp': '3ffb8d2d0660073142253330b7ff3d8a0ce06681af6dc75175c7bbba92bcd178',
    'src/map/entities/mob_entity.cpp': '78a50c65327981fd5e7b6361ae854eaaecd404600bf48b6c0e6fc4e7596a8482',
    'src/map/grades.cpp': 'd5c5bd981b8a3b5a91312eff7f52fe08ae158c728c53e0cc160d9a2c57bd65af',
    'src/map/instance_loader.cpp': '704f0013a317a0add9cd432469c6f0cae9ffb042876f3e61ac80ff376110fb4a',
    'src/map/ai/controllers/mob_controller.cpp': 'f6518753d8fc07883a4e21afe242ee20285f3c5aa03fdece7862ebef637d1778',
    'src/map/data/shared_types/mob_attributes/dataset.cpp': '8cfd4ed2de15c7ecabb81d0f27f421d23ab25b4191ed1fb0bd9ce168d3e5c3f9',
    'src/map/lua/lua_base_entity.cpp': 'b55d57c06ba29d6ff44eae1ea8bfb5c6f5969620aa42156cbd3d40f634a173d4',
    'scripts/globals/job_utils/beastmaster.lua': 'ec3d35d9d097192ec1b08d317e1f3336bf4a478e929b256fecd1d477950ee25b',
    'modules/phoenix/lua/custom/exp_penalties.lua': 'fcc1b93356db22fe94a077e1256e6676769466f3983388baaf239db32d7fca92',
    'src/map/utils/zoneutils.cpp': 'b6cb460d2be671b8b1789a72f0219d4245268e486f513730b905b8fdcac391c9',
    'src/map/attackround.cpp': 'db1da0f7668a848176d2e2a182152483c90bb18aa82cb15682b0349f6385da28',
    'src/map/utils/battleutils.cpp': '63028079ac1ba766db68fc905c45a61c51561fde485f3f806fa7390f0913b733',
    'scripts/globals/job_utils/thief.lua': '2818aca1ab4b9ca9de8d9de65e931798c0c0ef840fe3aea5a9cbcf338dd50d8a',
}
MODULE_GUARD = '6919b758d1477c0feb1a53b5c3021451534522803b85afb698bf0abc640a4967'


def fingerprint(text):
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    text = lua_source.strip_comments(text)
    return hashlib.sha256(re.sub(r'\s+', '', text).encode()).hexdigest()


def loaded_digest(tree):
    files = []
    for rel in sorted(aggro.lua_files_loaded(tree)):
        text = lua_source.strip_comments((Path(tree) / rel).read_text(encoding='utf8'))
        if re.search(r'onMob\w+|CHARMABLE|HP_SCALE|MP_BASE|exp_penalt|xi\.mobMod\.(?:GIL|EXP|NO_DROPS)', text):
            files.append(rel + ':' + fingerprint(text))
    return fingerprint('\n'.join(files))


def check_source(tree):
    for rel, expected in GUARDS.items():
        path = Path(tree) / rel
        if not path.is_file() or fingerprint(path.read_text(encoding='utf8')) != expected:
            raise RuntimeError('Monster information source changed: %s. Review the stored facts.' % rel)
    if loaded_digest(tree) != MODULE_GUARD:
        raise RuntimeError('Loaded monster or reward modules changed. Review the information exporter.')


def section(value, *notes, **fields):
    return dict(value=str(value), notes=[note for note in notes if note], **fields)


def title(name):
    return str(name).replace('_', ' ').title()


def base_hp(level, main, sub):
    """CalculateBaseMobHP plus CalculateSubjobHP, before ownership and server settings."""
    if level == 0:
        return 0
    base, scale, extra = HP_SCALES[main]
    _, sj_scale, sj_extra = HP_SCALES[sub]
    l5, l30 = min(level, 5), min(level, 30)
    hp = base + (l5 - 1) * (scale + 5) + (0, 0, 0, 3, 7, 14)[l5]
    if level > 5:
        hp += (l30 - 5) * (2 * scale + l30 + 6) // 2
    if level > 30:
        hp += (level - 30) * (63 + extra) + (level - 31) * (scale + 6)
    sj = level if level > 49 else level * 3 // 4 if level > 39 else level // 2 if level > 30 else level // 4 if level > 24 else 0
    value = sj_scale * max(sj - 1, 0) + (0.5 + 0.5 * sj_extra) * max(sj - 10, 0)
    value += sum(max(sj - threshold, 0) for threshold in (30, 50, 70))
    return hp + math.ceil(value / 2)


def signed16(number):
    return (int(number) + 32768) % 65536 - 32768


def final_health(hp, mp, mods):
    """CBattleEntity::UpdateHealth for a monster without current status effects."""
    weak = stats.fdiv(100 + mods.get('weakness_pct', 0), 100)
    curse = stats.fdiv(100 + mods.get('curse_pct', 0), 100)
    def base(number, key):
        value = math.floor(stats.fmul(number + mods.get('base_' + key, 0), weak)) + mods.get(key, 0)
        return math.floor(stats.fmul(value, curse)) + mods.get('food_' + key, 0)
    hp, mp = base(hp, 'hp'), base(mp, 'mp')
    diff = mods.get('convmptohp', 0) - mods.get('convhptomp', 0)
    conversion = min(mp, diff) if diff > 0 else -min(hp - 1, -diff) if diff < 0 else 0
    hp = math.floor(stats.fmul(hp + conversion, stats.fdiv(100 + mods.get('hpp', 0), 100)))
    mp = math.floor(stats.fmul(mp - conversion, stats.fdiv(100 + mods.get('mpp', 0), 100)))
    hp += min(signed16(int(hp * mods.get('food_hpp', 0) / 100)), mods.get('food_hp_cap', 0))
    mp += min(signed16(int(mp * mods.get('food_mpp', 0) / 100)), mods.get('food_mp_cap', 0))
    return hp, mp


def can_drop_gil(mob):
    # A negative maximum wins over every positive gil modifier.
    return mob.get('gil_max', 0) >= 0 and (mob.get('gil_min', 0) > 0 or
        mob.get('gil_max', 0) != 0 or mob.get('gil_bonus', 0) > 0)


def category(name, mob=False):
    if name in HEALTH or name in {'mp_base', 'hp_scale'}:
        return 'vitals'
    if name in MOVEMENT or name in {'no_move', 'speed', 'speed_run'}:
        return 'movement'
    if name == 'charmable':
        return 'charm'
    if name in TRAITS or name in {'multi_hit', 'tp_use_chance'}:
        return 'traits'
    return 'rewards'


class Reader:
    def __init__(self, tree, tables, scripts, roots, allowed):
        self.tree, self.tables, self.scripts = Path(tree), tables, scripts
        self.allowed = allowed
        self.cache = {}
        self.settings = {}
        text = (self.tree / 'settings/default/map.lua').read_text(encoding='utf8')
        for key, value in re.findall(r'^\s*([A-Z_]+)\s*=\s*([\d.]+)\s*,', text, re.M):
            self.settings[key] = float(value)
        self.module_text = '\n'.join(lua_source.strip_comments((self.tree / rel).read_text(encoding='utf8'))
                                     for rel in aggro.lua_files_loaded(tree))

    def analyze(self, kind):
        key = (kind.zone_dir, kind.script, tuple(kind.group_mixins))
        if key in self.cache:
            return self.cache[key]
        result = {'init': [], 'spawn': [], 'dynamic': set()}
        source = self.scripts.lua(self.scripts.mob_script_path(kind.zone_dir, kind.script))
        def walk(file, handler, phase, depth=0):
            if file is None:
                return
            if depth > 4:
                result['dynamic'].update(('vitals', 'traits', 'movement', 'charm', 'rewards', 'gil'))
                return
            events = [(call.line_no, 'call', call) for call in file.calls if call.handler == handler]
            events += [(line, 'helper', (name, top)) for own, line, name, top in file.helpers if own == handler]
            for _, event, call in sorted(events, key=lambda event: event[0]):
                if event == 'helper':
                    name, top = call
                    path = self.scripts.helpers.get(name)
                    if path:
                        walk(self.scripts.lua(path), name, phase if top else None, depth + 1)
                    else:
                        result['dynamic'].add('gil')
                    continue
                if not call.own:
                    continue
                if call.method in lua_source.RESTAT_METHODS:
                    result['dynamic'].update(('vitals', 'traits'))
                if call.method not in {'setMod', 'addMod', 'delMod', 'setMobMod'} or not call.args:
                    continue
                mob = call.method == 'setMobMod'
                match = re.fullmatch(r'xi\.(?:mobMod|mod)\.(\w+)', call.args[0])
                if not match:
                    result['dynamic'].update(('vitals', 'traits', 'movement', 'charm', 'rewards', 'gil'))
                    continue
                name = match[1].lower()
                if name not in (MOB_NAMES if mob else REGULAR):
                    continue
                value = call.args[1] if len(call.args) == 2 else ''
                if phase and call.top and lua_source.INTEGER.fullmatch(value):
                    action = 'set' if mob else call.method[:3].lower()
                    result[phase].append((mob, action, name, int(value)))
                    if phase == 'spawn' and category(name, mob) == 'vitals':
                        result['dynamic'].add('vitals')
                else:
                    result['dynamic'].add(category(name, mob))
                    if mob and name in GIL_MODS:
                        result['dynamic'].add('gil')
            # These methods are outside the existing numeric exporter parser.
            for method in EXTRA_METHODS.findall(file.text):
                if method in {'speed', 'setBaseSpeed', 'setAnimationSpeed'}:
                    result['dynamic'].add('movement')
                elif method in {'setDelay', 'setMobSkillAttack', 'setAutoAttackEnabled'}:
                    result['dynamic'].add('traits')
                elif method not in {'setHP', 'setMP'}:
                    result['dynamic'].add('vitals')
        if source:
            handlers = {call.handler for call in source.calls} | {helper[0] for helper in source.helpers}
            for handler in sorted(handlers):
                walk(source, handler, 'init' if handler == 'onMobInitialize' else 'spawn' if handler == 'onMobSpawn' else None)
        for mixin in set((source.mixins if source else []) + kind.group_mixins):
            file = self.scripts.lua(str(self.tree / 'scripts/mixins' / (mixin + '.lua')))
            if file:
                for handler in {call.handler for call in file.calls} | {helper[0] for helper in file.helpers}:
                    walk(file, handler, None)
        if kind.effects.job_changes:
            result['dynamic'].update(('vitals', 'traits', 'gil'))
        # Loaded callbacks retain a qualification. A source guard requires review when they change.
        token = 'xi.zones.%s.mobs.%s.' % (kind.zone_dir, kind.script)
        if token in self.module_text:
            result['dynamic'].update(('vitals', 'movement', 'charm', 'traits', 'rewards', 'gil'))
        self.cache[key] = result
        return result

    def modifiers(self, kind, raw, analysis, level, include_spawn=True, source_mob_mods=None):
        mods = dict(raw.get('mods') or {}) if not hasattr(kind, 'instance_pool') else {}
        mob = dict((kind.attributes.get('mob_mods') or {}) if source_mob_mods is None else source_mob_mods)
        for is_mob, action, name, value in analysis['init']:
            target = mob if is_mob else mods
            stats.apply_ops(target, [(action, name, value)], [])
        traits = []
        for job in kind.jobs:
            stats.add_traits(self.tables, traits, job, level, kind.ecosystem == 'beastmen')
        for trait in traits:
            name = trait['mod']
            mods[name] = mods.get(name, 0) + trait['value']
        if include_spawn:
            if kind.ecosystem == 'beastmen' and not mob.get('gil_bonus'):
                mob['gil_bonus'] = 150 if kind.jobs[0] == 'thf' else 100
            if 'battlefield' in kind.types:
                mob.update(gil_min=-1, gil_max=-1, mug_gil=-1, exp_bonus=-100)
            if hasattr(kind, 'instance_pool'):
                mob.update(gil_max=0, mug_gil=0)
            if can_drop_gil(mob):
                mob.pop('mug_gil', None)
                mob['_mug_reset'] = True
            for is_mob, action, name, value in analysis['spawn']:
                stats.apply_ops(mob if is_mob else mods, [(action, name, value)], [])
        return mods, mob

    def gil_details(self, kind, raw, analysis, level):
        # These encounter overrides are not resolved by the base script reader.
        if ('gil' in analysis['dynamic'] or kind.zone_dir.startswith('Dynamis') or
                kind.zone_dir in {'Apollyon', 'Temenos'}):
            return [], []
        source_mods = kind.attributes.get('mob_mods') if hasattr(kind, 'instance_pool') else raw.get('mob_mods')
        _, mob = self.modifiers(kind, raw, analysis, level, source_mob_mods=source_mods or {})
        if not can_drop_gil(mob) or self.settings.get('MOB_GIL_MULTIPLIER', 1) <= 0:
            return [], []
        bits = []
        notes = ['Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.']
        low, high = mob.get('gil_min', 0), mob.get('gil_max', 0)
        if low > 0 and high > 0:
            top = low if high <= low else max(high, low + 2) - 1
            bits.append('Base gil %d' % low if low == top else 'Base gil %d-%d' % (low, top))
        else:
            bits.append('Drops gil')
            if mob.get('gil_bonus', 0) > 0:
                notes.append('The source gil multiplier is %g%% before party distribution.' % mob['gil_bonus'])
        if mob.get('mug_gil', 0) > 0:
            bits.append('Mug purse %d gil' % mob['mug_gil'])
            notes.append('Mug uses the remaining purse; your modifiers can change the payout. This is not a guaranteed amount.')
        elif mob.get('_mug_reset'):
            bits.append('Mug purse set at spawn')
            notes.append('Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.')
        return bits, notes

    def vitals(self, kind, raw, analysis, pet):
        hp, mp = {}, {}
        fixed = raw.get('stats') or {}
        if hasattr(kind, 'instance_group'):
            fixed = dict({'hp': kind.instance_group['HP'], 'mp': kind.instance_group['MP']}, **fixed)
        uncertain = 'vitals' in analysis['dynamic'] or bool(kind.flags & {'scripted_stats'})
        notes = ['Estimated maximum at the stored level, not current HP or MP.',
                 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.']
        if pet:
            notes.append('This spawn is a monster pet. Derived base HP includes the native pet reduction.')
        if 'battlefield' in kind.types or hasattr(kind, 'instance_pool') or kind.zone_dir.startswith('Dynamis'):
            uncertain = True
            notes.append('Encounter setup or participant scaling can change these base estimates.')
        if uncertain:
            notes.append('Scripts, jobs or battle state can change the maximum; this is a stored baseline.')
        for level in sorted(kind.levels):
            mods, mob = self.modifiers(kind, raw, analysis, level, include_spawn=False)
            grades = [self.tables.grades[job]['hp'] for job in kind.jobs]
            base = fixed.get('hp', 0) or base_hp(level, *grades)
            if not fixed.get('hp', 0):
                if pet:
                    base = int(stats.fmul(base, 0.3))
                base = signed16(base)
            prefix = 'NM_' if kind.nm else 'MOB_'
            mult = self.settings.get(prefix + 'HP_MULTIPLIER', 1)
            base = int(stats.fmul(base, mult if 0.1 <= mult <= 2 else 1))
            mana = 0
            if set(kind.jobs) & MP_JOBS or mob.get('mp_base', 0):
                scale = stats.fdiv(mob['mp_base'], 100) if mob.get('mp_base') else 1
                mana = fixed.get('mp', 0) or signed16(18.2 * math.pow(level, 1.1075) * scale) + 10
                mult = self.settings.get(prefix + 'MP_MULTIPLIER', 1)
                mana = int(stats.fmul(mana, mult if 0.1 <= mult <= 2 else 1))
            hp[level], mp[level] = final_health(base, mana, mods)
            if mob.get('hp_scale', 0):
                uncertain = True
                notes.append('An HP scaling mob modifier is present; live maximum is not resolved.')
        if not hp:
            notes.append('No stored level is available for a maximum estimate.')
        return section('Estimated maximum HP / MP', *dict.fromkeys(notes), hp=hp, mp=mp,
                       uncertain=uncertain, hp_uncertain=uncertain, mp_uncertain=uncertain,
                       hp_unknown=not bool(hp), mp_unknown=not bool(mp))

    def read_one(self, kind, raw, analysis, pet):
        dynamic = analysis['dynamic']
        level = min(kind.levels) if kind.levels else 1
        mods, mob = self.modifiers(kind, raw, analysis, level)
        info = {}
        info['family'] = section('%s / %s' % (title(kind.family_name), title(kind.ecosystem)),
            'Source species: %s (ID %d); family ID %d.' % (title(kind.species_name), kind.species_id, kind.family),
            'Species names can be internal variants of the same visible family.')
        forbidden = bool(set(kind.types) & {'notorious', 'event', 'fished', 'battlefield'})
        eligible = bool(raw.get('charmable', False)) and not forbidden
        if 'charmable' in mob:
            eligible = mob['charmable'] != 0
        if kind.zone_dir.startswith('Dynamis') or kind.zone_dir in {'Zhayolm_Remnants', 'Arrapago_Remnants',
                'Bhaflau_Remnants', 'Silver_Sea_Remnants', 'Nyzul_Isle'} or pet:
            eligible = False
        value = 'Eligibility can change' if 'charm' in dynamic else 'Charm eligible' if eligible else 'Not charm eligible'
        info['charm'] = section(value, 'Eligibility only. This does not estimate Charm success or duration.',
            'An existing master, encounter restrictions and current states can prevent Charm.',
            'A script or loaded override changes the eligibility rules.' if 'charm' in dynamic else '')
        info['vitals'] = self.vitals(kind, raw, analysis, pet)
        speed = int(raw.get('speed', 40))
        animation = raw.get('animation_speed', speed)
        info['movement'] = section('Base speed %d' % speed,
            'Source base speed is %d; the ordinary monster default is 40. Animation speed is %s.' % (speed, animation),
            'Chase speed, Gravity, movement modifiers and scripts can change actual movement.',
            'The default server run multiplier is %g; this is not a safe kiting prediction.' % self.settings.get('MOB_RUN_SPEED_MULTIPLIER', 2.5),
            'Movement is disabled in the stored spawn setup.' if mob.get('no_move') else '',
            'A script or loaded override changes movement.' if 'movement' in dynamic else '')
        state = getattr(kind, 'state', None)
        scents = bool(state.mob_mods.get('detection', 0) & self.tables.detects['scent']) if state else 'scent' in (raw.get('detects') or [])
        changing = bool(kind.effects.aggro_runtime)
        info['pursuit'] = section('Scent tracking' if scents else 'No base scent tracking',
            'Scent is a pursuit rule, separate from initial aggro.',
            'Water, Deodorize and weather that disables scent can break scent tracking.' if scents else '',
            'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.',
            'Scripted detection changes can change pursuit.' if changing else '')
        element = str(raw.get('element', 'none'))
        blocked_rewards = bool(mob.get('no_drops') or mob.get('exp_bonus', 0) <= -100 or
            'battlefield' in kind.types or kind.zone_dir.startswith('Dynamis') or kind.zone_dir in LUMORIA)
        crystal_value = 'Crystal reward disabled' if blocked_rewards else title(element) + ' crystal (conditional)' if element != 'none' else 'No base crystal element'
        info['crystal'] = section(crystal_value,
            'Source crystal element: %s.' % title(element),
            'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.',
            'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.',
            'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' if blocked_rewards else
            'No-drops settings, region control and party conditions can prevent the reward.')
        reward_notes = ['Actual EXP depends on level, party, claim, eligibility and server settings.']
        if blocked_rewards:
            reward_notes.append('Stored encounter, zone or no-drops rules block the ordinary seal reward.')
        elif kind.nm:
            reward_notes.append('Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.')
        else:
            reward_notes.append('Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.')
            reward_notes.append('With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.')
        reward_bits = []
        if mob.get('no_drops') or kind.effects.drops_off:
            reward_bits.append('Ordinary item drops disabled')
            reward_notes.append('This does not describe separate scripted or encounter completion rewards.')
        if mob.get('exp_bonus'):
            reward_bits.append('EXP modifier %+d%%' % mob['exp_bonus'])
        elif 'battlefield' in kind.types:
            reward_bits.append('Ordinary kill EXP disabled')
            reward_notes.append('Battlefield completion rewards are separate from the normal kill award.')
        if mods.get('exp_lvl_mod'):
            reward_bits.append('EXP level modifier %+d' % mods['exp_lvl_mod'])
        gil_bits, gil_notes = self.gil_details(kind, raw, analysis, level)
        reward_bits.extend(gil_bits)
        reward_notes.extend(gil_notes)
        if pet:
            reward_notes.append('Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.')
        if 'rewards' in dynamic or 'scripted_drops' in kind.flags:
            reward_notes.append('Scripted encounter or loaded module rules can change rewards.')
        info['rewards'] = section('; '.join(reward_bits) or 'Conditional rewards', *reward_notes)
        combat = raw.get('combat') or {}
        delay = kind.instance_pool['cmbDelay'] if hasattr(kind, 'instance_pool') else combat.get('delay', 240)
        trait_notes = ['Base attack delay %s (source delay units), before haste, slows and fight changes.' % delay,
                       'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.',
                       'Store TP changes the monster\'s TP gain, not the player\'s TP feed.',
                       'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.']
        values = {name: set() for name in LABELS}
        for own_level in sorted(kind.levels) or [1]:
            own_mods, _ = self.modifiers(kind, raw, analysis, own_level)
            for name in values:
                values[name].add(own_mods.get(name, 0))
        bits = []
        for name, label in LABELS.items():
            low, high = min(values[name]), max(values[name])
            if high or low:
                bits.append('%s %s' % (label, str(low) if low == high else '%d-%d' % (low, high)))
        if mob.get('multi_hit'):
            bits.append('Multi-hit modifier %d' % mob['multi_hit'])
            trait_notes.append('The multi-hit modifier feeds a rolled attack count; priorities and caps still apply.')
        if mods.get('martial_arts'):
            trait_notes.append('Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.')
        if any(values['dual_wield']):
            trait_notes.append('The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.')
        if kind.effects.tp_moves:
            trait_notes.append('The spawn uses a TP-move attack list in place of ordinary swings.')
        if kind.effects.no_swings:
            trait_notes.append('The spawn setup disables ordinary attacks.')
        if 'traits' in dynamic:
            trait_notes.append('Scripts or loaded overrides can change attack traits during the fight.')
        info['traits'] = section('; '.join(bits) or 'Base delay %s' % delay, *trait_notes)
        return info

    def read(self, kind, levels=None):
        analysis = self.analyze(kind)
        raw = kind.attributes.get('source', {})
        pets = getattr(kind, 'pet_indexes', set())
        info = self.read_one(kind, raw, analysis, bool(kind.ids and kind.ids[0] in pets))
        by_index = {}
        cache = {}
        for index in kind.ids:
            own = getattr(kind, 'source_by_index', {}).get(index, raw)
            key = (repr(own), index in pets)
            if key not in cache:
                cache[key] = self.read_one(kind, own, analysis, index in pets)
            differences = {name: value for name, value in cache[key].items() if value != info[name]}
            if differences:
                by_index[index] = differences
        return info, by_index
