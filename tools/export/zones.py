"""
Monster rows for the zones the server builds from YAML (zoneutils.cpp InsertMobs). That covers the open world,
battlefields, Limbus and Dynamis.

A spawn becomes a monster only when it names a template, is placed (at, region, path or circuit) and its
template's content is on. Spawns that share a template, script, spawn attributes, fomor patrol or guard and
confrontation event share a row.
"""
import copy
import json
import os

from . import aggro
from . import drops
from . import exists
from . import links
from . import lua_source
from . import overlays
from . import rows
from . import species as species_chain
from . import steal

# The allegiance that fights players (data/enums/allegiance.yaml mob).
MOB_ALLEGIANCE = 'mob'

# Spawn attribute blocks that change nothing checkmate reads.
IGNORED_SPAWN_ATTRIBUTES = {'spawn', 'render', 'speed', 'animation_speed', 'combat'}

# The NPC that marks the end of an arena's monsters in a battlefield (lua_battlefield.cpp addGroups).
ARMOURY_CRATE = 'Armoury_Crate'

# Job tags a script or template name can end with, like Omaern_BST or Ixaern_MNK. Players see the name without it.
JOB_TAGS = {'war', 'mnk', 'whm', 'blm', 'rdm', 'thf', 'pld', 'drk', 'bst', 'brd', 'rng', 'sam', 'nin', 'drg', 'smn',
            'blu', 'cor', 'pup', 'dnc', 'sch', 'geo', 'run'}

# Link names link_name gets wrong, by (zone script folder, script). The client calls Pandemonium Warden's avatar forms
# Pandemonium Lamp, though their templates are Pandemonium Warden ones. It calls Beadeaux's Magnes and Nickel Quadav
# NMs Magnes Quadav and Nickel Quadav, Eald'narche's second form Eald'narche, and Ix'aern (DRG)'s wynavs Aern's Wynav.
LINK_NAMES = {
    ('Aydeewa_Subterrane', 'Pandemonium_Lamp_Avatar'): 'Pandemonium Lamp',
    ('Beadeaux', 'Magnes_Quadav_NM'): 'Magnes Quadav',
    ('Beadeaux', 'Nickel_Quadav_NM'): 'Nickel Quadav',
    ('The_Celestial_Nexus', 'Ealdnarche_2'): 'Ealdnarche',
    ('The_Garden_of_RuHmet', 'Ixaern_DRGs_Wynav'): 'Aerns Wynav',
}

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
    combat = (spawn.get('attributes') or {}).get('combat') or {}
    if 'skill' in combat:
        attributes['combat'] = {'skill': combat['skill']}
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
    base = overlays.load_yaml(os.path.join(ctx.tree, 'data', 'zones', dir_name, 'mobs.yaml')) or {}
    # The templates the zone's own YAML has. Phoenix's modules add the rest whole.
    own_templates = set(base.get('templates') or {})
    document = overlays.merge_overlays(base, ctx.roots, 'zones/%s/mobs' % dir_name)
    templates = document.get('templates') or {}
    spawns = document.get('spawns') or {}
    tables = id_tables(spawns)
    first = {script: ids[0] for script, ids in tables.items()}
    ids = links.Ids(ctx.tree, script_dir, first, tables)
    fomors = links.fomor_superlinks(ctx.tree, ids)
    kinds = {}
    placed_spawns = []
    # Every template and every script a spawn names. link_name trims a label suffix back to one of these.
    known = set(templates) | {spawn['script'] for spawn in spawns.values() if spawn and spawn.get('script')}
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
            kind = new_kind(ctx, dir_name, script_dir, template, name, script, spawn, name in own_templates, known)
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
        kind.source_by_index[index] = species_chain.apply(
            kind.template_attributes, spawn.get('attributes'))['source']
        placed_spawns.append((spawn_id, kind))
    kinds = list(kinds.values())
    zone_fights = ctx.fights.get(dir_name, [])
    crates = crate_ids(ctx, dir_name) if zone_fights else []
    fights = [links.fight_members(fight, ids, placed_spawns, crates) for fight in zone_fights]
    fight_ids = {spawn_id for arenas in fights for arena in arenas for spawn_id, _ in arena}
    pets = links.pet_masters(ctx, placed_spawns, script_dir, ids)
    for spawn_id, kind in placed_spawns:
        if spawn_id in pets:
            kind.pet_indexes.add(spawn_id & 0xFFF)
    # A battlefield group's mixins count for every monster the group holds. exists.Zone follows them, so they go on
    # first.
    kinds_by_id = dict(placed_spawns)
    for arenas in fights:
        for spawn_id, group in (member for arena in arenas for member in arena):
            kind = kinds_by_id.get(spawn_id)
            if kind is not None:
                kind.group_mixins += [mixin for mixin in group.mixins if mixin not in kind.group_mixins]
    up = exists.Zone(ctx, dir_name, script_dir, document, tables, placed_spawns, fight_ids, pets, in_dynamis)
    kinds, placed_spawns = split_events(kinds, placed_spawns, up.events())
    points = spawn_points(spawns, placed_spawns, up)
    aggro_and_links(ctx, dir_name, script_dir, in_dynamis, kinds, placed_spawns, ids, fomors, fights, up, points)
    ctx.placeholders.mark(dir_name, script_dir, tables, placed_spawns)
    return kinds


