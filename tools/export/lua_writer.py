"""Writes the data files as Lua tables, sharing identical danger details within each zone."""
from collections import Counter
from .lua_source import ELEMENTS, STATUSES, RESIST_EFFECTS, WEAPON_TYPES
from .rows import MEVA_KEYS, LINK_WAYS

LEVEL_FIELDS = ['acc', 'eva', 'agi', 'int', 'mnd', 'chr', 'dex', 'def', 'attack_skill']
RANK_ORDER = ELEMENTS + STATUSES
MEVA_ORDER = [key for key, _ in MEVA_KEYS]
DAMAGE_ORDER = ['all'] + ELEMENTS
FLAG_ORDER = ['scripted_drops', 'exp_only', 'scripted_stats', 'scripted_aggro', 'scripted_elements', 'scripted_weapons', 'scripted_defense', 'scripted_attack_skill']

# The fields a row or one of its levels can hold, with the order their keys are written in.
EXTRA_FIELDS = [('ranks', RANK_ORDER), ('meva', MEVA_ORDER), ('resist', RESIST_EFFECTS), ('magic_dmg', DAMAGE_ORDER),
                ('absorb', DAMAGE_ORDER), ('nullify', DAMAGE_ORDER), ('weapon_dmg', [kind for kind, _ in WEAPON_TYPES]),
                ('weapon_guard', ['physical', 'ranged', 'absorb', 'nullify_physical', 'nullify_ranged'])]

# The aggro switches, in the order they are written.
AGGRO_SWITCHES = ['aggro', 'any_level', 'no_aggro', 'true_detect', 'ambush']

# Lines longer than this wrap.
WIDTH = 116


def quote(text):
    return "'%s'" % str(text).replace('\\', '\\\\').replace("'", "\\'")


def named(values, order):
    """The a = 1 parts of a table, with the keys in a fixed order."""
    return ['%s = %s' % (key, values[key]) for key in order if key in values]


def wrap(prefix, parts, suffix):
    """prefix { parts } suffix, carried on to lines lined up under the first part when it runs long."""
    line = '%s{ %s }%s' % (prefix, ', '.join(parts), suffix)
    if len(line) <= WIDTH:
        return [line]
    lines, current = [], prefix + '{ '
    indent = ' ' * len(current)
    for number, part in enumerate(parts):
        piece = part + (',' if number < len(parts) - 1 else ' }' + suffix)
        if current != prefix + '{ ' and len(current) + len(piece) > WIDTH:
            lines.append(current.rstrip())
            current = indent
        current += piece + ' '
    lines.append(current.rstrip())
    return lines


def item_label(name):
    return name.replace('_', ' ')


def drop_lines(row_drops, pad):
    lines = []
    for roll in row_drops:
        if 'item' in roll:
            label = item_label(roll['name']) + (', the despoil entry' if roll.get('despoil') else '')
            lines.append('%s{ rate = %d, item = %d },  -- %s' % (pad, roll['rate'], roll['item'], label))
            continue
        members = roll['group']
        pairs = ', '.join('{ %d, %d }' % (item, weight) for item, weight, _ in members)
        names = ', '.join(item_label(name) for _, _, name in members)
        line = '%s{ rate = %d, group = { %s } },  -- one of %s' % (pad, roll['rate'], pairs, names)
        if len(line) <= WIDTH:
            lines.append(line)
            continue
        lines.append('%s{ rate = %d, group = {  -- one of' % (pad, roll['rate']))
        for item, weight, name in members:
            lines.append('%s    { %d, %d },  -- %s' % (pad, item, weight, item_label(name)))
        lines.append('%s} },' % pad)
    return lines


