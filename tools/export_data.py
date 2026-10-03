"""
Builds checkmate's monster data from the Phoenix server source.

    python tools\\export_data.py [--repo PATH] [--ref phoenix/live] [--out checkmate\\data] [content options]

It copies the ref into a new temp folder with git archive and works out every monster row. It writes
data\\zones\\<zone id>.lua, data\\bands.lua and data\\too_weak.lua, then prints a short summary. See tools\\README.txt.
"""
import argparse
import os
import re
import sys
import time

from export import aggro
from export import bands
from export import battlefields
from export import content
from export import drops
from export import dynamis
from export import instances
from export import launch
from export import lua_writer
from export import mobscripts
from export import outside
from export import overlays
from export import rows
from export import species
from export import sqlfile
from export import stats
from export import tables
from export import tree
from export import zones

HERE = os.path.dirname(os.path.abspath(__file__))
# The Phoenix clone in a folder named Phoenix next to this project.
DEFAULT_REPO = os.path.join(os.path.dirname(os.path.dirname(HERE)), 'Phoenix')
DEFAULT_OUT = os.path.join(os.path.dirname(HERE), 'checkmate', 'data')

# Zone ids that are not era content on Phoenix. They are the WotG [S] zones, Einherjar, Pankration, Abyssea,
# SoA and later, Walk of Echoes, Legion, and GM or unused zones. Every other zone up to 252 is Original, RoZ, CoP
# or ToAU.
EXCLUDED_ZONE_IDS = ({0, 15, 43, 44, 45, 49, 71, 78, 129, 131, 132, 133, 136, 137, 138, 155, 156, 164, 171, 175,
                      182, 183, 189, 199, 210, 214, 215, 216, 217, 218, 219, 222, 229}
                     | set(range(80, 100)) | set(range(253, 400)))

# The band table stops at this level.
BAND_TOP_LEVEL = 90

# A generated file must stay well under LuaJIT's 65536 constants in one function.
CONSTANT_LIMIT = 65000


class Stamp:
    def __init__(self, built, content_text):
        self.built = built
        self.content = content_text


class Context:
    """Everything the zone readers share."""

    def __init__(self, folder, allowed):
        self.tree = folder
        self.content = allowed
        self.roots = overlays.data_roots(folder)
        self.tables = tables.Tables(folder, allowed)
        self.species_by_name, self.species_by_id = species.load(folder, self.roots)
        self.scripts = mobscripts.ScriptIndex(folder, set(self.tables.immunities), self.tables.mod_aliases)
        self.items = drops.item_ids(folder)
        self.dynamis = dynamis.Dynamis(folder)
        self.launch = launch.load(folder)
        self.zone_dirs = {number: name for name, number in self.tables.zones.items()}
        self.script_dirs = {row['zoneid']: row['name'] for row in
                            sqlfile.rows(os.path.join(folder, 'sql', 'zone_settings.sql'), 'zone_settings')}
        self.subjob_zones = stats.load_subjob_zones(folder, self.tables.zones)
        settings = map_settings(folder)
        if settings.get('INCLUDE_MOB_SJ'):
            raise RuntimeError('INCLUDE_MOB_SJ is on. The stat port assumes a sub level equal to the main level.')
        self.mob_multiplier = multiplier(settings.get('MOB_STAT_MULTIPLIER', 1.0))
        self.nm_multiplier = multiplier(settings.get('NM_STAT_MULTIPLIER', 1.0))
        self.instance_sql = instances.Sql(folder)
        built_dirs = {name for number, name in self.script_dirs.items() if number not in EXCLUDED_ZONE_IDS}
        self.outside = outside.scan(folder, self.scripts, built_dirs)
        self.aggro = aggro.Reader(folder, self.tables, self.scripts)
        self.fights = battlefields.load(folder, set(self.tables.zones))
        self.unreadable = []
        self.skipped = []


def map_settings(folder):
    """The plain NAME = value lines of settings/default/map.lua."""
    values = {}
    for line in open(os.path.join(folder, 'settings', 'default', 'map.lua'), encoding='utf-8'):
        match = re.match(r'\s*([A-Z0-9_]+)\s*=\s*([^,]+),', line.split('--')[0])
        if match:
            text = match.group(2).strip()
            values[match.group(1)] = text == 'true' if text in ('true', 'false') else text
    return values


def multiplier(value):
    """The server only uses a stat multiplier between 0.1 and 2.0."""
    value = float(value)
    return value if 0.1 <= value <= 2.0 else 1.0


def zone_list(ctx):
    """(zone id, YAML folder, script folder, zone types) for every era zone with monster data."""
    zones = []
    for number in sorted(ctx.zone_dirs):
        if number in EXCLUDED_ZONE_IDS:
            continue
        name = ctx.zone_dirs[number]
        folder = os.path.join(ctx.tree, 'data', 'zones', name)
        if not os.path.exists(os.path.join(folder, 'mobs.yaml')):
            continue
        zone_yaml = overlays.load_yaml(os.path.join(folder, 'zone.yaml')) or {}
        zones.append((number, name, ctx.script_dirs[number], species.names(zone_yaml.get('type'))))
    return zones


def check_unreadable(ctx):
    problems = ctx.unreadable
    if problems:
        raise RuntimeError('The exporter can\'t read these monster script calls:\n  ' + '\n  '.join(sorted(set(problems))))


def count_constants(text):
    """A high estimate of the constants LuaJIT needs for one file. It counts every table and distinct literal."""
    tables_made = text.count('{')
    literals = set(re.findall(r"'(?:[^'\\]|\\.)*'", text)) | set(re.findall(r'(?<![\w.])-?\d+(?![\w.])', text))
    return tables_made + len(literals)