def spawn_points(spawns, placed, up):
    """
    {spawn id: (x, y, z)} where each placed spawn stands when it's up. An add or pet that waits at a placeholder
    point near 0, 0, 0 comes up beside the monster that spawns it, so it takes that monster's point. One with neither
    is left out, and links.fight_seats puts it in the room of its own kind in its battlefield pool.
    """
    own = {}
    for spawn_id, _ in placed:
        at = spawns[spawn_id].get('at')
        if at and any(abs(float(value)) > 2 for value in at[:3]):
            own[spawn_id] = tuple(float(value) for value in at[:3])
    points = dict(own)
    for spawn_id, _ in placed:
        if spawn_id in points:
            continue
        owners = sorted(owner for owner in up.owners(spawn_id) if owner in own)
        if owners:
            points[spawn_id] = own[owners[0]]
    return points


def split_events(kinds, placed, events):
    """
    Splits a kind whose spawns don't all come from the same confrontation event, or all from none, into a row for each
    event and one for the rest, since each event links only with itself. A Goblin's leech from an Expeditionary Force
    Hobgoblin shares a template with the leeches of open-world Goblins, for one.
    """
    members = {}
    for spawn_id, kind in placed:
        members.setdefault(id(kind), []).append(spawn_id)
    out, owner = [], {}
    for kind in kinds:
        groups = {}
        for spawn_id in members.get(id(kind), []):
            groups.setdefault(events.get(spawn_id), []).append(spawn_id)
        if len(groups) <= 1:
            out.append(kind)
            for spawn_id in members.get(id(kind), []):
                owner[spawn_id] = kind
            continue
        for spawn_ids in sorted(groups.values(), key=min):
            indexes = {spawn_id & 0xFFF for spawn_id in spawn_ids}
            part = copy.copy(kind)
            part.effects = copy.deepcopy(kind.effects)
            part.ids = [index for index in kind.ids if index in indexes]
            part.spawn_levels = [levels for index, levels in zip(kind.ids, kind.spawn_levels) if index in indexes]
            part.levels_by_index = {index: levels for index, levels in kind.levels_by_index.items()
                                    if index in indexes}
            part.levels = set().union(*part.levels_by_index.values())
            part.flags = set(kind.flags)
            part.links, part.group_mods, part.ph_for = {}, {}, {}
            part.group_aggro, part.group_mixins = list(kind.group_aggro), list(kind.group_mixins)
            out.append(part)
            for spawn_id in spawn_ids:
                owner[spawn_id] = part
    return out, [(spawn_id, owner[spawn_id]) for spawn_id, _ in placed]


