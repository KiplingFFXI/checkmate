"""Source targeting, shadows and reviewed removal options for danger moves."""
import hashlib
import math
from pathlib import Path
import re

from . import aggro, danger_effects, lua_source, overlays, tables


SOURCE_GUARD = '11a921f8ec70b0202dd1a035eb01db695a48501351749bbd667f3a0bce70402c'
SOURCE_FILES = (
    'src/map/mobskill.cpp', 'src/map/spell.cpp', 'src/map/entities/battle_entity.cpp',
    'src/map/ai/controllers/mob_controller.cpp', 'src/map/ai/states/magic_state.cpp',
    'src/map/ai/states/item_state.cpp', 'src/map/ai/helpers/targetfind.cpp',
    'src/map/status_effect_container.cpp', 'src/map/utils/battleutils.cpp', 'src/map/lua/lua_base_entity.cpp',
    'scripts/combat/basic/magic_aoe.lua', 'scripts/combat/action_mobskill_status_effect.lua',
    'scripts/globals/mobskills.lua', 'scripts/globals/bluemagic.lua', 'scripts/globals/weaponskills.lua',
    'scripts/utils/combat_utils.lua', 'scripts/enum/magic.lua', 'data/status_effects.yaml',
    'data/enums/status_effect_flag.yaml',
    'scripts/items/antidote.lua', 'scripts/items/flask_of_echo_drops.lua',
    'scripts/items/flask_of_eye_drops.lua', 'scripts/items/flask_of_holy_water.lua',
    'scripts/items/flask_of_panacea.lua', 'scripts/items/remedy.lua',
    'sql/item_usable.sql', 'sql/spell_list.sql',
)
REMOVAL_SPELLS = ('poisona', 'paralyna', 'blindna', 'silena', 'stona', 'viruna', 'cursna', 'erase')
SHAPES = {0: 'single target', 1: 'area around the monster', 2: 'area around the target',
          4: 'front cone', 8: 'rear cone'}
DAMAGE_HELPERS = {
    'xi.mobskills.mobPhysicalMove': (4, 1, True),
    'xi.mobskills.mobRangedMove': (4, 1, True),
    'xi.mobskills.mobMagicalMove': (4, 1, False),
    'xi.mobskills.mobBreathMove': (4, 0, False),
    'xi.spells.blue.usePhysicalSpell': (3, 1, True),
}
SHADOW_ENUM = {'IGNORE_SHADOWS': 0, 'WIPE_SHADOWS': 999,
               **{'NUMSHADOWS_' + str(n): n for n in range(1, 10)}}
CALL = re.compile(r'\b(' + '|'.join(re.escape(name) for name in DAMAGE_HELPERS) + r')\s*\(')
DIRECT_EFFECT = re.compile(r'xi\.mobskills\.(?:mobStatusEffectMove|mobGazeMove|mobDrainAttribute|mobDrainStatusEffectMove)\s*\('
                           r'|xi\.combat\.action\.executeMobskillStatusEffect\s*\('
                           r'|\btarget:(?:addStatusEffect(?:Ex)?|delStatusEffect(?:Silent)?|setHP|dispelStatusEffect|dispelAllStatusEffect|copyStatusEffect)\s*\('
                           r'|\b(?:mob|caster):(?:charm|stealStatusEffect)\s*\(')
SCRIPTED_GEOMETRY = re.compile(r':set(?:AoE|Aoe|Radius|Range|Distance)\s*\(')


def unique(values):
    return list(dict.fromkeys(values))