def load_check(paths):
    """Loads every file with lupa's LuaJIT when lupa is installed. Returns a note for the summary."""
    try:
        from lupa import luajit21
    except ImportError:
        return 'Skipped the LuaJIT load check because lupa is not installed.'
    runtime = luajit21.LuaRuntime()
    loader = runtime.eval('function(path) local chunk, err = loadfile(path) if not chunk then return err end '
                          'local ok, data = pcall(chunk) if not ok then return data end '
                          'if type(data) ~= "table" then return "no table" end return nil end')
    for path in paths:
        error = loader(path.replace('\\', '/'))
        if error:
            raise RuntimeError('%s does not load in LuaJIT: %s' % (path, error))
    return 'All %d files load in LuaJIT.' % len(paths)


def build_files(folder, allowed, stamp, out):
    """Reads the source tree in folder and writes every data file. Returns the numbers for the summary."""
    ctx = Context(folder, allowed)
    built, band_kinds = [], []
    for number, name, script_dir, types in zone_list(ctx):
        if 'instanced' in types:
            kinds = instances.build(ctx, number, script_dir)
        else:
            kinds = zones.build(ctx, name, script_dir, 'dynamis' in types)
        band_kinds += kinds
        kinds = [kind for kind in kinds if kind.in_file]
        for kind in kinds:
            kind.flags |= ctx.outside.get((script_dir, kind.script), set())
        built.append((number, script_dir, kinds))
    check_unreadable(ctx)

    out_zones = os.path.join(out, 'zones')
    os.makedirs(out_zones, exist_ok=True)
    for old in os.listdir(out_zones):
        if old.endswith('.lua'):
            os.remove(os.path.join(out_zones, old))
    written, zone_sizes, total_rows = [], [], 0
    for number, script_dir, kinds in built:
        finished = [rows.finish(kind, ctx.tables) for kind in kinds]
        if not finished:
            continue
        finished.sort(key=lambda row: row['ids'][0])
        display = script_dir.replace('_', ' ')
        path = os.path.join(out_zones, '%d.lua' % number)
        text = lua_writer.write_zone(path, number, display, finished, stamp)
        constants = count_constants(text)
        if constants > CONSTANT_LIMIT:
            raise RuntimeError('%s needs about %d constants, over the %d limit' % (path, constants, CONSTANT_LIMIT))
        written.append(path)
        zone_sizes.append((len(text), number, display))
        total_rows += len(finished)

    band_rows = [band for band in bands.build(ctx.tables, band_kinds) if band[0] <= BAND_TOP_LEVEL]
    bands_path = os.path.join(out, 'bands.lua')
    bands_size = len(lua_writer.write_bands(bands_path, band_rows, stamp))
    sources, too_weak = aggro.too_weak_table(folder, allowed)
    too_weak_path = os.path.join(out, 'too_weak.lua')
    too_weak_size = len(lua_writer.write_too_weak(too_weak_path, sources, too_weak, stamp))
    note = load_check(written + [bands_path, too_weak_path])
    total_size = sum(entry[0] for entry in zone_sizes) + bands_size + too_weak_size
    return {'files': len(written), 'rows': total_rows, 'zone_sizes': zone_sizes, 'total_size': total_size,
            'bands': band_rows, 'note': note, 'skipped': len(ctx.skipped), 'too_weak': too_weak,
            'too_weak_sources': sources}


def export(args):
    started = time.time()
    commit, short = tree.resolve(args.repo, args.ref)
    allowed = content.Content(args.restrict_content == 'on', args.content.split(',') if args.content else [])
    stamp = Stamp('%s %s' % (args.ref, short), allowed.stamp())
    folder = tree.extract(args.repo, commit)
    try:
        result = build_files(folder, allowed, stamp, args.out)
    finally:
        tree.remove(folder)
    biggest = max(result['zone_sizes'])
    level_75 = [band for band in result['bands'] if band[0] == 75]
    print('Built from %s (%s).' % (stamp.built, stamp.content))
    print('%d zone files, %d rows, %.2f MB with bands.lua and too_weak.lua. Biggest is %s (zone %d) at %.1f KB.'
          % (result['files'], result['rows'], result['total_size'] / 1048576.0,
             biggest[2], biggest[1], biggest[0] / 1024.0))
    print('bands.lua has %d levels. Level 75 is %s.' % (len(result['bands']), level_75[0] if level_75 else 'missing'))
    print('too_weak.lua comes from %s. At level 75, level %d and below checks Too Weak.'
          % (' and '.join(result['too_weak_sources']), result['too_weak'][75]))
    if result['skipped']:
        count = result['skipped']
        print('Skipped %d instance spawn%s with no mob_groups or mob_pools row.' % (count, '' if count == 1 else 's'))
    print(result['note'])
    print('Took %.0f s.' % (time.time() - started))


def main():
    parser = argparse.ArgumentParser(description='Build checkmate monster data from the Phoenix source.')
    parser.add_argument('--repo', default=DEFAULT_REPO, help='the Phoenix git checkout (only read)')
    parser.add_argument('--ref', default='phoenix/live', help='the branch or commit to read')
    parser.add_argument('--out', default=DEFAULT_OUT, help='the addon data folder to write into')
    parser.add_argument('--restrict-content', choices=['on', 'off'], default='on',
                        help='the server RESTRICT_CONTENT setting')
    parser.add_argument('--content', default=','.join(content.DEFAULT_ON),
                        help='comma list of the ENABLE_<TAG> settings that are on, such as rotz,cop,toau')
    export(parser.parse_args())


if __name__ == '__main__':
    sys.exit(main())