def crate_ids(ctx, dir_name):
    """The spawn ids of the zone's Armoury Crate NPCs."""
    if not os.path.exists(os.path.join(ctx.tree, 'data', 'zones', dir_name, 'npcs.yaml')):
        return []
    document = overlays.load_merged(ctx.tree, ctx.roots, 'zones/%s/npcs' % dir_name)
    return [npc_id for npc_id, npc in (document.get('npcs') or {}).items()
            if npc and npc.get('script') == ARMOURY_CRATE]


def group_damage_mods(group, aliases, dir_name, detects=None):
    """(mod, value) for each battlefield group mod that changes Elements or Weapons."""
    mods = []
    for key, value in group.mods:
        name = lua_source.mod_name(key) or aliases.get(key)
        if name not in lua_source.ELEMENT_READOUT_MODS | lua_source.WEAPON_DAMAGE_MODS | lua_source.DEFENSE_MODS:
            continue
        number = int(value) if lua_source.INTEGER.match(value) else aggro.detection_value(value, detects or {})
        if number is None:
            raise RuntimeError('A %s battlefield sets %s to a value the exporter can\'t read: %s'
                               % (dir_name, key, value))
        mods.append((name, number))
    return mods


def apply_group_mods(kind):
    """
    A fight sets its groups' mods when it starts and saves them, so they stay through later fights that set none
    (lua_battlefield.cpp addGroups). Two values for one mod depend on which fight ran last.
    """
    varying = [name for name, values in kind.group_mods.items() if len(values) > 1]
    if varying:
        reason = '%s battlefields set one damage mod two ways' % kind.name
        if any(name in lua_source.ELEMENT_READOUT_MODS for name in varying):
            kind.effects.element_runtime.append(reason)
        if any(name in lua_source.WEAPON_DAMAGE_MODS for name in varying):
            kind.effects.weapon_runtime.append(reason)
        if any(name in lua_source.DEFENSE_MODS for name in varying):
            kind.effects.defense_runtime.append(reason)
        if any(name in lua_source.ELEMENT_STAT_MODS for name in varying):
            kind.effects.runtime.append(reason)
    kind.effects.init_ops += [('set', name, min(values)) for name, values in sorted(kind.group_mods.items())
                             if len(values) == 1]


def aggro_and_links(ctx, dir_name, script_dir, in_dynamis, kinds, placed_spawns, ids, fomors, fights, up, points):
    """
    Works out each kind's aggro fields and the names it links with. A battlefield group's aggro and link mob mods
    and its magic damage mods count for every monster the group holds. build adds its mixins the same way.
    """
    kinds_by_id = dict(placed_spawns)
    for arenas in fights:
        for spawn_id, group in (member for arena in arenas for member in arena):
            kind = kinds_by_id.get(spawn_id)
            if kind is None:
                continue
            for op in group.mob_mods:
                if op[0] in lua_source.AGGRO_MOB_MODS | lua_source.LINK_MOB_MODS and op not in kind.group_aggro:
                    kind.group_aggro.append(op)
            for name, value in group_damage_mods(group, ctx.tables.mod_aliases, dir_name, ctx.tables.detects):
                kind.group_mods.setdefault(name, set()).add(value)
    for kind in kinds:
        # A battlefield group's mixin that changes the job makes the data's job wrong too. One can change how the
        # monster swings as well.
        for mixin in kind.group_mixins:
            if ctx.scripts.mixin_defense(mixin):
                kind.effects.defense_runtime.append('%s gets mixin %s from a battlefield group' % (kind.name, mixin))
            if ctx.scripts.mixin_changes_job(mixin):
                kind.effects.job_changes.append('%s gets mixin %s from a battlefield group' % (kind.name, mixin))
            if ctx.scripts.mixin_swings(mixin):
                kind.effects.normal_swings.append('%s gets mixin %s from a battlefield group' % (kind.name, mixin))
        apply_group_mods(kind)
        kind.aggro, kind.state = ctx.aggro.fields(kind, script_dir, ctx.tables.zones[dir_name])
    links.zone_names(ctx, placed_spawns, in_dynamis, fights, script_dir, ids, fomors, up, points)


