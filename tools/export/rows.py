"""
One data row per monster kind. It holds the numbers at every level it can be, its resistance ranks, extra magic
evasion, resist traits, magic damage, immunities, drops, steal items, aggro, links, the NMs its spawns can pop as PHs,
its jobs, its own crit rate, whether it attacks with TP moves or never attacks, and whether it counters.
"""
from . import stats
from .lua_source import ELEMENTS, STATUSES, RESIST_EFFECTS, LEVEL_MOD, MOD_ELEMENTS, CRIT_RATE, CRIT_EVASION, WEAPON_TYPES

# The immunities the printout can show, in display order. Dispel, addle and aspir never occur in era.
IMMUNITY_ORDER = ['dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow', 'elegy',
                  'blind', 'poison', 'requiem', 'petrify', 'terror', 'plague', 'curse']

# Extra magic evasion keys. 'all' is the plain MEVA mod on top of the level's base.
MEVA_KEYS = [('all', 'meva')] + [(name, name + '_meva') for name in ELEMENTS + RESIST_EFFECTS]

# The row fields worked out from the mods at each level.
LEVEL_EXTRAS = ('ranks', 'meva', 'resist', 'magic_dmg', 'absorb', 'nullify', 'weapon_dmg', 'weapon_guard')

# The mob mod that gives a monster a list of TP moves to swing with in place of its normal hits, and the mod that gives
# it a chance to counter, by their YAML names.
ATTACK_LIST = 'attack_skill_list'
COUNTER = 'counter'

# How a link name links, in the order a zone file writes its groups and a name with two lists them. links.py works
# them out from CanLink (mob_entity.cpp): a superlink partner, then what the helper sees and hears, with true_ in
# front when it has true detection. One that neither sees nor hears goes by the other senses aggro shows, like
# magic, or neither when it has none of them. The addon knows what to print for each of these, so finish stops on
# any other.
LINK_WAYS = ['superlink', 'sight', 'true_sight', 'sound', 'true_sound', 'both', 'true_both', 'magic', 'neither']


class Kind:
    """What the exporter knows about one monster kind before its numbers are worked out."""

    def __init__(self, name, nm, jobs, stat_ranks, resists, mods, immune, ecosystem, effects, subjob_curve,
                 multiplier, drops):
        self.name = name
        # The name players see, which other rows' link lists use.
        self.link_name = name
        self.ids = []
        self.levels = set()
        self.nm = nm
        self.jobs = jobs
        # False when the data names no job, so the server runs it as WAR/WAR by default. zones.py and instances.py
        # set it. An instance monster whose pool is 1/1 names none.
        self.job_named = True
        self.stat_ranks = stat_ranks
        self.resists = resists
        self.mods = mods
        self.immune = immune
        self.ecosystem = ecosystem
        self.effects = effects
        self.subjob_curve = subjob_curve
        self.multiplier = multiplier
        self.drops = drops
        # What Steal can take, as (item id, name) pairs. zones.py fills it in, and instance monsters have none.
        self.steal = []
        self.flags = set()
        # The level bands read the template, its type flags, its entity flags and each spawn's levels.
        self.template = None
        self.script = None
        self.types = []
        self.entity_flags = 0
        self.spawn_levels = []
        # The levels each spawn index can be. The row keeps a spawn's own range when it's narrower than the row's.
        self.levels_by_index = {}
        # The NM spawn indexes each of its spawns can pop as a placeholder, by spawn index. placeholders.py fills it in.
        self.ph_for = {}
        self.ph_rules = {}
        self.loot_conditions = []
        self.assault_capped = False
        # False for an instance monster that only feeds the level bands.
        self.in_file = True
        # The aggro and link readers read these. The group lists are the aggro and link mob mods and mixins of the
        # battlefield groups that hold the monster.
        self.attributes = None
        self.family = 0
        self.roam = []
        self.group_aggro = []
        self.group_mixins = []
        # The values each magic damage mod gets from the battlefield groups that hold the monster.
        self.group_mods = {}
        # The aggro reader fills in the aggro fields and the monster's state once spawned. The link reader fills in
        # the names of the monsters it links with, by how each one links (LINK_WAYS).
        self.aggro = {}
        self.state = None
        self.links = {}
        # For a script split by id, True for the spawns below the split.
        self.split_below = None


def nonzero(values):
    return {key: value for key, value in values.items() if value != 0}


def clamp(value, low, high):
    return max(low, min(high, value))


def whole(value):
    """value to two places, as a whole number when it is one."""
    value = round(value, 2)
    return int(value) if value == int(value) else value


def percent(multiplier):
    """A damage multiplier as the percent it adds or takes away, like 1.125 as 12.5."""
    return whole((multiplier - 1) * 100)


def chance(*mods):
    """The percent chance at least one of these mods hits. Each rolls 1 to 100 against its value."""
    miss = 1.0
    for mod in mods:
        miss *= 1 - clamp(mod, 0, 100) / 100
    return whole((1 - miss) * 100)


