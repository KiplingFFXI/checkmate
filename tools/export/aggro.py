"""
Whether a monster aggroes, how it finds you, and the Too Weak table for monsters whose /check can't be gauged.

A monster aggroes you when it is aggressive (m_Aggro or the ALWAYS_AGGRO mob mod), NO_AGGRO is off, you don't
check Too Weak to it, and it finds you by sight, sound, magic, low HP, ability or ambush (zone_entities.cpp
tapMobAggro, mob_controller.cpp CanAggroTarget and CanDetectTarget). ALWAYS_AGGRO and resting skip the Too Weak
test. Scent never starts a fight on this server. It only keeps one going, so it is left out.

The flags come from the species chain, the template and the spawn, then the top-level calls in onMobInitialize,
battlefield group mob mods and onMobSpawn, in that order. A few mixins change them while the monster lives. Those
become a note on the row. Every other change that doesn't always run marks the row scripted_aggro.
"""
from pathlib import Path
import os
import re

from . import overlays
from . import tables as tables_module
from .lua_source import block

# The detection bits a row lists, in display order, as (data/enums/detects.yaml name, name in the row).
DETECTS = [('sight', 'sight'), ('hearing', 'sound'), ('magic', 'magic'), ('lowhp', 'low_hp'), ('ability', 'ability')]

# The behavior flag and roam flag the aggro test reads, by their YAML names.
AMBUSH = 'aggro_ambush'
WORM = 'worm'

# CoP fomors that aren't notorious only aggro players with fomor hate in Lufaise Meadows through Sacrarium.
# The family number and the zone range are fixed in mob_controller.cpp CanAggroTarget.
FOMOR_FAMILY = 172
FOMOR_ZONES = ('lufaise_meadows', 'sacrarium')

# Mixins that change aggro while the monster lives, and the note they give the row.
MIXIN_NOTES = {
    # Asleep outside the hours its table gives, and not aggressive while asleep.
    'sleep_at_night': 'sleeps',
    # Hears by day and also sees from 18:00 to 5:59.
    'families/imp_aggro': 'night_sight',
    # Not aggressive in ball form, and aggressive in the forms it takes every minute or so.
    'families/ghrah': 'form',
    # Aggressive while the zone's apkallu hate is at tier 2, and links only at tier 3.
    'families/apkallu': 'apkallu',
}

# Mixins that change aggro or links in a way the row already holds.
MIXINS_HELD = {
    # It sets aggressive from its spawn animation, and a fight puts that animation back when it ends.
    'families/euvhi',
    # It superlinks the fomors of one patrol or guard, which links.py reads from it, and leaves aggro alone.
    'fomor_party',
}

SLEEP_MIXIN = os.path.join('scripts', 'mixins', 'sleep_at_night.lua')
SLEEP_ROW = re.compile(r"\['(\w+)'\s*\]\s*=\s*\{\s*\d+,\s*\d+,\s*(\d+),\s*(\d+),\s*(?:true|false),\s*(true|false),"
                       r"\s*(\d+)\s*\}")
# The mixin's own test for sleeping, which the hours below replay.
SLEEP_TEST = ('currentHour >= dataTable[mobName][column.SLEEP_HOUR_START] or '
              'currentHour < dataTable[mobName][column.SLEEP_HOUR_END]')

# The euvhi mouth is open while this bit of the animation is set.
EUVHI_MOUTH = 0x02

# The module that swaps in the pre-2011 experience table and /check curve, and the stock files it replaces.
ERA_EXP_MODULE = 'modules/era/lua/globals/toau_experience_points.lua'
STOCK_EXP_TABLE = 'scripts/data/experience_table.lua'
STOCK_EXP_CURVE = 'scripts/globals/exp_difficulty_curve.lua'
DIFFICULTY_ENUM = 'scripts/enum/mob_difficulty.lua'

# The player levels the Too Weak table covers, as GetBaseExp takes them.
PLAYER_LEVELS = range(1, 100)