def steal_lines(row_steal, pad):
    """The steal ids on one line with their names after, or one id a line when that runs long."""
    ids = ', '.join(str(item) for item, _ in row_steal)
    line = '%ssteal  = { %s },  -- %s' % (pad, ids, ', '.join(item_label(name) for _, name in row_steal))
    if len(line) <= WIDTH:
        return [line]
    return (['%ssteal  = {' % pad] + ['%s    %d,  -- %s' % (pad, item, item_label(name)) for item, name in row_steal]
            + ['%s},' % pad])


def level_lines(level, numbers, pad):
    parts = ['%s = %d' % (field, numbers[field]) for field in LEVEL_FIELDS
             if field != 'attack_skill' or field in numbers]
    for field, order in EXTRA_FIELDS:
        if field in numbers:
            parts.append('%s = { %s }' % (field, ', '.join(named(numbers[field], order))))
    return wrap('%s[%d] = ' % (pad, level), parts, ',')


def aggro_lines(row, pad, lists):
    """The aggro switches, detection, note, awake hours and link list number of a row."""
    lines = ['%s%s = true,' % (pad, field.ljust(6)) for field in AGGRO_SWITCHES if row.get(field)]
    if 'detects' in row:
        lines += wrap('%sdetects = ' % pad, [quote(name) for name in row['detects']], ',')
    if 'aggro_note' in row:
        lines.append('%saggro_note = %s,' % (pad, quote(row['aggro_note'])))
    if 'aggro_hours' in row:
        lines.append('%saggro_hours = { %d, %d },' % (pad, row['aggro_hours'][0], row['aggro_hours'][1]))
    if 'links' in row:
        lines.append('%slinks  = %d,' % (pad, lists[link_key(row['links'])]))
    return lines


def row_lines(row, lists, shared=None):
    pad = ' ' * 12
    lines = ['        {']
    lines.append('%sname   = %s,' % (pad, quote(row['name'])))
    lines += wrap('%sids    = ' % pad, [str(index) for index in row['ids']], ',')
    if row.get('nm'):
        lines.append('%snm     = true,' % pad)
    if 'job' in row:
        lines.append('%sjob    = %s,' % (pad, quote(row['job'])))
    if row['levels']:
        lines.append('%slevels = {' % pad)
        for level in sorted(row['levels']):
            lines += level_lines(level, row['levels'][level], pad + '    ')
        lines.append('%s},' % pad)
    else:
        lines.append('%slevels = {},' % pad)
    if 'spawn_levels' in row:
        ranges = sorted(row['spawn_levels'].items())
        parts = ['[%d] = { %d, %d }' % (index, low, high) for index, (low, high) in ranges]
        lines += wrap('%sspawn_levels = ' % pad, parts, ',')
    if 'ph_for' in row:
        parts = ['[%d] = { %s }' % (index, ', '.join(map(str, nms))) for index, nms in sorted(row['ph_for'].items())]
        lines += wrap('%sph_for = ' % pad, parts, ',')
    if 'ph_rules' in row:
        lines.append('%sph_rules = {' % pad)
        for index, nms in sorted(row['ph_rules'].items()):
            lines.append('%s    [%d] = {' % (pad, index))
            for nm, rule in sorted(nms.items()):
                lines.append('%s        [%d] = %s,' % (pad, nm, effect_value(rule)))
            lines.append('%s    },' % pad)
        lines.append('%s},' % pad)
    if 'loot_conditions' in row:
        lines += wrap('%sloot_conditions = ' % pad, [quote(note) for note in row['loot_conditions']], ',')
    if 'level_mod' in row:
        lines.append('%slevel_mod = %d,' % (pad, row['level_mod']))
    if 'crit' in row:
        lines.append('%scrit   = %d,' % (pad, row['crit']))
    if row.get('tp_moves'):
        lines.append('%stp_moves = true,' % pad)
    if row.get('no_swings'):
        lines.append('%sno_swings = true,' % pad)
    if row.get('counters'):
        lines.append('%scounters = true,' % pad)
    for field, order in EXTRA_FIELDS:
        if field in row:
            lines += wrap('%s%s = ' % (pad, field.ljust(6)), named(row[field], order), ',')
    if row.get('undead'):
        lines.append('%sundead = true,' % pad)
    if 'immune' in row:
        lines += wrap('%simmune = ' % pad, [quote(name) for name in row['immune']], ',')
    if 'drops' in row:
        lines.append('%sdrops  = {' % pad)
        lines.extend(drop_lines(row['drops'], pad + '    '))
        lines.append('%s},' % pad)
    if 'steal' in row:
        lines += steal_lines(row['steal'], pad)
    lines += aggro_lines(row, pad, lists)
    if 'flags' in row:
        flags = ', '.join('%s = true' % flag for flag in FLAG_ORDER if flag in row['flags'])
        lines.append('%sflags  = { %s },' % (pad, flags))
    if 'info' in row:
        lines.append('%sinfo = {' % pad)
        for key, value in row['info'].items():
            rendered = shared.value(value) if key == 'dangers' and shared else effect_value(value)
            lines.append('%s    %s = %s,' % (pad, key, rendered))
        lines.append('%s},' % pad)
    if 'info_by_index' in row:
        lines.append('%sinfo_by_index = {' % pad)
        for index, sections in sorted(row['info_by_index'].items()):
            value = shared.sections(sections) if shared else effect_value(sections)
            lines.append('%s    [%d] = %s,' % (pad, index, value))
        lines.append('%s},' % pad)
    lines.append('        },')
    return lines


