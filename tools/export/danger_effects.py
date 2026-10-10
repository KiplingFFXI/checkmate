"""Harmful effects from the effective move and spell handlers."""
from collections import defaultdict
import hashlib
from pathlib import Path
import re

from . import aggro, effects as effect_source, lua_source, overlays, tables

HARMFUL = set('''KO WEAKNESS SLEEP_I SLEEP_II LULLABY POISON PARALYSIS BLINDNESS SILENCE
PETRIFICATION DISEASE CURSE_I CURSE_II BIND WEIGHT SLOW STUN CHARM_I CHARM_II DOOM BANE
AMNESIA TERROR MUTE PLAGUE ADDLE DIA BIO BURN FROST CHOKE RASP SHOCK DROWN HELIX KAUSTRA
STR_DOWN DEX_DOWN VIT_DOWN AGI_DOWN INT_DOWN MND_DOWN CHR_DOWN ACCURACY_DOWN ATTACK_DOWN
EVASION_DOWN DEFENSE_DOWN MAGIC_ACC_DOWN MAGIC_ATK_DOWN MAGIC_EVASION_DOWN MAGIC_DEF_DOWN
MAX_HP_DOWN MAX_MP_DOWN MAX_TP_DOWN CRIT_HIT_EVASION_DOWN ELEMENTALRES_DOWN ELEGY REQUIEM
THRENODY FLASH ENCUMBRANCE_I ENCUMBRANCE_II INHIBIT_TP NINJUTSU_ELE_DEBUFF'''.split())
LABELS = {'KO': 'Instant KO', 'SLEEP_I': 'Sleep', 'SLEEP_II': 'Sleep', 'LULLABY': 'Sleep',
          'CHARM_I': 'Charm', 'CHARM_II': 'Charm', 'CURSE_I': 'Curse', 'CURSE_II': 'Curse',
          'BANE': 'Curse', 'WEIGHT': 'Weight', 'MAGIC_ACC_DOWN': 'Magic accuracy down',
          'MAGIC_ATK_DOWN': 'Magic attack down', 'MAGIC_DEF_DOWN': 'Magic defense down',
          'ELEMENTALRES_DOWN': 'Elemental resistance down', 'CRIT_HIT_EVASION_DOWN': 'Critical evasion down',
          'ENCUMBRANCE_I': 'Equipment restriction', 'ENCUMBRANCE_II': 'Equipment restriction'}
BENEFICIAL = set('''NONE COSTUME AGI_BOOST CHR_BOOST DEX_BOOST INT_BOOST MND_BOOST STR_BOOST
VIT_BOOST ATTACK_BOOST DEFENSE_BOOST MAGIC_ATK_BOOST MAGIC_DEF_BOOST ELEMENTAL_SEAL
NEGATE_SLEEP PROTECT SHELL REGEN SUPER_BUFF STONESKIN WARCRY BERSERK EVASION_BOOST ENDARK
ENLIGHT KLIMAFORM HASTE REFRESH BLINK SHOCK_SPIKES ICE_SPIKES ACCURACY_BOOST RERAISE'''.split())


def effect_label(name):
    if name in LABELS:
        return LABELS[name]
    text = name.replace('_', ' ').capitalize()
    for term in ('hp', 'mp', 'tp', 'str', 'dex', 'vit', 'agi', 'int', 'mnd', 'chr'):
        text = re.sub(r'\b' + term + r'\b', term.upper(), text, flags=re.I)
    return text


def clean(path):
    return lua_source.strip_comments(Path(path).read_text(encoding='utf8'))


def unique(values):
    return list(dict.fromkeys(values))


def function_parts(text):
    pattern = re.compile(r'^(?P<pad> *)(?:local function (?P<local>\w+)\s*\(|'
                         r'(?:local )?(?P<name>[\w.]+)\s*=\s*function\s*\()(?P<args>[^)]*)\)', re.M)
    out = {}
    for match in pattern.finditer(text):
        end = re.search(r'^' + re.escape(match['pad']) + r'end\b[^\n]*', text[match.end():], re.M)
        if end:
            out[match['local'] or match['name']] = text[match.start():match.end() + end.end()]
    return out