def magic_damage(mods):
    """
    How much more or less damage magic does, and the chances the monster absorbs or nullifies it, by element and
    for all elements. Damage taken follows damage_multipliers.lua magicalElementSDT and calculateDamageAdjustment.
    Absorb and nullify follow damage_spell.lua calculateAbsorption and calculateNullification.
    """
    capped = clamp((mods.get('dmg', 0) + mods.get('dmgmagic', 0)) / 10000, -0.5, 0.5)
    taken = clamp(1 + capped + mods.get('dmgmagic_ii', 0) / 10000, 0.125, 1.875)
    damage = {'all': percent(clamp(taken + mods.get('udmgmagic', 0) / 10000, 0, 2))}
    absorb = {'all': chance(mods.get('absorb_dmg_chance', 0), mods.get('magic_absorb', 0))}
    nullify = {'all': chance(mods.get('null_damage', 0), mods.get('null_magical_damage', 0))}
    for element, mod_element in zip(ELEMENTS, MOD_ELEMENTS):
        damage[element] = percent(clamp(1 + mods.get(element + '_sdt', 0) / 10000, 0, 3))
        absorb[element] = chance(mods.get(mod_element + '_absorb', 0))
        nullify[element] = chance(mods.get(mod_element + '_null', 0))
    return nonzero(damage), nonzero(absorb), nonzero(nullify)


def level_extras(mods, base_meva):
    """
    The ranks, extra magic evasion over the level's base, resist traits and magic damage, in LEVEL_EXTRAS order.
    These don't often change with the level.
    """
    ranks = {}
    for name in ELEMENTS + STATUSES:
        ranks[name] = mods.get(name + '_res_rank', 0)
    meva = {}
    for key, mod in MEVA_KEYS:
        meva[key] = mods.get(mod, 0) - (base_meva if key == 'all' else 0)
    resist = {name: mods.get(name + 'res', 0) for name in RESIST_EFFECTS}
    return (nonzero(ranks), nonzero(meva), nonzero(resist)) + magic_damage(mods) + weapon_damage(mods)


def weapon_damage(mods):
    """Type multipliers and separate normal-hit reductions from battleutils.cpp."""
    types = {kind: whole(mods.get(mod, 0) / 100) for kind, mod in WEAPON_TYPES}
    physical = max(0, 1 + mods.get('udmgphys', 0) / 10000)
    physical *= max(0.5, 1 + (mods.get('dmg', 0) + mods.get('dmgphys', 0)) / 10000) + mods.get('dmgphys_ii', 0) / 10000
    ranged = max(0, 1 + mods.get('udmgrange', 0) / 10000)
    ranged *= max(0.5, 1 + (mods.get('dmg', 0) + mods.get('dmgrange', 0)) / 10000)
    guard = {
        'physical': percent(physical), 'ranged': percent(ranged),
        'absorb': chance(mods.get('absorb_dmg_chance', 0), mods.get('phys_absorb', 0)),
        'nullify_physical': chance(mods.get('null_damage', 0), mods.get('null_physical_damage', 0)),
        'nullify_ranged': chance(mods.get('null_damage', 0), mods.get('null_ranged_damage', 0)),
    }
    return nonzero(types), nonzero(guard)


def crit_rate(kind, mods):
    """The monster's own crit rate mod. It stops on critical hit evasion, since the Crit part doesn't count it."""
    if mods.get(CRIT_EVASION, 0):
        raise RuntimeError('%s has critical hit evasion, which would lower your crit. The crit reader needs updating.'
                           % kind.name)
    return mods.get(CRIT_RATE, 0)


def spawn_ranges(kind):
    """
    The lowest and highest level of each spawn whose range is narrower than the row's, by spawn index. A spawn
    the data gives no level takes the row's range, so it is left out too.
    """
    if not kind.levels:
        return {}
    row_range = (min(kind.levels), max(kind.levels))
    ranges = {}
    for index, levels in kind.levels_by_index.items():
        if levels and (min(levels), max(levels)) != row_range:
            ranges[index] = (min(levels), max(levels))
    return ranges


