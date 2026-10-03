"""
Who a monster links with (zone_entities.cpp FindPartyForMob, mob_controller.cpp TryLink, mob_entity.cpp CanLink).

When a zone loads, each monster that links, has a sublink or force-links (in Dynamis, battlefield typed, or with a
superlink) joins the first link party it matches, in ascending spawn id. A superlinked monster matches the same
superlink, another force-linker matches any force-linker, and the rest match a linker of the same family or the
same sublink.

In a fight the monster calls idle members of its party. It skips its own family unless it links or force-links
itself, and never calls pets or monsters with NO_LINK, unless they share its superlink. Every monster that joins
calls its own helpers the same way, so a row lists everyone its fight can pull in. Distance, sight and facing
depend on where things stand, so they are left out.

A battlefield sets up new parties when it starts (lua_battlefield.cpp addGroups). An isParty group is one party,
a superlinked group is another, and the rest of its battlefield-typed monsters share one. Other monsters in it
go back to their family or sublink party. Each arena is a fight of its own, and a monster that several fights
use links with the partners from each.
"""
import copy
import re

from . import aggro
from . import dynamis
from . import outside

# Hand-read link changes that the static reader can't follow, by (zone script folder, script).
KNOWN_LINK_SCRIPTS = {
    # Spawns below the first Jailer of Love superlink with Jailer of Justice, and the rest with Jailer of Love.
    # The id split in zones.py gives the two sides their own rows.
    ('AlTaieu', 'Qnxzomit'): 'split',
    # Sets a sublink by id in groups of four. Every Qn'zdei already shares the zdei family party and no other
    # monster has those sublinks, so it changes nothing.
    ('The_Garden_of_RuHmet', 'Qnzdei'): 'none',
    # Sets NO_LINK on spawn after early returns that only skip it outside its battlefield.
    ('Mine_Shaft_2716', 'Hume_Automaton'): 'no_link',
}

# Helpers whose link changes the reader can't follow but that change no names.
KNOWN_LINK_HELPERS = {
    # Superlinks the fomors of one patrol. The linking ones already share the fomor family party, and the rest
    # have no party for a superlink to work in.
    'xi.mix.fomorParty.onPartySpawn',
}

# Superlink values a script can name, and how the server works them out.
OWN_TARG = 'mob:getTargID()'
OWN_ID = 'mob:getID()'
TARG_OF = re.compile(r'GetMobByID\(ID\.mob\.(\w+)\):getTargID\(\)')
ID_OF = re.compile(r'ID\.mob\.(\w+)(?:\s*\+\s*(\d+))?')

# The two superlinks the Qn'xzomit split picks between, below the split and from it on.
SPLIT_SUPERLINKS = ('GetMobByID(ID.mob.JAILER_OF_JUSTICE):getTargID()', 'GetMobByID(ID.mob.JAILER_OF_LOVE):getTargID()')

# The calls that make the monster at an offset a pet, which never links with the party. setPet takes any name.
SET_PET = re.compile(r"xi\.pet\.setMobPet\(\s*mob\s*,\s*(-?\d+)\s*,\s*'([^']+)'\s*\)")
SET_PET_BY_ID = re.compile(r'mob:setPet\(\s*GetMobByID\(\s*mob:getID\(\)\s*\+\s*(\d+)\s*[,)]')

# Any call that makes a monster a pet.
ANY_PET = re.compile(r'setMobPet\s*\(|:setPet\s*\(')

# Scripts that pair each of their spawns with a pet through two ID tables, as (zone script folder, script):
# (pet script, how many of the pet's spawns come before the first one it pairs with).
TABLE_PETS = {
    # The first pet of each kind belongs to Ulaern.
    ('AlTaieu', 'Omaern_BST'): ('Aerns_Xzomit', 1),
    ('AlTaieu', 'Omaern_DRG'): ('Aerns_Wynav', 1),
    ('AlTaieu', 'Omaern_SMN'): ('Aerns_Elemental', 1),
    ('Misareaux_Coast', 'Gigas_Warwolf'): ('Gigass_Sheep', 0),
}

