"""
The fights in scripts/battlefields. Each file sets up one battlefield and puts its monsters in groups
(lua_battlefield.cpp addGroups).

A group names its monsters by script (mobs) or by id (mobIds, through the zone's IDs.lua). It can be a link party
of its own (isParty), share a superlink (superlink or superlinkGroup), and set mods, mob mods and mixins. A
battlefield with no fixed area runs in any of three arenas, and each arena has its own copy of the monsters.
"""
import glob
import os
import re

from . import lua_source
from .lua_source import block

# Arenas a zone's battlefields can run in (luautils.cpp OnBattlefieldHandlerInitialize).
ARENAS = 3

# Battlefields that build their groups in code, so their groups are written out here. Each group lists, per
# arena, the IDs.lua mob names and offsets it holds.
HAND = {
    # Five automatons, one of which sits out by the initiator's race, from HUME_AUTOMATON + (area - 1) * 6.
    'Mine_Shaft_2716/automaton_assault.lua': [
        [[('HUME_AUTOMATON', arena * 6 + offset) for offset in range(5)] for arena in range(ARENAS)],
    ],
}

GROUPS_START = re.compile(r'content\.groups\s*=\s*(?=\{)')
ESSENTIAL_START = re.compile(r'content:addEssentialMobs\(\s*(?=\{)')
ALIAS = re.compile(r'local\s+(\w+)\s*=\s*zones\[xi\.zone\.(\w+)\]')
ID_REF = re.compile(r'(\w+)\.mob\.(\w+)(?:\s*\+\s*(\d+))?')
MOB_MOD = re.compile(r'\[\s*xi\.mobMod\.(\w+)\s*\]\s*=\s*(.+)', re.S)
MOD = re.compile(r'\[\s*(xi\.(?:mod|mobMod)\.\w+)\s*\]\s*=\s*(.+)', re.S)


def entries(body):
    """The comma-separated entries at the top level of a Lua table body, skipping strings and nested blocks."""
    out, start, depth, blocks, i = [], 0, 0, 0, 0
    while i < len(body):
        ch = body[i]
        if ch in '\'"':
            i = body.index(ch, i + 1) + 1
            continue
        word = re.match(r'[A-Za-z_]\w*', body[i:]) if (ch.isalpha() or ch == '_') else None
        if word:
            if word.group(0) in ('function', 'if', 'do', 'repeat'):
                blocks += 1
            elif word.group(0) in ('end', 'until'):
                blocks -= 1
            i += len(word.group(0))
            continue
        if ch in '({[':
            depth += 1
        elif ch in ')}]':
            depth -= 1
        elif ch == ',' and depth == 0 and blocks == 0:
            out.append(body[start:i].strip())
            start = i + 1
        i += 1
    if body[start:].strip():
        out.append(body[start:].strip())
    return out


def fields(body):
    """{key: value text} for the key = value entries at the top level of a Lua table body."""
    out = {}
    for entry in entries(body):
        match = re.match(r'(\w+)\s*=\s*(.*)$', entry, re.S)
        if match:
            out[match.group(1)] = match.group(2).strip()
    return out


def inside(text):
    """The body of a table literal, or None when text is not one."""
    text = text.strip()
    return block(text, 0, text) if text.startswith('{') else None


class Group:
    def __init__(self):
        # The scripts named in mobs.
        self.names = []
        # Per arena, (IDs.lua mob name, offset) pairs from mobIds.
        self.ids = []
        self.party = False
        # A key shared by every group that superlinks together, or None.
        self.superlink = None
        # (mob mod name, value text) pairs from mobMods.
        self.mob_mods = []
        # (mod enum text, value text) pairs from mods. A few groups put a mob mod there, and its number lands on
        # whatever mod has the same number.
        self.mods = []
        self.mixins = []


class Fight:
    def __init__(self, zone, arenas):
        # The zone's data/enums/zone.yaml name. Its IDs.lua names the monsters in mobIds.
        self.zone = zone
        self.arenas = arenas
        self.groups = []


