"""
A port of the server's monster stat math at spawn. It covers mobutils::CalculateMobStats, battleutils::AddTraits
and CBattleEntity ACC(), EVA(), DEF() and the stats they use.

The server does its float math in single precision, so the float steps here round to float32 the same way.
"""
from pathlib import Path
import math
import os
import re
import struct

# Skill ids GetBaseSkill and the evasion rank read (data/enums/skill_type.yaml).
SKILL_GREAT_AXE = 6
SKILL_STAFF = 12
SKILL_ARCHERY = 25
SKILL_THROWING = 27
SKILL_EVASION = 29

# Monster magic evasion is the rank C skill cap column (GetMagicEvasion).
MEVA_RANK_COLUMN = 7

# Base evasion by rank above level 50, as (value at 50, per level over 50), and at 50 or below, as (value at 1,
# per level over 1).
DEF_EVA_HIGH = {1: (153, 5.0), 2: (147, 4.9), 3: (142, 4.8), 4: (136, 4.7), 5: (126, 4.5)}
DEF_EVA_LOW = {1: (6, 3.0), 2: (5, 2.9), 3: (5, 2.8), 4: (4, 2.7), 5: (4, 2.5)}

# GetBaseToRank as (base, per level) for ranks A..G.
BASE_TO_RANK = {1: (5, 50), 2: (4, 45), 3: (4, 40), 4: (3, 35), 5: (3, 30), 6: (2, 25), 7: (2, 20)}

# GetBaseSkill by rank, 1 (A+) to 5 (E), as the skill and job whose cap it reads.
BASE_SKILL = {1: (SKILL_GREAT_AXE, 'war'), 2: (SKILL_STAFF, 'war'), 3: (SKILL_EVASION, 'war'),
              4: (SKILL_ARCHERY, 'war'), 5: (SKILL_THROWING, 'mnk')}

# JobSkillRankToBaseEvaRank, the best evasion skill rank of the two jobs to a base evasion rank. Any other rank is 3.
EVA_RANK = {1: 1, 2: 1, 3: 2, 4: 2, 5: 2, 6: 3, 7: 3, 8: 3, 9: 4, 10: 5}

# The stats the spawn math works out. DEX feeds accuracy; VIT feeds Defense without adding a separate output field.
STATS = ['dex', 'agi', 'int', 'mnd', 'chr', 'vit']


def f32(x):
    return struct.unpack('<f', struct.pack('<f', x))[0]


def fmul(a, b):
    return f32(f32(a) * f32(b))


def fadd(a, b):
    return f32(f32(a) + f32(b))


def fsub(a, b):
    return f32(f32(a) - f32(b))


def fdiv(a, b):
    return f32(f32(a) / f32(b))


def u16(x):
    """C++ conversion of a non-negative number to uint16."""
    return int(x) & 0xFFFF


def base_to_rank(rank, level):
    if rank not in BASE_TO_RANK:
        return 0
    base, per = BASE_TO_RANK[rank]
    return base + ((level - 1) * per) // 100


def sub_job_divide(stat, a, b, offset, level):
    return math.floor(fdiv(float(stat), fsub(a, fmul(b, float(level - offset)))))