def write_file(path, lines):
    text = '\n'.join(lines) + '\n'
    text.encode('ascii')
    with open(path, 'w', encoding='ascii', newline='\n') as handle:
        handle.write(text)
    return text


def stamp_lines(stamp):
    return ['-- Built by tools\\export_data.py from %s.' % stamp.built,
            '-- It assumes %s.' % stamp.content,
            "-- Don't edit this file by hand."]


def link_key(links):
    """A row's link groups in LINK_WAYS order, as a tuple, so rows with the same groups share a list."""
    return tuple((way, tuple(links[way])) for way in LINK_WAYS if way in links)


def link_numbers(rows):
    """Each distinct list of link groups, numbered from 1 in the order the rows first use them."""
    numbers = {}
    for row in rows:
        if 'links' in row:
            numbers.setdefault(link_key(row['links']), len(numbers) + 1)
    return numbers


def link_families(rows):
    """Exact helper names whose family agrees across every represented kind."""
    wanted = {name for row in rows for names in row.get('links', {}).values() for name in names}
    found = {}
    for row in rows:
        own = row.get('_link_family')
        if not own or own.get('link_name') not in wanted:
            continue
        name = own['link_name']
        valid = (type(own.get('id')) is int and own['id'] > 0
                 and isinstance(own.get('name'), str) and bool(own['name'].strip()))
        key = (own['id'], own['name']) if valid else None
        if name not in found:
            found[name] = key
        elif found[name] != key:
            found[name] = None
    result = {}
    for name, key in sorted(found.items()):
        if key is not None:
            family, label = key
            result[name] = {'id': family, 'name': label}
    return result


def link_family_lines(rows):
    families = link_families(rows)
    if not families:
        return []
    lines = ['    -- Exact helper names with an unambiguous source family.', '    link_families = {']
    for name, family in families.items():
        lines.append('        [%s] = %s,' % (quote(name), effect_value(family)))
    return lines + ['    },']


def link_list_lines(lists):
    """The link_lists table. Many rows share a list, so each one is written once, on one line when it fits."""
    if not lists:
        return ['    link_lists = {},']
    lines = ["    -- Each list of link names by how they link, written once. A row's links is the number of its list.",
             '    link_lists = {']
    for groups, number in lists.items():
        parts = ['%s = { %s }' % (way, ', '.join(quote(name) for name in names)) for way, names in groups]
        line = '        [%d] = { %s },' % (number, ', '.join(parts))
        if len(line) <= WIDTH:
            lines.append(line)
            continue
        lines.append('        [%d] = {' % number)
        for way, names in groups:
            lines += wrap('            %s = ' % way, [quote(name) for name in names], ',')
        lines.append('        },')
    return lines + ['    },']


