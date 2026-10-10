"""
Reads Phoenix Lua source for the monster calls checkmate cares about.

A handler body is the lines between `entity.onX = function(mob)` (or `xi.a.b = function(mob)`) at column 0 and
the next `end` at column 0. A call on the handler's own monster at four spaces of indent always runs. A call
nested deeper, or after a nested `return`, only runs sometimes.
"""
import re

# Mods whose value feeds a number in the data files, by their data/enums/mod.yaml name.
STAT_MODS = {'acc', 'eva', 'dex', 'agi', 'int', 'mnd', 'chr', 'eva_percent'}
DEFENSE_MODS = {'def', 'defp', 'vit', 'food_defp', 'food_def_cap'}
ELEMENTS = ['fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark']
STATUSES = ['paralyze', 'bind', 'silence', 'slow', 'poison', 'light_sleep', 'dark_sleep', 'blind', 'stun', 'gravity']
RESIST_EFFECTS = ['sleep', 'poison', 'paralyze', 'blind', 'silence', 'virus', 'petrify', 'bind', 'curse', 'gravity',
                  'slow', 'stun', 'charm', 'amnesia', 'lullaby', 'death', 'status']
MEVA_MODS = {'meva'} | {e + '_meva' for e in ELEMENTS} | {e + '_meva' for e in RESIST_EFFECTS}
RANK_MODS = {e + '_res_rank' for e in ELEMENTS + STATUSES}
RESIST_MODS = {e + 'res' for e in RESIST_EFFECTS}
LEVEL_MOD = 'exp_lvl_mod'
# The monster's own crit rate on you, for the Crit taken part, and the critical hit evasion that would lower your crit.
# The Crit part doesn't count that, so the export stops on it.
CRIT_RATE, CRIT_EVASION = 'crithitrate', 'critical_hit_evasion'
RELEVANT_MODS = STAT_MODS | MEVA_MODS | RANK_MODS | RESIST_MODS | {LEVEL_MOD, CRIT_RATE}

# Mods that change the damage magic does to a monster, for one element or for every element. Thunder's null and
# absorb mods are named ltng. A change to one of these during a fight gives the monster scripted_elements.
MOD_ELEMENTS = ['ltng' if element == 'thunder' else element for element in ELEMENTS]
MAGIC_DAMAGE_MODS = {'dmg', 'dmgmagic', 'dmgmagic_ii', 'udmgmagic', 'null_damage', 'null_magical_damage',
                     'absorb_dmg_chance', 'magic_absorb'}
ELEMENT_DAMAGE_MODS = (MAGIC_DAMAGE_MODS | {element + '_sdt' for element in ELEMENTS}
                       | {element + '_null' for element in MOD_ELEMENTS}
                       | {element + '_absorb' for element in MOD_ELEMENTS})

# Elements also reads elemental ranks and evasion, but not general MEVA or status-specific ranks.
ELEMENT_STAT_MODS = {element + suffix for element in ELEMENTS for suffix in ('_res_rank', '_meva')}
ELEMENT_READOUT_MODS = ELEMENT_DAMAGE_MODS | ELEMENT_STAT_MODS

WEAPON_TYPES = [('slashing', 'slash_sdt'), ('piercing', 'pierce_sdt'), ('blunt', 'impact_sdt'),
                ('hand_to_hand', 'hth_sdt')]
WEAPON_DAMAGE_MODS = {mod for _, mod in WEAPON_TYPES} | {
    'dmg', 'dmgphys', 'dmgphys_ii', 'udmgphys', 'dmgrange', 'udmgrange',
    'absorb_dmg_chance', 'phys_absorb', 'null_damage', 'null_physical_damage', 'null_ranged_damage',
}

# Stat ranks setStatRank can change that feed a number in the data files.
RELEVANT_STAT_RANKS = {'DEX', 'AGI', 'INT', 'MND', 'CHR', 'EVA', 'ACC'}

# Calls that change a monster's level, jobs or whole stat block after it spawns.
RESTAT_METHODS = {'setMobLevel', 'changeJob', 'setPetStats', 'recalculateStats'}

