"""
The crit merits and gear in data\\crit.lua, and the checks the Crit taken part needs.

battleutils.cpp GetCritHitRate works out a crit both ways. Yours gains your Critical Hit Rate merits. A monster's on you
loses your Enemy Critical Hit Rate merits and the critical hit evasion on your gear. Yonin lowers it too, but Yonin is
WotG, which Phoenix runs off, so the addon leaves it out. GetMeritValue in merit.cpp only counts as many merits as your main level allows, and gear only counts once
your main level reaches its own level (GetScaledItemModifier). Each reader stops the export when the server stops
looking the way it expects, so the weekly job catches it.
"""
from pathlib import Path
import os
import re

from . import aggro
from . import items
from . import lua_source
from . import overlays
from . import sqlfile
from . import steal
from . import tables

# The two merits, by their data/merits.yaml names. Both are in the Others category, which counts on every job.
MERITS = ('crit_hit_rate', 'enemy_crit_rate')
CATEGORY = 'others'

# Safety Mantle, era gear with critical hit evasion. If it's gone, the reader is reading the wrong thing.
SAFETY_MANTLE = 15463

# Yonin's abilities row, which the addon leaves out while its content is off.
YONIN_NAME, YONIN_ID = 'yonin', 248

# Where the mob script readers follow setMobSkillAttack and setAutoAttackEnabled: the mob scripts, the mixins and the
# xi.* helpers.
FOLLOWED = re.compile(r'^scripts/(?:zones/[^/]+/mobs|mixins|globals|combat)/')
TP_MOVES_CALL = re.compile(r'\bsetMobSkillAttack\b')
SWINGS_CALL = re.compile(r'\bsetAutoAttackEnabled\b')
# Lines no reader follows, wherever they are: critical hit evasion, and the mob mod setMobSkillAttack sets.
UNREAD = re.compile(r'\bmod\.CRITICAL_HIT_EVASION\b|\bmobMod\.ATTACK_SKILL_LIST\b')

# Every line that names critical hit evasion or the TP move list mob mod, and every line outside FOLLOWED that gives a
# TP move list or stops the swings or gives them back, word for word with comments out and spaces run together, by
# file, with why the data still comes out right. Any other line stops the export.
EFFECT_REASON = ("A status effect that lowers it on whoever has it. checkmate can't see a monster's status effects, "
                 'the same as its other buffs and debuffs.')
KNOWN_LINES = {
    'scripts/combat/physical_utilities.lua': ('Reads it for weapon skills, blue magic and TP moves, never a normal '
                                              'swing.', {
        'local targetCriticalEvasion = target:getMod(xi.mod.CRITICAL_HIT_EVASION) / 100',
    }),
    'scripts/effects/bewildered_daze_1.lua': (EFFECT_REASON, {
        'effect:addMod(xi.mod.CRITICAL_HIT_EVASION, -effect:getPower())',
    }),
    'scripts/effects/bewildered_daze_2.lua': (EFFECT_REASON, {'effect:addMod(xi.mod.CRITICAL_HIT_EVASION, -7)'}),
    'scripts/effects/bewildered_daze_3.lua': (EFFECT_REASON, {'effect:addMod(xi.mod.CRITICAL_HIT_EVASION, -9)'}),
    'scripts/effects/bewildered_daze_4.lua': (EFFECT_REASON, {'effect:addMod(xi.mod.CRITICAL_HIT_EVASION, -11)'}),
    'scripts/effects/bewildered_daze_5.lua': (EFFECT_REASON, {'effect:addMod(xi.mod.CRITICAL_HIT_EVASION, -13)'}),
    'scripts/effects/critical_hit_evasion_down.lua': (EFFECT_REASON, {
        'effect:addMod(xi.mod.CRITICAL_HIT_EVASION, -effect:getPower())',
    }),
    'scripts/globals/abyssea/atma.lua': ("Abyssea's atmas, which only players get.", {
        '[xi.keyItem.ATMA_OF_ETERNITY] = { xi.mod.CRITICAL_HIT_EVASION, -20, xi.mod.SLOWRES, 30, xi.mod.CURSERES, '
        '30 },',
    }),
    'scripts/actions/mobskills/touchdown.lua': ('The wyrms land with it. Their own scripts give them their normal hits '
                                               'back too, so none of them gets tp_moves.', {
        'mob:setMobSkillAttack(0)',
    }),
    'scripts/actions/spells/trust/august.lua': ('A trust, which has no row.', {'mob:setMobSkillAttack(1197)'}),
    'scripts/actions/spells/trust/shantotto_ii.lua': ('A trust, which has no row.', {'mob:setMobSkillAttack(1163)'}),
    'scripts/battlefields/Mine_Shaft_2716/century_of_hardship.lua': ('The Moblins and the Bugbear only stop swinging '
                                                                     'while they stand still for an order, and swing '
                                                                     'again after.', {
        'moblin:setAutoAttackEnabled(false)',
        'bugbear:setAutoAttackEnabled(false)',
        'moblin:setAutoAttackEnabled(true)',
        'bugbear:setAutoAttackEnabled(true)',
    }),
    'scripts/utils/utils.lua': ('utils.mobTeleport only stops the swings while it hides the monster, and its timer '
                                'gives them back.', {
        'mob:setAutoAttackEnabled(false)',
        'mobArg:setAutoAttackEnabled(true)',
    }),
}
# The trusts that stop their own swings.
KNOWN_LINES.update({'scripts/actions/spells/trust/%s.lua' % name: ('A trust, which has no row.',
                                                                   {'mob:setAutoAttackEnabled(false)'})
                    for name in ('apururu_uc', 'brygid', 'cherukiki', 'cornelia', 'joachim', 'koru-moru', 'kupofried',
                                 'kuyin_hathdenna', 'monberaux', 'moogle', 'sakura', 'semih_lafihna', 'shantotto',
                                 'star_sibyl', 'sylvie_uc', 'tenzen_ii', 'ulmia', 'yoran-oran_uc')})

