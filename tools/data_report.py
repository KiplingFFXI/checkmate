"""
Compares two checkmate data folders and writes what changed as a short markdown report.

    python tools\\data_report.py OLD NEW [--report FILE] [--bullets FILE]

Loads the generated files in LuaJIT and compares the monsters row by row. Links, PHs and steal items are
compared by name so a changed index alone does not count. The build stamp is ignored too.
Zone-level family labels are compared separately from actual link memberships.

Also reports whether pets.lua, steal.lua, crit.lua, effects.lua, modifiers.lua or blue_finder.lua or pdif.lua or defenses.lua changed. Writes the report
and short changelog entries when requested, or prints the report. With no changes, it writes nothing.
Older data may have no jobs; those comparisons leave jobs out and say why.
"""
import argparse
import os
import re
import sys

from lupa import luajit21

HERE = os.path.dirname(os.path.abspath(__file__))
DROPS_LUA = os.path.join(os.path.dirname(HERE), 'checkmate', 'core', 'drops.lua')
AGGRO_LUA = os.path.join(os.path.dirname(HERE), 'checkmate', 'core', 'aggro.lua')

# GitHub refuses a pull request body over 65536 characters, so the zone list stops before that.
REPORT_LIMIT = 60000

# Most CHANGELOG bullets about monsters. The last one counts the rest when there are more.
MOST_BULLETS = 5

# The Treasure Hunter levels the drop tables show. Phoenix allows 0 to 4.
TH_LEVELS = range(5)

# Row fields in the order the data files write them.
FIELD_ORDER = ['ids', 'nm', 'job', 'levels', 'spawn_levels', 'ph_for', 'ph_rules', 'loot_conditions', 'level_mod', 'crit', 'tp_moves', 'no_swings',
               'counters', 'ranks', 'meva', 'resist', 'magic_dmg', 'absorb', 'nullify', 'undead', 'immune', 'drops',
               'steal', 'aggro', 'any_level', 'no_aggro', 'true_detect', 'ambush', 'detects', 'aggro_note',
               'aggro_hours', 'links', 'flags']

# Fields that are a list of names or indexes, where only what's in the list matters. Steal picks evenly from its
# items, so their order doesn't matter either.
SET_FIELDS = {'ids', 'immune', 'detects', 'links', 'ph_for', 'steal'}

# Names for the fields whose own name reads badly in the report.
LABELS = {'ids': 'spawn indexes', 'immune': 'immunities', 'detects': 'detection', 'ph_for': 'PH spawns',
          'steal': 'steal items', 'ph_rules': 'PH lottery rules', 'loot_conditions': 'loot conditions'}

# Fields that are only written when true.
TRUE_FIELDS = {'nm', 'tp_moves', 'no_swings', 'counters', 'undead', 'aggro', 'any_level', 'no_aggro', 'true_detect',
               'ambush'}

# Plain words for each field in the CHANGELOG bullets. A field that isn't here goes by its own name.
PLAIN = {'ids': 'spawns', 'nm': 'notorious flag', 'job': 'job', 'levels': 'levels', 'spawn_levels': 'levels',
         'level_mod': 'level', 'crit': 'crit rate', 'tp_moves': 'TP move flag', 'no_swings': 'no swing flag',
         'counters': 'counter flag',
         'ranks': 'magic resistance', 'meva': 'magic evasion', 'resist': 'resist traits',
         'magic_dmg': 'magic damage', 'absorb': 'magic damage', 'nullify': 'magic damage', 'undead': 'undead flag',
         'immune': 'immunities', 'drops': 'drops', 'steal': 'steal items', 'aggro': 'aggro', 'any_level': 'aggro',
         'no_aggro': 'aggro', 'true_detect': 'aggro', 'ambush': 'aggro', 'detects': 'aggro', 'aggro_note': 'aggro',
         'aggro_hours': 'aggro', 'links': 'links', 'ph_for': 'PH spawns', 'ph_rules': 'PH lottery rules', 'loot_conditions': 'loot conditions', 'flags': 'notes'}

