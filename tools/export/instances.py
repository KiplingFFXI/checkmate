"""
Instanced monsters, Assault and The Ashu Talif among them. Instanced zones skip the zone YAML (zoneutils.cpp
InsertMobs), so instance_loader.cpp builds them from SQL: instance_entities, mob_spawn_points, mob_groups, mob_pools
and mob_resistances.

The loader's ApplySpecies uses the species chain alone. Its resistance ranks overwrite the SQL ones, but its
mods never apply. Jobs and immunities come from mob_pools unless the chain names them. Every copy of an instance
uses the same ids, and each mission has its own indexes. So one file per zone holds every mission. Aggro, true
detection and links come from mob_pools, and detection from the species chain.
"""
import os
import re

from . import links
from . import mobscripts
from . import rows
from . import sqlfile
from .tables import JOBS

# The Assault zones, The Ashu Talif (ToAU 15 and COR AF3) and Nyzul Isle (ToAU 42 and 44 and the
# Waking the Colossus quest) get data files. Salvage only feeds the level bands.
FILE_ZONES = {55, 56, 60, 63, 66, 69, 77}

# Instances in those zones that only feed the level bands. Phoenix hides Sorrowful Sage, who gives out Nyzul Isle
# Investigation (modules/phoenix/lua/zones/npc_visibility.lua).
BAND_ONLY = {'nyzul_isle_investigation'}

# Scripts that give the killer a temporary Qiqirn Mine 40% of the time on death, as a scripted drop.
SCRIPTED_DROPS = {'Qiqirn_Ceramist', 'Qiqirn_Volcanist'}

# The helper that drops a monster's level to the party's chosen cap on spawn.
ADJUST_LEVEL = 'xi.assault.adjustMobLevel'

# mob_resistances columns and the rank they set. instance_loader.cpp calls thunder lightning.
RANK_COLUMNS = {'fire': 'fire', 'ice': 'ice', 'wind': 'wind', 'earth': 'earth', 'lightning': 'thunder',
                'water': 'water', 'light': 'light', 'dark': 'dark', 'paralyze': 'paralyze', 'bind': 'bind',
                'silence': 'silence', 'slow': 'slow', 'poison': 'poison', 'light_sleep': 'light_sleep',
                'dark_sleep': 'dark_sleep', 'blind': 'blind', 'stun': 'stun', 'gravity': 'gravity'}

# mob_resistances columns and the magic damage mod they set. magical_sdt is on top of every element.
SDT_COLUMNS = {'magical_sdt': 'udmgmagic', 'fire_sdt': 'fire_sdt', 'ice_sdt': 'ice_sdt', 'wind_sdt': 'wind_sdt',
               'earth_sdt': 'earth_sdt', 'lightning_sdt': 'thunder_sdt', 'water_sdt': 'water_sdt',
               'light_sdt': 'light_sdt', 'dark_sdt': 'dark_sdt'}

# mob_pools.mobType bits (data/enums/mob_type.yaml).
MOB_TYPES = {0x02: 'notorious', 0x04: 'fished', 0x08: 'called', 0x10: 'battlefield', 0x20: 'event'}


def level_shifts(tree):
    """How far each Assault level cap lowers a capped monster. It is 75 minus the cap, and 0 with no cap."""
    folder = os.path.join(tree, 'scripts', 'globals', 'assault')
    data = open(os.path.join(folder, 'data.lua'), encoding='utf-8').read()
    body = data[data.index('xi.assault.levelCapByIndex'):]
    caps = [int(cap) for cap in re.findall(r'\[\d+\]\s*=\s*(\d+)', body[:body.index('}')])]
    container = open(os.path.join(folder, 'container.lua'), encoding='utf-8').read()
    top = re.search(r'local reducedLevel\s*=\s*(\d+) - levelCap', container)
    if not caps or top is None:
        raise RuntimeError('The Assault level cap code changed. The instance reader needs updating.')
    return sorted({0} | {int(top.group(1)) - cap for cap in caps if cap != 0})


class Sql:
    """The instance tables, read once."""

    def __init__(self, tree):
        sql = os.path.join(tree, 'sql')
        self.instances = sqlfile.rows(os.path.join(sql, 'instance_list.sql'), 'instance_list')
        self.entities = sqlfile.rows(os.path.join(sql, 'instance_entities.sql'), 'instance_entities')
        self.points = {row['mobid']: row for row in
                       sqlfile.rows(os.path.join(sql, 'mob_spawn_points.sql'), 'mob_spawn_points')}
        self.groups = {(row['zoneid'], row['groupid']): row for row in
                       sqlfile.rows(os.path.join(sql, 'mob_groups.sql'), 'mob_groups')}
        self.pools = {row['poolid']: row for row in sqlfile.rows(os.path.join(sql, 'mob_pools.sql'), 'mob_pools')}
        self.resists = {row['resist_id']: row for row in
                        sqlfile.rows(os.path.join(sql, 'mob_resistances.sql'), 'mob_resistances')}
        self.shifts = level_shifts(tree)