# mobutils.cpp GetSubJobStats, rows of (first level, last level, a, b, offset, floor) per rank.
SUB_JOB_CURVES = {
    1: [(0, 30, 4.0, 0.225, 30, 2.0), (31, 40, 3.25, 0.073, 30, None), (41, 46, 2.55, 0.001, 41, None),
        (47, 99, 2.7, 0.001, 45, None)],
    2: [(0, 30, 3.1, 0.075, 32, 2.0), (31, 40, 3.1, 0.075, 32, None), (41, 45, 2.5, 0.025, 40, None),
        (46, 99, 2.35, 0.04, 44, None)],
    3: [(0, 30, 4.5, 0.15, 26, 2.0), (31, 40, 3.28, 0.001, 30, None), (41, 45, 2.6, 0.025, 40, None),
        (46, 99, 2.1, 0.2, 49, None)],
    4: [(0, 30, 5.0, 0.05, 21, 1.0), (31, 40, 3.2, 0.001, 29, None), (41, 45, 3.5, 0.08, 32, None),
        (46, 99, 3.25, 0.045, 32, None)],
    5: [(0, 30, 3.8, 0.1, 32, 1.0), (31, 40, 3.8, 0.15, 32, None), (41, 45, 2.7, 0.075, 40, None),
        (46, 99, 2.7, 0.05, 45, None)],
    6: [(0, 30, 4.0, 0.15, 35, 1.0), (31, 40, 4.0, 0.15, 30, None), (41, 46, 3.0, 0.1125, 40, None),
        (47, 99, 3.0, 0.07, 40, None)],
    7: [(0, 30, 4.0, 0.15, 35, 1.0), (31, 40, 4.0, 0.2, 31, None), (41, 46, 2.5, 0.09, 40, None)],
}


def sub_job_stat(rank, level, stat):
    """mobutils.cpp GetSubJobStats."""
    if rank == 7 and level > 46:
        return u16(math.floor(stat / 2))
    for first, last, a, b, offset, lowest in SUB_JOB_CURVES.get(rank, []):
        if first <= level <= last:
            value = sub_job_divide(stat, a, b, offset, level)
            return u16(max(value, lowest) if lowest is not None else value)
    return u16(fdiv(float(stat), 2.0))


def base_def_eva(level, rank):
    """mobutils.cpp GetBaseDefEva."""
    table, start = (DEF_EVA_HIGH, 50) if level > 50 else (DEF_EVA_LOW, 1)
    if rank not in table:
        return 0
    base, per = table[rank]
    return u16(math.floor(fadd(float(base), fmul(float(level - start), per))))


def base_skill(tables, rank, level):
    """mobutils.cpp GetBaseSkill. The int8 level turns back into the same uint8 on its way to GetMaxSkill."""
    if rank not in BASE_SKILL:
        return 0
    skill, job = BASE_SKILL[rank]
    return tables.max_skill(skill, job, level)


def evasion_rank(tables, mjob, sjob):
    """mobutils.cpp JobSkillRankToBaseEvaRank."""
    main = tables.skill_ranks[SKILL_EVASION].get(mjob, 0)
    sub = tables.skill_ranks[SKILL_EVASION].get(sjob, 0) if sjob != 'none' else main
    return EVA_RANK.get(min(main, sub), 3)


def add_traits(tables, traits, job, level, beastmen):
    """battleutils.cpp AddTraits for a monster, with xi.traits.canApplyTrait."""
    for trait in tables.traits_by_job.get(job, []):
        if not (level >= trait['level'] > 0):
            continue
        add = True
        for index, existing in enumerate(traits):
            if existing['id'] != trait['id']:
                continue
            if existing['rank'] < trait['rank']:
                del traits[index]
                break
            if existing['rank'] > trait['rank'] or existing['mod'] == trait['mod']:
                add = False
                break
        if add and trait['id'] in tables.mob_excluded_traits:
            add = False
        if add and trait['id'] in tables.resist_traits and not beastmen:
            add = False
        if add:
            traits.append(trait)


def load_subjob_zones(tree, zone_ids):
    """The zone names in mobutils.cpp CheckSubJobZone, as data/enums/zone.yaml keys."""
    source = Path(os.path.join(tree, 'src', 'map', 'utils', 'mobutils.cpp')).read_text(encoding='utf-8')
    body = source[source.index('bool CheckSubJobZone'):]
    body = body[:body.index('return false;')]
    by_plain = {re.sub(r'[^a-z0-9]', '', name): name for name in zone_ids}
    zones = set()
    for name in re.findall(r'xi::ZoneId::(\w+)', body):
        if name == 'Unknown':
            continue
        if name.lower() not in by_plain:
            raise RuntimeError('CheckSubJobZone names a zone the enum lacks: ' + name)
        zones.add(by_plain[name.lower()])
    return zones