HANDLER_START = re.compile(r'^(entity\.\w+|xi\.[\w.]+|g_mixins\.[\w.]+)\s*=\s*function\s*\(([^)]*)\)')
FUNCTION_START = re.compile(r'^function\s+(xi\.[\w.]+)\s*\(([^)]*)\)')
METHOD_CALL = re.compile(r'(\w+|\))\s*:\s*(setMod|addMod|delMod|addImmunity|delImmunity|setMobMod|addMobMod|setStatRank|setSpellList|'
                         r'setMobLevel|changeJob|setPetStats|recalculateStats|addListener|setAggressive|'
                         r'setTrueDetection|setLink|setMobSkillAttack|setAutoAttackEnabled)\s*\(')
HELPER_CALL = re.compile(r'(?<![\w.:])(xi\.[\w.]+)\s*\(\s*(\w+)\s*[,)]')
MIXIN_REQUIRE = re.compile(r"require\('scripts/mixins/([\w/]+)'\)")
INTEGER = re.compile(r'^-?\d+$')
LONG_OPEN = re.compile(r'\[(=*)\[')

# Receivers that are players, never monsters.
PLAYER_RECEIVERS = {'player', 'target', 'killer', 'attacker', 'caster', 'playerArg', 'PChar', 'member'}

# Calls that switch one of a monster's aggro or link behaviors on or off, by the name the aggro reader uses.
SWITCH_METHODS = {'setAggressive': 'aggressive', 'setTrueDetection': 'true_detection', 'setLink': 'links'}

# Mob mods that decide whether a monster aggroes you and how it finds you.
AGGRO_MOB_MODS = {'always_aggro', 'no_aggro', 'detection'}

# Mob mods that decide who a monster links with.
LINK_MOB_MODS = {'superlink', 'sublink', 'no_link', 'one_way_linking'}

# The names above that are about aggro. The rest are about links.
AGGRO_NAMES = {'aggressive', 'true_detection'} | AGGRO_MOB_MODS

# Calls that change how a monster swings at you, which the crit reader reads. setMobSkillAttack gives it a list of TP
# moves to swing with in place of its normal hits, and 0 gives the normal hits back. setAutoAttackEnabled(false) stops
# its swings, and true gives them back.
SWING_METHODS = {'setMobSkillAttack', 'setAutoAttackEnabled'}


def strip_comments(text):
    """Blanks out Lua comments and keeps strings and line breaks where they are."""
    out = []
    i, n = 0, len(text)
    while i < n:
        ch = text[i]
        if ch in '\'"':
            j = i + 1
            while j < n and text[j] != ch and text[j] != '\n':
                j += 2 if text[j] == '\\' else 1
            out.append(text[i:j + 1])
            i = j + 1
        elif text.startswith('--', i):
            long = LONG_OPEN.match(text, i + 2)
            if long:
                close = ']' + long.group(1) + ']'
                j = text.find(close, i)
                j = n if j < 0 else j + len(close)
            else:
                j = text.find('\n', i)
                j = n if j < 0 else j
            out.append(re.sub(r'[^\n]', ' ', text[i:j]))
            i = j
        elif ch == '[' and LONG_OPEN.match(text, i):
            close = ']' + LONG_OPEN.match(text, i).group(1) + ']'
            j = text.find(close, i)
            j = n if j < 0 else j + len(close)
            out.append(text[i:j])
            i = j
        else:
            out.append(ch)
            i += 1
    return ''.join(out)


def call_arguments(line, start):
    """Splits the arguments of the call whose '(' is at start. Returns None when the call spans lines."""
    depth, args, current = 0, [], ''
    for ch in line[start:]:
        if ch in '([{':
            depth += 1
            if depth == 1:
                continue
        elif ch in ')]}':
            depth -= 1
            if depth == 0:
                args.append(current.strip())
                return args
        elif ch == ',' and depth == 1:
            args.append(current.strip())
            current = ''
            continue
        current += ch
    return None


def block(text, start, where):
    """The text inside the first brace after start, up to the brace that closes it."""
    first = text.index('{', start)
    depth = 0
    for index in range(first, len(text)):
        if text[index] == '{':
            depth += 1
        elif text[index] == '}':
            depth -= 1
            if depth == 0:
                return text[first + 1:index]
    raise RuntimeError('%s: unbalanced braces' % where)