def build(ctx, zone_id, script_dir):
    """
    Every monster kind the instance loader can load in one zone. Outside FILE_ZONES and in the BAND_ONLY instances,
    only the level bands use them, so their scripts go unread.
    """
    sql = ctx.instance_sql
    subjob_curve = ctx.zone_dirs[zone_id] in ctx.subjob_zones
    kinds = {}
    placed_by_instance = {}
    for instance in sql.instances:
        if instance['instance_zone'] != zone_id:
            continue
        zone_bits = instance['overlay_id'] or zone_id
        in_file = zone_id in FILE_ZONES and instance['instance_name'] not in BAND_ONLY
        for entity in sql.entities:
            if entity['instanceid'] != instance['instanceid']:
                continue
            point = sql.points.get(entity['id'])
            if point is None or (point['mobid'] >> 12) & 0xFFF != zone_bits:
                continue
            if point['pos_x'] == 0 and point['pos_y'] == 0 and point['pos_z'] == 0:
                continue
            group = sql.groups.get((zone_id, point['groupid']))
            pool = sql.pools.get(group['poolid']) if group else None
            if pool is None:
                ctx.skipped.append('zone %d spawn %d has no mob_groups or mob_pools row' % (zone_id, point['mobid']))
                continue
            if group['allegiance'] != 0:
                continue
            key = (point['mobname'], group['groupid'])
            kind = kinds.get(key)
            if kind is None:
                kind = new_kind(ctx, script_dir, point, pool, sql.resists[pool['resist_id']], subjob_curve, in_file)
                kinds[key] = kind
            if group['dropid'] != 0 and in_file:
                raise RuntimeError('Instance group %d now has drop list %d. Teach the exporter SQL drop lists.'
                                   % (group['groupid'], group['dropid']))
            levels = list(range(point['minLevel'], point['maxLevel'] + 1)) if point['maxLevel'] else []
            kind.ids.append(point['mobid'] & 0xFFF)
            kind.spawn_levels.append([max(1, level) for level in levels])
            # A spawn's own levels are its levels under every level cap.
            own = kind.levels_by_index.setdefault(point['mobid'] & 0xFFF, set())
            for shift in (sql.shifts if kind.assault_capped else [0]):
                own.update(max(1, level - shift) for level in levels)
            kind.levels.update(own)
            if in_file:
                placed_by_instance.setdefault(instance['instanceid'], []).append((point['mobid'], kind))
    for kind in kinds.values():
        if kind.in_file:
            kind.aggro, kind.state = ctx.aggro.fields(kind, script_dir, zone_id)
    # Each instance builds its own link parties from its own monsters.
    for placed in placed_by_instance.values():
        first = {}
        for mob_id, kind in placed:
            first[kind.script] = min(first.get(kind.script, mob_id), mob_id)
        ids = links.Ids(ctx.tree, script_dir, first)
        links.zone_names(ctx, placed, False, [], script_dir, ids, links.fomor_superlinks(ctx.tree, ids))
    return list(kinds.values())


def instance_attributes(tables, chain, pool, types):
    """
    The aggro and link attributes the instance loader gives a monster. The species chain gives only detection,
    since the loader applies no species mob mods. mob_pools gives the rest. An event-type monster that aggroes
    aggroes at any level.
    """
    attributes = dict(chain)
    attributes['aggressive'] = pool['aggro'] != 0
    attributes['links'] = pool['links'] != 0
    attributes['true_detection'] = pool['true_detection'] != 0
    attributes['behavior_flags'] = [name for name, bit in tables.behaviors.items() if bit and pool['behavior'] & bit]
    attributes['mob_mods'] = {'always_aggro': pool['aggro']} if 'event' in types else {}
    attributes['animation_sub'] = pool['animationsub']
    return attributes


def new_kind(ctx, script_dir, point, pool, resist_row, subjob_curve, read_scripts):
    species = ctx.species_by_id.get(pool['speciesid'])
    if species is None:
        raise RuntimeError('Pool %d names unknown species %d' % (pool['poolid'], pool['speciesid']))
    chain = species.attributes
    ranks = {'%s_res_rank' % rank: resist_row['%s_res_rank' % column] for column, rank in RANK_COLUMNS.items()}
    ranks.update({mod: resist_row[column] for column, mod in SDT_COLUMNS.items()})
    ranks.update(chain['resists'])
    # SetMJob(0) is refused, so a pool with no main job keeps the default WAR.
    jobs = chain['jobs'] or (JOBS[pool['mJob']] if pool['mJob'] else 'war', JOBS[pool['sJob']])
    immune = chain['immune']
    if immune is None:
        immune = [name for name, bit in ctx.tables.immunities.items() if bit and pool['immunity'] & bit]
    types = [name for bit, name in MOB_TYPES.items() if pool['mobType'] & bit]
    nm = 'notorious' in types
    source = ctx.scripts.lua(ctx.scripts.mob_script_path(script_dir, point['mobname'])) if read_scripts else None
    capped = source is not None and any(handler == 'onMobSpawn' and name == ADJUST_LEVEL and top
                                        for handler, _, name, top in source.helpers)
    effects = mobscripts.Effects()
    if read_scripts:
        # The level cap is covered by giving the monster every capped level.
        ignored = {ADJUST_LEVEL} if capped else set()
        effects = ctx.scripts.mob_effects(script_dir, point['mobname'], ignored_helpers=ignored)
    for problem in effects.unreadable:
        ctx.unreadable.append('%s (%s)' % (problem, point['mobname']))
    kind = rows.Kind(name=point['polutils_name'], nm=nm, jobs=jobs, stat_ranks=chain['stats'], resists=ranks,
                     mods={}, immune=immune, ecosystem=species.ecosystem, effects=effects, subjob_curve=subjob_curve,
                     multiplier=ctx.nm_multiplier if nm else ctx.mob_multiplier, drops=[])
    kind.types = types
    kind.entity_flags = pool['entityFlags']
    kind.template = point['mobname']
    kind.script = point['mobname']
    kind.assault_capped = capped
    kind.in_file = read_scripts
    kind.attributes = instance_attributes(ctx.tables, chain, pool, types)
    kind.family = species.family
    kind.roam = [name for name, bit in ctx.tables.roam_flags.items() if bit and pool['roamflag'] & bit]
    if point['mobname'] in SCRIPTED_DROPS:
        kind.flags.add('scripted_drops')
    return kind