# Scripts with pet calls the reader can't follow. Their pet depends on the fight, or is one the reader already has.
KNOWN_PET_SCRIPTS = {
    # Picks the tiger or the mandragora in the fight.
    ('LaLoff_Amphitheater', 'Ark_Angel_MR'),
    # Takes the pet for the initiator's job when it spawns.
    ('Mine_Shaft_2716', 'Fantoccini'),
    # Takes a pet when it copies a pet job's two-hour.
    ('Waughroon_Shrine', 'Osschaart'),
    # Takes the same pet back when it calls it again.
    ('Mamool_Ja_Training_Grounds', 'Mamool_Ja_Warder_bst'),
}


def int16(value):
    """A mob mod is an int16, so a full entity id wraps."""
    value &= 0xFFFF
    return value - 0x10000 if value >= 0x8000 else value


class Ids:
    """The zone's IDs.lua mob names, first spawn ids, and the spawn ids of each script in order."""

    def __init__(self, tree, script_dir, first, tables=None):
        self.names = outside.id_names(tree, script_dir)
        self.first = first
        self.tables = tables or {}
        self.script_dir = script_dir

    def first_id(self, name):
        script = self.names.get(name)
        if script not in self.first:
            raise RuntimeError('%s IDs.lua has no placed monster for mob.%s' % (self.script_dir, name))
        return self.first[script]

    def value(self, text, spawn_id, where):
        """The number a superlink or sublink value comes to for the spawn."""
        text = str(text).strip()
        if re.fullmatch(r'-?\d+', text):
            return int(text)
        if text == OWN_TARG:
            return spawn_id & 0xFFF
        if text == OWN_ID:
            return int16(spawn_id)
        match = TARG_OF.fullmatch(text)
        if match:
            return self.first_id(match.group(1)) & 0xFFF
        match = ID_OF.fullmatch(text)
        if match:
            return int16(self.first_id(match.group(1)) + int(match.group(2) or 0))
        raise RuntimeError('%s sets a superlink or sublink of %s, which the exporter can\'t read' % (where, text))


class Linker:
    """One placed monster as the link rules see it."""

    def __init__(self, spawn_id, kind):
        self.id = spawn_id
        self.kind = kind
        self.name = kind.link_name
        self.family = kind.family
        self.battlefield = 'battlefield' in kind.types
        self.pet = False
        # At zone load, for the party build.
        self.load_links = False
        self.sublink = 0
        self.superlink = 0
        self.force = False
        # In a fight.
        self.links = False
        self.fight_superlink = 0
        self.fight_force = False
        self.no_link = False
        self.one_way = False
        self.party = None


def check_scripts(kind, script_dir):
    """Stops on a link change the reader can't hold, unless the hand lists above cover it."""
    unknown = [reason for reason in kind.effects.link_runtime
               if not any(' %s ' % helper in reason for helper in KNOWN_LINK_HELPERS)]
    if unknown and (script_dir, kind.script) not in KNOWN_LINK_SCRIPTS:
        raise RuntimeError('The exporter can\'t read these link changes:\n  ' + '\n  '.join(unknown))


def make_linker(spawn_id, kind, ids, in_dynamis, detects, script_dir):
    """The spawn's link state at zone load and in a fight."""
    where = '%s %s' % (script_dir, kind.script)
    linker = Linker(spawn_id, kind)
    load = aggro.State(kind.attributes, detects)
    load.apply(kind.effects.init_aggro, detects, where)
    fight = kind.state
    hand = KNOWN_LINK_SCRIPTS.get((script_dir, kind.script))
    if hand == 'split':
        text = SPLIT_SUPERLINKS[0 if kind.split_below else 1]
        load.mob_mods['superlink'] = text
        fight.mob_mods.setdefault('superlink', text)
    linker.load_links = load.links
    linker.sublink = ids.value(load.mob_mods.get('sublink', 0), spawn_id, where)
    linker.superlink = ids.value(load.mob_mods.get('superlink', 0), spawn_id, where)
    linker.force = in_dynamis or linker.battlefield or linker.superlink != 0
    linker.links = fight.links
    linker.fight_superlink = ids.value(fight.mob_mods.get('superlink', 0), spawn_id, where)
    linker.fight_force = in_dynamis or linker.battlefield or linker.fight_superlink != 0
    linker.no_link = fight.mob_mods.get('no_link', 0) > 0 or hand == 'no_link'
    linker.one_way = fight.mob_mods.get('one_way_linking', 0) > 0
    return linker