def finish(kind, tables):
    """Works out every level of a kind. Returns the row as a plain dict ready for the Lua writer."""
    from . import defenses
    saved = dict(kind.resists)
    for name, value in kind.mods.items():
        saved[name] = saved.get(name, 0) + value
    immune = list(kind.immune or [])
    spawn_mod_ops = [op for op in kind.effects.spawn_ops if not op[0].startswith('immune')]
    spawn_immune_ops = [op for op in kind.effects.spawn_ops if op[0].startswith('immune')]
    stats.apply_ops(saved, kind.effects.init_ops, immune)
    stats.apply_ops({}, spawn_immune_ops, immune)

    monster = stats.Monster(kind.jobs, kind.stat_ranks, saved, spawn_mod_ops, kind.subjob_curve, kind.multiplier,
                            kind.ecosystem == 'beastmen')
    levels, extras, level_mods, crits, counters = {}, {}, set(), set(), False
    for level in sorted(kind.levels):
        numbers, mods = stats.at_level(tables, monster, level)
        attack_skill = defenses.attack_skill(kind, tables, level)
        if attack_skill is not None:
            numbers['attack_skill'] = attack_skill
        levels[level] = numbers
        extras[level] = level_extras(mods, tables.cap_by_rank(stats.MEVA_RANK_COLUMN, min(level, 99)))
        level_mods.add(mods.get(LEVEL_MOD, 0))
        crits.add(crit_rate(kind, mods))
        counters = counters or mods.get(COUNTER, 0) > 0
    if not levels:
        # With no level the spawn math never runs, so only the saved mods and the spawn script count.
        mods = dict(saved)
        stats.apply_ops(mods, spawn_mod_ops, [])
        extras[None] = level_extras(mods, 0)
        level_mods.add(mods.get(LEVEL_MOD, 0))
        crits.add(crit_rate(kind, mods))
        counters = mods.get(COUNTER, 0) > 0

    row = {'name': kind.name, 'ids': sorted(set(kind.ids)), 'levels': levels}
    # The writer shares these exact link identities once per zone.
    family_name = getattr(kind, 'family_name', None)
    row['_link_family'] = {
        'link_name': kind.link_name, 'id': kind.family,
        'name': family_name.replace('_', ' ').title() if isinstance(family_name, str) else '',
    }
    ranges = spawn_ranges(kind)
    if ranges:
        row['spawn_levels'] = ranges
    if kind.ph_for:
        row['ph_for'] = {index: sorted(nms) for index, nms in kind.ph_for.items()}
    if kind.ph_rules:
        row['ph_rules'] = kind.ph_rules
    if kind.loot_conditions:
        row['loot_conditions'] = kind.loot_conditions
    if kind.nm:
        row['nm'] = True
    # Its main and support job as the server sets them, like 'drk/war'. A monster whose data names no job gets none,
    # and so does one whose script changes the job when it spawns, since the data can't know which one it picked.
    if kind.job_named and not kind.effects.job_changes:
        row['job'] = '%s/%s' % tuple(kind.jobs)
    if len(level_mods) != 1:
        raise RuntimeError('%s has a level mod that changes with the level' % kind.name)
    level_mod = level_mods.pop()
    if level_mod:
        row['level_mod'] = level_mod
    if len(crits) != 1:
        raise RuntimeError('%s has a crit rate that changes with the level' % kind.name)
    crit = crits.pop()
    if crit:
        row['crit'] = crit
    # It swings with TP moves from its list in place of normal hits from the moment it spawns, and nothing gives it
    # the normal hits back.
    if (kind.attributes['mob_mods'].get(ATTACK_LIST) or kind.effects.tp_moves) and not kind.effects.normal_swings:
        row['tp_moves'] = True
    # It never swings from the moment it spawns, and nothing gives its swings back.
    if kind.effects.no_swings and not kind.effects.normal_swings:
        row['no_swings'] = True
    # A monster with either flag still counters if it can, and a counter crits like a normal swing. Its job traits
    # and the mods in its data count. A Counterstance it uses is a buff, and checkmate can't see a monster's buffs.
    if counters and (row.get('tp_moves') or row.get('no_swings')):
        row['counters'] = True
    for index, field in enumerate(LEVEL_EXTRAS):
        values = [extra[index] for extra in extras.values()]
        if all(value == values[0] for value in values):
            if values[0]:
                row[field] = values[0]
        else:
            for level in levels:
                if extras[level][index]:
                    levels[level][field] = extras[level][index]
    if kind.ecosystem == 'undead':
        row['undead'] = True
    shown = [name for name in IMMUNITY_ORDER if name in immune]
    if shown:
        row['immune'] = shown
    # A monster whose script always turns drops off, and never back on, drops nothing.
    if kind.drops and not (kind.effects.drops_off and not kind.effects.scripted_drops):
        row['drops'] = kind.drops
    # Turning its drops off doesn't stop Steal (mob_entity.cpp only checks NO_DROPS for the kill drops).
    if kind.steal:
        row['steal'] = kind.steal
    if kind.effects.scripted_drops:
        kind.flags.add('scripted_drops')
    if kind.effects.runtime:
        kind.flags.add('scripted_stats')
    if kind.effects.element_runtime:
        kind.flags.add('scripted_elements')
    if kind.effects.defense_runtime:
        kind.flags.add('scripted_defense')
    if kind.effects.weapon_runtime:
        kind.flags.add('scripted_weapons')
    row.update(kind.aggro)
    for way, names in kind.links.items():
        if way not in LINK_WAYS:
            raise RuntimeError('%s links with %s, which link by %s. The addon has no words for that yet. Add it to '
                               'LINK_WAYS in tools\\export\\rows.py, and to LINK_WAYS and LINK_WORDS in '
                               'checkmate\\core\\aggro.lua.'
                               % (kind.name, ', '.join(sorted(names)), way))
    if kind.links:
        row['links'] = {way: sorted(names) for way, names in kind.links.items()}
    if kind.flags:
        row['flags'] = sorted(kind.flags)
    return row