def read_ids(value, fight, aliases, where):
    """The per-arena (name, offset) lists of a mobIds value. aliases are the locals naming the fight's IDs table."""
    body = inside(value)
    if body is None:
        raise RuntimeError('%s has a mobIds the exporter can\'t read' % where)
    areas = [inside(entry) for entry in entries(body)] if fight.arenas > 1 else [body]
    if any(area is None for area in areas):
        raise RuntimeError('%s mobIds is not one list per arena' % where)
    out = []
    for area in areas:
        refs = ID_REF.findall(area)
        if any(alias not in aliases for alias, _, _ in refs):
            raise RuntimeError('%s mobIds reads another zone\'s IDs table' % where)
        out.append([(name, int(offset or 0)) for _, name, offset in refs])
    return out


def read_group(body, number, fight, aliases, where):
    group = Group()
    values = fields(body)
    if 'mobs' in values:
        names = inside(values['mobs'])
        if names is None:
            raise RuntimeError('%s group %d has mobs the exporter can\'t read' % (where, number))
        group.names = re.findall(r"'([^']+)'", names)
    if 'mobIds' in values:
        group.ids = read_ids(values['mobIds'], fight, aliases, '%s group %d' % (where, number))
    group.party = values.get('isParty') == 'true'
    if values.get('superlink') == 'true':
        group.superlink = ('superlink', number)
    elif 'superlinkGroup' in values:
        group.superlink = ('superlinkGroup', int(values['superlinkGroup']))
    for entry in entries(inside(values.get('mobMods', '')) or ''):
        match = MOB_MOD.fullmatch(entry)
        if match is None:
            raise RuntimeError('%s group %d has a mob mod the exporter can\'t read: %s' % (where, number, entry))
        group.mob_mods.append((match.group(1).lower(), match.group(2).strip()))
    for entry in entries(inside(values.get('mods', '')) or ''):
        match = MOD.fullmatch(entry)
        if match is None:
            raise RuntimeError('%s group %d has a mod the exporter can\'t read: %s' % (where, number, entry))
        group.mods.append((match.group(1), match.group(2).strip()))
    group.mixins = lua_source.MIXIN_REQUIRE.findall(values.get('mixins', ''))
    return group


def read_fight(path, rel):
    text = lua_source.strip_comments(open(path, encoding='utf-8').read())
    new = re.search(r':new\(\s*(?=\{)', text)
    header = fields(block(text, new.end(), rel)) if new else {}
    zone = re.fullmatch(r'xi\.zone\.(\w+)', header.get('zoneId', ''))
    if zone is None:
        raise RuntimeError('%s has no zoneId the exporter can read' % rel)
    fight = Fight(zone.group(1).lower(), 1 if 'area' in header else ARENAS)
    if rel in HAND:
        for areas in HAND[rel]:
            group = Group()
            group.ids = areas
            fight.groups.append(group)
        return fight
    aliases = {alias for alias, name in ALIAS.findall(text) if name.lower() == fight.zone}
    starts = [(match.end(), 'groups') for match in GROUPS_START.finditer(text)]
    starts += [(match.end(), 'essential') for match in ESSENTIAL_START.finditer(text)]
    if not starts:
        raise RuntimeError('%s sets up no groups the exporter can read. Add it to battlefields.HAND.' % rel)
    # content.groups replaces the list and addEssentialMobs adds to it, in file order.
    for start, kind in sorted(starts):
        body = block(text, start, rel)
        if kind == 'groups':
            fight.groups = [read_group(inside(entry) or '', number, fight, aliases, rel)
                            for number, entry in enumerate(entries(body), len(fight.groups))]
        else:
            group = Group()
            group.names = re.findall(r"'([^']+)'", body)
            group.party = True
            group.superlink = ('superlink', len(fight.groups))
            fight.groups.append(group)
    return fight


def load(tree, zone_names):
    """{zone enum name: [Fight]} for the battlefields in the zones named."""
    root = os.path.join(tree, 'scripts', 'battlefields')
    fights = {}
    for path in sorted(glob.glob(os.path.join(root, '**', '*.lua'), recursive=True)):
        rel = os.path.relpath(path, root).replace(os.sep, '/')
        fight = read_fight(path, rel)
        if fight.zone in zone_names:
            fights.setdefault(fight.zone, []).append(fight)
    return fights