NEEDS_UPDATE = 'The crit reader needs updating.'


def merits(tree, roots):
    """
    ({name: {'id', 'per_merit', 'most'}} for both merits, [(level, cap), ...]) from data/merits.yaml with the module
    overlays merged in. most is the fewer of what its cost list prices (or its own cap) and what its category allows in
    all. Each level cap holds from its level until the next one, lowest level first.
    """
    document = overlays.load_merged(tree, roots, 'merits').get('merits') or {}
    caps = [(int(entry['level']), int(entry['cap'])) for entry in document.get('level_caps') or []]
    if not caps or caps[0][0] != 0 or any(a[0] >= b[0] or a[1] > b[1] for a, b in zip(caps, caps[1:])):
        raise RuntimeError('data/merits.yaml level_caps no longer starts at level 0 and goes up. %s' % NEEDS_UPDATE)
    category = (document.get('categories') or {}).get(CATEGORY) or {}
    found = {}
    for name in MERITS:
        merit = (category.get('merits') or {}).get(name) or {}
        costs = (document.get('upgrade_costs') or {}).get(merit.get('upgrade_cost'))
        if not merit.get('id') or not merit.get('value') or not costs or category.get('max_upgrades') is None:
            raise RuntimeError('data/merits.yaml has no %s in %s with an id, value, cost list and category cap. %s'
                               % (name, CATEGORY, NEEDS_UPDATE))
        # The server's own cap holds even at 0, which leaves a merit in the menu but unbuyable.
        own = merit['max_upgrades'] if merit.get('max_upgrades') is not None else len(costs)
        found[name] = {'id': int(merit['id']), 'per_merit': int(merit['value']),
                       'most': int(min(own, category['max_upgrades']))}
        if found[name]['most'] > caps[-1][1]:
            raise RuntimeError('data/merits.yaml allows more %s merits than any level counts. %s'
                               % (name, NEEDS_UPDATE))
    return found, caps


def gear(tree):
    """{item id: (crit_evasion, level)} for every item with CRITICAL_HIT_EVASION, its level from item_equipment."""
    found = items.mod_values(tree, tables.read_enum(tree, 'mod')[lua_source.CRIT_EVASION])
    if SAFETY_MANTLE not in found:
        raise RuntimeError('item_mods has no CRITICAL_HIT_EVASION on Safety Mantle (%d). %s'
                           % (SAFETY_MANTLE, NEEDS_UPDATE))
    levels = items.levels(tree, found, 'CRITICAL_HIT_EVASION')
    return {item: (found[item], levels[item]) for item in found}


def check_latents(tree):
    """Stops on any item_latents row with CRITICAL_HIT_EVASION, which the addon doesn't follow."""
    mod = tables.read_enum(tree, 'mod')[lua_source.CRIT_EVASION]
    with open(os.path.join(tree, 'sql', 'item_latents.sql'), encoding='utf-8', errors='replace') as source_file:
        for line in source_file:
            match = steal.ITEM_LATENT.match(line)
            if match is not None and int(match.group(2)) == mod:
                raise RuntimeError('item_latents has CRITICAL_HIT_EVASION on item %s, which the addon doesn\'t follow. %s'
                                   % (match.group(1), NEEDS_UPDATE))


