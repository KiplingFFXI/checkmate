"""Critical-hit paths in effective monster move handlers."""
from collections import Counter
import hashlib
from pathlib import Path
import re

from . import aggro, lua_source, overlays

HELPERS = {
    'xi.mobskills.mobPhysicalMove': ('canCrit', 4, True),
    'xi.mobskills.mobRangedMove': ('canCrit', 4, False),
}
CRITICAL_STATUSES = ('MIGHTY_STRIKES', 'AZURE_LORE', 'EFFLUX', 'CHAIN_AFFINITY', 'SNEAK_ATTACK')
GUARDS = {
    'scripts/globals/mobskills.lua': '4143e78653e6fd944978f6d4ad3c21e8c30342d7eb830e9a8282e8a617d74397',
    'scripts/combat/physical_utilities.lua': '64f08a4dc892fd0f03a133ea1bb1028f0a024a50061a7caf9f57b1d67fb3148e',
    'scripts/globals/bluemagic.lua': '26c2132d9a8ba81f122896b68218cad92853103951bec0827875ae083f114aff',
    'src/map/ai/controllers/mob_controller.cpp': 'cf0d9154b618fa2ef78c80c7100e551fdc9c7a8f7c91cf290aa23eceadc7aa7d',
}
MODULE_GUARD = 'e1de87174551cd5c1e3fcb83882632925a261eedaf578614e78b592121f830fb'
CALL = re.compile(r'\b(' + '|'.join(re.escape(name) for name in HELPERS) + r')\s*\(')
SHARED_CHANGE = re.compile(r'xi\.mobskills\.(?:mobPhysicalMove|mobRangedMove|handleSinglePhysicalHit|handleSingleRangedHit)|'
                           r'xi\.combat\.physical\.(?:calculateSwingCriticalRate|calculateRangedCriticalRate)|xi\.spells\.blue\.')


def digest(text):
    return hashlib.sha256(' '.join(lua_source.strip_comments(text).split()).encode()).hexdigest()


def code(text):
    """Keep positions while removing comments and quoted text from call searches."""
    text = lua_source.strip_comments(text)
    text = re.sub(r'\[(=*)\[.*?\]\1\]', lambda match: re.sub(r'[^\n]', ' ', match[0]), text, flags=re.S)
    return re.sub(r"(['\"])(?:\\.|(?!\1)[^\\\n])*?\1", lambda match: ' ' * len(match[0]), text)


def module_digest(tree, loaded):
    parts = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in loaded:
        text = (Path(tree) / rel).read_text(encoding='utf8')
        if SHARED_CHANGE.search(lua_source.strip_comments(text)):
            parts.append(rel + '\n' + digest(text))
    return digest('\n'.join(parts))


def check_source(tree, loaded=None):
    loaded = aggro.lua_files_loaded(str(tree)) if loaded is None else loaded
    for rel, expected in GUARDS.items():
        path = Path(tree) / rel
        if not path.is_file() or digest(path.read_text(encoding='utf8')) != expected:
            raise RuntimeError('%s changed; review critical-move helper semantics' % rel)
    if module_digest(tree, loaded) != MODULE_GUARD:
        raise RuntimeError('Loaded critical-move helper overrides changed; review their semantics')


def boolean(expression):
    value = expression.strip().rstrip(',;')
    if value in ('nil', 'false'):
        return False
    if value == 'true' or re.fullmatch(r'-?\d+(?:\.\d+)?', value):
        return True
    return None


