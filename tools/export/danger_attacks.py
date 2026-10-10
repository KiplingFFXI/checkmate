"""Harmful effects on ordinary monster attacks, with source conditions kept separate."""
import hashlib
from pathlib import Path
import re

from . import aggro, danger_effects, lua_source, overlays

SOURCE_GUARD = '584d133399cd748ff9f4a83b1bfa64733e72c9cac3060c5b219f485669bcf0a6'
SOURCE_FILES = (
    'src/map/utils/battleutils.cpp', 'src/map/utils/battleutils.h',
    'src/map/entities/battle_entity.cpp', 'src/map/lua/luautils.cpp',
    'scripts/globals/mobs.lua', 'scripts/combat/action_additional_effect_status.lua',
    'scripts/combat/action_additional_effect_damage.lua', 'scripts/effects/blood_weapon.lua',
    'scripts/mixins/job_special.lua', 'scripts/mixins/families/morbol_toau.lua',
    'scripts/enum/mob_skill.lua',
)
WATCH = re.compile(r'onAdditionalEffect|ADD_EFFECT|ENSPELL|BLOOD_WEAPON|'
                   r"addListener\(\s*['\"](?:ATTACK|MELEE_SWING_)")
HELPERS = {'xi.mob.onAddEffect', 'xi.combat.action.executeAddEffectEnfeeblement',
           'xi.combat.action.executeAddEffectEnhancement', 'xi.combat.action.executeAddEffectDispel',
           'xi.combat.action.executeAddEffectDamage'}
BLOOD_WEAPON_IDS = {695, 1015, 2249}


def source_digest(tree, loaded=None):
    tree = Path(tree)
    loaded = list(loaded) if loaded is not None else aggro.lua_files_loaded(str(tree))
    paths = set(SOURCE_FILES) | set(loaded)
    for folder in ('scripts/zones', 'scripts/mixins', 'scripts/globals', 'scripts/combat', 'scripts/effects'):
        for path in (tree / folder).rglob('*.lua'):
            if folder == 'scripts/combat' or WATCH.search(danger_effects.clean(path)):
                paths.add(path.relative_to(tree).as_posix())
    for root in overlays.data_roots(str(tree)):
        for name in ('status_effects.yaml', 'enums/mob_mod.yaml', 'enums/mod.yaml'):
            path = Path(root) / name
            if path.is_file():
                paths.add(path.relative_to(tree).as_posix())
    parts = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in sorted(paths):
        path = tree / rel
        if not path.is_file():
            raise RuntimeError('Ordinary attack source is missing ' + rel)
        text = path.read_text(encoding='utf-8-sig')
        if path.suffix == '.lua':
            text = lua_source.strip_comments(text)
        parts.append(rel + '\n' + ' '.join(text.split()))
    return hashlib.sha256('\n'.join(parts).encode()).hexdigest(), len(paths)


def check_source(tree, loaded=None):
    actual, count = source_digest(tree, loaded)
    if actual != SOURCE_GUARD:
        raise RuntimeError('Ordinary attack sources changed; review callback, listener and native proc coverage. '
                           'Expected %s, found %s across %s files.' % (SOURCE_GUARD, actual, count))
    return count


def unique(values):
    return list(dict.fromkeys(values))


def field(table, key):
    match = re.search(r'\b' + re.escape(key) + r'\s*=\s*', table)
    if not match:
        return None
    rest = table[match.end():]
    # The argument splitter respects nested calls, tables and quoted strings.
    args = lua_source.call_arguments('(' + rest + ')', 0)
    return args[0].strip() if args else None


def parameter_tables(expression, text):
    if expression.strip().startswith('{'):
        return [expression.strip()], False
    values = danger_effects.Values(text, {})
    found = values.assignments.get(expression.strip(), ())
    known = [value for value in found if value.startswith('{')]
    return known, not known or len(known) != len(found)


def legacy_effects(text):
    result = {}
    for match in re.finditer(r'\[xi\.mob\.ae\.(\w+)\]\s*=\s*\{', text):
        body = lua_source.block(text, match.start(), 'ordinary effect defaults')
        effect = re.search(r'\beff\s*=\s*xi\.effect\.(\w+)', body)
        if effect:
            result[match[1]] = [danger_effects.effect_label(effect[1])]
        elif match[1] in ('HP_DRAIN', 'MP_DRAIN', 'TP_DRAIN'):
            result[match[1]] = [match[1][:2] + ' drain']
        else:
            result[match[1]] = []
    return result