class Call:
    """One call found in a handler body."""

    def __init__(self, handler, line_no, method, args, top, own=True):
        self.handler = handler
        self.line_no = line_no
        self.method = method
        self.args = args
        self.top = top
        # False when the call is on some other monster the script looks up.
        self.own = own

    def where(self):
        return '%s line %d' % (self.handler, self.line_no)


class LuaFile:
    """The handlers of one Lua file and the calls inside them that checkmate cares about."""

    def __init__(self, path, text):
        self.path = path
        clean = strip_comments(text)
        self.text = clean
        self.mixins = MIXIN_REQUIRE.findall(clean)
        self.params = {}
        self.calls = []
        self.helpers = []
        self.item_drops = False
        self.read(clean.split('\n'))

    def read(self, lines):
        handler, param, early_return = None, None, False
        for number, line in enumerate(lines, 1):
            start = HANDLER_START.match(line) or FUNCTION_START.match(line)
            if start:
                handler = start.group(1).replace('entity.', '')
                params = [p.strip() for p in start.group(2).split(',')]
                param = params[0] if params else ''
                self.params[handler] = param
                early_return = False
                continue
            if re.match(r'^end\b', line):
                handler, param = None, None
                continue
            indent = len(line) - len(line.lstrip(' '))
            if handler and indent > 4 and re.search(r'\breturn\b', line):
                early_return = True
            top = handler is not None and indent == 4 and not early_return
            for match in METHOD_CALL.finditer(line):
                receiver, method = match.group(1), match.group(2)
                args = call_arguments(line, match.end() - 1)
                if method == 'addListener':
                    if re.match(r"\s*'ITEM_DROPS'", line[match.end():]):
                        self.item_drops = True
                    continue
                # A listener or timer names the same monster mobArg or similar. Other receivers are
                # players, pets and other monsters. A drop switch on another monster still counts, because
                # it is often a twin of this one.
                if receiver in PLAYER_RECEIVERS:
                    continue
                if receiver != param and not receiver.startswith('mob') and method != 'setMobMod':
                    continue
                own = receiver == param or receiver.startswith('mob')
                self.calls.append(Call(handler or '<file>', number, method, args, top and receiver == param, own))
            if handler:
                for match in HELPER_CALL.finditer(line):
                    if match.group(2) == param:
                        self.helpers.append((handler, number, match.group(1), top))


def mod_name(arg):
    match = re.fullmatch(r'xi\.mod\.([A-Z0-9_]+)', arg or '')
    return match.group(1).lower() if match else None


def immunity_name(arg):
    match = re.fullmatch(r'xi\.immunity\.([A-Z_]+)', arg or '')
    return match.group(1).lower() if match else None


def changes_elements(call, aliases):
    """Whether a runtime call can change a displayed Elements field. Unknown mods stay marked."""
    if call.method in RESTAT_METHODS:
        return True
    if call.method not in ('setMod', 'addMod', 'delMod'):
        return False
    if not call.args:
        return True
    name = mod_name(call.args[0]) or aliases.get(call.args[0])
    return name is None or name in ELEMENT_READOUT_MODS


def changes_weapons(call, aliases):
    """Whether a runtime call can change a weapon type or its separate damage-taken notes."""
    if call.method in RESTAT_METHODS:
        return True
    if call.method not in ('setMod', 'addMod', 'delMod'):
        return False
    if not call.args:
        return True
    name = mod_name(call.args[0]) or aliases.get(call.args[0])
    return name is None or name in WEAPON_DAMAGE_MODS


def changes_defense(call, aliases):
    if call.method in RESTAT_METHODS:
        return True
    if call.method == 'setStatRank':
        return not call.args or call.args[0] in ('xi.stat.DEF', 'xi.stat.VIT')
    if call.method not in ('setMod', 'addMod', 'delMod'):
        return False
    if not call.args:
        return True
    name = mod_name(call.args[0]) or aliases.get(call.args[0])
    return name is None or name in DEFENSE_MODS


