"""Compare flat and shared zone tables in LuaJIT without loading the addon or contacting the game."""
import argparse
from copy import deepcopy
import json
from pathlib import Path
import re
import statistics
import tempfile
from time import perf_counter
from types import SimpleNamespace
import zipfile

from lupa import luajit21

from export import blue_finder, lua_writer

MAP_FIELDS = {'levels', 'spawn_levels', 'ph_for', 'ph_rules', 'ph_rules_nm', 'info_by_index'}


def python_value(value, field=None):
    if luajit21.lua_type(value) != 'table':
        return value
    pairs = {key: python_value(child, 'ph_rules_nm' if field == 'ph_rules' else key) for key, child in value.items()}
    if field not in MAP_FIELDS and pairs and set(pairs) == set(range(1, len(pairs) + 1)):
        return [pairs[index] for index in range(1, len(pairs) + 1)]
    return pairs


def input_rows(zone):
    """Restore the writer-only item comments and link references; neither changes the loaded data."""
    rows = deepcopy(zone['monsters'])
    lists = zone.get('link_lists', [])
    for row in rows:
        if isinstance(row.get('links'), int):
            row['links'] = deepcopy(lists[row['links'] - 1])
        if 'steal' in row:
            row['steal'] = [(item, str(item)) for item in row['steal']]
        for drop in row.get('drops', ()):
            if 'item' in drop:
                drop['name'] = str(drop['item'])
            else:
                drop['group'] = [(item, weight, str(item)) for item, weight in drop['group']]
    return rows


def carry_link_families(text, zone):
    """Keep existing family labels while comparing only the danger storage layout."""
    if 'link_families' not in zone:
        return text
    marker = '\n    monsters = {'
    if text.count(marker) != 1:
        raise RuntimeError('Cannot place the existing link family metadata in the benchmark zone.')
    families = '{ %s }' % ', '.join('[%s] = %s' % (lua_writer.quote(name), lua_writer.effect_value(value))
                                    for name, value in sorted(zone['link_families'].items()))
    field = '\n    link_families = %s,' % families
    return text.replace(marker, field + marker, 1)


def files(path):
    if path.suffix.lower() == '.zip':
        with zipfile.ZipFile(path) as archive:
            return {int(Path(name).stem): archive.read(name).decode('ascii') for name in archive.namelist()
                    if re.search(r'(?:^|/)data/zones/\d+\.lua$', name)}
    folder = path / 'zones' if (path / 'zones').is_dir() else path
    return {int(item.stem): item.read_text(encoding='ascii') for item in folder.glob('*.lua') if item.stem.isdigit()}


def zone_name(text, number):
    match = re.match(r'-- (.*?) \(zone \d+\)\.', text)
    return match.group(1) if match else 'Zone %d' % number


def probe(lua):
    return lua.eval('''function(source, now)
        collectgarbage('collect')
        local before = collectgarbage('count')
        local started = now()
        local chunk = assert(loadstring(source))
        local value = chunk()
        local elapsed = now() - started
        chunk = nil
        collectgarbage('collect')
        local retained = collectgarbage('count') - before
        assert(type(value) == 'table')
        return elapsed * 1000, retained
    end''')


def equality(lua):
    return lua.eval('''function(a, b)
        local function equal(x, y, path)
            if type(x) ~= type(y) then return path .. ': type' end
            if type(x) ~= 'table' then
                if x ~= y then return path .. ': value' end
                return nil
            end
            for key, value in pairs(x) do
                local err = equal(value, y[key], path .. '.' .. tostring(key))
                if err then return err end
            end
            for key in pairs(y) do
                if x[key] == nil then return path .. '.' .. tostring(key) .. ': extra key' end
            end
        end
        return equal(a, b, 'zone')
    end''')


def summarize(rows, mode):
    return {'bytes': sum(row[mode]['bytes'] for row in rows),
            'median_zone_load_ms': statistics.median(row[mode]['load_ms'] for row in rows),
            'sum_zone_load_ms': sum(row[mode]['load_ms'] for row in rows),
            'median_zone_retained_kib': statistics.median(row[mode]['retained_kib'] for row in rows),
            'sum_zone_retained_kib': sum(row[mode]['retained_kib'] for row in rows),
            'largest_retained_zone': max(rows, key=lambda row: row[mode]['retained_kib'])['zone']}


def source_facts(number, name, rows):
    """Enumerate every lesson/spawn context independently of the catalogue builder."""
    facts = set()
    for row in rows:
        for index in row.get('ids', ()) or (None,):
            sections = dict(row.get('info', {}))
            sections.update(row.get('info_by_index', {}).get(index, {}))
            blue = sections.get('blue', {})
            levels = sorted(level for level in row.get('levels', {}) if isinstance(level, int) and level > 0)
            bounds = row.get('spawn_levels', {}).get(index)
            if bounds:
                levels = [level for level in levels if bounds[0] <= level <= bounds[1]]
                if not levels:
                    levels = list(range(bounds[0], bounds[1] + 1))
            context = []
            for section, label in (('spawn', 'Spawn'), ('fight', 'Fight')):
                value = sections.get(section, {})
                if value.get('value'):
                    context.append(label + ': ' + value['value'])
                context.extend(value.get('notes', ()))
            for spell in blue.get('spells', ()):
                fact = {'spell': {key: spell[key] for key in ('id', 'name', 'level', 'min_skill') if key in spell},
                        'zone': number, 'zone_name': name, 'name': row['name'], 'index': index,
                        'levels': levels, 'notes': list(blue.get('notes', ())),
                        'incomplete': bool(blue.get('incomplete')), 'context': list(dict.fromkeys(context)),
                        'skill_ids': sorted(set(spell.get('skill_ids', ())))}
                facts.add(lua_writer.identity(fact))
    return facts