def analyze(text, ids, legacy):
    """Read only the effective ordinary callback and its reachable helpers."""
    labels, notes, unknown = set(), [], []
    values = danger_effects.Values(text, ids)
    masked = text
    for match in list(danger_effects.CALL.finditer(text)):
        name = match['name']
        if name not in HELPERS:
            continue
        args = lua_source.call_arguments(text, match.end() - 1)
        if args is None:
            raise RuntimeError('Unbalanced ordinary additional-effect call')
        minimum = 4 if name == 'xi.mob.onAddEffect' else 3
        if len(args) < minimum or args[0] not in ('mob', 'attacker', 'actor') or args[1] != 'target':
            unknown.append('An ordinary additional-effect target or argument is unresolved.')
            continue
        if name == 'xi.mob.onAddEffect':
            selected = re.fullmatch(r'xi\.mob\.ae\.(\w+)', args[3])
            if selected and selected[1] in legacy:
                labels.update(legacy[selected[1]])
            else:
                unknown.append('An ordinary attack effect selector is missing or unresolved in the source.')
            if len(args) > 4 and 'code' in args[4]:
                unknown.append('A custom ordinary attack effect callback needs review.')
            continue
        parameters, missing = parameter_tables(args[2], text)
        if missing:
            unknown.append('Some ordinary attack effect parameters are unresolved.')
        for parameter in parameters:
            recipient = field(parameter, 'aeTarget')
            if recipient in ('mob', 'attacker', 'actor'):
                continue
            if recipient not in (None, 'target'):
                unknown.append('An ordinary additional-effect recipient is unresolved.')
                continue
            chance = field(parameter, 'chance')
            if chance is not None and re.fullmatch(r'-?\d+(?:\.\d+)?', chance) and float(chance) <= 0:
                continue
            if name.endswith(('Enfeeblement', 'Enhancement')):
                effect = field(parameter, 'effectId') or 'xi.effect.NONE'
                names, missing = values.resolve(effect)
                labels.update(danger_effects.effect_label(value) for value in names & danger_effects.HARMFUL)
                if missing or names - danger_effects.HARMFUL - danger_effects.BENEFICIAL:
                    unknown.append('Some ordinary attack status effects are unresolved.')
            elif name.endswith('Dispel'):
                effect = field(parameter, 'effectId')
                if effect not in (None, 'xi.effect.NONE', '0'):
                    unknown.append('The ordinary dispel effect selector is unresolved.')
                    continue
                absorb = field(parameter, 'absorbEffect')
                if absorb in (None, 'false'):
                    labels.add('Buff removal')
                elif absorb == 'true':
                    labels.add('Buff theft')
                else:
                    unknown.append('Whether the ordinary attack removes or steals a buff is unresolved.')
            else:
                for resource in ('HP', 'MP', 'TP'):
                    drain = field(parameter, 'drain' + resource)
                    if drain == 'true':
                        labels.add(resource + ' drain')
                    elif drain not in (None, 'false'):
                        unknown.append('An ordinary attack drain condition is unresolved.')
    # Direct target mutations use the same harmful-status classification as TP moves.
    for helper in HELPERS:
        masked = masked.replace(helper, 'reviewed_helper')
    direct, _ = danger_effects.analyze(masked, ids)
    labels.update(direct['effects'])
    notes.extend(direct['notes'])
    unknown.extend(direct['unknown'])
    for match in danger_effects.CALL.finditer(text):
        name = match['name']
        if name.startswith('xi.') and name not in HELPERS:
            unknown.append('A helper used by an ordinary attack effect has not been resolved.')
    if labels:
        if re.search(r'\bif\b|math\.random|utils\.random', text):
            notes.append('These effects depend on the callback conditions and may not all happen on the same hit.')
        if 'target:getTP' in text:
            notes.append('The callback checks the target\'s remaining TP.')
        if 'target:hasStatusEffect' in text:
            notes.append('The callback checks effects already on the target.')
        notes.append('Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them.')
        notes.append('An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.')
    return {'effects': sorted(labels), 'notes': unique(notes), 'unknown': unique(unknown)}


def enabled(text, baseline):
    values, uncertain, conditional = {baseline or 0}, False, False
    parsed = lua_source.LuaFile('ordinary attack gate', text)
    calls = [call for call in parsed.calls if call.own and call.method in ('setMobMod', 'addMobMod')
             and len(call.args) == 2 and call.args[0] == 'xi.mobMod.ADD_EFFECT']
    for call in sorted(calls, key=lambda row: (0 if row.handler == 'onMobInitialize' else 1 if row.handler == 'onMobSpawn' else 2, row.line_no)):
        value = int(call.args[1]) if re.fullmatch(r'-?\d+', call.args[1]) else None
        top = call.top and call.handler in ('onMobInitialize', 'onMobSpawn')
        if value is None:
            uncertain = True
            if top:
                values.clear()
        else:
            updated = {value} if call.method == 'setMobMod' else {old + value for old in values}
            values = updated if top else values | updated
            if top and call.method == 'setMobMod':
                uncertain = False
        conditional |= not top
    return any(value > 0 for value in values), uncertain, conditional