def call_effect(call, static, immunities, aliases):
    """
    What one call does to the monster, as (kind, detail).

    ('op', (kind, name, value)) is a change that always runs. ('runtime', text) is a change the data files
    can't hold. ('element_runtime', text) is the same for a magic damage mod. ('unreadable', text) always runs
    but the exporter can't read its value. (None, None) is a call that changes nothing checkmate uses. aliases
    maps other enum names scripts pass as a mod, such as xi.mobMod.MAGIC_DELAY, to the mod the number lands on.
    """
    args = call.args
    text = '%s %s(%s)' % (call.where(), call.method, ', '.join(args or ['...']))
    if call.method in ('setMobMod', 'addListener') or call.method in SWING_METHODS:
        return None, None
    if args is None:
        return ('unreadable', text) if static else ('runtime', text)
    if call.method in ('setMod', 'addMod', 'delMod'):
        first = args[0] if args else ''
        name = mod_name(first) or aliases.get(first)
        value = args[1] if len(args) > 1 else ''
        # A magic damage mod the script picks or works out, like an absorb mod for the day's element, can't be
        # known ahead of time.
        if name in ELEMENT_DAMAGE_MODS or (name is None and re.search(r'absorb|null|sdt', first, re.I)):
            if static and name is not None and INTEGER.match(value):
                return 'op', (call.method[:3], name, int(value))
            return 'element_runtime', text
        if name in DEFENSE_MODS:
            if static and INTEGER.match(value):
                return 'op', (call.method[:3], name, int(value))
            return 'defense_runtime', text
        if name in WEAPON_DAMAGE_MODS:
            if static and INTEGER.match(value):
                return 'op', (call.method[:3], name, int(value))
            return 'weapon_runtime', text
        if name is not None and name not in RELEVANT_MODS:
            return None, None
        if name is None or not INTEGER.match(value):
            return ('unreadable', text) if static else ('runtime', text)
        op = (call.method[:3], name, int(value))
    elif call.method in ('addImmunity', 'delImmunity'):
        name = immunity_name(args[0] if args else '')
        if name is None or name not in immunities:
            return ('unreadable', text) if static else ('runtime', text)
        op = ('immune_' + call.method[:3], name, None)
    elif call.method == 'setStatRank':
        stat = re.fullmatch(r'xi\.stat\.([A-Z]+)', args[0] if args else '')
        if stat and stat.group(1) in {'DEF', 'VIT'}:
            return 'defense_runtime', text
        if stat and stat.group(1) not in RELEVANT_STAT_RANKS:
            return None, None
        return 'runtime', text
    elif call.method in RESTAT_METHODS:
        return 'runtime', text
    else:
        return None, None
    return ('op', op) if static else ('runtime', text)


def aggro_effect(call, static):
    """
    What one call does to a monster's aggro or links, as (kind, name, detail).

    kind is 'op', 'runtime' or 'unreadable' as in call_effect, and None for a call that changes neither. An op's
    detail is (name, value). A switch has a bool value. A mob mod keeps its value as source text, because its
    reader needs the zone to make sense of it.
    """
    if not call.own or (call.method not in SWITCH_METHODS and call.method != 'setMobMod'):
        return None, None, None
    text = '%s %s(%s)' % (call.where(), call.method, ', '.join(call.args or ['...']))
    # A call that runs past its line can't be read, so it can't be passed over either.
    if call.args is None:
        return ('unreadable' if static else 'runtime'), 'aggressive', text
    args = call.args
    if call.method in SWITCH_METHODS:
        name = SWITCH_METHODS[call.method]
        value = {'true': True, '1': True, 'false': False, '0': False}.get(args[0] if len(args) == 1 else '')
    else:
        match = re.fullmatch(r'xi\.mobMod\.([A-Z_]+)', args[0] if args else '')
        name = match.group(1).lower() if match else None
        if name not in AGGRO_MOB_MODS | LINK_MOB_MODS:
            return None, None, None
        value = args[1] if len(args) == 2 else None
    if not static:
        return 'runtime', name, text
    if value is None:
        return 'unreadable', name, text
    return 'op', name, (name, value)


def attack_list(args):
    """The TP move list a setMobSkillAttack call gives, 0 for none, or None when the reader can't read it."""
    return int(args[0]) if args and len(args) == 1 and INTEGER.match(args[0]) else None


def drop_effect(call, static):
    """'off' when the call always turns drops off, 'changed' for any other NO_DROPS change, else None."""
    if call.method != 'setMobMod' or not call.args or call.args[0] != 'xi.mobMod.NO_DROPS':
        return None
    if static and len(call.args) > 1 and call.args[1] == '1':
        return 'off'
    return 'changed'
