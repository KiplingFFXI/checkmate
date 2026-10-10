"""
What Steal can take from each monster, and the job, level and gear in data\\steal.lua that the chance comes from.

A template's loot block names its steal items, one name or a list. buildDropList in zoneutils.cpp adds each one to
the monster's drop list as a steal entry, and getStealItem in lua_base_entity.cpp picks one of them at random each
time someone uses Steal. useSteal in thief.lua rolls the chance from your THF level, the STEAL mod and the monster's
level, and only gear adds to the STEAL mod. A mob file's onSteal does get called, but the Interaction Framework
drops its answer today (onHandler in interaction_lookup.lua), so Steal still takes from the YAML list. Each reader
stops the export when the server stops looking the way it expects, so the weekly job catches it.
"""
from pathlib import Path
import concurrent.futures
import os
import re

from . import aggro
from . import drops
from . import items
from . import lua_source
from . import species
from . import sqlfile
from . import tables

THIEF = 'scripts/globals/job_utils/thief.lua'
ABILITY = 'scripts/actions/abilities/steal.lua'
UTILS = 'scripts/utils/utils.lua'

# The roll the addon copies, from thief.lua useSteal. Each has to be there, and no other line of useSteal may name
# thfLevel, stealMod or stealChance.
ROLL_START = 'xi.job_utils.thief.useSteal = function(player, target, ability, action)'
ROLL_LINES = (
    'local thfLevel = utils.getActiveJobLevel(player, xi.job.THF)',
    'local stealMod = player:getMod(xi.mod.STEAL)',
    'local stealChance = 50 + stealMod * 2 + thfLevel - target:getMainLvl()',
    'if target:isMob() and math.randomInt(1, 100) <= stealChance and stolen ~= 0 then',
)
ROLL_NAMES = re.compile(r'\b(?:thfLevel|stealMod|stealChance)\b')

# The ability hands both steps to thief.lua.
ABILITY_LINES = (
    'return xi.job_utils.thief.checkSteal(player, target, ability)',
    'return xi.job_utils.thief.useSteal(player, target, ability, action)',
)

# utils.getActiveJobLevel line for line: your main level with that job as your main, your support level with it as
# your support, else 0.
JOB_LEVEL_START = 'function utils.getActiveJobLevel(actor, job)'
JOB_LEVEL_LINES = (
    'local jobLevel = 0',
    'if actor:getMainJob() == job then',
    'jobLevel = actor:getMainLvl()',
    'elseif actor:getSubJob() == job then',
    'jobLevel = actor:getSubLvl()',
    'end',
    'return jobLevel',
)

# A line that hooks Steal, changes or clears what a monster gives up, or touches the STEAL mod. The bare words catch
# a module override in string form too, like m:addOverride('xi.job_utils.thief.useSteal', ...).
HOOKS = re.compile(r"\b(?:onSteal|useSteal|checkSteal|getStealItem|setDropID|itemStolen)\b|\bmod\.STEAL\b"
                   r"|\babilities\.steal\b|function\s+utils\.getActiveJobLevel\b|\butils\.getActiveJobLevel\s*="
                   r"|['\"]utils\.getActiveJobLevel['\"]")