def matches(a, b):
    """Whether a joins b's party (FindPartyForMob)."""
    if not a.force and not a.sublink and not b.load_links:
        return False
    if a.superlink:
        return b.superlink == a.superlink
    if a.force:
        return b.force
    return (b.load_links and b.family == a.family) or (a.sublink != 0 and a.sublink == b.sublink)


def zone_parties(linkers):
    """Puts each linker in its zone-load party, in ascending spawn id."""
    first = []
    for linker in sorted(linkers, key=lambda item: item.id):
        if not (linker.force or linker.load_links or linker.sublink):
            continue
        # Linkers of one class match alike, so the first of each class stands in for the rest.
        key = (linker.force, linker.sublink, linker.superlink, linker.load_links, linker.family)
        match = next((other for _, other in first if matches(linker, other)), None)
        linker.party = match.party if match else ('zone', linker.id)
        if key not in [other_key for other_key, _ in first]:
            first.append((key, linker))


def calls(caller, helper):
    """Whether caller calls helper into its fight (TryLink with CanLink's NO_LINK and superlink checks)."""
    if caller.one_way or helper.pet:
        return False
    if helper.family == caller.family and not caller.fight_force and not caller.links:
        return False
    if helper.no_link and not (caller.fight_superlink and caller.fight_superlink == helper.fight_superlink):
        return False
    # A battlefield monster never reaches an open-world fight. Inside a fight's own party it links like the rest.
    return not (helper.battlefield and not caller.battlefield and caller.party[0] == 'zone')


def closure_names(members):
    """{linker: set of names} of everyone each member's fight can pull in, not counting the member itself."""
    classes = {}
    for linker in members:
        key = (linker.family, linker.links, linker.fight_force, linker.fight_superlink, linker.no_link,
               linker.one_way, linker.pet, linker.battlefield)
        classes.setdefault(key, []).append(linker)
    groups = list(classes.values())
    edges = {index: [other for other, group in enumerate(groups) if calls(groups[index][0], group[0])]
             for index in range(len(groups))}
    out = {}
    for index, group in enumerate(groups):
        reached, todo = set(), list(edges[index])
        while todo:
            other = todo.pop()
            if other not in reached:
                reached.add(other)
                todo += edges[other]
        names = set()
        for other in reached - {index}:
            names |= {linker.name for linker in groups[other]}
        for linker in group:
            own = {other.name for other in group if other is not linker} if index in reached else set()
            out[linker] = names | own
    return out


def fight_members(fight, ids, placed, crates):
    """Per arena, [(spawn id, group)] the way addGroups finds the monsters, crate stride and all."""
    by_script = {}
    for spawn_id, kind in placed:
        by_script.setdefault(kind.script, []).append(spawn_id)
    named = sorted({spawn_id for group in fight.groups for name in group.names
                    for spawn_id in by_script.get(name, [])})
    windows = [(0, 1 << 32)] * fight.arenas
    if fight.arenas > 1 and named:
        lowest, stride = named[0], len(named) // fight.arenas
        if any(lowest <= crate <= lowest + stride for crate in crates):
            stride += 1
        windows = [(lowest + stride * arena, lowest + stride * (arena + 1) - 1) for arena in range(fight.arenas)]
    arenas = []
    for arena, (low, high) in enumerate(windows):
        members = []
        for group in fight.groups:
            for name in group.names:
                members += [(spawn_id, group) for spawn_id in by_script.get(name, []) if low <= spawn_id <= high]
            if group.ids:
                refs = group.ids[arena] if arena < len(group.ids) else []
                members += [(ids.first_id(name) + offset, group) for name, offset in refs]
        arenas.append(members)
    return arenas