def detection_value(text, detects):
    """A DETECTION value from a number, xi.detects.X or bit.bor of those. None when it is anything else."""
    text = text.strip()
    if re.fullmatch(r'\d+|0x[0-9A-Fa-f]+', text):
        return int(text, 0)
    parts = re.fullmatch(r'bit\.bor\((.*)\)', text)
    parts = [part.strip() for part in parts.group(1).split(',')] if parts else [text]
    value = 0
    for part in parts:
        match = re.fullmatch(r'xi\.detects\.([A-Z]+)', part)
        if match is None or match.group(1).lower() not in detects:
            return None
        value |= detects[match.group(1).lower()]
    return value


class State:
    """A monster's aggro and link switches and mob mods, as the server holds them."""

    def __init__(self, attributes, detects):
        self.aggressive = attributes['aggressive']
        self.true_detection = attributes['true_detection']
        self.links = attributes['links']
        self.behavior = list(attributes['behavior_flags'])
        self.mob_mods = {'detection': sum(detects[name] for name in set(attributes['detects']))}
        self.mob_mods.update(attributes['mob_mods'])

    def apply(self, ops, detects, where):
        """
        Applies (name, value) ops in order. superlink and sublink keep their source text for the link reader.
        """
        for name, value in ops:
            if isinstance(value, bool):
                setattr(self, name, value)
            elif name == 'detection':
                number = detection_value(value, detects)
                if number is None:
                    raise RuntimeError('%s sets DETECTION to %s, which the exporter can\'t read' % (where, value))
                self.mob_mods[name] = number
            elif name in ('superlink', 'sublink'):
                self.mob_mods[name] = value
            elif re.fullmatch(r'-?\d+', value.strip()):
                self.mob_mods[name] = int(value)
            else:
                raise RuntimeError('%s sets %s to %s, which the exporter can\'t read' % (where, name.upper(), value))


def sleep_table(tree):
    """
    {script name: ((first awake hour, last awake hour) or None, aggressive awake, links awake)} from the mixin.
    Each hour runs the mixin's own test, since a row's comment can say something else.
    """
    text = Path(os.path.join(tree, SLEEP_MIXIN)).read_text(encoding='utf-8')
    if text.count(SLEEP_TEST) != 2 or 'column.AGGRESSIVE]' not in text or 'column.LINK]' not in text:
        raise RuntimeError('%s changed its sleep test. The aggro reader needs updating.' % SLEEP_MIXIN)
    out = {}
    for name, start, end, aggressive, link in SLEEP_ROW.findall(text):
        awake = [hour for hour in range(24) if not (hour >= int(start) or hour < int(end))]
        if awake and awake != list(range(awake[0], awake[-1] + 1)):
            raise RuntimeError('%s row %s wakes more than once a day' % (SLEEP_MIXIN, name))
        hours = (awake[0], awake[-1]) if awake else None
        out[name] = (hours, aggressive == 'true', link == '0')
    if not out:
        raise RuntimeError('%s did not read as expected. The aggro reader needs updating.' % SLEEP_MIXIN)
    return out