# The first line of a zone file, like "-- Valkurm Dunes (zone 103)."
TITLE = re.compile(r'^-- (.+) \(zone \d+\)\.$')

# Item names sit in the comments of the drop lines.
ITEM_LINE = re.compile(r'item = (\d+) \},  -- (.+?)(?:, the despoil entry)?$', re.M)
MEMBER_LINE = re.compile(r'^\s*\{ (\d+), \d+ \},  -- (.+)$', re.M)
GROUP_LINE = re.compile(r'group = \{ (.+) \} \},  -- one of (.+)$', re.M)
# The steal line, or one of its ids on a line of its own when it runs long.
STEAL_LINE = re.compile(r'^\s*steal  = \{ ([\d, ]+) \},  -- (.+)$', re.M)
STEAL_MEMBER = re.compile(r'^\s*(\d+),  -- (.+)$', re.M)

lua = luajit21.LuaRuntime()
load_file = lua.eval('function(path) return assert(loadfile(path))() end')

# drops.lua asks Ashita for item names when it loads. The report only needs its chance math.
lua.execute('AshitaCore = { GetResourceManager = function() return {} end }')
drops = load_file(DROPS_LUA)

# aggro.lua finds data\too_weak.lua through the addon folder.
lua.execute("package.path = [[%s/?.lua;]] .. package.path"
            % os.path.join(os.path.dirname(HERE), 'checkmate').replace('\\', '/'))
aggro = load_file(AGGRO_LUA)
# The link words are keys in core\wording.lua, found through the same folder.
wording = lua.eval("require('core.wording')")


class Folder:
    """
    One data folder with each zone's name and rows, the bands, the Too Weak table, the pet, Steal and crit tables and
    the stamps.
    """

    def __init__(self, root):
        self.zones, self.names, self.link_families = {}, {}, {}
        folder = os.path.join(root, 'zones')
        for file_name in os.listdir(folder):
            if file_name.endswith('.lua'):
                path = os.path.join(folder, file_name)
                # The names first, since the rows name their steal items with them.
                self.read_item_names(path)
                zone = plain(load_file(path))
                number = int(file_name[:-4])
                self.link_families[number] = zone.get('link_families') or {}
                self.zones[number] = (zone_title(path), zone_rows(zone, self.names))
        bands = plain(load_file(os.path.join(root, 'bands.lua')))
        self.built, self.content = bands['built'], bands['content']
        self.bands = {row[0]: row[1:] for row in bands['rows']}
        self.too_weak = by_number(plain(load_file(os.path.join(root, 'too_weak.lua')))['highest'])
        # The extra tables without their stamps. Older builds may not have all of them.
        self.pets = without_stamps(load_file(os.path.join(root, 'pets.lua')))
        steal = os.path.join(root, 'steal.lua')
        self.steal = without_stamps(load_file(steal)) if os.path.exists(steal) else None
        crit = os.path.join(root, 'crit.lua')
        self.crit = without_stamps(load_file(crit)) if os.path.exists(crit) else None
        effects = os.path.join(root, 'effects.lua')
        self.effects = without_stamps(load_file(effects)) if os.path.exists(effects) else None
        modifiers = os.path.join(root, 'modifiers.lua')
        self.modifiers = without_stamps(load_file(modifiers)) if os.path.exists(modifiers) else None
        pdif = os.path.join(root, 'pdif.lua')
        self.pdif = without_stamps(load_file(pdif)) if os.path.exists(pdif) else None
        defenses = os.path.join(root, 'defenses.lua')
        self.defenses = without_stamps(load_file(defenses)) if os.path.exists(defenses) else None
        blue_finder = os.path.join(root, 'blue_finder.lua')
        self.blue_finder = without_stamps(load_file(blue_finder)) if os.path.exists(blue_finder) else None
        self.rows = sum(len(rows) for _, rows in self.zones.values())
        # Data built before jobs came along has none.
        self.has_jobs = any('job' in row for _, rows in self.zones.values() for row in rows)

    def read_item_names(self, path):
        with open(path, encoding='ascii') as handle:
            text = handle.read()
        for item, name in ITEM_LINE.findall(text) + MEMBER_LINE.findall(text) + STEAL_MEMBER.findall(text):
            self.names[int(item)] = name
        for members, listed in GROUP_LINE.findall(text):
            items = re.findall(r'\{ (\d+), \d+ \}', members)
            listed = listed.split(', ')
            if len(items) == len(listed):
                self.names.update(zip(map(int, items), listed))
        for members, listed in STEAL_LINE.findall(text):
            items = members.split(', ')
            listed = listed.split(', ')
            if len(items) == len(listed):
                self.names.update(zip(map(int, items), listed))


