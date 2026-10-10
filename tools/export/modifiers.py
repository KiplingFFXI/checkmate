"""Direct combat bonuses on equipped items and observed merit ranks.

Reads direct item bonuses. Latents and unknown status powers get a note.
Skill and attribute bonuses are already in the client totals, so they are left out.
"""
from pathlib import Path
import hashlib
import re

from . import aggro, effects, lua_source, overlays, sqlfile, tables

ELEMENTS = ('fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark')
CORE_GUARDS = {
    'scripts/combat/basic/magic_hit_rate.lua': 'fbc693800ada2b1c59f24329007a6f29ffb5a143da6c5d610c96a12f54bd70ad',
    'scripts/combat/physical_hit_rate.lua': '1ced36b369f7fff60eb7d4f0073c925c5f8b732b44fb9c84ee63959b963deebc',
}
WANTED = {'crithitrate': 'crit', 'crithitrate_only_wep': 'weapon_crit', 'macc': 'magic_accuracy'}
WANTED.update({name + '_macc': name for name in ELEMENTS})
WANTED.update({name + '_staff_bonus': 'staff_' + name for name in ELEMENTS})
WANTED.update({'force_' + ('lightning' if name == 'thunder' else name) + '_dwbonus': 'weather_' + name
               for name in ELEMENTS})
WANTED.update({'iridescence': 'weather_all', 'force_dw_bonus_penalty': 'weather_all'})
MERITS = {
    'elemental_magic_accuracy': ('blm_group_2', 4, 'elemental'),
    'magic_accuracy': ('rdm_group_2', 5, 'all'),
    'troubadour': ('brd_group_2', 10, 'singing'),
    'nin_magic_accuracy': ('nin_group_2', 13, 'ninjutsu'),
    'magical_accuracy': ('blu_group_1', 16, 'blue'),
}
for element in ELEMENTS[:6]:
    name = 'lightning' if element == 'thunder' else element
    MERITS[name + '_magic_accuracy'] = ('rdm_group_1', 5, element)


def sql_rows(tree, table):
    """Merge every loaded SQL change, stopping rather than guessing at an expression."""
    path = Path(tree, 'sql', table + '.sql')
    columns = sqlfile.columns(path.read_text(encoding='utf-8'), table)
    rows = sqlfile.rows(str(path), table)
    for module, target, statement in tables.module_statements(tree):
        if target != table:
            continue
        update = re.fullmatch(r'UPDATE\s+`?\w+`?\s+SET\s+(.*?)\s+WHERE\s+(.*)', statement, re.I)
        insert = re.fullmatch(r'INSERT INTO\s+`?\w+`?\s+VALUES\s*\((.*)\)', statement, re.I)
        delete = re.fullmatch(r'DELETE FROM\s+`?\w+`?\s+WHERE\s+(.*)', statement, re.I)
        if update:
            changes, where = tables.parse_pairs(update[1], module), tables.parse_pairs(update[2], module)
            for row in rows:
                if all(row.get(key) == value for key, value in where.items()):
                    row.update(changes)
        elif insert:
            values = sqlfile.split_values(insert[1])
            if len(values) != len(columns):
                raise RuntimeError('%s has an unreadable %s insert' % (module, table))
            rows.append(dict(zip(columns, values)))
        elif delete:
            where = tables.parse_pairs(delete[1], module)
            rows = [row for row in rows if not all(row.get(key) == value for key, value in where.items())]
        else:
            raise RuntimeError('%s changes %s in a way the modifier reader cannot follow: %s'
                               % (module, table, statement))
    return rows


