"""A Blue Magic source catalogue built only from the final enabled monster rows."""
import math

from . import lua_writer

VERSION = 1


def ranges(levels):
    out = []
    for level in sorted(set(levels)):
        if out and out[-1][1] + 1 == level:
            out[-1][1] = level
        else:
            out.append([level, level])
    return out


def level_ranges(row, index):
    levels = [level for level in row.get('levels', {})
              if isinstance(level, int) and not isinstance(level, bool) and level > 0]
    own = row.get('spawn_levels', {}).get(index)
    if own:
        low, high = own
        levels = [level for level in levels if low <= level <= high]
        if not levels:
            return [[low, high]]
    return ranges(levels)


def effective(row, index):
    values = dict(row.get('info', {}))
    values.update(row.get('info_by_index', {}).get(index, {}))
    return values


def context(sections):
    lines = []
    for key, label in (('spawn', 'Spawn'), ('fight', 'Fight')):
        section = sections.get(key)
        if not isinstance(section, dict):
            continue
        value = section.get('value')
        if isinstance(value, str) and value:
            lines.append(label + ': ' + value)
        lines.extend(note for note in section.get('notes', ()) if isinstance(note, str) and note)
    return list(dict.fromkeys(lines))


def nonnegative(value):
    return isinstance(value, (int, float)) and not isinstance(value, bool) and math.isfinite(value) and value >= 0


class Builder:
    def __init__(self):
        self.spells, self.places, self.zones = {}, {}, set()

    def add_zone(self, number, name, rows):
        self.zones.add(number)
        for row in rows:
            for index in row.get('ids', ()) or (None,):
                sections = effective(row, index)
                blue = sections.get('blue')
                if not isinstance(blue, dict):
                    continue
                for spell in blue.get('spells', ()):
                    unknown = set(spell) - {'id', 'name', 'level', 'min_skill', 'skill_ids'}
                    if unknown:
                        raise RuntimeError('Blue finder cannot display these spell conditions: %s' % ', '.join(sorted(unknown)))
                    spell_id = spell.get('id')
                    if not isinstance(spell_id, int) or isinstance(spell_id, bool) or spell_id <= 0:
                        raise RuntimeError('Blue finder received an invalid spell id')
                    base = {key: spell[key] for key in ('id', 'name', 'level', 'min_skill') if key in spell}
                    if not isinstance(base.get('name'), str) or not base['name']:
                        raise RuntimeError('Blue finder received a spell without a name')
                    if 'min_skill' in base and not nonnegative(base['min_skill']):
                        raise RuntimeError('Blue finder received an invalid skill requirement')
                    if spell_id in self.spells and self.spells[spell_id] != base:
                        raise RuntimeError('Blue finder received conflicting details for spell %d' % spell_id)
                    self.spells[spell_id] = base
                    levels = level_ranges(row, index)
                    place = {'zone': number, 'zone_name': name, 'name': row['name'],
                             'incomplete': bool(blue.get('incomplete')),
                             'notes': list(blue.get('notes', ())), 'context': context(sections),
                             'skill_ids': sorted(set(spell.get('skill_ids', ())))}
                    if levels:
                        place.update(low=levels[0][0], high=levels[-1][1], level_ranges=levels)
                    key = lua_writer.identity(place)
                    known = self.places.setdefault(spell_id, {}).setdefault(key, dict(place, indices=[]))
                    if index is not None and index not in known['indices']:
                        known['indices'].append(index)

    def finish(self):
        spells = []
        for spell_id, spell in sorted(self.spells.items(), key=lambda pair: (pair[1]['name'].casefold(), pair[0])):
            places = list(self.places[spell_id].values())
            for place in places:
                place['indices'].sort()
            places.sort(key=lambda place: (place['zone_name'].casefold(), place['zone'], place['name'].casefold(),
                                           place.get('low', -1), place.get('high', -1), tuple(place['indices'])))
            spells.append(dict(spell, monsters=places))
        return {'version': VERSION, 'spells': spells,
                'coverage': 'Only possible lessons present in the enabled monster data are listed. Missing entries do not establish that a spell has no source.',
                'zones': len(self.zones)}


def write(path, data, stamp):
    lines = ['-- Possible Blue Magic source places from the final enabled monster rows.'] + lua_writer.stamp_lines(stamp)
    shared = lua_writer.SharedValues(data['spells'])
    lines += shared.lines()
    lines += ['return {', '    version = %d,' % data['version'],
              '    built = %s,' % lua_writer.quote(stamp.built),
              '    content = %s,' % lua_writer.quote(stamp.content),
              '    coverage = %s,' % lua_writer.quote(data['coverage']), '    spells = {']
    for spell in data['spells']:
        lines.append('        {')
        for key in ('id', 'name', 'level', 'min_skill'):
            if key in spell:
                lines.append('            %s = %s,' % (key, lua_writer.effect_value(spell[key])))
        lines.append('            monsters = {')
        for place in spell['monsters']:
            lines.append('                %s,' % shared.value(place))
        lines += ['            },', '        },']
    lines += ['    },', '}']
    return lua_writer.write_file(path, lines)