def source_digest(tree, loaded=None):
    tree = Path(tree)
    loaded = list(loaded) if loaded is not None else aggro.lua_files_loaded(str(tree))
    paths = set(SOURCE_FILES) | set(loaded)
    paths.update('scripts/actions/spells/white/' + name + '.lua' for name in REMOVAL_SPELLS)
    for folder in ('scripts/actions/mobskills', 'scripts/actions/spells', 'scripts/actions/weaponskills', 'scripts/globals/spells'):
        paths.update(path.relative_to(tree).as_posix() for path in (tree / folder).rglob('*.lua'))
    for root in overlays.data_roots(str(tree)):
        path = Path(root) / 'status_effects.yaml'
        if path.is_file():
            paths.add(path.relative_to(tree).as_posix())
    for path in tables.module_sql_files(str(tree)):
        if re.search(r'\b(?:item_usable|spell_list)\b', Path(path).read_text(encoding='utf-8-sig')):
            paths.add(Path(path).relative_to(tree).as_posix())
    parts = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in sorted(paths):
        path = tree / rel
        if not path.is_file():
            raise RuntimeError('Danger details source is missing ' + rel)
        text = path.read_text(encoding='utf-8-sig')
        if path.suffix == '.lua':
            text = lua_source.strip_comments(text)
        parts.append(rel + '\n' + ' '.join(text.split()))
    return hashlib.sha256('\n'.join(parts).encode()).hexdigest(), len(paths)


def check_source(tree, loaded=None):
    actual, count = source_digest(tree, loaded)
    if actual != SOURCE_GUARD:
        raise RuntimeError('Danger targeting, shadow or removal sources changed; review their rules before exporting. '
                           'Expected %s, found %s across %d files.' % (SOURCE_GUARD, actual, count))
    return count


def number(value, scale=1):
    if isinstance(value, (int, float)) and not isinstance(value, bool) and math.isfinite(value) and value >= 0:
        return value / scale
    return None


def yards(value):
    return '%g yalms' % value


def geometry(row, spell=False):
    out = {'notes': [], 'unknown': []}
    if row.get('targeting_scripted'):
        out['unknown'].append('The monster script changes targeting. Its final range and area are not established here.')
        return out
    if spell:
        aoe = row.get('AOE')
        # Monster casting does not use player Manifestation, Accession or Diffusion.
        aoe = 0 if aoe in (3, 4, 6) else 1 if aoe == 5 else aoe
        shape = {0: 'single target', 1: 'area around the target', 2: 'front cone'}.get(aoe)
        reach = number(row.get('spell_range'), 10)
        radius = number(row.get('radius'), 10)
        if reach is not None:
            out['activation_range'] = reach
            out['notes'].append('Base casting range: ' + yards(reach) + '. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.')
        if row.get('forced'):
            out['notes'].append('Scripted casting can bypass normal spell selection range.')
    else:
        aoe = row.get('mob_skill_aoe')
        shape = SHAPES.get(aoe)
        reach = number(row.get('mob_skill_distance'))
        radius = number(row.get('mob_skill_aoe_radius'))
        if reach is not None:
            out['activation_range'] = reach
            out['notes'].append('Normal activation range: ' + yards(reach) + '. This is the move selection limit, not its affected area.')
        if aoe in (1, 2) and radius is not None and radius <= 0:
            radius = 8 if aoe == 2 else reach
        if row.get('forced'):
            out['notes'].append('A scripted use can bypass normal move selection range.')
    if shape is None:
        out['unknown'].append('The source targeting shape is not established.')
    else:
        out['shape'] = shape
        if (spell and aoe == 2) or (not spell and aoe in (4, 8)):
            length = radius if spell else reach
            if length is not None:
                out['cone_length'] = length
                out['notes'].append('Area: ' + shape + ', ' + yards(length) + ' source length. The cone uses a 45-degree triangle; the primary target is handled separately.')
            else:
                out['unknown'].append('The source cone length is not established.')
        elif aoe in (1, 2):
            if radius is not None:
                out['effect_radius'] = radius
                out['notes'].append('Area: ' + yards(radius) + ' radius, ' + shape + '.')
            else:
                out['unknown'].append('The source effect radius is not established.')
        else:
            out['notes'].append('Area: ' + shape + '.')
    if reach is None:
        out['unknown'].append('The source activation range is not established.')
    out['notes'].append('These source distances do not establish a safe place to stand.')
    return out


