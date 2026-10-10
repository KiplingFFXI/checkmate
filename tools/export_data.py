"""
Builds checkmate's monster data from the Phoenix server source.

    python tools\\export_data.py [--repo PATH] [--ref phoenix/live] [--out checkmate\\data] [content options]

It copies the ref into a new temp folder with git archive and works out every monster row. It writes
data\\zones\\<zone id>.lua, data\\bands.lua, data\\too_weak.lua, data\\pets.lua, data\\steal.lua,
data\\crit.lua, data\\effects.lua, data\\modifiers.lua, data\\pdif.lua, data\\defenses.lua and data\\blue_finder.lua,
then prints a short summary.
See tools\\README.txt.
"""
import argparse
import os
import re
import sys
import time

from export import aggro
from export import defenses
from export import bands
from export import blue_finder
from export import battlefields
from export import content
from export import crit
from export import drops
from export import dynamis
from export import effects
from export import encounters
from export import exists
from export import instances
from export import info
from export import launch
from export import lua_writer
from export import mobscripts
from export import modifiers
from export import outside
from export import overlays
from export import pets
from export import pdif
from export import placeholders
from export import rows
from export import species
from export import source_parity
from export import sqlfile
from export import stats
from export import steal
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
        self.placeholders = placeholders.Reader(folder, self.scripts, self.dynamis)
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
        self.fights = battlefields.load(folder, set(self.tables.zones), allowed)
        # The Lua that spawns monsters, read once for exists.py to work out which spawns ever come up.
        self.exists = exists.Index(folder, allowed)
        # The mob scripts whose onSteal returns one item, and the ones a row has checked against its loot.
        self.fixed_steal = steal.check_scripts(folder)
        self.fixed_seen = set()
        # Any script that changes a job, other than the few the readers know, stops the export.
        outside.check_job_changes(folder)
        self.unreadable = []
        self.skipped = []
        self.info = info.Reader(folder, self.tables, self.scripts, self.roots, allowed)
        self.encounters = encounters.Reader(folder, self.tables, self.scripts, self.roots, allowed)