def write_zone(path, zone_id, zone_name, rows, stamp, share_dangers=True):
    lists = link_numbers(rows)
    shared = SharedDangers(rows) if share_dangers else None
    lines = ['-- %s (zone %d).' % (zone_name, zone_id)] + stamp_lines(stamp)
    if shared:
        lines += shared.lines()
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content)]
    lines += link_list_lines(lists)
    lines += link_family_lines(rows)
    lines.append('    monsters = {')
    for row in rows:
        lines += row_lines(row, lists, shared)
    lines += ['    },', '    by_name = {},', '}']
    return write_file(path, lines)


def write_bands(path, band_rows, stamp):
    lines = ['-- Typical monster accuracy, evasion, AGI and DEX by level, for monsters with no data row.',
             '-- Each row covers the middle 80 percent of the monsters at that level that are not notorious.']
    lines += stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content),
              '    -- { level, accuracy low, accuracy high, evasion low, evasion high, AGI low, AGI high, DEX low, '
              'DEX high }',
              '    rows = {']
    for band in band_rows:
        lines.append('        { %s },' % ', '.join(str(value) for value in band))
    lines += ['    },', '}']
    return write_file(path, lines)


def write_too_weak(path, sources, highest, stamp):
    lines = ['-- The highest monster level that checks Too Weak to you, by your main level.',
             '-- A monster\'s level here is its true level plus its level_mod.',
             '-- The levels are worked out from %s.' % ' and '.join(sources)]
    lines += stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content),
              '    -- [your main level] = the highest Too Weak level',
              '    highest = {']
    levels = sorted(highest)
    for start in range(0, len(levels), 10):
        parts = ['[%d] = %d,' % (level, highest[level]) for level in levels[start:start + 10]]
        lines.append('        ' + ' '.join(parts))
    lines += ['    },', '}']
    return write_file(path, lines)


def four_to_a_line(parts):
    return ['        ' + ' '.join(parts[start:start + 4]) for start in range(0, len(parts), 4)]


def write_pets(path, jugs, avatars, items, affinity, stamp):
    lines = ["-- Jug pets by the name the game shows, with each one's own highest level, "
             "a summoner's avatars and spirits",
             "-- by name, the gear that narrows a jug pet's level, and the Beast Affinity merit."]
    lines += stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content),
              "    -- [name] = the jug's own highest level, before Beast Affinity and your main level cap it",
              '    jugs = {']
    lines += four_to_a_line(['[%s] = %d,' % (quote(name), jugs[name]) for name in sorted(jugs)])
    lines += ['    },',
              "    -- The names of a summoner's avatars and spirits, which never get the pet part",
              '    avatars = {']
    lines += four_to_a_line(['[%s] = true,' % quote(name) for name in sorted(avatars)])
    lines += ['    },',
              '    -- [item id] = the levels it takes off how far under its highest level a jug pet can be, and its '
              'own level']
    lines += wrap('    jug_range_items = ', ['[%d] = { cut = %d, level = %d }' % (item, items[item][0], items[item][1])
                                           for item in sorted(items)], ',')
    lines += ['    -- Beast Affinity: its id in the merit list the server sends, the levels each merit adds and the '
              'most merits',
              '    beast_affinity = { id = %d, per_merit = %d, most = %d },'
              % (affinity['id'], affinity['per_merit'], affinity['most']),
              '}']
    return write_file(path, lines)


