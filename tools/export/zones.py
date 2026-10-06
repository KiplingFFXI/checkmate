"""
Monster rows for the zones the server builds from YAML (zoneutils.cpp InsertMobs). That covers the open world,
battlefields, Limbus and Dynamis.

A spawn becomes a monster only when it names a template, is placed (at, region, path or circuit) and its
template's content is on. Spawns that share a template, script, spawn attributes and fomor patrol or guard
share a row.
"""
import json
import os

from . import drops
from . import links
from . import lua_source
from . import overlays
from . import rows
from . import species as species_chain

# The allegiance that fights players (data/enums/allegiance.yaml mob).
MOB_ALLEGIANCE = 'mob'

# Spawn attribute blocks that change nothing checkmate reads.
IGNORED_SPAWN_ATTRIBUTES = {'spawn', 'render', 'speed', 'animation_speed', 'combat'}

# The NPC that marks the end of an arena's monsters in a battlefield (lua_battlefield.cpp addGroups).
ARMOURY_CRATE = 'Armoury_Crate'

# Scripts that treat their spawns differently by id, as (zone script folder, script): (the script whose first id
# splits them, immunities added below that id, the handler holding the calls).
# Qn'xzomit below the first Jailer of Love serve Jailer of Justice and are immune to six effects.
ID_SPLITS = {
    ('AlTaieu', 'Qnxzomit'): ('Jailer_of_Love', ['bind', 'blind', 'dark_sleep', 'light_sleep', 'petrify', 'stun'],
                              'onMobInitialize'),
}


def placed(spawn):
    return any(key in spawn for key in ('at', 'region', 'path', 'circuit'))


def spawn_levels(spawn):
    """The levels a spawn can roll. A level of 0 becomes 1 (SetMLevel). [0, 0] means the data holds no level."""
    # NORMAL_MOB_MAX_LEVEL_RANGE_MIN and _MAX would flatten these. Both are 0 on Phoenix.
    low, high = (spawn.get('level') or [0, 0])
    if high == 0 or low > high:
        return []
    return [max(1, level) for level in range(low, high + 1)]


def spawn_key(spawn):
    """The part of a spawn's own attributes that changes its numbers, as text so rows can group on it."""
    attributes = {key: value for key, value in (spawn.get('attributes') or {}).items()
                  if key not in IGNORED_SPAWN_ATTRIBUTES}
    return json.dumps(attributes, sort_keys=True)


def id_tables(spawns):
    """The spawn ids of each script in order, like GetTableOfIDs. The first of each is what GetFirstID gives."""
    tables = {}
    for spawn_id, spawn in spawns.items():
        if spawn and (spawn.get('script') or spawn.get('template')):
            tables.setdefault(spawn.get('script') or spawn['template'], []).append(spawn_id)
    return {script: sorted(ids) for script, ids in tables.items()}


def build(ctx, dir_name, script_dir, in_dynamis):
    """Every monster kind in one YAML zone."""
    document = overlays.load_merged(ctx.tree, ctx.roots, 'zones/%s/mobs' % dir_name)
    templates = document.get('templates') or {}
    spawns = document.get('spawns') or {}
    tables = id_tables(spawns)
    first = {script: ids[0] for script, ids in tables.items()}
    ids = links.Ids(ctx.tree, script_dir, first, tables)
    fomors = links.fomor_superlinks(ctx.tree, ids)
    kinds = {}
    placed_spawns = []
    for spawn_id, spawn in sorted(spawns.items()):
        if not isinstance(spawn_id, int):
            raise RuntimeError('%s spawn key %r is not a number' % (dir_name, spawn_id))
        if not spawn or not spawn.get('template') or not placed(spawn):
            continue
        name = spawn['template']
        template = templates.get(name)
        if template is None:
            raise RuntimeError('%s spawn %d names unknown template %s' % (dir_name, spawn_id, name))
        if not ctx.content.allows(template.get('content')):
            continue
        if str(template.get('allegiance') or MOB_ALLEGIANCE).lower() != MOB_ALLEGIANCE:
            continue
        script = spawn.get('script') or name
        index = spawn_id & 0xFFF
        extra = ctx.launch.get((script_dir, script))
        is_extra = extra is not None and extra[0] <= index <= extra[1]
        split = ID_SPLITS.get((script_dir, script))
        below = split is not None and spawn_id < first[split[0]]
        # A fomor's patrol or guard decides who it superlinks with, so each one gets its own row.
        party = fomors[spawn_id] if spawn_id in fomors and links.calls_fomor_party(ctx, script_dir, script) else None
        key = (name, script, is_extra, below, spawn_key(spawn), party)
        kind = kinds.get(key)
        if kind is None:
            kind = new_kind(ctx, dir_name, script_dir, template, name, script, spawn)
            if is_extra:
                kind.name = kind.link_name = extra[2]
                kind.flags.add('exp_only')
            if split is not None:
                apply_split(kind, split, below)
                kind.split_below = below
            kinds[key] = kind
        kind.ids.append(index)
        kind.levels.update(spawn_levels(spawn))
        kind.spawn_levels.append(spawn_levels(spawn))
        kind.levels_by_index[index] = set(spawn_levels(spawn))
        placed_spawns.append((spawn_id, kind))
    kinds = list(kinds.values())
    aggro_and_links(ctx, dir_name, script_dir, in_dynamis, kinds, placed_spawns, ids, fomors)
    ctx.placeholders.mark(dir_name, script_dir, tables, placed_spawns)
    return kinds