# Every line in the scanned Lua that hooks Steal, word for word with comments out and spaces collapsed, by file,
# with why it's safe. A line only passes in its own file. Any other line stops the export.
KNOWN_LINES = {
    'scripts/globals/job_utils/thief.lua': ('Steal itself. check_roll reads its roll.', {
        'xi.job_utils.thief.checkSteal = function(player, target, ability)',
        'xi.job_utils.thief.useSteal = function(player, target, ability, action)',
        'local stealMod = player:getMod(xi.mod.STEAL)',
        'stolen = target:getStealItem()',
        'target:itemStolen(true)',
    }),
    'scripts/actions/abilities/steal.lua': ('The ability. check_roll reads it.', set(ABILITY_LINES)),
    'scripts/utils/utils.lua': ('Defines getActiveJobLevel. check_roll reads it.', {
        'function utils.getActiveJobLevel(actor, job)',
    }),
    'scripts/globals/interaction/interaction_global.lua': ("The Interaction Framework's Steal hook. Its handlers "
                                                           'live in the quest and mission files, which are scanned.', {
        'function InteractionGlobal.onSteal(player, mob, ability, action, fallbackFn)',
        'return InteractionGlobal.lookup:onSteal(player, mob, ability, action, fallbackFn)',
    }),
    'scripts/globals/interaction/interaction_lookup.lua': ('Finds those handlers by the monster\'s name.', {
        "thirdLevelKey ~= 'onSteal' and",
        'function InteractionLookup:onSteal(player, mob, ability, action, fallbackFn)',
        "return onHandler(self.data, mob:getName(), 'onSteal', { player, mob, ability, action }, fallbackFn)",
    }),
    'scripts/globals/npc_util.lua': ('popFromQM clears the stolen mark on the NM it pops.', {
        'mob:itemStolen(false)',
    }),
    'scripts/zones/AlTaieu/mobs/Absolute_Virtue.lua': ('setDropID(0) takes its loot away. Its template has nothing '
                                                       'to steal.', {'mob:setDropID(0)'}),
    'scripts/zones/VeLugannon_Palace/mobs/Brigandish_Blade.lua': ("Its onSteal returns Buccaneer's Knife. "
                                                                  'FIXED_STEAL checks that against its YAML.', {
        'entity.onSteal = function(player, target, ability, action)',
    }),
    'scripts/mixins/nyzul_boss_drops.lua': ('Nyzul Isle Investigation bosses, which checkmate leaves out.', {
        'mob:setDropID(0)',
    }),
    'modules/phoenix/lua/custom/pernicious_presents_event.lua': ('A GM event. setDropID(0) on the monsters it spawns, '
                                                                 'which have no row.', {'mob:setDropID(0)'}),
}
KNOWN_FOLDERS = {'scripts/zones/Zhayolm_Remnants/': 'Salvage, which checkmate leaves out.'}

# Mob scripts whose onSteal returns one fixed item. Today the Interaction Framework drops that answer (onHandler in
# interaction_lookup.lua), so Steal still takes from the YAML list, but the item has to be the YAML's in case that
# changes.
FIXED_STEAL = {'scripts/zones/VeLugannon_Palace/mobs/Brigandish_Blade.lua'}
FIXED_START = re.compile(r'^entity\.onSteal = function\(')
FIXED_RETURN = re.compile(r'^return xi\.item\.([A-Z0-9_]+)$')

# Steal's row in abilities.sql. The client knows each ability by its id, so the id doesn't move.
STEAL_NAME, STEAL_ID = 'steal', 41

# A module statement on abilities that names Steal, by its name or its id.
STEAL_ROW = re.compile(r"'%s'|\babilityId`?\s*(?:=|IN\s*\([^)]*?\b)\s*%d\b|\bVALUES\s*\(\s*%d\s*,"
                       % (STEAL_NAME, STEAL_ID, STEAL_ID), re.I)

# The STEAL mod's name in mod.yaml, and the one latent on it the addon can follow, by its name in latent.yaml.
STEAL_MOD = 'steal'
HP_TP_LATENT = 'hp_under_tp_under_100'

# One item_latents row: item, mod, value, latent and its parameter. Some lines have no space before the values.
ITEM_LATENT = re.compile(r'^INSERT INTO `item_latents` VALUES\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(-?\d+)\s*,\s*(\d+)\s*,'
                         r'\s*(-?\d+)\s*\);')

# Rabbit Charm and Rogue's Ring, era gear with STEAL. If either is gone, the reader is reading the wrong thing.
RABBIT_CHARM = 13112
ROGUES_RING = 13291

NEEDS_UPDATE = 'The steal reader needs updating.'


def pool(loot, ids, where):
    """
    [(item id, name), ...] Steal can take from one loot block, in the YAML's order. Empty when there's nothing to
    steal. A list makes each Steal pick one at random (lua_base_entity.cpp getStealItem).
    """
    names = species.names((loot or {}).get('steal'))
    if all(name == drops.NOTHING for name in names):
        return []
    if drops.NOTHING in names:
        raise RuntimeError('%s has nothing next to an item in its steal list. The addon has no words for '
                           'that yet.' % where)
    found = [(drops.lookup(ids, name, where), name) for name in names]
    if len({item for item, _ in found}) != len(found):
        raise RuntimeError('%s names the same steal item twice, which makes it likelier. The addon has no words for '
                           'that yet.' % where)
    return found