def write_steal(path, ability, items, latents, stamp):
    lines = ["-- Steal: the job that has it and the level it's learned at, and the gear that adds to the Steal mod."]
    lines += stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content),
              "    -- Steal is this job's, as your main or support job, from this level",
              '    ability = { job = %d, level = %d },' % (ability['job'], ability['level']),
              '    -- [item id] = the Steal it adds and its own level. It adds nothing while your main level is under '
              'that.']
    lines += wrap('    items = ', ['[%d] = { steal = %d, level = %d }' % (item, items[item][0], items[item][1])
                                 for item in sorted(items)], ',')
    lines += ['    -- [item id] = the Steal it adds while your HP is at or under hp_percent and TP is under 100%, and '
              'its own level']
    lines += wrap('    latents = ', ['[%d] = { steal = %d, level = %d, hp_percent = %d }' % ((item,) + latents[item])
                                   for item in sorted(latents)], ',')
    lines.append('}')
    return write_file(path, lines)


def write_crit(path, merits, caps, items, stamp):
    lines = ['-- Crit: the Critical Hit Rate and Enemy Critical Hit Rate merits, the main level each count of them',
             '-- needs, and the gear that changes the crits you take.']
    lines += stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content),
              '    -- Each merit: its id in the merit list the server sends, what one adds to your crit or takes off',
              '    -- the crits you take, in percent, and the most you can have',
              '    merits = {']
    width = max(len(name) for name in merits)
    lines += ['        %s = { id = %d, per_merit = %d, most = %d },'
              % (name.ljust(width), merit['id'], merit['per_merit'], merit['most']) for name, merit in merits.items()]
    lines += ['    },',
              '    -- { main level, how many merits count from that level }, lowest first. A level sync counts.']
    lines += wrap('    level_caps = ', ['{ %d, %d }' % cap for cap in caps], ',')
    lines += ['    -- [item id] = its critical hit evasion and its own level. It counts for nothing while your main',
              '    -- level is under that. A minus one raises the crits you take.']
    lines += wrap('    evasion_items = ', ['[%d] = { crit_evasion = %d, level = %d }' % ((item,) + items[item])
                                         for item in sorted(items)], ',')
    lines.append('}')
    return write_file(path, lines)


def effect_value(value):
    """The small nested values in effects.lua, in a stable order."""
    if isinstance(value, bool):
        return 'true' if value else 'false'
    if isinstance(value, str):
        return quote(value)
    if isinstance(value, dict):
        return '{ %s }' % ', '.join('%s = %s' % (('[%d]' % key) if isinstance(key, int) else key,
                                                 effect_value(child))
                                  for key, child in value.items() if not str(key).startswith('_'))
    if isinstance(value, list):
        return '{ %s }' % ', '.join(effect_value(child) for child in value)
    return str(value)


def identity(value):
    """Every field and list position participates; differing conditions never share."""
    if isinstance(value, dict):
        return ('map', tuple(sorted((identity(key), identity(child)) for key, child in value.items())))
    if isinstance(value, (list, tuple)):
        return ('list', tuple(identity(child) for child in value))
    return (type(value).__name__, value)


class SharedValues:
    """Lua constructs shared tables directly, with no decoder or second pass."""
    def __init__(self, roots, name='shared'):
        self.name = name
        self.counts, self.keys, self.sizes, self.ids, self.definitions = Counter(), {}, {}, {}, []
        for root in roots:
            self.count(root)
        for root in roots:
            self.collect(root)

    def key(self, value):
        address = id(value)
        if address not in self.keys:
            self.keys[address] = (value, identity(value))
        return self.keys[address][1]

    def count(self, value):
        if not isinstance(value, (dict, list)):
            return
        key = self.key(value)
        self.counts[key] += 1
        if key not in self.sizes:
            self.sizes[key] = len(effect_value(value))
        for child in value.values() if isinstance(value, dict) else value:
            self.count(child)

    def collect(self, value):
        if not isinstance(value, (dict, list)):
            return
        key = self.key(value)
        if key in self.ids:
            return
        for child in value.values() if isinstance(value, dict) else value:
            self.collect(child)
        if self.counts[key] > 1 and self.sizes[key] >= 80:
            self.ids[key] = len(self.definitions) + 1
            self.definitions.append(value)

    def value(self, value, expand=False):
        if isinstance(value, (dict, list)):
            number = self.ids.get(self.key(value))
            if number and not expand:
                return '%s[%d]' % (self.name, number)
            if isinstance(value, dict):
                return '{ %s }' % ', '.join('%s = %s' % (('[%d]' % key) if isinstance(key, int) else key,
                                                         self.value(child))
                                          for key, child in value.items() if not str(key).startswith('_'))
            return '{ %s }' % ', '.join(self.value(child) for child in value)
        return effect_value(value)

    def lines(self):
        if not self.definitions:
            return []
        return ['-- Identical tables are shared within this file.', 'local %s = {};' % self.name] + [
            '%s[%d] = %s;' % (self.name, number, self.value(value, expand=True))
            for number, value in enumerate(self.definitions, 1)]