def parameter_values(text, end, parameter, field):
    """Possible values at this call; top-level assignments replace earlier values."""
    if parameter == 'nil':
        return {None}
    if parameter.startswith('{'):
        found = re.search(r'\b' + re.escape(field) + r'\s*=\s*([^,}\n]+)', parameter)
        return {boolean(found[1])} if found else {False}
    if not re.fullmatch(r'\w+', parameter):
        return {None}
    # Sources keeps each reachable function with its own declaration and closing end.
    starts = list(re.finditer(r'^( *)(?:local function\b|(?:(?:local )?[\w.]+\s*=\s*)?function\b)', text[:end], re.M))
    start = starts[-1].start() if starts else 0
    base_indent = len(starts[-1][1]) + 4 if starts else 0
    body = text[start:end]
    values = {None}
    pattern = re.compile(r'\b' + re.escape(parameter) + r'(?:\.' + re.escape(field) + r')?\s*=(?!=)')
    for match in pattern.finditer(body):
        line_start = body.rfind('\n', 0, match.start()) + 1
        prefix = body[line_start:match.start()]
        indent = len(prefix) - len(prefix.lstrip())
        top = indent <= base_indent and re.fullmatch(r'\s*(?:local\s+)?', prefix) is not None
        rest = body[match.end():]
        is_field = '.' in match[0]
        if not is_field:
            stripped = rest.lstrip()
            if stripped.startswith('{'):
                table = lua_source.block(stripped, 0, 'critical parameter table')
                found = re.search(r'\b' + re.escape(field) + r'\s*=\s*([^,}\n]+)', table)
                value = boolean(found[1]) if found else False
            else:
                value = None
        else:
            expression = rest.split('\n', 1)[0].split(';', 1)[0]
            expression = re.split(r'\s+(?:end|else)\b', expression, maxsplit=1)[0]
            value = boolean(expression)
        values = {value} if top else values | {value}
    return values