def overrides(text):
    pattern = re.compile(r"^(?P<pad> *)\w+:addOverride\(\s*['\"](?P<target>xi\.[^'\"]+)['\"],\s*function\((?P<args>[^)]*)\)", re.M)
    for match in pattern.finditer(text):
        end = re.search(r'^' + re.escape(match['pad']) + r'end\)', text[match.end():], re.M)
        if end:
            body = text[match.end():match.end() + end.start()]
            body = re.sub(r'^' + re.escape(match['pad']), '', body, flags=re.M)
            yield match['target'], match['args'], body


class Sources:
    """Loaded callbacks and the local helpers they call."""
    def __init__(self, tree, loaded=None):
        self.tree = Path(tree)
        self.loaded = list(loaded) if loaded is not None else aggro.lua_files_loaded(str(tree))
        self.overrides = defaultdict(list)
        self.cache = {}
        self.spell_paths = defaultdict(list)
        for path in (self.tree / 'scripts/actions/spells').rglob('*.lua'):
            self.spell_paths[path.stem].append(path.relative_to(self.tree).as_posix())
        for rel in self.loaded:
            for name, args, body in overrides(clean(self.tree / rel)):
                self.overrides[name].append((args, body))

    def move(self, name):
        return self.read('scripts/actions/mobskills/' + name + '.lua',
                         'xi.actions.mobskills.' + name + '.', 'onMobWeaponSkill')

    def spell(self, name):
        paths = self.spell_paths.get(name, ())
        if len(paths) != 1:
            return '', ['The spell effect handler is missing or ambiguous.']
        rel = paths[0]
        prefix = 'xi.actions.spells.' + rel[len('scripts/actions/spells/'): -4].replace('/', '.') + '.'
        return self.read(rel, prefix, 'onSpellCast')

    def read(self, rel, prefix, callback, trail=()):
        key = rel, prefix, callback
        if key in self.cache:
            return self.cache[key]
        if key in trail:
            return '', ['A move helper calls itself recursively.']
        path = self.tree / rel
        if not path.is_file():
            return '', ['The effect handler is missing from the source.']
        text = clean(path)
        functions = function_parts(text)
        roots = [name for name in functions if name.endswith('.' + callback)]
        if len(roots) > 1:
            return '', ['The effect callback has multiple definitions.']
        root = roots[0] if roots else 'handler.' + callback
        # Keep local tables and constants, not unused handler bodies.
        declarations = text
        for body in functions.values():
            declarations = declarations.replace(body, '')
        for index, (args, body) in enumerate(self.overrides.get(prefix + callback, ())):
            if re.search(r'\bsuper\s*\(', body) and root in functions:
                previous = 'previous_' + str(index)
                functions[previous] = functions[root].replace(root, previous, 1)
                body = re.sub(r'\bsuper\s*\(', previous + '(', body)
            functions[root] = root + ' = function(' + args + ')\n' + body + '\nend'
        if root not in functions:
            return '', ['The effect callback is not implemented.']
        bodies, reasons, seen, pending = [], [], set(), [root]
        while pending:
            name = pending.pop()
            if name in seen:
                continue
            seen.add(name)
            body = functions[name]
            bodies.append(body)
            for other in functions:
                if other not in seen and re.search(r'(?<![\w.])' + re.escape(other) + r'\s*\(', body):
                    pending.append(other)
            forward = r'xi\.actions\.(mobskills|weaponskills)(?:\.([\w-]+)|\[([^]]+)\])\.(onMobWeaponSkill|onUseWeaponSkill)\s*\('
            for match in re.finditer(forward, body):
                target = match[2]
                if target is None:
                    expression = match[3].strip()
                    literal = re.fullmatch(r"['\"]([^'\"]+)['\"]", expression)
                    values = re.findall(r'\blocal\s+' + re.escape(expression) + r"\s*=\s*['\"]([^'\"]+)['\"]", text)
                    target = literal[1] if literal else values[0] if len(set(values)) == 1 else None
                if target is None:
                    reasons.append('A forwarded move effect is selected dynamically.')
                    continue
                other_rel = 'scripts/actions/' + match[1] + '/' + target + '.lua'
                extra, unknown = self.read(other_rel, 'xi.actions.' + match[1] + '.' + target + '.',
                                           match[4], trail + (key,))
                bodies.append(extra)
                reasons.extend(unknown)
        result = declarations + '\n' + '\n'.join(bodies), unique(reasons)
        self.cache[key] = result
        return result