def equipment(tree):
    ids = tables.read_enum(tree, 'mod')
    wanted = {ids[name]: field for name, field in WANTED.items()}
    equipped = {row['itemId']: row for row in sql_rows(tree, 'item_equipment')}
    found = {}
    for table, conditional in [('item_mods', False), ('item_latents', True)]:
        for row in sql_rows(tree, table):
            field, item = wanted.get(row['modId']), equipped.get(row['itemId'])
            # The era has no equipment above 75. Unavailable items cannot contribute unless actually equipped.
            if field is None or item is None or item['level'] > 75 or row['value'] == 0:
                continue
            entry = found.setdefault(row['itemId'], {'level': item['level'], 'name': item['name']})
            if conditional:
                entry['conditional_crit' if field in ('crit', 'weapon_crit') else 'conditional_magic'] = True
            else:
                if field in entry:
                    raise RuntimeError('Duplicate direct modifier %s on item %d' % (field, row['itemId']))
                entry[field] = row['value']
    return found


def merit_rows(tree, roots):
    source = overlays.load_merged(tree, roots, 'merits')['merits']
    found = {}
    for name, (category_name, job, school) in MERITS.items():
        category = source['categories'][category_name]
        row = category['merits'][name]
        costs = source['upgrade_costs'][row['upgrade_cost']]
        most = min(row.get('max_upgrades', len(costs)), category['max_upgrades'])
        if most > 0:
            found[name] = {'id': row['id'], 'per_rank': row['value'], 'most': most, 'job': job,
                           'school': school, 'level': 75}
    return found


def effect_overrides(tree):
    """Era handlers replace core unless they call super."""
    found = {}
    pattern = re.compile(r"\w+:addOverride(ByEra)?\(\s*'xi\.effects\.([\w]+)\.onEffectGain'")
    eras = {'WOTG': 4, 'ABYSSEA': 5, 'SOA': 6, 'ROV': 7}
    for relative in effects.check_source(tree):
        text = effects.source(tree, relative)
        for match in pattern.finditer(text):
            args = lua_source.call_arguments(text, text.index('(', match.start()))
            if args is None or len(args) != 2:
                raise RuntimeError('%s: unreadable effect modifier override' % relative)
            body = args[1]
            bodies = [body]
            if match[1]:
                starts = list(re.finditer(r'\[xi\.expansion\.(\w+)\]\s*=\s*function', body))
                if not starts or any(start[1] not in eras for start in starts):
                    raise RuntimeError('%s: unaudited effect modifier era' % relative)
                cases = [(eras[start[1]], body[start.end():starts[i + 1].start() if i + 1 < len(starts) else len(body)])
                         for i, start in enumerate(starts)]
                bodies = [case for _, case in sorted(cases, reverse=True)]
            for case in bodies:
                before = found.get(match[2])
                keeps = re.search(r'\bsuper\s*\(', case) is not None
                if before and keeps:
                    found[match[2]] = (before[0], before[1] + '\n' + case)
                else:
                    found[match[2]] = (keeps, case)
    return found


