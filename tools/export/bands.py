"""
The level-band fallback (data/bands.lua) holds typical monster accuracy, evasion, AGI and DEX by level, for monsters
checkmate has no row for.

It counts every monster in an era zone that has a level in the data and isn't notorious, a pet (called),
untargetable or a Limbus crate. Each spawn counts once, spread evenly over the levels it can roll. The numbers
are the spawn math alone, with no script changes. Each row holds the 10th and 90th percentile of each number.
"""
from . import stats

# Entity flag for an untargetable monster.
UNTARGETABLE = 0x800

LOW, HIGH = 0.10, 0.90


def counted(kind):
    if 'notorious' in kind.types or 'called' in kind.types:
        return False
    if kind.entity_flags & UNTARGETABLE:
        return False
    return not (kind.template.startswith('Armoury_Crate') or kind.name.startswith('Armoury Crate'))


def quantile(pairs, share):
    """The smallest value whose running weight reaches share of the total. pairs are (value, weight), sorted."""
    total = sum(weight for _, weight in pairs)
    running = 0.0
    for value, weight in pairs:
        running += weight
        if running >= share * total - 1e-9:
            return value
    return pairs[-1][0]


def build(tables, kinds):
    """Rows of (level, acc low, acc high, eva low, eva high, agi low, agi high, dex low, dex high)."""
    by_level = {}
    for kind in kinds:
        if not counted(kind):
            continue
        monster = stats.Monster(kind.jobs, kind.stat_ranks, dict(kind.mods), [], kind.subjob_curve,
                                kind.multiplier, kind.ecosystem == 'beastmen')
        numbers = {}
        for levels in kind.spawn_levels:
            for level in levels:
                if level not in numbers:
                    numbers[level] = stats.at_level(tables, monster, level)[0]
                entry = by_level.setdefault(level, ([], [], [], []))
                weight = 1.0 / len(levels)
                entry[0].append((numbers[level]['acc'], weight))
                entry[1].append((numbers[level]['eva'], weight))
                entry[2].append((numbers[level]['agi'], weight))
                entry[3].append((numbers[level]['dex'], weight))
    out = []
    for level in sorted(by_level):
        acc, eva, agi, dex = (sorted(values) for values in by_level[level])
        out.append((level, quantile(acc, LOW), quantile(acc, HIGH), quantile(eva, LOW), quantile(eva, HIGH),
                    quantile(agi, LOW), quantile(agi, HIGH), quantile(dex, LOW), quantile(dex, HIGH)))
    return out