def apply_split(kind, split, below):
    """Gives the spawns below the split their immunities, which the script only adds by id."""
    _, immunities, handler = split
    kind.effects.runtime = [reason for reason in kind.effects.runtime
                            if not (handler in reason and 'Immunity(' in reason)]
    if below:
        kind.effects.init_ops += [('immune_add', name, None) for name in immunities]


def link_name(template_name, display_name, script, own_script, known):
    """
    The name players see, which link lists use. The server names a monster by its spawn's script, or its template
    when the spawn names none, and the client shows the name from its own data. A template or display name that is
    the script plus a suffix, like Heraldic_Imp_CM for the script Heraldic_Imp, shows as the script, and a script
    that is the template or display name plus a suffix, like the script Phantom_Puk_Clone on the template
    Phantom_Puk, shows as that shorter name. Otherwise a display name wins, and with none a spawn's own script wins
    over the template name (Funnel_Bats_GC spawns with the script Funnel_Bat).
    A template name that is one of its zone's other names plus a label suffix, like Worker_Crawler_CN, shows as that
    name, and a trailing job tag goes, so Omaern_BST shows as Omaern. Case doesn't matter.
    """
    label = str(display_name or template_name)
    if label.lower() == script.lower():
        name = label
    elif label.lower().startswith(script.lower() + '_'):
        name = script
    elif script.lower().startswith(label.lower() + '_'):
        name = label
    elif own_script and not display_name:
        name = script
    else:
        name = label
    if not own_script:
        for other in sorted(known, key=len, reverse=True):
            rest = name[len(other) + 1:].split('_')
            if (other.lower() != name.lower() and name.lower().startswith(other.lower() + '_')
                    and all(map(is_tag, rest))):
                name = other
                break
    parts = name.split('_')
    if len(parts) > 1 and parts[-1].lower() in JOB_TAGS and is_tag(parts[-1]):
        name = '_'.join(parts[:-1])
    return name.replace('_', ' ')


def is_tag(part):
    """
    Whether a name part is a label rather than a word of the name. Names are capitalized words, like Skewer_Sam or
    Fallen_Imperial_Wizard, while labels are all lower or upper case, like noroam, CN or BST.
    """
    return part.islower() or part.isupper() or part.isdigit()


def new_kind(ctx, dir_name, script_dir, template, name, script, spawn, in_zone_yaml, known):
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
    kind.loot_conditions = drops.conditions(ctx.tree, script_dir, script)
    kind.template = name
    kind.script = script
    kind.zone_dir = script_dir
    kind.data_zone = dir_name
    kind.template_attributes = species_chain.apply(species.attributes, template.get('attributes'))
    kind.source_by_index = {}
    kind.pet_indexes = set()
    kind.species_name = species.name
    kind.family_name = species.family_name
    kind.species_id = species.id
    # Phoenix's modules write out every template's jobs, the 1/1 default included, so WAR/WAR on a template one of them
    # adds names no job, like a template the zone YAML leaves jobs out for.
    kind.job_named = attributes['jobs'] is not None and (in_zone_yaml or attributes['jobs'] != ('war', 'war'))
    kind.steal = steal.pool(template.get('loot'), ctx.items, where)
    fixed = ctx.fixed_steal.get((script_dir, script))
    if fixed is not None:
        steal.check_fixed(fixed, kind.steal, where)
        ctx.fixed_seen.add((script_dir, script))
    # Link lists use the name players see.
    kind.link_name = (LINK_NAMES.get((script_dir, script))
                      or link_name(name, template.get('display_name'), script, bool(spawn.get('script')), known))
    kind.types = species_chain.names(template.get('type'))
    kind.entity_flags = attributes['entity_flags'] or 0
    kind.attributes = attributes
    kind.family = species.family
    kind.roam = species_chain.names(template.get('roam'))
    return kind