def crate_ids(ctx, dir_name):
    """The spawn ids of the zone's Armoury Crate NPCs."""
    if not os.path.exists(os.path.join(ctx.tree, 'data', 'zones', dir_name, 'npcs.yaml')):
        return []
    document = overlays.load_merged(ctx.tree, ctx.roots, 'zones/%s/npcs' % dir_name)
    return [npc_id for npc_id, npc in (document.get('npcs') or {}).items()
            if npc and npc.get('script') == ARMOURY_CRATE]


def group_damage_mods(group, aliases, dir_name):
    """(mod, value) for each mod in a battlefield group's mods that changes magic damage."""
    mods = []
    for key, value in group.mods:
        name = lua_source.mod_name(key) or aliases.get(key)
        if name not in lua_source.ELEMENT_DAMAGE_MODS:
            continue
        if not lua_source.INTEGER.match(value):
            raise RuntimeError('A %s battlefield sets %s to a value the exporter can\'t read: %s'
                               % (dir_name, key, value))
        mods.append((name, int(value)))
    return mods


def apply_group_mods(kind):
    """
    A fight sets its groups' mods when it starts and saves them, so they stay through later fights that set none
    (lua_battlefield.cpp addGroups). Two values for one mod depend on which fight ran last.
    """
    if any(len(values) > 1 for values in kind.group_mods.values()):
        kind.effects.element_runtime.append('%s battlefields set one magic damage mod two ways' % kind.name)
        return
    kind.effects.init_ops += [('set', name, min(values)) for name, values in sorted(kind.group_mods.items())]


def aggro_and_links(ctx, dir_name, script_dir, in_dynamis, kinds, placed_spawns, ids, fomors):
    """
    Works out each kind's aggro fields and the names it links with. A battlefield group's aggro and link mob mods,
    its mixins and its magic damage mods count for every monster the group holds.
    """
    zone_fights = ctx.fights.get(dir_name, [])
    crates = crate_ids(ctx, dir_name) if zone_fights else []
    fights = [links.fight_members(fight, ids, placed_spawns, crates) for fight in zone_fights]
    kinds_by_id = dict(placed_spawns)
    for arenas in fights:
        for spawn_id, group in (member for arena in arenas for member in arena):
            kind = kinds_by_id.get(spawn_id)
            if kind is None:
                continue
            for op in group.mob_mods:
                if op[0] in lua_source.AGGRO_MOB_MODS | lua_source.LINK_MOB_MODS and op not in kind.group_aggro:
                    kind.group_aggro.append(op)
            kind.group_mixins += [mixin for mixin in group.mixins if mixin not in kind.group_mixins]
            for name, value in group_damage_mods(group, ctx.tables.mod_aliases, dir_name):
                kind.group_mods.setdefault(name, set()).add(value)
    for kind in kinds:
        apply_group_mods(kind)
        kind.aggro, kind.state = ctx.aggro.fields(kind, script_dir, ctx.tables.zones[dir_name])
    links.zone_names(ctx, placed_spawns, in_dynamis, fights, script_dir, ids, fomors)


def apply_split(kind, split, below):
    """Gives the spawns below the split their immunities, which the script only adds by id."""
    _, immunities, handler = split
    kind.effects.runtime = [reason for reason in kind.effects.runtime
                            if not (handler in reason and 'Immunity(' in reason)]
    if below:
        kind.effects.init_ops += [('immune_add', name, None) for name in immunities]


def new_kind(ctx, dir_name, script_dir, template, name, script, spawn):
    species = ctx.species_by_name.get(str(template.get('species')))
    if species is None:
        raise RuntimeError('%s template %s names unknown species %s' % (dir_name, name, template.get('species')))
    attributes = species_chain.apply(species.attributes, template.get('attributes'))
    attributes = species_chain.apply(attributes, spawn.get('attributes'))
    jobs = attributes['jobs'] or ('war', 'war')
    if jobs[0] == 'none':
        jobs = ('war', jobs[1])
    nm = 'notorious' in species_chain.names(template.get('type'))
    where = '%s template %s' % (dir_name, name)
    loot = drops.rolls(template.get('loot'), ctx.items, ctx.tables.drop_rates, where)
    if script_dir in ctx.dynamis.zone_dirs:
        effects = ctx.dynamis.effects(ctx.scripts, script_dir, script)
    else:
        effects = ctx.scripts.mob_effects(script_dir, script)
    for problem in effects.unreadable:
        ctx.unreadable.append('%s (%s)' % (problem, where))
    shown = str(template.get('display_name') or name).replace('_', ' ')
    kind = rows.Kind(name=shown, nm=nm, jobs=jobs, stat_ranks=attributes['stats'], resists=attributes['resists'],
                     mods=attributes['mods'], immune=attributes['immune'], ecosystem=species.ecosystem,
                     effects=effects, subjob_curve=dir_name in ctx.subjob_zones,
                     multiplier=ctx.nm_multiplier if nm else ctx.mob_multiplier, drops=loot)
    kind.template = name
    kind.script = script
    # Link lists use the name players see. A template or display name that is the script's name plus a suffix, like
    # Heraldic_Imp_CM for the script Heraldic_Imp, shows as the script's name.
    plain = str(template.get('display_name') or name)
    kind.link_name = (script if plain.startswith(script + '_') else plain).replace('_', ' ')
    kind.types = species_chain.names(template.get('type'))
    kind.entity_flags = attributes['entity_flags'] or 0
    kind.attributes = attributes
    kind.family = species.family
    kind.roam = species_chain.names(template.get('roam'))
    return kind