def without_stamps(table):
    """A generated file's table without its built and content stamps."""
    return {key: value for key, value in plain(table).items() if key not in ('built', 'content')}


def plain(value):
    """A Lua value as Python. A table keyed 1 to n becomes a list and any other table a dict."""
    if luajit21.lua_type(value) != 'table':
        return value
    keys = list(value.keys())
    if all(isinstance(key, int) for key in keys) and sorted(keys) == list(range(1, len(keys) + 1)):
        return [plain(value[key]) for key in sorted(keys)]
    return {key: plain(value[key]) for key in keys}


def by_number(value):
    """A table keyed by level or spawn index as a dict, even when plain() made a list of it."""
    return dict(enumerate(value, 1)) if isinstance(value, list) else value


def zone_title(path):
    with open(path, encoding='ascii') as handle:
        match = TITLE.match(handle.readline().rstrip('\n'))
    return match.group(1) if match else os.path.basename(path)


def zone_rows(zone, item_names):
    """
    The zone's rows with levels keyed by level, each links number swapped for its names, each with how it links, each
    placeholder's NMs swapped for their names, and the steal items swapped for their names.
    """
    words = {way: [wording.BY_KEY[key].full for key in keys] for way, keys in plain(aggro.LINK_WORDS).items()}
    lists = zone['link_lists'] or []
    rows = zone['monsters'] or []
    name_at = {index: row['name'] for row in rows for index in row['ids']}
    for row in rows:
        row['levels'] = by_number(row['levels'])
        if 'spawn_levels' in row:
            row['spawn_levels'] = by_number(row['spawn_levels'])
        if 'links' in row:
            # Each name with how it links, in the addon's words, so a name that links another way is a change. A
            # group the addon has no words for gives the name on its own, the way the addon prints it.
            groups = lists[row['links'] - 1]
            row['links'] = sorted('%s (%s)' % (name, ', '.join(words[way])) if words[way] else name
                                  for way, names in groups.items() for name in names)
        if 'ph_for' in row:
            # Each PH spawn as "330 for Valkurm Emperor", so an NM that only moved to a new spawn index isn't a change.
            row['ph_for'] = ['%d for %s' % (index, join_words(sorted({name_at.get(nm, str(nm)) for nm in nms})))
                             for index, nms in sorted(by_number(row['ph_for']).items())]
        if 'steal' in row:
            # By name and sorted, so an item that only got a new id or a new place in the list isn't a change.
            row['steal'] = sorted(item_names.get(item, 'item %d' % item) for item in row['steal'])
    return rows


def pair_rows(old_rows, new_rows):
    """(old, new) for every row. A row only in the old data pairs with None, and the other way round."""
    old_left = {(row['name'], tuple(row['ids'])): row for row in old_rows}
    new_left = {(row['name'], tuple(row['ids'])): row for row in new_rows}
    pairs = [(old_left.pop(key), new_left.pop(key)) for key in list(old_left) if key in new_left]
    # A monster whose spawn indexes changed still pairs up when it's the only one left with its name on both sides.
    for name in sorted({key[0] for key in old_left}):
        olds = [key for key in old_left if key[0] == name]
        news = [key for key in new_left if key[0] == name]
        if len(olds) == 1 and len(news) == 1:
            pairs.append((old_left.pop(olds[0]), new_left.pop(news[0])))
    pairs += [(row, None) for row in old_left.values()]
    pairs += [(None, row) for row in new_left.values()]
    return sorted(pairs, key=lambda pair: (pair[0] or pair[1])['name'])