class Values:
    """Possible enum values from literal locals, tables, loops and random choices."""
    def __init__(self, text, ids):
        self.text, self.ids = text, ids
        self.names = {number: name for name, number in ids.items()}
        self.assignments = defaultdict(list)
        for match in re.finditer(r'(?m)^\s*(?:local\s+)?([\w.]+)\s*=\s*([^\n]+)', text):
            expression = match[2].strip().rstrip(',;')
            if expression.startswith('{'):
                expression = '{' + lua_source.block(text, match.start(), 'effect table') + '}'
            self.assignments[match[1]].append(expression)
        # Multiline table declarations put the opening brace on the next line.
        for match in re.finditer(r'\b(?:local\s+)?(\w+)\s*=\s*\n\s*\{', text):
            self.assignments[match[1]].append('{' + lua_source.block(text, match.start(), 'effect table') + '}')
        for match in re.finditer(r'for\s+\w+\s*,\s*(\w+)\s+in\s+[ip]*pairs\((\w+)\)', text):
            self.assignments[match[1]].append(match[2])
        for match in re.finditer(r'for\s+(\w+)\s*=\s*(xi\.effect\.\w+)\s*,\s*(xi\.effect\.\w+)\s+do', text):
            self.assignments[match[1]].append('math.randomInt(' + match[2] + ',' + match[3] + ')')
        for match in re.finditer(r'table\.insert\(\s*(\w+)\s*,\s*([^\n)]+)\)', text):
            self.assignments[match[1]].append(match[2])

    def resolve(self, expression, trail=()):
        expression = expression.strip().rstrip(',;')
        if expression in trail:
            return set(), False
        trail += (expression,)
        if re.fullmatch(r'xi\.effect\.\w+', expression):
            name = expression.rsplit('.', 1)[1]
            return ({name}, False) if name in self.ids else (set(), True)
        if re.fullmatch(r'\d+', expression):
            return ({self.names[int(expression)]}, False) if int(expression) in self.names else (set(), True)
        if expression.startswith('{'):
            names = set(re.findall(r'xi\.effect\.(\w+)', expression))
            return names, bool(names - self.ids.keys())
        random = re.fullmatch(r'math\.(?:random|randomInt)\(\s*(xi\.effect\.\w+|\d+)\s*,\s*(xi\.effect\.\w+|\d+)\s*\)', expression)
        addition = re.fullmatch(r'(xi\.effect\.\w+)\s*\+\s*math\.(?:random|randomInt)\(\s*(\d+)\s*,\s*(\d+)\s*\)', expression)
        if random or addition:
            def number(value):
                return int(value) if value.isdigit() else self.ids.get(value.rsplit('.', 1)[1])
            low, high = (number(random[1]), number(random[2])) if random else (number(addition[1]), number(addition[1]))
            if addition and low is not None:
                low, high = low + int(addition[2]), high + int(addition[3])
            if low is None or high is None or high < low or high - low > 100:
                return set(), True
            return {self.names[n] for n in range(low, high + 1) if n in self.names}, any(n not in self.names for n in range(low, high + 1))
        wrapper = re.fullmatch(r'utils\.(?:shuffle|randomEntry)\(\s*(\w+)\s*\)', expression)
        if wrapper:
            return self.resolve(wrapper[1], trail)
        indexed = re.fullmatch(r'(\w+)\[[^]]+\](?:\.\w+)?', expression)
        field = re.fullmatch(r'(\w+)\.\w+', expression)
        if (indexed or field) and expression not in self.assignments:
            expression = (indexed or field)[1]
        fetch = re.fullmatch(r'(?:mob|target):getStatusEffect\((.+)\)', expression)
        if fetch:
            return self.resolve(fetch[1], trail)
        if expression in self.assignments:
            values, unknown = set(), False
            for value in self.assignments[expression]:
                found, missing = self.resolve(value, trail)
                values.update(found)
                unknown |= missing
            return values, unknown
        return set(), True