def map_settings(folder):
    """The plain NAME = value lines of settings/default/map.lua."""
    values = {}
    with open(os.path.join(folder, 'settings', 'default', 'map.lua'), encoding='utf-8') as source_file:
        for line in source_file:
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
    parity_note = source_parity.check(folder)
    ctx = Context(folder, allowed)
    modifier_data = modifiers.build(folder, ctx.roots, allowed)
    source_parity.check_modifiers(folder, modifier_data)
    # The Steal and crit checks and tables come first, since they're quick and the zones take most of the run.
    steal.check_roll(folder)
    steal.check_traits(ctx.tables)
    steal_ability, steal_items, steal_latents = steal.ability(folder), steal.gear(folder), steal.latents(folder)
    steal.check_module_sql(folder, set(steal_items) | set(steal_latents))
    defense_data = defenses.build(folder, overlays.data_roots(folder), allowed)
    pdif_data = pdif.build(folder, ctx.roots, allowed)
    effect_data = effects.build(folder, ctx.roots, allowed)
    crit.check_traits(ctx.tables)
    crit_items = crit.gear(folder)
    crit.check_latents(folder)
    crit.check_module_sql(folder, set(crit_items))
    crit.check_yonin(folder, allowed)
    crit.check_scripts(folder)
    exists.check_module_sql(folder, ctx.exists)
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
    unseen = sorted(set(ctx.fixed_steal) - ctx.fixed_seen)
    if unseen:
        raise RuntimeError('scripts/zones/%s/mobs/%s.lua has an onSteal for a monster with no row. Check FIXED_STEAL '
                           'in export\\steal.py.' % unseen[0])

    out_zones = os.path.join(out, 'zones')
    os.makedirs(out_zones, exist_ok=True)
    for old in os.listdir(out_zones):
        if old.endswith('.lua'):
            os.remove(os.path.join(out_zones, old))
    written, zone_sizes, total_rows = [], [], 0
    finder = blue_finder.Builder()
    for number, script_dir, kinds in built:
        finished = []
        for kind in kinds:
            row = rows.finish(kind, ctx.tables)
            details, by_index = ctx.info.read(kind, row['levels'])
            encounter, encounter_indexes = ctx.encounters.read(kind, row['levels'])
            details.update(encounter)
            for index, sections in encounter_indexes.items():
                by_index.setdefault(index, {}).update(sections)
            row['info'] = details
            if by_index:
                row['info_by_index'] = by_index
            finished.append(row)
        if not finished:
            continue
        finished.sort(key=lambda row: row['ids'][0])
        display = script_dir.replace('_', ' ')
        finder.add_zone(number, display, finished)
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
    jugs, avatars = pets.jugs(ctx.tree), pets.avatars(ctx.tree)
    affinity = pets.beast_affinity(ctx.tree, ctx.roots)
    pets_path = os.path.join(out, 'pets.lua')
    pets_size = len(lua_writer.write_pets(pets_path, jugs, avatars, pets.jug_range_items(ctx.tree), affinity, stamp))
    steal_path = os.path.join(out, 'steal.lua')
    steal_size = len(lua_writer.write_steal(steal_path, steal_ability, steal_items, steal_latents, stamp))
    crit_merits, crit_caps = crit.merits(ctx.tree, ctx.roots)
    crit_path = os.path.join(out, 'crit.lua')
    crit_size = len(lua_writer.write_crit(crit_path, crit_merits, crit_caps, crit_items, stamp))
    effects_path = os.path.join(out, 'effects.lua')
    effects_size = len(lua_writer.write_effects(effects_path, effect_data, stamp))
    modifiers_path = os.path.join(out, 'modifiers.lua')
    modifiers.write(modifiers_path, modifier_data, stamp.built, stamp.content)
    modifiers_size = os.path.getsize(modifiers_path)
    pdif_path = os.path.join(out, 'pdif.lua')
    pdif_text = pdif.write(pdif_path, pdif_data, stamp)
    if count_constants(pdif_text) > CONSTANT_LIMIT:
        raise RuntimeError('pDIF metadata exceeds the LuaJIT constant limit.')
    pdif_size = len(pdif_text)
    defenses_path = os.path.join(out, 'defenses.lua')
    defenses_text = defenses.write(defenses_path, defense_data, stamp)
    if count_constants(defenses_text) > CONSTANT_LIMIT:
        raise RuntimeError('Shield and Parry metadata exceeds the LuaJIT constant limit.')
    finder_data = finder.finish()
    finder_path = os.path.join(out, 'blue_finder.lua')
    finder_text = blue_finder.write(finder_path, finder_data, stamp)
    if count_constants(finder_text) > CONSTANT_LIMIT:
        raise RuntimeError('Blue finder exceeds the LuaJIT constant limit; review its layout before exporting')
    note = load_check(written + [bands_path, too_weak_path, pets_path, steal_path, crit_path, effects_path, modifiers_path, finder_path, pdif_path, defenses_path])
    total_size = (sum(entry[0] for entry in zone_sizes) + bands_size + too_weak_size + pets_size + steal_size
                  + crit_size + effects_size + modifiers_size + len(finder_text) + pdif_size + len(defenses_text))
    return {'files': len(written), 'rows': total_rows, 'zone_sizes': zone_sizes, 'total_size': total_size,
            'bands': band_rows, 'note': note, 'skipped': len(ctx.skipped), 'too_weak': too_weak,
            'too_weak_sources': sources, 'jugs': len(jugs), 'avatars': len(avatars), 'affinity': affinity,
            'steal_ability': steal_ability, 'steal_items': len(steal_items), 'steal_latents': len(steal_latents),
            'crit_merits': crit_merits, 'crit_caps': crit_caps, 'crit_items': len(crit_items),
            'effects': effect_data, 'modifiers': modifier_data, 'blue_finder': finder_data, 'parity_note': parity_note}


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
    print('%d zone files, %d rows, %.2f MB with bands.lua, too_weak.lua, pets.lua, steal.lua, crit.lua, effects.lua, modifiers.lua, pdif.lua, defenses.lua and blue_finder.lua. Biggest '
          'is %s (zone %d) at %.1f KB.' % (result['files'], result['rows'], result['total_size'] / 1048576.0,
                                         biggest[2], biggest[1], biggest[0] / 1024.0))
    print('bands.lua has %d levels. Level 75 is %s.' % (len(result['bands']), level_75[0] if level_75 else 'missing'))
    print('too_weak.lua comes from %s. At level 75, level %d and below checks Too Weak.'
          % (' and '.join(result['too_weak_sources']), result['too_weak'][75]))
    affinity = result['affinity']
    print('pets.lua has %d jug pets and %d avatars. Beast Affinity adds %d levels a merit, up to %d merits.'
          % (result['jugs'], result['avatars'], affinity['per_merit'], affinity['most']))
    latents = result['steal_latents']
    print('steal.lua has %d items that add Steal and %d more that only add%s it at low HP. Steal is %s\'s from '
          'level %d.' % (result['steal_items'], latents, 's' if latents == 1 else '',
                         tables.JOBS[result['steal_ability']['job']].upper(), result['steal_ability']['level']))
    rate, enemy = (result['crit_merits'][name] for name in crit.MERITS)
    most = max(rate['most'], enemy['most'])
    print('crit.lua has %d items with critical hit evasion. Critical Hit Rate adds %d%% a merit, up to %d, and Enemy '
          'Critical Hit Rate takes off %d%% a merit, up to %d, all of them from level %d.'
          % (result['crit_items'], rate['per_merit'], rate['most'], enemy['per_merit'], enemy['most'],
             next(level for level, cap in result['crit_caps'] if cap >= most)))
    effect_data = result['effects']
    print('effects.lua has %d spells, %d abilities, %d TP moves, %d pet moves, %d effects, %d icons and %d gear items.'
          % tuple([len(effect_data[key]) for key in ('spells', 'abilities', 'skills', 'pacts', 'effects', 'pictured')]
                  + [len(set().union(*(set(items) for items in effect_data['gear'].values())))]))
    if result['skipped']:
        count = result['skipped']
        print('Skipped %d instance spawn%s with no mob_groups or mob_pools row.' % (count, '' if count == 1 else 's'))
    print(result['parity_note'])
    print('modifiers.lua has %d items with supported bonuses or named conditions.' % len(result['modifiers']['items']))
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