def shadow_literal(expression):
    value = expression.strip().rstrip(',;')
    if value in ('nil', 'false'):
        return 'default'
    match = re.fullmatch(r'xi\.mobskills\.shadowBehavior\.(\w+)', value)
    if match:
        return SHADOW_ENUM.get(match[1])
    if re.fullmatch(r'\d+', value) and int(value) in set(SHADOW_ENUM.values()):
        return int(value)
    return None


def shadow_values(text, end, parameter, default):
    """Only literal writes before this call establish the possible shadow rules."""
    def field(table):
        found = re.search(r'\bshadowBehavior\s*=\s*([^,}\n]+)', table)
        value = shadow_literal(found[1]) if found else 'default'
        return default if value == 'default' else value
    if parameter == 'nil':
        return {default}
    if parameter.startswith('{'):
        return {field(parameter)}
    if not re.fullmatch(r'\w+', parameter):
        return {None}
    starts = list(re.finditer(r'^( *)(?:local function\b|(?:(?:local )?[\w.]+\s*=\s*)?function\b)', text[:end], re.M))
    start = starts[-1].start() if starts else 0
    base_indent = len(starts[-1][1]) + 4 if starts else 0
    body, values = text[start:end], {None}
    pattern = re.compile(r'\b' + re.escape(parameter) + r'(?:\.shadowBehavior)?\s*=(?!=)')
    for match in pattern.finditer(body):
        line = body[body.rfind('\n', 0, match.start()) + 1:match.start()]
        top = len(line) - len(line.lstrip()) <= base_indent and re.fullmatch(r'\s*(?:local\s+)?', line) is not None
        rest = body[match.end():].lstrip()
        if '.shadowBehavior' not in match[0]:
            if rest.startswith('{'):
                value = field(lua_source.block(rest, 0, 'shadow parameter table'))
            elif re.match(r'xi\.spells\.blue\.getDefaultParams\s*\(', rest):
                value = 1
            else:
                value = None
        else:
            expression = re.split(r'\s+(?:end|else)\b', rest.split('\n', 1)[0].split(';', 1)[0], maxsplit=1)[0]
            value = shadow_literal(expression)
            if value == 'default':
                value = default
        values = {value} if top else values | {value}
    return values