class SharedDangers(SharedValues):
    """Only danger metadata shares tables between monster rows."""
    def __init__(self, rows):
        roots = []
        for row in rows:
            sources = [row.get('info', {})] + list(row.get('info_by_index', {}).values())
            roots.extend(source['dangers'] for source in sources if isinstance(source.get('dangers'), dict))
        super().__init__(roots, 'danger')

    def sections(self, sections):
        return '{ %s }' % ', '.join('%s = %s' % (key, self.value(value) if key == 'dangers' else effect_value(value))
                                  for key, value in sections.items())


def write_effects(path, data, stamp):
    lines = ['-- Effects seen in action messages, with Phoenix durations before resists.',
             '-- An absent duration stays untimed. by_effect names each status of a move with several.']
    lines += stamp_lines(stamp)
    lines += ['return {', '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content)]
    sections = [('effects', 'What an effect removes, and its usual duration.'),
                ('spells', 'Spell IDs, filtered by enabled content.'),
                ('abilities', 'Player ability IDs.'), ('skills', 'Monster skill IDs.'),
                ('pacts', 'Pet skill IDs from the action packet, including Ready and automaton moves.'),
                ('procs', 'Item IDs and their added-effect durations.'),
                ('proc_effects', 'The status each added-effect item applies.'),
                ('proc_usual', 'The most common item duration for each added effect; longer wins a tie.'),
                ('gear', 'Song bonuses and Shadowbind seconds by item ID.'),
                ('merits', 'Merit IDs, base seconds, seconds per rank and the enabled rank cap.')]
    for section, comment in sections:
        lines += ['    -- ' + comment, '    %s = {' % section]
        values = data[section]
        for key in sorted(values):
            value = values[key]
            label = '[%d]' % key if isinstance(key, int) else key
            tail = '  -- ' + value['_name'] if isinstance(value, dict) and '_name' in value else ''
            line = '        %s = %s,' % (label, effect_value(value))
            if len(line + tail) <= WIDTH:
                lines.append(line + tail)
            elif isinstance(value, dict):
                lines.append(('        %s = { %s' % (label, tail.lstrip())).rstrip())
                for field, child in value.items():
                    if str(field).startswith('_'):
                        continue
                    field_label = '[%d]' % field if isinstance(field, int) else field
                    if field == 'by_effect':
                        lines.append('            by_effect = {')
                        for effect, row in sorted(child.items()):
                            lines.append('                [%d] = %s,' % (effect, effect_value(row)))
                        lines.append('            },')
                    else:
                        lines.append('            %s = %s,' % (field_label, effect_value(child)))
                lines.append('        },')
            else:
                lines.append(line + tail)
        lines.append('    },')
    lines += ['    -- Unique icon IDs. Sleep II and Lullaby share Sleep.']
    lines += wrap('    pictured = ', [str(effect) for effect in data['pictured']], ',')
    lines += ['    troubadour = %d,' % data['troubadour'], '}']
    return write_file(path, lines)