def effect_rows(tree, roots):
    """Presence can warn about a changed input without guessing the effect's hidden power."""
    rows = overlays.load_merged(tree, roots, 'status_effects')['status_effects']
    overrides = effect_overrides(tree)
    found = {}
    for name, row in rows.items():
        file = Path(tree, 'scripts', 'effects', name + '.lua')
        if not file.exists():
            continue
        text = lua_source.strip_comments(file.read_text(encoding='utf-8'))
        if name in overrides:
            keeps, body = overrides[name]
            if not keeps:
                text, count = re.subn(r'^effectObject\.onEffectGain\s*=\s*function\b.*?^end\b', '', text,
                                      count=1, flags=re.M | re.S)
                if count != 1:
                    raise RuntimeError('%s: unreadable original effect gain handler' % file)
            text += '\n' + body
        jp_names = re.findall(r'local\s+(\w+)\s*=\s*\w+:getJobPoint\w*\(', text)
        calls = [line for line in text.splitlines() if 'getJobPoint' not in line
                 and not any(re.search(r'\b' + re.escape(jp) + r'\b', line) for jp in jp_names)]
        used = set(re.findall(r'(?:addMod|setMod)\(\s*xi\.mod\.([A-Z0-9_]+)', '\n'.join(calls)))
        flags = {}
        if used & {'ACC', 'ACCP', 'ACC_PERCENT', 'DEX'}: flags['evade'] = True
        if used & {'EVA', 'EVAP', 'EVA_PERCENT', 'AGI'}: flags['hit'] = True
        if used & {'AGI', 'CRITICAL_HIT_EVASION'}: flags['crit'] = True
        if used & {'DEX', 'CRITHITRATE'}: flags['crittaken'] = True
        if used & {'INT', 'MND', 'CHR', 'MEVA', 'STATUS_MEVA'} or any(x.endswith('_MEVA') for x in used):
            flags['magic'] = True
        if used & {'CRITHITRATE', 'CRITHITRATE_ONLY_WEP'}: flags['own_crit'] = True
        if used & {'MACC', 'FOOD_MACCP', 'FOOD_MACC_CAP'} or any(x.endswith('_MACC') for x in used):
            flags['own_magic'] = True
        # Flash is applied by the hit-rate function, rather than an effect modifier.
        if name == 'flash': flags['evade'] = True
        if name == 'threnody': flags['magic'] = True
        if flags:
            flags['name'] = name.replace('_', ' ')
            found[row['id']] = flags
    return found


def build(tree, roots, allowed):
    if not allowed.restrict or set(allowed.enabled) != {'rotz', 'cop', 'toau'}:
        raise RuntimeError('Combat modifiers require Phoenix content: rotz/cop/toau with content restrictions.')
    for relative, expected in CORE_GUARDS.items():
        text = lua_source.strip_comments(Path(tree, relative).read_text(encoding='utf-8'))
        normalized = re.sub(r'\s+', ' ', text).strip()
        if hashlib.sha256(normalized.encode()).hexdigest() != expected:
            raise RuntimeError('%s changed. Audit the direct combat modifiers before regenerating.' % relative)
    # A loaded module changing the calculation needs a deliberate audit, not a new guessed bonus.
    for file in aggro.lua_files_loaded(tree):
        text = lua_source.strip_comments(Path(tree, file).read_text(encoding='utf-8'))
        if re.search(r"addOverride\(['\"]xi\.combat\.(?:magicHitRate|basic\.magicHitRate)", text) \
                or re.search(r'xi\.combat\.(?:magicHitRate|basic\.magicHitRate)(?:\.[\w.]+)?\s*=', text):
            raise RuntimeError('%s overrides the magic accuracy calculation. Update the modifier reader.' % file)
    statuses = overlays.load_merged(tree, roots, 'status_effects')['status_effects']
    return {'items': equipment(tree), 'merits': merit_rows(tree, roots), 'effects': effect_rows(tree, roots),
            'buffs': {name: statuses[name]['id'] for name in
                      ('mighty_strikes', 'flash', 'food', 'troubadour', 'sneak_attack', 'trick_attack')}}


def lua(value, indent=0):
    if isinstance(value, bool): return 'true' if value else 'false'
    if isinstance(value, (int, float)): return str(value)
    if isinstance(value, str): return "'%s'" % value.replace('\\', '\\\\').replace("'", "\\'")
    if not value: return '{}'
    pieces = []
    for key in sorted(value, key=lambda k: (isinstance(k, str), k)):
        label = '[%s]' % key if isinstance(key, int) else key
        pieces.append(' ' * (indent + 4) + label + ' = ' + lua(value[key], indent + 4) + ',')
    return '{\n' + '\n'.join(pieces) + '\n' + ' ' * indent + '}'


def write(path, data, built, content):
    body = dict(data, built=built, content=content)
    Path(path).write_text('-- Direct equipped bonuses only. Stats and skills are already in client totals.\n'
                          '-- Conditional bonuses are named, never assumed active.\nreturn ' + lua(body) + ';\n',
                          encoding='ascii')