CALL = re.compile(r'(?P<name>xi\.[\w.]+|\w+:[A-Za-z_]\w*)\s*\(')
STATUS_HELPERS = {'xi.mobskills.mobStatusEffectMove': (1, 2), 'xi.mobskills.mobGazeMove': (1, 2),
                  'xi.mobskills.mobDrainAttribute': (1, 2), 'xi.mobskills.mobBuffMove': (0, 1)}


def analyze(text, ids, script_name='', hostile=True):
    values = Values(text, ids)
    effects, notes, unknown = set(), set(), set()
    applied = []
    def status(expression, recipient, detail='', payload=''):
        if recipient in {'mob', 'caster', 'player', 'pet'} or not hostile:
            return
        if recipient != 'target':
            unknown.add('A status recipient is selected dynamically.')
            return
        found, missing = values.resolve(expression)
        if missing:
            unknown.add('Some applied status effects are selected dynamically.')
        for name in found:
            applied.append(name)
            if name == 'NINJUTSU_ELE_DEBUFF':
                element = re.search(r'subPower\s*=\s*xi\.mod\.(FIRE|ICE|WIND|EARTH|THUNDER|WATER|LIGHT|DARK)_MEVA', payload)
                effects.add((element[1].capitalize() if element else 'Elemental') + ' magic evasion down')
            elif name in HARMFUL:
                effects.add(effect_label(name))
            elif name == 'FOOD' and script_name == 'saucepan':
                effects.add('Harmful food')
                notes.add('Replaces existing food with a meal that lowers all seven attributes.')
            elif name == 'TELEPORT' and script_name == 'substitute':
                effects.add('Forced Escape')
                notes.add('The forced Escape requires a living player and more than one party member in the same zone.')
            elif name not in BENEFICIAL:
                unknown.add('An applied status effect has not been classified as harmful or beneficial.')
        if detail and found & HARMFUL:
            notes.add(detail)
    for match in CALL.finditer(text):
        name = match['name']
        args = lua_source.call_arguments(text, match.end() - 1)
        if args is None:
            raise RuntimeError('Unbalanced effect call in ' + script_name)
        if name in STATUS_HELPERS and len(args) > STATUS_HELPERS[name][1]:
            recipient, effect = STATUS_HELPERS[name]
            status(args[effect], args[recipient], 'The gaze effect requires the target to face the monster.' if name.endswith('mobGazeMove') else '')
        elif name == 'xi.combat.action.executeMobskillStatusEffect' and len(args) >= 4:
            status(args[3], args[1])
        elif name == 'xi.spells.blue.applyBlueAdditionalEffect' and len(args) >= 4:
            status(args[3], args[1])
        elif name == 'xi.spells.blue.useEnfeeblingSpell' and len(args) >= 4:
            status(args[3] + '.effect', args[1])
        elif name.endswith((':addStatusEffect', ':addStatusEffectEx')) and args:
            status(args[0], name.split(':')[0], payload=args[1] if len(args) > 1 else '')
        elif hostile and name in {'target:dispelStatusEffect', 'target:dispelAllStatusEffect'}:
            effects.add('Buff removal')
            notes.add('Only effects allowed by the move\'s dispel checks can be removed.')
        elif hostile and (name in {'mob:stealStatusEffect', 'caster:stealStatusEffect'} and args and args[0] == 'target' or name == 'xi.mobskills.mobDrainStatusEffectMove'):
            effects.add('Buff theft')
        elif hostile and name == 'mob:charm' and args and args[0] == 'target':
            effects.add('Charm')
        elif hostile and name == 'target:copyStatusEffect' and args:
            status(args[0], 'target')
            notes.add('Transferred ailments must already be present on the monster.')
        elif hostile and name in {'target:delStatusEffect', 'target:delStatusEffectSilent'} and args:
            found, missing = values.resolve(args[0])
            if 'xi.effectFlag.DISPELABLE' in text and missing:
                effects.add('Buff removal')
            elif found - HARMFUL - {'NONE'}:
                effects.add('Buff removal')
        elif hostile and name == 'target:setHP' and args and args[0] == '0':
            effects.add('Instant KO')
        elif hostile and name == 'xi.mobskills.mobDrainMove' and len(args) > 2:
            drain = re.fullmatch(r'xi\.mobskills\.drainType\.(HP|MP|TP)', args[2])
            if drain:
                effects.add(drain[1] + ' drain')
            elif re.fullmatch(r'\w+', args[2]) and any(re.fullmatch(r'math\.(?:random|randomInt)\(\s*xi\.mobskills\.drainType\.HP\s*,\s*xi\.mobskills\.drainType\.TP\s*\)', v)
                                                        for v in values.assignments.get(args[2], ())):
                effects.update({'HP drain', 'MP drain', 'TP drain'})
            else:
                unknown.add('The drained resource is selected dynamically.')
        elif hostile and name == 'xi.spells.blue.useDrainSpell':
            if len(args) < 6 or args[5] == 'false':
                effects.add('HP drain')
            elif args[5] == 'true':
                effects.add('MP drain')
            else:
                unknown.add('The drained resource is selected dynamically.')
        elif hostile and name.startswith('xi.') and re.search(r'(StatusEffect|mobGaze|mobDrain|Debuff)', name) and name not in STATUS_HELPERS:
            unknown.add('An additional effect helper is not resolved.')
    if re.search(r'target:setHP\(\s*0\s*\)', text):
        notes.discard('The gaze effect requires the target to face the monster.')
    if effects and ('math.random' in text or 'utils.random' in text or 'utils.shuffle' in text):
        notes.add('Random effects may not all happen on the same use.')
    return {'effects': sorted(effects), 'notes': sorted(notes), 'unknown': sorted(unknown)}, sorted(set(applied))


