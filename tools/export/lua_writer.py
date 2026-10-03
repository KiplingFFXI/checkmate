"""Writes the data files as plain, readable Lua tables."""
from .lua_source import ELEMENTS, STATUSES, RESIST_EFFECTS
from .rows import MEVA_KEYS

LEVEL_FIELDS = ['acc', 'eva', 'agi', 'int', 'mnd', 'chr']
RANK_ORDER = ELEMENTS + STATUSES
MEVA_ORDER = [key for key, _ in MEVA_KEYS]
DAMAGE_ORDER = ['all'] + ELEMENTS
FLAG_ORDER = ['scripted_drops', 'exp_only', 'scripted_stats', 'scripted_aggro', 'scripted_elements']

# The fields a row or one of its levels can hold, with the order their keys are written in.
EXTRA_FIELDS = [('ranks', RANK_ORDER), ('meva', MEVA_ORDER), ('resist', RESIST_EFFECTS), ('magic_dmg', DAMAGE_ORDER),
                ('absorb', DAMAGE_ORDER), ('nullify', DAMAGE_ORDER)]

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


def level_lines(level, numbers, pad):
    parts = ['%s = %d' % (field, numbers[field]) for field in LEVEL_FIELDS]
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
        lines.append('%slinks  = %d,' % (pad, lists[tuple(row['links'])]))
    return lines


def row_lines(row, lists):
    pad = ' ' * 12
    lines = ['        {']
    lines.append('%sname   = %s,' % (pad, quote(row['name'])))
    lines += wrap('%sids    = ' % pad, [str(index) for index in row['ids']], ',')
    if row.get('nm'):
        lines.append('%snm     = true,' % pad)
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
    if 'level_mod' in row:
        lines.append('%slevel_mod = %d,' % (pad, row['level_mod']))
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
    lines += aggro_lines(row, pad, lists)
    if 'flags' in row:
        flags = ', '.join('%s = true' % flag for flag in FLAG_ORDER if flag in row['flags'])
        lines.append('%sflags  = { %s },' % (pad, flags))
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


def link_numbers(rows):
    """Each distinct list of link names, numbered from 1 in the order the rows first use them."""
    numbers = {}
    for row in rows:
        if 'links' in row:
            numbers.setdefault(tuple(row['links']), len(numbers) + 1)
    return numbers


def link_list_lines(lists):
    """The link_lists table. Many rows share a list, so each one is written once."""
    if not lists:
        return ['    link_lists = {},']
    lines = ["    -- Each list of link names, written once. A row's links is the number of its list.",
             '    link_lists = {']
    for names, number in lists.items():
        lines += wrap('        [%d] = ' % number, [quote(name) for name in names], ',')
    return lines + ['    },']


def write_zone(path, zone_id, zone_name, rows, stamp):
    lists = link_numbers(rows)
    lines = ['-- %s (zone %d).' % (zone_name, zone_id)] + stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content)]
    lines += link_list_lines(lists)
    lines.append('    monsters = {')
    for row in rows:
        lines += row_lines(row, lists)
    lines += ['    },', '    by_name = {},', '}']
    return write_file(path, lines)


def write_bands(path, band_rows, stamp):
    lines = ['-- Typical monster accuracy, evasion and AGI by level, for monsters with no data row.',
             '-- Each row covers the middle 80 percent of the monsters at that level that are not notorious.']
    lines += stamp_lines(stamp)
    lines += ['return {',
              '    built   = %s,' % quote(stamp.built),
              '    content = %s,' % quote(stamp.content),
              '    -- { level, accuracy low, accuracy high, evasion low, evasion high, AGI low, AGI high }',
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