class Reader:
    def __init__(self, tree, loaded=None):
        self.tree = Path(tree)
        self.sources = danger_effects.Sources(tree, loaded)
        self.watched = check_source(tree, self.sources.loaded)
        rows = overlays.load_merged(str(tree), overlays.data_roots(str(tree)), 'status_effects')['status_effects']
        self.ids = {name.upper(): row['id'] for name, row in rows.items()}
        self.legacy = legacy_effects(danger_effects.clean(self.tree / 'scripts/globals/mobs.lua'))
        self.cache = {}

    def callback(self, kind):
        key = kind.zone_dir, kind.script
        if key in self.cache:
            return self.cache[key]
        rel = 'scripts/zones/%s/mobs/%s.lua' % key
        path = self.tree / rel
        prefix = 'xi.zones.%s.mobs.%s.' % key
        present = path.is_file() and 'onAdditionalEffect' in danger_effects.clean(path)
        present |= prefix + 'onAdditionalEffect' in self.sources.overrides
        if not present:
            result = {'effects': [], 'notes': [], 'unknown': []}
        else:
            text, unknown = self.sources.read(rel, prefix, 'onAdditionalEffect')
            result = analyze(text, self.ids, self.legacy)
            result['unknown'] = unique(result['unknown'] + unknown)
        self.cache[key] = result
        return result

    def read(self, kind, attrs, kit_text, statuses=(), skills=()):
        labels, notes, unknown = set(), [], []
        analysis = getattr(kind, 'effects', None)
        mob_mods = getattr(kind, 'attributes', {}).get('mob_mods') or attrs.get('mob_mods') or {}
        if not getattr(analysis, 'normal_swings', False) and (getattr(analysis, 'no_swings', False)
                or getattr(analysis, 'tp_moves', False) or mob_mods.get('attack_skill_list', 0)):
            return {'effects': [], 'notes': [], 'unknown': []}
        baseline = mob_mods.get('add_effect', 0)
        active, missing, conditional = enabled(kit_text, baseline)
        if active:
            record = self.callback(kind)
            labels.update(record['effects'])
            notes.extend(record['notes'])
            unknown.extend(record['unknown'])
            if conditional and labels:
                notes.append('Scripts can enable or disable the ordinary additional effect during the fight.')
        if missing:
            unknown.append('Whether scripted ordinary attack effects are enabled is unresolved.')
        if 'BLOOD_WEAPON' in statuses or set(skills) & BLOOD_WEAPON_IDS or re.search(
                r'\b(?:mob|mobArg|actor):addStatusEffect(?:Ex)?\(\s*xi\.effect\.BLOOD_WEAPON\b', kit_text):
            labels.add('HP drain')
            notes.append('Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.')
        native_values = {(attrs.get('mods') or {}).get('enspell', 0)}
        parsed = lua_source.LuaFile('native ordinary proc', kit_text)
        calls = [call for call in parsed.calls if call.own and call.method in ('setMod', 'addMod', 'delMod')
                 and len(call.args) == 2 and call.args[0] == 'xi.mod.ENSPELL']
        for call in sorted(calls, key=lambda item: (0 if item.handler == 'onMobInitialize' else 1 if item.handler == 'onMobSpawn' else 2, item.line_no)):
            value = int(call.args[1]) if re.fullmatch(r'-?\d+', call.args[1]) else None
            top = call.top and call.handler in ('onMobInitialize', 'onMobSpawn')
            if value is None:
                unknown.append('A native ordinary attack proc selector is unresolved.')
                if top:
                    native_values.clear()
                continue
            updated = {value} if call.method == 'setMod' else {old + value * (-1 if call.method == 'delMod' else 1) for old in native_values}
            native_values = updated if top else native_values | updated
        if 17 in native_values:
            labels.add('HP drain')
            notes.append('The source can enable the native Blood Weapon drain on normal hits; current activation is not known.')
        listeners = re.findall(r"addListener\(\s*['\"](ATTACK|MELEE_SWING_[A-Z_]+)['\"]\s*,\s*['\"]([^'\"]+)", kit_text)
        for event, name in listeners:
            if name == 'MORBOL_TOAU_ATTACK':
                labels.add('HP drain')
                notes.append('Normal hits drain HP when this Morbol is outside its spawn area. The source checks a 25-yalm distance from its spawn point; current position relative to that point is not established.')
            elif name == 'COLLECTOR_ATTACK':
                labels.add('Enmity reset')
                notes.append('The attack listener resets enmity for the target captured when the listener was attached.')
            elif name != 'TARASQUE_BLAZE_SPIKES':
                unknown.append('An ordinary attack listener has not been resolved.')
        if re.search(r"removeListener\(\s*['\"]MORBOL_TOAU_ATTACK", kit_text):
            unknown.append('The ordinary attack drain listener can be removed by scripts.')
        return {'effects': sorted(labels), 'notes': unique(notes), 'unknown': unique(unknown)}