# Every source file in this census is watched, including helper and loaded-module changes.
SOURCE_GUARD = 'd8c9b93e8f7fb1dc8da321b9e177712e50be217a619a5d0150fb092d0b6b29bc'
SOURCE_FOLDERS = ('scripts/actions/mobskills', 'scripts/actions/spells', 'scripts/actions/weaponskills',
                  'scripts/globals/spells', 'scripts/combat')
SOURCE_FILES = ('scripts/globals/mobskills.lua', 'scripts/globals/bluemagic.lua', 'scripts/globals/weaponskills.lua',
                'scripts/effects/bane.lua', 'scripts/effects/food.lua', 'scripts/effects/teleport.lua',
                'scripts/effects/ninjutsu_ele_debuff.lua', 'scripts/enum/target_type.lua')


def source_digest(tree, loaded=None):
    tree = Path(tree)
    loaded = list(loaded) if loaded is not None else aggro.lua_files_loaded(str(tree))
    paths = set(SOURCE_FILES) | set(loaded)
    for folder in SOURCE_FOLDERS:
        paths.update(path.relative_to(tree).as_posix() for path in (tree / folder).rglob('*.lua'))
    roots = overlays.data_roots(str(tree))
    for root in roots:
        rel = Path(root) / 'status_effects.yaml'
        if rel.is_file():
            paths.add(rel.relative_to(tree).as_posix())
    parts = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in sorted(paths):
        path = tree / rel
        if not path.is_file():
            raise RuntimeError('Danger effects source is missing ' + rel)
        parts.append(rel + '\n' + ' '.join(clean(path).split()))
    return hashlib.sha256('\n'.join(parts).encode()).hexdigest(), len(paths)


def check_source(tree, loaded=None):
    actual, count = source_digest(tree, loaded)
    if actual != SOURCE_GUARD:
        raise RuntimeError('Danger effect sources changed; review the complete harmful-effect census before exporting.')
    return count