class Reader:
    """Works out the aggro fields of a row."""

    def __init__(self, tree, tables, scripts):
        self.detects = tables.detects
        self.scripts = scripts
        self.sleep = sleep_table(tree)
        first, last = (tables.zones[name] for name in FOMOR_ZONES)
        self.fomor_zones = set(range(first, last + 1))
        self.zone_mixins = {}
        self.tree = tree

    def zone_mixin_names(self, script_dir):
        """The mixins scripts/mixins/zones/<zone>.lua gives every monster in the zone."""
        if script_dir not in self.zone_mixins:
            path = os.path.join(self.tree, 'scripts', 'mixins', 'zones', script_dir + '.lua')
            source = self.scripts.lua(path)
            self.zone_mixins[script_dir] = source.mixins if source is not None else []
        return self.zone_mixins[script_dir]

    def mixins(self, names, where):
        """(note, flag reasons) from the mixins named. Fails on a mixin that changes links in an unknown way."""
        note, reasons = None, []
        for mixin in names:
            aggro, links = self.scripts.mixin_aggro(mixin)
            if mixin in MIXIN_NOTES:
                note = MIXIN_NOTES[mixin]
            elif mixin in MIXINS_HELD:
                continue
            elif links:
                raise RuntimeError('Mixin %s changes links, which the exporter does not know (%s)' % (mixin, where))
            elif aggro:
                reasons.append('uses mixin %s' % mixin)
        return note, reasons

    def fields(self, kind, script_dir, zone_id):
        """
        The aggro fields for the row, and the monster's state once it has spawned. The link reader uses that state.
        """
        state = State(kind.attributes, self.detects)
        where = '%s %s' % (script_dir, kind.script)
        state.apply(kind.effects.init_aggro + kind.group_aggro + kind.effects.spawn_aggro, self.detects, where)
        mixins = kind.effects.mixins + kind.group_mixins + self.zone_mixin_names(script_dir)
        note, reasons = self.mixins(mixins, where)
        hours = None
        if note == 'sleeps':
            # The table is keyed by the spawn's script name. Awake, it takes the table's aggressive and link values.
            if kind.script not in self.sleep:
                raise RuntimeError('%s uses sleep_at_night but its table has no row for it' % where)
            hours, awake_aggressive, awake_links = self.sleep[kind.script]
            state.aggressive = awake_aggressive and hours is not None
            state.mob_mods['no_link'] = 0 if awake_links and hours is not None else 1
        elif note == 'night_sight':
            state.mob_mods['detection'] = self.detects['hearing']
        elif note == 'form':
            state.aggressive = True
        elif note == 'apkallu':
            # It turns links off below hate tier 3, and the row holds those tiers.
            state.links = False
        if 'families/euvhi' in mixins:
            state.aggressive = bool(kind.attributes['animation_sub'] & EUVHI_MOUTH)

        row = {}
        always = state.mob_mods.get('always_aggro', 0) > 0
        if state.mob_mods.get('no_aggro', 0) > 0:
            row['no_aggro'] = True
        elif state.aggressive or always:
            row['aggro'] = True
            if always:
                row['any_level'] = True
            bits = state.mob_mods['detection']
            row['detects'] = [shown for name, shown in DETECTS if bits & self.detects[name]]
            if state.true_detection:
                row['true_detect'] = True
            if AMBUSH in state.behavior:
                row['ambush'] = True
            engine_note = None
            if kind.family == FOMOR_FAMILY and not kind.nm and zone_id in self.fomor_zones:
                engine_note = 'fomor_hate'
            elif WORM in kind.roam:
                engine_note = 'underground'
            if engine_note and note:
                raise RuntimeError('%s has two aggro notes, %s and %s' % (where, note, engine_note))
            note = note or engine_note
        if note:
            row['aggro_note'] = note
        if hours:
            row['aggro_hours'] = list(hours)
        if kind.effects.aggro_runtime or reasons:
            kind.flags.add('scripted_aggro')
        return row, state


def lua_files_loaded(tree):
    """Every module Lua file init.txt loads, as paths inside the tree."""
    found = []
    for entry in overlays.init_entries(tree):
        base = os.path.join(tree, 'modules', *entry.split('/'))
        if os.path.isfile(base) and base.endswith('.lua'):
            found.append(base)
        elif os.path.isdir(base):
            for folder, _, names in os.walk(base):
                found += [os.path.join(folder, name) for name in names if name.endswith('.lua')]
    return [os.path.relpath(path, tree).replace(os.sep, '/') for path in found]


def exp_rows(text, where):
    """The [difference] = { 20 numbers } rows of a baseTable, as {difference: [numbers]}."""
    body = block(text, text.index('xi.data.experiencePoints.baseTable ='), where)
    rows = {}
    for difference, numbers in re.findall(r'\[\s*(-?\d+)\]\s*=\s*\{([^}]*)\}', body):
        rows[int(difference)] = [int(number) for number in numbers.split(',')]
    if sorted(rows) != list(range(-44, 16)) or any(len(row) != 20 for row in rows.values()):
        raise RuntimeError('%s baseTable did not read as 60 rows of 20. The aggro reader needs updating.' % where)
    return rows