def fight_seats(fights, linkers):
    """
    A copy of a monster's linker for each fight that puts it in a party of the fight's own, holding that party and
    superlink. A monster its fights never put back in its zone party leaves that party. In a zone with
    battlefields, an arena monster that no fight names never spawns, so it links with no one.
    """
    seats, back = [], set()
    for fight_number, arenas in enumerate(fights):
        for arena, members in enumerate(arenas):
            party, superlink = {}, {}
            for spawn_id, group in members:
                if group.party:
                    party[spawn_id] = ('party', fight_number, arena, id(group))
                if group.superlink:
                    superlink[spawn_id] = (fight_number, arena) + group.superlink
            for spawn_id in {spawn_id for spawn_id, _ in members}:
                linker = linkers.get(spawn_id)
                if linker is None:
                    continue
                seat = copy.copy(linker)
                # A superlink the monster's own spawn script sets wins over its group's.
                spawn_set = any(name == 'superlink' for name, _ in linker.kind.effects.spawn_aggro)
                if spawn_id in superlink and not spawn_set:
                    seat.fight_superlink = superlink[spawn_id]
                    seat.fight_force = True
                if spawn_id in party:
                    seat.party = party[spawn_id]
                elif seat.fight_superlink:
                    seat.party = ('superlink', fight_number, arena, seat.fight_superlink)
                elif seat.battlefield:
                    seat.party = ('pool', fight_number, arena)
                else:
                    # The party search puts any other monster back in the family or sublink party it had.
                    back.add(spawn_id)
                    continue
                seats.append(seat)
    seated = {seat.id for seat in seats} - back
    for linker in linkers.values():
        if (fights and linker.battlefield) or linker.id in seated:
            linker.party = None
    return seats


def zone_names(ctx, placed, in_dynamis, fights, script_dir, ids):
    """Sets kind.links for every kind in one zone or instance. placed is [(spawn id, kind)] for every placed monster."""
    by_id = {}
    for spawn_id, kind in placed:
        check_scripts(kind, script_dir)
        by_id[spawn_id] = make_linker(spawn_id, kind, ids, in_dynamis, ctx.tables.detects, script_dir)
    mark_pets(ctx, placed, by_id, script_dir, ids)
    zone_parties(by_id.values())
    seats = fight_seats(fights, by_id)
    by_party = {}
    for linker in list(by_id.values()) + seats:
        if linker.party is not None:
            by_party.setdefault(linker.party, []).append(linker)
    names = {}
    for members in by_party.values():
        names.update(closure_names(members))
    for linker, found in names.items():
        linker.kind.links |= found


def pet_calls(ctx, script_dir, script):
    """(offset, pet script or None for any) for each pet a monster takes when the zone loads."""
    found, base = [], True
    if script_dir in ctx.dynamis.zone_dirs:
        if ctx.dynamis.mob_type(script_dir, script) == dynamis.MASTER:
            found.append(('1', None))
        base = ctx.dynamis.keeps(script_dir, script, 'onMobInitialize')
    source = ctx.scripts.lua(ctx.scripts.mob_script_path(script_dir, script)) if base else None
    if source is None:
        return found
    text = source.text
    calls = SET_PET.findall(text) + [(offset, None) for offset in SET_PET_BY_ID.findall(text)]
    read = len(calls) + (1 if (script_dir, script) in TABLE_PETS else 0)
    if len(ANY_PET.findall(text)) > read and (script_dir, script) not in KNOWN_PET_SCRIPTS:
        raise RuntimeError('%s %s sets a pet the exporter can\'t read' % (script_dir, script))
    return found + calls


def mark_pets(ctx, placed, by_id, script_dir, ids):
    """
    Marks the spawns a monster makes its pet, with a setMobPet or setPet call at a fixed offset, through the
    TABLE_PETS tables, or as a Dynamis master.
    """
    offsets = {}
    for spawn_id, kind in placed:
        if kind.script not in offsets:
            offsets[kind.script] = pet_calls(ctx, script_dir, kind.script)
        for offset, name in offsets[kind.script]:
            pet = by_id.get(spawn_id + int(offset))
            if pet is not None and name in (None, pet.kind.script):
                pet.pet = True
        table = TABLE_PETS.get((script_dir, kind.script))
        if table is not None:
            pets = ids.tables.get(table[0], [])
            index = ids.tables[kind.script].index(spawn_id) + table[1]
            if index < len(pets) and pets[index] in by_id:
                by_id[pets[index]].pet = True