def ability(tree):
    """{'job': 6, 'level': 5}, Steal's job and level from the abilities row named steal."""
    found = [row for row in sqlfile.rows(os.path.join(tree, 'sql', 'abilities.sql'), 'abilities')
             if row['name'] == STEAL_NAME]
    # A main-only addType would mean a support THF can't Steal.
    if len(found) != 1 or found[0]['abilityId'] != STEAL_ID or found[0]['addType'] != 0:
        raise RuntimeError('abilities.sql has no steal row, or its row changed. %s' % NEEDS_UPDATE)
    return {'job': found[0]['job'], 'level': found[0]['level']}


def gear(tree):
    """{item id: (steal, level)} for every item with the STEAL mod, and its own level from item_equipment."""
    found = items.mod_values(tree, tables.read_enum(tree, 'mod')[STEAL_MOD])
    if RABBIT_CHARM not in found:
        raise RuntimeError('item_mods has no STEAL on Rabbit Charm (%d). %s' % (RABBIT_CHARM, NEEDS_UPDATE))
    levels = items.levels(tree, found, 'STEAL')
    return {item: (found[item], levels[item]) for item in found}


def latents(tree):
    """{item id: (steal, level, hp_percent)} for the item_latents rows on STEAL the addon can follow."""
    mod = tables.read_enum(tree, 'mod')[STEAL_MOD]
    kinds = tables.read_enum(tree, 'latent')
    names = {number: name for name, number in kinds.items()}
    found = {}
    with open(os.path.join(tree, 'sql', 'item_latents.sql'), encoding='utf-8', errors='replace') as source_file:
        for line in source_file:
            if not line.startswith('INSERT'):
                continue
            match = ITEM_LATENT.match(line)
            if match is None:
                raise RuntimeError('The steal reader can\'t read this item_latents line: %s' % line.strip())
            item, mod_id, value, kind, param = (int(number) for number in match.groups())
            if mod_id != mod:
                continue
            if kind != kinds[HP_TP_LATENT]:
                raise RuntimeError('item_latents has a STEAL latent of kind %s, which the addon can\'t follow. %s'
                                   % (names.get(kind, kind), NEEDS_UPDATE))
            if item in found:
                raise RuntimeError('item_latents has two STEAL latents on item %d, which the addon can\'t follow. %s'
                                   % (item, NEEDS_UPDATE))
            found[item] = (value, param)
    if ROGUES_RING not in found:
        raise RuntimeError('item_latents has no STEAL on Rogue\'s Ring (%d). %s' % (ROGUES_RING, NEEDS_UPDATE))
    levels = items.levels(tree, found, 'STEAL latent')
    return {item: (value, levels[item], param) for item, (value, param) in found.items()}


def lua_lines(tree, path):
    """A Lua file's lines with the comments out."""
    text = Path(os.path.join(tree, path)).read_text(encoding='utf-8', errors='replace')
    return lua_source.strip_comments(text).split('\n')


def collapse(line):
    return ' '.join(line.split())


def function_body(lines, first):
    """
    The lines after the function definition line at lines[first], up to the next line that is just end, with the
    spaces run together and the empty ones left out. None when there's no such end.
    """
    last = next((at for at in range(first + 1, len(lines)) if lines[at].rstrip() == 'end'), None)
    if last is None:
        return None
    return [collapse(line) for line in lines[first + 1:last] if line.strip()]


def body_of(lines, start):
    """The body of the function whose definition line reads start, or None when it isn't there."""
    collapsed = [collapse(line) for line in lines]
    return function_body(lines, collapsed.index(start)) if start in collapsed else None


def check_roll(tree):
    """Stops unless thief.lua's roll, the Steal ability script and utils.getActiveJobLevel still read as above."""
    roll = body_of(lua_lines(tree, THIEF), ROLL_START)
    if (roll is None or any(line not in roll for line in ROLL_LINES)
            or any(ROLL_NAMES.search(line) for line in roll if line not in ROLL_LINES)):
        raise RuntimeError('%s changed the Steal roll. %s' % (THIEF, NEEDS_UPDATE))
    script = [collapse(line) for line in lua_lines(tree, ABILITY)]
    if any(line not in script for line in ABILITY_LINES):
        raise RuntimeError('%s no longer hands Steal to thief.lua. %s' % (ABILITY, NEEDS_UPDATE))
    if body_of(lua_lines(tree, UTILS), JOB_LEVEL_START) != list(JOB_LEVEL_LINES):
        raise RuntimeError('%s changed getActiveJobLevel. %s' % (UTILS, NEEDS_UPDATE))