def exp_curve(text, where, difficulty):
    """([(exp, is Too Weak)] high to low, IEP level, IEP exp) as luautils LoadExpDifficultyCurves stores them."""
    body = text[text.index('expToDifficultyTable ='):]
    body = body[:body.index('}')]
    curve = []
    for exp, name in re.findall(r'\[\s*(\d+)\]\s*=\s*xi\.mobDifficulty\.(\w+)', body):
        if name not in difficulty:
            raise RuntimeError('%s names unknown difficulty %s' % (where, name))
        curve.append((int(exp), difficulty[name] == difficulty['TOO_WEAK']))
    level = re.search(r'local incrediblyEasyPreyLevel\s*=\s*(\d+)', text)
    exp = re.search(r'local incrediblyEasyPreyMinExp\s*=\s*(\d+)', text)
    if not curve or level is None or exp is None:
        raise RuntimeError('%s did not read as a difficulty curve. The aggro reader needs updating.' % where)
    # The pair that holds them is (uint16, uint8), so the exp keeps only its low byte (charutils.h).
    return sorted(curve, reverse=True), int(level.group(1)) & 0xFF, int(exp.group(1)) & 0xFF


def too_weak_table(tree, content):
    """
    (the files it came from, {player level: the highest monster level plus EXP_LVL_MOD that checks Too Weak}).
    It runs charutils.cpp CheckMob and GetBaseExp over the table and curve the server loads.
    """
    loaded = lua_files_loaded(tree)
    module_text = Path(os.path.join(tree, ERA_EXP_MODULE)).read_text(encoding='utf-8')
    gate = re.search(r"Module:new\('toau_experience_points',\s*xi\.pre\(xi\.expansion\.(\w+)\)\)", module_text)
    if gate is None:
        raise RuntimeError('%s changed its gate. The aggro reader needs updating.' % ERA_EXP_MODULE)
    for path in loaded:
        text = Path(os.path.join(tree, path)).read_text(encoding='utf-8', errors='replace')
        if path != ERA_EXP_MODULE and ('LoadExpDifficultyCurves' in text or 'experiencePoints.baseTable =' in text):
            raise RuntimeError('%s changes the experience table or curve. Teach the aggro reader.' % path)
    # xi.pre is true when content is restricted and that expansion is off. That's when content.allows is false.
    era = ERA_EXP_MODULE in loaded and not content.allows(gate.group(1).lower())
    table_file, curve_file = (ERA_EXP_MODULE, ERA_EXP_MODULE) if era else (STOCK_EXP_TABLE, STOCK_EXP_CURVE)
    rows = exp_rows(Path(os.path.join(tree, table_file)).read_text(encoding='utf-8'), table_file)
    difficulty = tables_module.lua_enum(os.path.join(tree, DIFFICULTY_ENUM), 'xi.mobDifficulty')
    curve, iep_level, iep_exp = exp_curve(Path(os.path.join(tree, curve_file)).read_text(encoding='utf-8'),
                                          curve_file, difficulty)

    def too_weak(player, mob):
        exp = rows[max(-44, min(15, mob - min(player, 99)))][(player - 1) // 5]
        if exp == 0:
            return True
        for threshold, weak in curve:
            if exp >= threshold:
                return weak
        return not (exp >= iep_exp and mob >= iep_level)

    highest = {}
    for player in PLAYER_LEVELS:
        levels = range(player - 60, player + 30)
        weak = [mob for mob in levels if too_weak(player, mob)]
        if not weak or weak != list(range(levels[0], weak[-1] + 1)) or weak[-1] == levels[-1]:
            raise RuntimeError('Too Weak is not one run of low levels at player level %d' % player)
        highest[player] = weak[-1]
    return sorted({table_file, curve_file}), highest