def shadows(text, aoe=False):
    text = lua_source.strip_comments(text)
    rules, notes, unknown = [], [], []
    for match in re.finditer(r'\butils\.takeShadows\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if args and args[0] == 'target':
            expression = args[2] if len(args) > 2 else '1'
            span = re.fullmatch(r'math\.randomInt\(\s*(\d+)\s*,\s*(\d+)\s*\)', expression)
            count = shadow_literal(expression)
            if span and 0 < int(span[1]) <= int(span[2]) <= 9:
                rules.append({'mode': 'absorb', 'count_min': int(span[1]), 'count_max': int(span[2]), 'per_hit': False, 'legacy': True})
            elif isinstance(count, int) and 0 < count < 999:
                rules.append({'mode': 'absorb', 'count': count, 'per_hit': False, 'legacy': True})
            else:
                unknown.append('A separate shadow check is selected dynamically and is not established.')
    for match in CALL.finditer(text):
        args = lua_source.call_arguments(text, match.end() - 1)
        index, default, per_hit = DAMAGE_HELPERS[match[1]]
        values = shadow_values(text, match.start(), args[index], default) if args and len(args) > index else {default}
        if None in values:
            unknown.append('Part of the shadow handling is selected dynamically and is not established.')
        for value in sorted(values - {None}):
            rule = {'mode': 'ignore' if value == 0 else 'wipe' if value == 999 else 'absorb', 'per_hit': per_hit}
            if 0 < value < 999:
                rule['count'] = value
            if rule not in rules:
                rules.append(rule)
    if rules:
        for rule in rules:
            if rule['mode'] == 'ignore':
                notes.append('Utsusemi and Blink do not absorb the damage step.')
            elif rule['mode'] == 'wipe':
                notes.append('The damage step removes Utsusemi and Blink without letting them absorb it.')
            else:
                unit = 'per hit' if rule['per_hit'] else 'for the damage step'
                if rule.get('legacy'):
                    unit = 'before the effect'
                count = str(rule['count']) if 'count' in rule else '%d-%d' % (rule['count_min'], rule['count_max'])
                notes.append('Shadow check: %s image%s %s. Too few images do not fully block it.' %
                             (count, '' if count == '1' else 's', unit))
        if len(rules) > 1:
            notes.insert(0, 'Shadow behavior changes with script conditions; the following are possible rules.')
        if aoe and any(not rule.get('legacy') for rule in rules):
            notes.append('Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.')
        elif any(rule['mode'] == 'absorb' for rule in rules):
            notes.append('Blink absorption can fail.')
        if DIRECT_EFFECT.search(text) and any(not rule.get('legacy') for rule in rules):
            notes.append('The damage shadow rule does not establish whether every additional effect is blocked.')
    elif DIRECT_EFFECT.search(text) and not re.search(r'(?:shadow|Shadow|COPY_IMAGE|BLINK|xi\.weaponskills\.)', text):
        rules = [{'mode': 'ignore'}]
        notes.append('The effect application does not check Utsusemi or Blink.')
    else:
        unknown.append('Shadow handling is not established for this effect handler.')
    return {'rules': rules, 'notes': unique(notes), 'unknown': unique(unknown)}


REMOVALS = {
    'Poison': ['Poisona', 'Antidote', 'Remedy'],
    'Paralysis': ['Paralyna', 'Remedy'],
    'Blindness': ['Blindna', 'Eye Drops', 'Remedy'],
    'Silence': ['Silena', 'Echo Drops', 'Remedy'],
    'Petrification': ['Stona'],
    'Disease': ['Viruna', 'Remedy (can fail)'],
    'Plague': ['Viruna'],
    'Curse': ['Cursna', 'Holy Water'],
    'Doom': ['Cursna (can fail)', 'Holy Water (can fail)'],
}


def removal_options(labels, status_rows, panacea):
    result = []
    for label in sorted(set(labels)):
        options = list(REMOVALS.get(label, ()))
        matching = [row for name, row in status_rows.items() if danger_effects.effect_label(name.upper()) == label]
        if matching and all('erasable' in row.get('flags', ()) for row in matching):
            options.append('Erase (one random eligible timed ailment)')
        if label in panacea:
            options.append('Panacea')
        if options:
            result.append({'effect': label, 'options': options})
    return result


class Reader:
    def __init__(self, tree, loaded=None):
        self.tree = Path(tree)
        self.sources = danger_effects.Sources(tree, loaded)
        check_source(tree, self.sources.loaded)
        self.status_rows = overlays.load_merged(str(tree), overlays.data_roots(str(tree)), 'status_effects')['status_effects']
        panacea = lua_source.strip_comments((self.tree / 'scripts/items/flask_of_panacea.lua').read_text(encoding='utf8'))
        self.panacea = {danger_effects.effect_label(name) for name in re.findall(r'target:delStatusEffect\(xi\.effect\.(\w+)\)', panacea)}
        self.cache = {}

    def removals(self, effect_record, out):
        values = removal_options((effect_record or {}).get('effects', ()), self.status_rows, self.panacea)
        if not values:
            return
        out['removals'] = values
        groups = {}
        for value in values:
            groups.setdefault(tuple(value['options']), []).append(value['effect'])
        out['notes'].append('Reviewed removal options: ' + '; '.join(', '.join(labels) + ': ' + ', '.join(options)
                                                                    for options, labels in groups.items()) + '.')
        out['notes'].append('These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.')
        if any(value['effect'] == 'Paralysis' for value in values):
            out['notes'].append('Paralysis can interrupt Remedy before it cures you.')
        if any(value['effect'] == 'Doom' for value in values):
            out['notes'].append('Doom removal is a chance, not a guarantee.')
        if any(value['effect'] == 'Plague' for value in values):
            out['notes'].append('Viruna removes Disease first if both Disease and Plague are present.')
        if any(value['effect'] == 'Curse' for value in values):
            out['notes'].append('Cursna and Holy Water handle a successful Doom removal before Curse when both are present.')

    def skill(self, row, effect_record=None):
        key = ('skill', row.get('mob_skill_id'), row.get('mob_skill_name'), bool(row.get('forced')))
        if key in self.cache:
            return self.cache[key]
        out = geometry(row)
        text, reasons = self.sources.move(row['mob_skill_name'])
        shadow = shadows(text, row.get('mob_skill_aoe') in (1, 2, 4, 8)) if text else {'rules': [], 'notes': [], 'unknown': []}
        out['shadows'] = shadow['rules']
        out['notes'].extend(shadow['notes'])
        out['unknown'].extend(reasons + shadow['unknown'])
        self.removals(effect_record, out)
        out['notes'] = unique(out['notes'] + out['unknown'])
        out['unknown'] = unique(out['unknown'])
        self.cache[key] = out
        return out

    def spell(self, row, effect_record=None):
        key = ('spell', row.get('spellid'), bool(row.get('targeting_scripted')), bool(row.get('forced')))
        if key in self.cache:
            return self.cache[key]
        out = geometry(row, spell=True)
        text, reasons = self.sources.spell(row['name'])
        paths = self.sources.spell_paths.get(row['name'], ())
        checks = ''
        if len(paths) == 1:
            rel = paths[0]
            prefix = 'xi.actions.spells.' + rel[len('scripts/actions/spells/'):-4].replace('/', '.') + '.'
            checks, _ = self.sources.read(rel, prefix, 'onMagicCastingCheck')
        if SCRIPTED_GEOMETRY.search(checks + text):
            out = geometry(dict(row, targeting_scripted=True), spell=True)
        aoe = out.get('shape') not in ('single target', None)
        if not out.get('shape'):
            out['shadows'] = []
            out['unknown'].append('Shadow handling also depends on the unresolved targeting.')
        elif aoe:
            out['shadows'] = [{'mode': 'wipe'}]
            out['notes'].append('The area spell removes Utsusemi and Blink before its effect check.')
        elif re.search(r':setFlag\(\s*xi\.magic\.spellFlag\.IGNORE_SHADOWS\s*\)', checks) or row['name'] == 'meteor_ii':
            out['shadows'] = [{'mode': 'ignore'}]
            out['notes'].append('The spell ignores Utsusemi and Blink.')
        elif ':setFlag' in checks:
            out['shadows'] = []
            out['unknown'].append('The spell sets a shadow flag whose final value is not established.')
        elif row.get('group') == 3:
            if 'xi.spells.blue.usePhysicalSpell' in text:
                shadow = shadows(text)
                out['shadows'] = shadow['rules']
                out['notes'].extend(shadow['notes'])
                out['unknown'].extend(shadow['unknown'])
            elif any(name in text for name in ('xi.spells.blue.useEnfeeblingSpell', 'xi.spells.blue.useMagicalSpell', 'xi.spells.blue.useBreathSpell', 'xi.spells.blue.useDrainSpell')):
                out['shadows'] = [{'mode': 'ignore'}]
                out['notes'].append('This Blue Magic effect bypasses Utsusemi and Blink.')
            else:
                shadow = shadows(text)
                out['shadows'] = shadow['rules']
                out['notes'].extend(shadow['notes'])
                out['unknown'].extend(shadow['unknown'])
        else:
            out['shadows'] = [{'mode': 'absorb', 'count': 1, 'per_hit': False}]
            out['notes'].append('One Utsusemi image can absorb the spell. Blink absorption can fail.')
        out['unknown'].extend(reasons)
        self.removals(effect_record, out)
        out['notes'] = unique(out['notes'] + out['unknown'])
        out['unknown'] = unique(out['unknown'])
        self.cache[key] = out
        return out

    read_skill = skill
    read_spell = spell