def apply_ops(mods, ops, immune):
    """Applies set, add and del ops to mods and immune_add, immune_del ops to the immunity list, in order."""
    for kind, name, value in ops:
        if kind == 'set':
            mods[name] = value
        elif kind == 'add':
            mods[name] = mods.get(name, 0) + value
        elif kind == 'del':
            mods[name] = mods.get(name, 0) - value
        elif kind == 'immune_add':
            if name not in immune:
                immune.append(name)
        elif kind == 'immune_del':
            if name in immune:
                immune.remove(name)


class Monster:
    """Everything about one monster kind that the level-by-level math needs."""

    def __init__(self, jobs, stat_ranks, saved_mods, spawn_ops, subjob_curve, multiplier, beastmen):
        self.jobs = jobs
        self.stat_ranks = stat_ranks
        self.saved_mods = saved_mods
        self.spawn_ops = spawn_ops
        self.subjob_curve = subjob_curve
        self.multiplier = multiplier
        self.beastmen = beastmen


def at_level(tables, monster, level):
    """
    The monster's numbers at one level, after its spawn. Returns (numbers, mods) where numbers has acc, eva,
    agi, int, mnd, chr, dex and def, and mods holds every mod as the server has it once onMobSpawn has run.
    """
    mjob, sjob = monster.jobs
    stats = {}
    for stat in STATS:
        family = base_to_rank(monster.stat_ranks[stat], level)
        main = base_to_rank(tables.grades[mjob][stat], level)
        sub_grade = tables.grades[sjob][stat]
        sub = base_to_rank(sub_grade, level)
        if monster.subjob_curve and level < 50:
            sub = sub_job_stat(sub_grade, level, sub)
        else:
            sub = sub // 2
        stats[stat] = u16(fmul(float(u16(family + main + sub)), monster.multiplier))

    mods = dict(monster.saved_mods)
    mods['def'] = mods.get('def', 0) + base_def_eva(level, monster.stat_ranks['def'])
    mods['eva'] = mods.get('eva', 0) + base_def_eva(level, evasion_rank(tables, mjob, sjob))
    mods['acc'] = mods.get('acc', 0) + base_skill(tables, monster.stat_ranks['acc'], level)
    mods['meva'] = mods.get('meva', 0) + tables.cap_by_rank(MEVA_RANK_COLUMN, min(level, 99))
    traits = []
    add_traits(tables, traits, mjob, level, monster.beastmen)
    add_traits(tables, traits, sjob, level, monster.beastmen)
    for trait in traits:
        mods[trait['mod']] = mods.get(trait['mod'], 0) + trait['value']
    apply_ops(mods, monster.spawn_ops, [])

    final = {stat: max(0, min(999, stats[stat] + mods.get(stat, 0))) for stat in STATS}
    acc = max(1, mods['acc'] + final['dex'] // 2)
    eva = mods['eva'] + final['agi'] // 2
    eva += int(math.floor(fdiv(fmul(float(eva), float(mods.get('eva_percent', 0))), 100.0)))
    eva = max(1, min(65535, eva))
    numbers = {'acc': acc, 'eva': eva, 'agi': final['agi'], 'int': final['int'], 'mnd': final['mnd'],
               'chr': final['chr'], 'dex': final['dex'], 'def': defense(final['vit'], mods)}
    return numbers, mods


def signed16(value):
    return (int(value) + 32768) % 65536 - 32768


def defense(vit, mods):
    """CBattleEntity::DEF for an unbuffed monster, including C++ integer conversions."""
    base = 8 + vit // 2 + mods.get('def', 0)
    percent = math.trunc(base * mods.get('defp', 0) / 100)
    food = min(signed16(math.trunc(base * mods.get('food_defp', 0) / 100)),
               signed16(mods.get('food_def_cap', 0)))
    return u16(max(1, base + percent + food))