def check_traits(sql_tables):
    """Stops when a job trait has critical hit evasion, which the addon doesn't count."""
    if any(trait['mod'] == lua_source.CRIT_EVASION for traits in sql_tables.traits_by_job.values() for trait in traits):
        raise RuntimeError('A job trait has critical hit evasion, which the addon doesn\'t count. %s' % NEEDS_UPDATE)


def check_module_sql(tree, gear_items):
    """Stops on module SQL that changes CRITICAL_HIT_EVASION or the level of an item with it."""
    names = {row['name'] for row in sqlfile.rows(os.path.join(tree, 'sql', 'item_equipment.sql'), 'item_equipment')
             if row['itemId'] in gear_items}
    gear_test = re.compile('|'.join([r'\b%d\b' % item for item in sorted(gear_items)]
                                    + ["'%s'" % re.escape(name) for name in sorted(names)]))
    mod = str(tables.read_enum(tree, 'mod')[lua_source.CRIT_EVASION])
    for rel, table, statement in tables.module_statements(tree):
        if ((table in ('item_mods', 'item_latents') and re.search(r'\b%s\b' % mod, statement))
                or (table == 'item_equipment' and gear_test.search(statement))):
            raise RuntimeError('%s changes critical hit evasion or the gear that has it, which the exporter reads. '
                               'Teach it this change.' % rel)


def check_yonin(tree, allowed):
    """Stops when Yonin's abilities row loads with this content, or module SQL could change its content tag."""
    found = [row for row in sqlfile.rows(os.path.join(tree, 'sql', 'abilities.sql'), 'abilities')
             if row['name'] == YONIN_NAME]
    if len(found) != 1 or found[0]['abilityId'] != YONIN_ID:
        raise RuntimeError('abilities.sql has no yonin row, or its id changed. %s' % NEEDS_UPDATE)
    if allowed.allows(found[0]['content_tag']):
        raise RuntimeError('Yonin loads with this content, and Crit taken leaves it out. %s' % NEEDS_UPDATE)
    # The era module's recast change leaves the tag alone. A tag change, or the row put back in, could turn Yonin on.
    for rel, table, statement in tables.module_statements(tree):
        if table == 'abilities' and (re.search(r'\bcontent_tag\b', statement, re.I)
                                     or (not re.match(r'UPDATE\b', statement, re.I)
                                         and re.search(r"\b%d\b|'%s'" % (YONIN_ID, YONIN_NAME), statement))):
            raise RuntimeError('%s could change whether Yonin loads, which Crit taken leaves out. %s'
                               % (rel, NEEDS_UPDATE))


def unknown_line(path, line):
    """True when a line changes something the crit readers don't follow and KNOWN_LINES doesn't have it."""
    if steal.collapse(line) in KNOWN_LINES.get(path, ('', set()))[1]:
        return False
    if UNREAD.search(line):
        return True
    if FOLLOWED.match(path):
        return False
    return bool(TP_MOVES_CALL.search(line) or SWINGS_CALL.search(line))


def check_scripts(tree):
    """
    Stops on any line in the scripts or the loaded modules that names critical hit evasion or the TP move list mob mod,
    or outside the mob scripts, mixins and helpers gives a TP move list or stops the swings or gives them back, unless
    KNOWN_LINES has it.
    """
    paths = aggro.lua_files_loaded(tree)
    for folder, _, names in os.walk(os.path.join(tree, 'scripts')):
        paths += [os.path.relpath(os.path.join(folder, name), tree).replace(os.sep, '/') for name in names
                  if name.endswith('.lua')]
    words = re.compile(r'CRITICAL_HIT_EVASION|ATTACK_SKILL_LIST|setMobSkillAttack|setAutoAttackEnabled')
    for path in sorted(paths):
        text = Path(os.path.join(tree, path)).read_text(encoding='utf-8', errors='replace')
        if not words.search(text):
            continue
        for line in lua_source.strip_comments(text).split('\n'):
            if unknown_line(path, line):
                raise RuntimeError('%s changes your crit or a monster\'s crit on you in a way the exporter can\'t '
                                   'follow: "%s". Add the line to KNOWN_LINES in export\\crit.py with why the data '
                                   'still comes out right, or teach the reader.' % (path, steal.collapse(line)))