def catalogue_facts(data):
    facts = set()
    for spell in data['spells']:
        for place in spell['monsters']:
            for index in place.get('indices', ()) or (None,):
                levels = [level for low, high in place.get('level_ranges', ()) for level in range(low, high + 1)]
                if levels and (place.get('low') != min(levels) or place.get('high') != max(levels)):
                    raise RuntimeError('Finder level envelope does not match its exact ranges')
                fact = {'spell': {key: spell[key] for key in ('id', 'name', 'level', 'min_skill') if key in spell},
                        'zone': place['zone'], 'zone_name': place['zone_name'], 'name': place['name'], 'index': index,
                        'levels': levels, 'notes': list(place.get('notes', ())),
                        'incomplete': bool(place.get('incomplete')), 'context': list(place.get('context', ())),
                        'skill_ids': list(place.get('skill_ids', ()))}
                key = lua_writer.identity(fact)
                if key in facts:
                    raise RuntimeError('Finder repeats an identical source context')
                facts.add(key)
    return facts


def run(source, repetitions):
    chunks = files(source)
    if not chunks:
        raise RuntimeError('No zone files found in %s' % source)
    lua = luajit21.LuaRuntime(unpack_returned_tuples=True)
    same, measure = equality(lua), probe(lua)
    rows = []
    expected = set()
    finder = blue_finder.Builder()
    with tempfile.TemporaryDirectory(prefix='checkmate_sharing_') as folder:
        path = Path(folder) / 'zone.lua'
        for number, original in sorted(chunks.items()):
            loaded = lua.execute(original)
            data = python_value(loaded)
            inputs = input_rows(data)
            name = zone_name(original, number)
            stamp = SimpleNamespace(built=data['built'], content=data['content'])
            flat = carry_link_families(lua_writer.write_zone(path, number, name, inputs, stamp, share_dangers=False), data)
            shared = carry_link_families(lua_writer.write_zone(path, number, name, inputs, stamp), data)
            for label, candidate in (('flat', flat), ('shared', shared)):
                error = same(loaded, lua.execute(candidate))
                if error:
                    raise RuntimeError('Zone %d %s changed %s' % (number, label, error))
            loaded = None
            samples = {label: [] for label in ('original', 'flat', 'shared')}
            texts = {'original': original, 'flat': flat, 'shared': shared}
            for repeat in range(repetitions):
                order = ('original', 'flat', 'shared') if repeat % 2 == 0 else ('shared', 'flat', 'original')
                for label in order:
                    samples[label].append(measure(texts[label], perf_counter))
            result = {'zone': number, 'name': name}
            for label, values in samples.items():
                result[label] = {'bytes': len(texts[label].encode('ascii')),
                                 'load_ms': statistics.median(value[0] for value in values),
                                 'retained_kib': statistics.median(value[1] for value in values)}
            rows.append(result)
            finder.add_zone(number, name, inputs)
            expected.update(source_facts(number, name, inputs))
        catalogue = finder.finish()
        catalogue_text = blue_finder.write(Path(folder) / 'finder.lua', catalogue, stamp)
        actual = catalogue_facts(python_value(lua.execute(catalogue_text)))
        if actual != expected:
            raise RuntimeError('Finder source identity mismatch: %d missing, %d extra' % (len(expected - actual), len(actual - expected)))
        generated_match = None
        generated = source / 'blue_finder.lua'
        if source.is_dir() and generated.is_file():
            stored = lua.execute(generated.read_text(encoding='ascii'))
            error = same(lua.execute(catalogue_text), stored)
            if error:
                raise RuntimeError('Generated Blue finder changed %s' % error)
            generated_match = True
            stored = None
        finder_samples = [measure(catalogue_text, perf_counter) for _ in range(repetitions)]
    return {'source': str(source), 'zones': len(rows), 'semantic_match': True,
            'repetitions': repetitions, 'runtime': lua.eval('_VERSION .. " / " .. jit.version'),
            'method': 'Wall time for loadstring plus execution, using the Python high-resolution clock; '
                      'full GC before and after; retained heap excludes source text. '
                      'Medians per zone, alternating form order. Sums are an offline traversal, not concurrent addon memory or live FPS.',
            'original': summarize(rows, 'original'), 'flat': summarize(rows, 'flat'), 'shared': summarize(rows, 'shared'),
            'finder': {'spells': len(catalogue['spells']), 'places': sum(len(spell['monsters']) for spell in catalogue['spells']),
                       'source_contexts': len(expected), 'all_source_contexts_match': True,
                       'generated_file_match': generated_match,
                       'bytes': len(catalogue_text.encode('ascii')),
                       'load_ms': statistics.median(value[0] for value in finder_samples),
                       'retained_kib': statistics.median(value[1] for value in finder_samples)},
            'details': rows}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--data', type=Path, required=True, help='Data directory, zone directory, or release ZIP.')
    parser.add_argument('--out', type=Path, required=True, help='JSON report path; no addon files are changed.')
    parser.add_argument('--repetitions', type=int, default=7)
    args = parser.parse_args()
    if args.repetitions < 3:
        parser.error('Use at least three repetitions.')
    report = run(args.data, args.repetitions)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, indent=2) + '\n', encoding='ascii')
    print(json.dumps({key: value for key, value in report.items() if key != 'details'}, indent=2))


if __name__ == '__main__':
    main()