def changed_fields(old, new):
    fields = set(old) | set(new)
    order = FIELD_ORDER + sorted(fields - set(FIELD_ORDER) - {'name'})
    return [field for field in order if field in fields and old.get(field) != new.get(field)]


def join_words(words):
    words = list(words)
    return words[0] if len(words) == 1 else ', '.join(words[:-1]) + ' and ' + words[-1]


def shorten(words, most=5):
    words = list(words)
    return words if len(words) <= most else words[:most] + ['%d more' % (len(words) - most)]


def count(number, word):
    return '%d %s%s' % (number, word, '' if number == 1 else 's')


def level_span(levels):
    """Levels as "17-20" when they run on, or one by one when they don't."""
    levels = sorted(levels)
    if not levels:
        return 'none'
    if levels == list(range(levels[0], levels[-1] + 1)):
        return str(levels[0]) if len(levels) == 1 else '%d-%d' % (levels[0], levels[-1])
    return ', '.join(map(str, levels))


def levels_text(levels):
    """Like "level 75" or "levels 1-5"."""
    return ('level %s' if len(levels) == 1 else 'levels %s') % level_span(levels)


def value_text(value):
    if value is None:
        return 'none'
    if isinstance(value, list):
        return '-'.join(map(str, value))
    return str(value).lower() if isinstance(value, bool) else str(value)


def job_text(job):
    """A row's job as players write it, like DRK/WAR, DRK/DRK or WAR with no support job, or no job."""
    if not job:
        return 'no job'
    main, sub = job.upper().split('/')
    return ('%s with no support job' % main) if sub == 'NONE' else '%s/%s' % (main, sub)


def describe(field, old, new):
    """A few words on how one field changed, like "ranks (ice 4 to 3)"."""
    if field == 'levels':
        if set(old) != set(new):
            return 'levels (%s to %s)' % (level_span(old), level_span(new))
        moved = [level for level in old if old[level] != new[level]]
        stats = {stat for level in moved for stat in set(old[level]) | set(new[level])
                 if old[level].get(stat) != new[level].get(stat)}
        return 'levels (%s at %s)' % (join_words(sorted(stats)), levels_text(moved))
    if field == 'drops':
        return 'drops'
    if field == 'job':
        return 'job (%s to %s)' % (job_text(old), job_text(new))
    if field in SET_FIELDS:
        gained = [str(value) for value in new or [] if value not in (old or [])]
        lost = [str(value) for value in old or [] if value not in (new or [])]
        parts = (['gains ' + join_words(shorten(gained))] if gained else []) + \
                (['loses ' + join_words(shorten(lost))] if lost else [])
        return '%s (%s)' % (LABELS.get(field, field), ', '.join(parts) or 'new order')
    if isinstance(old, dict) or isinstance(new, dict):
        old, new = old or {}, new or {}
        keys = sorted(key for key in set(old) | set(new) if old.get(key) != new.get(key))
        moves = ['%s %s to %s' % (key, value_text(old.get(key)), value_text(new.get(key))) for key in keys]
        return '%s (%s)' % (field, ', '.join(shorten(moves, 4)))
    if field in TRUE_FIELDS:
        old, new = bool(old), bool(new)
    return '%s (%s to %s)' % (field, value_text(old), value_text(new))


def chance_text(percent):
    """The same as chance_text in core\\printout.lua."""
    return '%d%%' % int(percent + 0.5) if percent >= 9.95 else '%.1f%%' % percent


def chances(rolls):
    """Each item's chance in percent at every Treasure Hunter level, from core\\drops.lua."""
    table = lua.table_from(rolls or [], recursive=True)
    return [{item: chance * 100 for item, chance in drops.chances(table, th).items()} for th in TH_LEVELS]


