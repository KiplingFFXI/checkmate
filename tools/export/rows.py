"""
One data row per monster kind. It holds the numbers at every level it can be, its resistance ranks, extra magic
evasion, resist traits, magic damage, immunities, drops, aggro, links, the NMs its spawns can pop as PHs and flags.
"""
from . import stats
from .lua_source import ELEMENTS, STATUSES, RESIST_EFFECTS, LEVEL_MOD, MOD_ELEMENTS

# The immunities the printout can show, in display order. Dispel, addle and aspir never occur in era.
IMMUNITY_ORDER = ['dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow', 'elegy',
                  'blind', 'poison', 'requiem', 'petrify', 'terror', 'plague', 'curse']

# Extra magic evasion keys. 'all' is the plain MEVA mod on top of the level's base.
MEVA_KEYS = [('all', 'meva')] + [(name, name + '_meva') for name in ELEMENTS + RESIST_EFFECTS]

# The row fields worked out from the mods at each level.
LEVEL_EXTRAS = ('ranks', 'meva', 'resist', 'magic_dmg', 'absorb', 'nullify')

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
        self.stat_ranks = stat_ranks
        self.resists = resists
        self.mods = mods
        self.immune = immune
        self.ecosystem = ecosystem
        self.effects = effects
        self.subjob_curve = subjob_curve
        self.multiplier = multiplier
        self.drops = drops
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
    return (nonzero(ranks), nonzero(meva), nonzero(resist)) + magic_damage(mods)


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
    levels, extras, level_mods = {}, {}, set()
    for level in sorted(kind.levels):
        numbers, mods = stats.at_level(tables, monster, level)
        levels[level] = numbers
        extras[level] = level_extras(mods, tables.cap_by_rank(stats.MEVA_RANK_COLUMN, min(level, 99)))
        level_mods.add(mods.get(LEVEL_MOD, 0))
    if not levels:
        # With no level the spawn math never runs, so only the saved mods and the spawn script count.
        mods = dict(saved)
        stats.apply_ops(mods, spawn_mod_ops, [])
        extras[None] = level_extras(mods, 0)
        level_mods.add(mods.get(LEVEL_MOD, 0))

    row = {'name': kind.name, 'ids': sorted(set(kind.ids)), 'levels': levels}
    ranges = spawn_ranges(kind)
    if ranges:
        row['spawn_levels'] = ranges
    if kind.ph_for:
        row['ph_for'] = {index: sorted(nms) for index, nms in kind.ph_for.items()}
    if kind.nm:
        row['nm'] = True
    if len(level_mods) != 1:
        raise RuntimeError('%s has a level mod that changes with the level' % kind.name)
    level_mod = level_mods.pop()
    if level_mod:
        row['level_mod'] = level_mod
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
    if kind.effects.scripted_drops:
        kind.flags.add('scripted_drops')
    if kind.effects.runtime:
        kind.flags.add('scripted_stats')
    if kind.effects.element_runtime:
        kind.flags.add('scripted_elements')
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