def grants_statuses(text):
    """Grants to the acting monster, not checks for buffs or grants to its target."""
    text = code(text)
    grants = set()
    for match in re.finditer(r'xi\.mobskills\.mobBuffMove\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if args and len(args) > 1 and args[0] in ('mob', 'mobArg', 'actor'):
            match = re.fullmatch(r'xi\.effect\.(\w+)', args[1])
            if match and match[1] in CRITICAL_STATUSES:
                grants.add(match[1])
    grants.update(name for name in re.findall(r'\b(?:mob|mobArg|actor)\s*:\s*addStatusEffect(?:Ex)?\s*\(\s*xi\.effect\.(\w+)\b', text)
                  if name in CRITICAL_STATUSES)
    return sorted(grants)


def grants_mighty_strikes(text):
    return 'MIGHTY_STRIKES' in grants_statuses(text)


def blocked_statuses(text):
    """A direct rejection while the acting monster has one of these buffs."""
    found = set()
    text = code(text)
    for match in re.finditer(r'\bif\s+((?:(?!\bthen\b).)*?)\bthen\s+return\s+[1-9]\d*\b', text, re.S):
        condition = match[1]
        # An AND clause can have another requirement, so it is not a blanket rejection.
        if re.search(r'\band\b', condition):
            continue
        for status in CRITICAL_STATUSES:
            call = r'\b(?:mob|mobArg|actor):hasStatusEffect\(\s*xi\.effect\.' + status + r'\s*\)'
            if re.search(call, condition) and not re.search(r'\bnot\s+' + call, condition):
                found.add(status)
    return sorted(found)


def critical_facts(text):
    text = code(text)
    out = dict(can_crit=False, mighty_strikes=False, grants_mighty_strikes=grants_mighty_strikes(text),
               grants_statuses=grants_statuses(text), labels=[], notes=[], mighty_notes=[], unknown=[])
    conditional = False
    for match in CALL.finditer(text):
        field, position, mighty = HELPERS[match[1]]
        args = lua_source.call_arguments(text, match.end() - 1)
        if not args or len(args) != 5:
            out['unknown'].append('A physical move uses an unreadable helper signature.')
            continue
        values = parameter_values(text, match.start(), args[position], field)
        out['mighty_strikes'] |= mighty
        if True in values:
            out['can_crit'] = True
            conditional |= values != {True}
        if None in values:
            out['unknown'].append('Critical-hit enablement depends on a script value that could not be resolved.')
    if 'CRIT_VARIES' in text:
        out['unknown'].append('A legacy critical-TP argument is not supported by the current source helpers.')
    if out['can_crit']:
        out['labels'].append('Can crit conditionally' if conditional else 'Can crit')
        out['notes'].append('This move can crit' +
                            (' under script conditions.' if conditional else '.') +
                            ' Its current critical chance is not known.')
    if out['mighty_strikes']:
        out['mighty_notes'].append('Requires Mighty Strikes to be active, with the move still usable.')
    out['unknown'] = list(dict.fromkeys(out['unknown']))
    return out


def spell_facts(text):
    """Physical Blue spells need a buff route; a parameter table alone is not enough."""
    text = code(text)
    out = dict(can_crit=False, mighty_strikes=False, required_statuses=[], sneak_attack=False,
               labels=[], notes=[], unknown=[])
    calls = list(re.finditer(r'xi\.spells\.blue\.usePhysicalSpell\s*\(', text))
    if not calls:
        return out
    out['required_statuses'] = ['AZURE_LORE', 'EFFLUX', 'CHAIN_AFFINITY']
    out['notes'].append('Can crit with Azure Lore, Efflux or Chain Affinity. Its current critical chance is not known.')
    for match in calls:
        args = lua_source.call_arguments(text, match.end() - 1)
        if not args or len(args) != 4 or not re.fullmatch(r'\w+', args[3]):
            out['unknown'].append('A physical Blue spell uses unreadable parameters.')
            continue
        values = re.findall(r'\b' + re.escape(args[3]) + r'\.attackType\s*=\s*([^\n]+)', text[:match.start()])
        values = {value.strip().rstrip(',;') for value in values}
        if not values or values <= {'xi.attackType.PHYSICAL', 'xi.attackType.NONE'}:
            out['sneak_attack'] = True
        elif values != {'xi.attackType.RANGED'}:
            out['unknown'].append('A physical Blue spell changes its attack type in an unreadable way.')
    if out['sneak_attack']:
        out['notes'].append('Sneak Attack requires a single target and the caster to be behind it or have Hide.')
    return out


class Reader:
    def __init__(self, tree, loaded=None):
        from .danger_effects import Sources
        self.tree = Path(tree)
        self.loaded = list(loaded) if loaded is not None else aggro.lua_files_loaded(str(tree))
        check_source(tree, self.loaded)
        self.sources = Sources(tree, self.loaded)
        self.cache, self.spell_cache = {}, {}

    def read(self, name):
        if name not in self.cache:
            text, unknown = self.sources.move(name)
            out = critical_facts(text)
            if out['unknown']:
                raise RuntimeError(name + ': review critical-move parameters: ' + '; '.join(out['unknown']))
            out['unknown'] = list(dict.fromkeys(unknown + out['unknown']))
            check, _ = self.sources.read('scripts/actions/mobskills/' + name + '.lua',
                                        'xi.actions.mobskills.' + name + '.', 'onMobSkillCheck')
            out['blocked_statuses'] = blocked_statuses(check)
            self.cache[name] = out
        return self.cache[name]

    def spell(self, name):
        if name not in self.spell_cache:
            text, unknown = self.sources.spell(name)
            out = spell_facts(text)
            if out['unknown']:
                raise RuntimeError(name + ': review critical-spell parameters: ' + '; '.join(out['unknown']))
            out['unknown'] = list(dict.fromkeys(unknown + out['unknown']))
            self.spell_cache[name] = out
        return self.spell_cache[name]

    def census(self):
        rows = {path.stem: self.read(path.stem) for path in sorted((self.tree / 'scripts/actions/mobskills').glob('*.lua'))}
        counts = Counter()
        for value in rows.values():
            counts['files'] += 1
            for key in ('can_crit', 'mighty_strikes', 'grants_mighty_strikes'):
                counts[key] += bool(value[key])
            counts['unresolved'] += bool(value['unknown'])
        return dict(counts), rows