def drop_table(name, old_rolls, new_rolls, names):
    """A table of the items whose chance moved at some Treasure Hunter level."""
    before, after = chances(old_rolls), chances(new_rolls)
    rows = []
    for item in sorted(set().union(*before, *after), key=lambda item: names.get(item, '')):
        cells = [(chance_text(old.get(item, 0)), chance_text(new.get(item, 0))) for old, new in zip(before, after)]
        if any(old != new for old, new in cells):
            label = names.get(item, 'item %d' % item)
            rows.append('| %s | %s |' % (label, ' | '.join('%s -> %s' % cell for cell in cells)))
    if not rows:
        return ['%s\'s drop list changed, but no item\'s chance moved.' % name, '']
    head = ['%s\'s drop chances, old -> new.' % name, '',
            '| Item | %s |' % ' | '.join('TH %d' % th for th in TH_LEVELS),
            '|---|' + '---|' * len(TH_LEVELS)]
    return head + rows + ['']


def zone_section(title, zone_id, pairs, names):
    """The report lines for one zone, and (kind, CHANGELOG bullet) for each monster that changed."""
    # A name that more than one row on either side shares gets its spawn indexes after it.
    shared = set()
    for side in (0, 1):
        names_seen = [pair[side]['name'] for pair in pairs if pair[side]]
        shared |= {name for name in names_seen if names_seen.count(name) > 1}
    lines, tables, entries = ['## %s (zone %d)' % (title, zone_id), ''], [], []
    for old, new in pairs:
        row = new or old
        label = row['name']
        if label in shared:
            label += ' (%s)' % ', '.join(map(str, shorten(row['ids'])))
        if old is None:
            levels = ', at ' + levels_text(row['levels']) if row['levels'] else ''
            lines.append('- %s is new%s.' % (label, levels))
            entries.append(('new', '%s in %s is new.' % (row['name'], title)))
            continue
        if new is None:
            lines.append('- %s is gone.' % label)
            entries.append(('gone', '%s in %s is gone.' % (row['name'], title)))
            continue
        fields = changed_fields(old, new)
        if not fields:
            continue
        lines.append('- %s changed its %s.' % (label, join_words(describe(field, old.get(field), new.get(field))
                                                                for field in fields)))
        words = []
        for field in fields:
            word = PLAIN.get(field, field)
            if word not in words:
                words.append(word)
        entries.append(('changed', '%s in %s changed its %s.' % (row['name'], title, join_words(words))))
        if 'drops' in fields:
            tables += drop_table(row['name'], old.get('drops'), new.get('drops'), names)
    return lines + [''] + tables, entries


def summary(entries):
    """Like "2 monsters changed and 1 monster is new"."""
    parts = []
    for kind, one, more in (('changed', 'changed', 'changed'), ('new', 'is new', 'are new'),
                            ('gone', 'is gone', 'are gone')):
        number = sum(entry_kind == kind for entry_kind, _ in entries)
        if number:
            parts.append('%s %s' % (count(number, 'monster'), one if number == 1 else more))
    return join_words(parts)


def changed_levels(old, new):
    return [level for level in set(old) | set(new) if old.get(level) != new.get(level)]