def spell_effects(tree, ids):
    """Table-driven shared spell helpers, separate from each spell's own handler."""
    spell_ids = tables.lua_enum(str(Path(tree) / 'scripts/enum/magic.lua'), 'xi.magic.spell')
    found = {}
    for file, table in [('enfeebling_spell', 'pTable'), ('enfeebling_song', 'pTable')]:
        rel = 'scripts/globals/spells/' + file + '.lua'
        for name, cells in effect_source.table_rows(clean(Path(tree) / rel), table, rel):
            effect = cells[0].removeprefix('xi.effect.')
            if effect not in ids:
                raise RuntimeError('Unrecognized spell status in ' + rel)
            found[spell_ids[name]] = [effect_label(effect)] if effect in HARMFUL else ['Buff removal'] if effect == 'NONE' else []
    absorb = clean(Path(tree) / 'scripts/globals/spells/absorb_spell.lua')
    for match in re.finditer(r'\[xi\.magic\.spell\.(\w+)\]\s*=\s*\{[^{}]*downEffect\s*=\s*xi\.effect\.(\w+)', absorb):
        found[spell_ids[match[1]]] = [effect_label(match[2])]
    for match in re.finditer(r'\[xi\.magic\.spell\.(\w+)\s*\]\s*=\s*\{\s*xi\.mod\.(HP|MP)', absorb):
        found[spell_ids[match[1]]] = [match[2] + ' drain']
    found[spell_ids['ABSORB_TP']] = ['TP drain']
    found[spell_ids['ABSORB_ATTRI']] = ['Buff theft']
    return found


def build(tree, skill_rows, spell_rows, loaded=None):
    sources = Sources(tree, loaded)
    watched = check_source(tree, sources.loaded)
    status_rows = overlays.load_merged(tree, overlays.data_roots(tree), 'status_effects')['status_effects']
    ids = {name.upper(): row['id'] for name, row in status_rows.items()}
    shared_spells = spell_effects(tree, ids)
    scripts, skills, spells = {}, {}, {}
    # Run every source script through the same reader, including scripts with no current SQL row.
    for path in sorted((Path(tree) / 'scripts/actions/mobskills').glob('*.lua')):
        text, reasons = sources.move(path.stem)
        record, names = analyze(text, ids, path.stem)
        record['unknown'] = unique(record['unknown'] + reasons)
        scripts[path.stem] = record
    rows = skill_rows.values() if isinstance(skill_rows, dict) else skill_rows
    for row in rows:
        name = row['mob_skill_name']
        # Any-allegiance moves can affect enemies too; self/allied buffs stay out.
        hostile = bool(row.get('mob_valid_targets', 4) & (4 | 2048))
        if not hostile:
            continue
        record = scripts.get(name)
        if record is None:
            record = {'effects': [], 'notes': [], 'unknown': ['The effect handler is missing from the source.']}
        if row.get('mob_valid_targets', 4) & 2048:
            record = dict(record, notes=unique(record['notes'] + ["Effects depend on the target's allegiance and the move's targeting rules."]))
        if record['effects'] or record['unknown']:
            skills[row['mob_skill_id']] = record
    rows = spell_rows.values() if isinstance(spell_rows, dict) else spell_rows
    spell_unknown = {}
    for row in rows:
        if not row.get('validTargets', 4) & 4:
            continue
        name, number = row['name'], row['spellid']
        text, reasons = sources.spell(name)
        record, _ = analyze(text, ids, name)
        if any(helper in text for helper in ('xi.spells.enfeebling.useEnfeebling', 'xi.spells.absorb.doAbsorb', 'xi.spells.absorb.doDraining')):
            if number in shared_spells:
                record['effects'] = sorted(set(record['effects']) | set(shared_spells[number]))
            else:
                record['unknown'].append('The shared spell effect mapping is unresolved.')
        record['unknown'] = unique(record['unknown'] + reasons)
        if record['unknown']:
            spell_unknown[name] = record['unknown']
        if record['effects'] or record['unknown']:
            spells[number] = record
    unresolved = {name: row['unknown'] for name, row in scripts.items() if row['unknown']}
    coverage = {'scripts': len(scripts), 'harmful_scripts': sum(bool(row['effects']) for row in scripts.values()),
                'skill_records': len(skills), 'harmful_skill_records': sum(bool(row['effects']) for row in skills.values()),
                'spell_records': len(spells), 'harmful_spell_records': sum(bool(row['effects']) for row in spells.values()),
                'unresolved_scripts': unresolved, 'unresolved_spells': spell_unknown,
                'unresolved_skills': {number: row['unknown'] for number, row in skills.items() if row['unknown']},
                'watched_files': watched, 'source_digest': SOURCE_GUARD,
                'by_script': scripts}
    return {'skills': skills, 'spells': spells, 'coverage': coverage}