def fixed_item(lines, path):
    """The item_basic name of the one item a FIXED_STEAL script's onSteal returns."""
    first = next((at for at, line in enumerate(lines) if FIXED_START.match(line)), None)
    body = function_body(lines, first) if first is not None else None
    returns = [line for line in body or [] if re.search(r'\breturn\b', line)]
    match = FIXED_RETURN.match(returns[0]) if len(returns) == 1 else None
    if match is None:
        raise RuntimeError('%s changed its onSteal. %s' % (path, NEEDS_UPDATE))
    return match.group(1).lower()


def has_hook(path):
    """True when a hook shows up anywhere in the file, comments and all."""
    with open(path, encoding='utf-8', errors='replace') as handle:
        return HOOKS.search(handle.read()) is not None


def check_scripts(tree):
    """
    Stops on any line that hooks Steal, changes or clears what a monster gives up, or touches the STEAL mod, unless
    KNOWN_LINES has it. Returns {(script folder, script name): item name} for FIXED_STEAL.
    """
    paths = aggro.lua_files_loaded(tree)
    for folder, _, names in os.walk(os.path.join(tree, 'scripts')):
        paths += [os.path.relpath(os.path.join(folder, name), tree).replace(os.sep, '/') for name in names
                  if name.endswith('.lua')]
    paths = sorted(path for path in paths if not any(path.startswith(folder) for folder in KNOWN_FOLDERS))
    # Only a file with a hit somewhere gets its comments taken out and read line by line. The first look goes
    # through the files side by side, which is a lot quicker on Windows, where the virus scanner checks each file
    # the first time it's opened.
    with concurrent.futures.ThreadPoolExecutor(16) as workers:
        found = workers.map(has_hook, [os.path.join(tree, path) for path in paths])
        hits = [path for path, hit in zip(paths, found) if hit]
    fixed = {}
    for path in hits:
        lines = lua_lines(tree, path)
        known = KNOWN_LINES.get(path, ('', set()))[1]
        for line in lines:
            if HOOKS.search(line) and collapse(line) not in known:
                raise RuntimeError('%s changes what Steal takes or its chance, which the exporter can\'t follow: '
                                   '"%s". Add the line to KNOWN_LINES in export\\steal.py with what it does, or '
                                   'teach the steal reader.' % (path, collapse(line)))
        if path in FIXED_STEAL:
            parts = path.split('/')
            fixed[(parts[2], parts[4][:-len('.lua')])] = fixed_item(lines, path)
    return fixed


def check_fixed(fixed, stolen, where):
    """Stops unless the YAML steal list of a monster whose onSteal returns one item holds only that item."""
    if [name for _, name in stolen] != [fixed]:
        raise RuntimeError('%s: its onSteal returns %s, but its steal list has %s. %s'
                           % (where, fixed, ', '.join(name for _, name in stolen) or drops.NOTHING, NEEDS_UPDATE))


def check_traits(sql_tables):
    """Stops when a job trait adds Steal, which the addon doesn't count."""
    if any(trait['mod'] == STEAL_MOD for traits in sql_tables.traits_by_job.values() for trait in traits):
        raise RuntimeError('A job trait adds Steal, which the addon doesn\'t count. %s' % NEEDS_UPDATE)


def check_module_sql(tree, gear_items):
    """Stops on module SQL that changes Steal, the STEAL mod, or the level of an item that adds Steal."""
    names = {row['name'] for row in sqlfile.rows(os.path.join(tree, 'sql', 'item_equipment.sql'), 'item_equipment')
             if row['itemId'] in gear_items}
    gear_test = re.compile('|'.join([r'\b%d\b' % item for item in sorted(gear_items)]
                                    + ["'%s'" % re.escape(name) for name in sorted(names)]))
    mod = str(tables.read_enum(tree, 'mod')[STEAL_MOD])
    for rel, table, statement in tables.module_statements(tree):
        if ((table in ('item_mods', 'item_latents') and re.search(r'\b%s\b' % mod, statement))
                or (table == 'abilities' and STEAL_ROW.search(statement))
                or (table == 'item_equipment' and gear_test.search(statement))):
            raise RuntimeError('%s changes Steal or the gear that adds to it, which the exporter reads. Teach it this '
                               'change.' % rel)