def compare(old, new):
    """The report and the CHANGELOG bullets, or (None, None) when nothing but the stamp changed."""
    names = {**old.names, **new.names}
    notes, extra_bullets = [], []
    # When only one side has jobs, every row would change its job, so they're left out this time.
    if old.has_jobs != new.has_jobs:
        for folder in (old, new):
            for _, rows in folder.zones.values():
                for row in rows:
                    row.pop('job', None)
        notes.append('The %s data has each monster\'s job and the %s data doesn\'t, so jobs aren\'t compared this '
                     'time.' % (('new', 'old') if new.has_jobs else ('old', 'new')))
    sections, entries, family_zones = [], [], []
    for zone_id in sorted(set(old.zones) | set(new.zones)):
        old_title, old_rows = old.zones.get(zone_id, (None, []))
        new_title, new_rows = new.zones.get(zone_id, (None, []))
        if old.link_families.get(zone_id, {}) != new.link_families.get(zone_id, {}):
            family_zones.append('%s (zone %d)' % (new_title or old_title, zone_id))
        lines, zone_entries = zone_section(new_title or old_title, zone_id, pair_rows(old_rows, new_rows), names)
        if zone_entries:
            sections.append(lines)
            entries += zone_entries

    if family_zones:
        notes.append('Link family labels changed in %s.' % join_words(shorten(family_zones)))
        extra_bullets.append('Updated family grouping for Links.')

    if old.content != new.content:
        notes.append('The content settings changed from "%s" to "%s".' % (old.content, new.content))
    bands = changed_levels(old.bands, new.bands)
    if bands:
        notes.append('bands.lua changed at %s.' % levels_text(bands))
        extra_bullets.append('The level bands for monsters with no data changed.')
    too_weak = changed_levels(old.too_weak, new.too_weak)
    if too_weak:
        notes.append('too_weak.lua changed for main %s.' % levels_text(too_weak))
        extra_bullets.append('The levels that check Too Weak changed.')
    if old.pets != new.pets:
        notes.append('pets.lua changed.')
        extra_bullets.append('The jug pet levels, the avatar names, the gear that narrows a jug pet\'s level or the '
                             'Beast Affinity merit changed.')
    if old.steal != new.steal:
        notes.append('steal.lua changed.')
        extra_bullets.append('The gear that adds Steal or the level Steal is learned at changed.')
    if old.crit != new.crit:
        notes.append('crit.lua changed.')
        extra_bullets.append('The crit merits or the gear that changes the crits you take changed.')
    if old.effects != new.effects:
        notes.append('effects.lua changed.')
        extra_bullets.append('The effect durations, removal rules, gear or merits changed.')
    if old.modifiers != new.modifiers:
        notes.append('modifiers.lua changed.')
        extra_bullets.append('The supported combat bonuses, merits or their conditions changed.')
    if old.defenses != new.defenses:
        notes.append('defenses.lua changed.')
        extra_bullets.append('Updated Shield and Parry inputs.')
    if old.pdif != new.pdif:
        notes.append('pdif.lua changed.')
        extra_bullets.append('The physical damage multiplier rules changed.')
    if old.blue_finder != new.blue_finder:
        notes.append('blue_finder.lua changed.')
        extra_bullets.append('The Blue Magic source catalogue changed.')
    if not entries and not notes:
        return None, None

    lines = ['# Monster data changes', '',
             'This compares the data built from %s with the data built from %s.' % (old.built, new.built), '',
             'The old data has %d zone files and %d rows. The new data has %d and %d.'
             % (len(old.zones), old.rows, len(new.zones), new.rows), '']
    if entries:
        lines += ['In %s, %s.' % (count(len(sections), 'zone'), summary(entries)), '']
    lines += notes + ([''] if notes else [])
    for number, section in enumerate(sections):
        if len('\n'.join(lines + section)) > REPORT_LIMIT:
            left = len(sections) - number
            lines += ['%d more zone%s changed too. They don\'t fit in a pull request, so run tools\\data_report.py '
                      'on the data from main and from this branch to see them.' % (left, '' if left == 1 else 's'), '']
            break
        lines += section

    bullets = [text for _, text in entries]
    if len(bullets) > MOST_BULLETS:
        bullets = bullets[:MOST_BULLETS - 1] + ['%d more monsters changed too.' % (len(bullets) - MOST_BULLETS + 1)]
    return '\n'.join(lines).rstrip() + '\n', ''.join('- %s\n' % bullet for bullet in bullets + extra_bullets)


def write(path, text):
    with open(path, 'w', encoding='ascii', newline='\n') as handle:
        handle.write(text)


def main():
    parser = argparse.ArgumentParser(description='Report what changed between two checkmate data folders.')
    parser.add_argument('old', help='the data folder before, like a copy of checkmate\\data')
    parser.add_argument('new', help='the data folder after')
    parser.add_argument('--report', help='write the markdown report here instead of printing it')
    parser.add_argument('--bullets', help='write the CHANGELOG.md bullets here')
    args = parser.parse_args()

    report, bullets = compare(Folder(args.old), Folder(args.new))
    if report is None:
        print('No monster data changed. Only the build stamp is different, if anything.')
        return
    if args.report:
        write(args.report, report)
        print('Wrote the report to %s.' % args.report)
    else:
        print(report, end='')
    if args.bullets:
        write(args.bullets, bullets)
        print('Wrote the CHANGELOG bullets to %s.' % args.bullets)


if __name__ == '__main__':
    sys.exit(main())
