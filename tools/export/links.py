"""
Who a monster links with (zone_entities.cpp FindPartyForMob, mob_controller.cpp TryLink, mob_entity.cpp CanLink).

When a zone loads, each monster that links, has a sublink or force-links (in Dynamis, battlefield typed, or with a
superlink) joins the first link party it matches, in ascending spawn id. A superlinked monster matches the same
superlink, another force-linker matches any force-linker, and the rest match a linker of the same family or the
same sublink.

In a fight the monster calls idle members of its party. It skips its own family unless it links or force-links
itself, and never calls pets, monsters with NO_LINK or an ambush antlion while it's underground, unless they share
its superlink. Every monster that joins calls its own helpers the same way, so a row lists everyone its fight can
pull in. Each name keeps how that helper links (CanLink). One that shares the superlink of the monster calling it
links from anywhere, with no other check. Any other one has to be near with nothing in the way, and one that sees
but doesn't hear has to face the fight too. Distance, line of sight and facing depend on where things stand, so the
data leaves them out.

A battlefield sets up new parties when it starts (lua_battlefield.cpp addGroups). An isParty group is one party,
a superlinked group is another, and the rest of its battlefield-typed monsters share one. Other monsters in it
go back to their family or sublink party. Each arena is a fight of its own, and a monster that several fights
use links with the partners from each.
"""
import copy
import os
import re

from . import aggro
from . import battlefields
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

# The helper the fomors in Lufaise Meadows, Misareaux Coast, Phomiuna Aqueducts and the Sacrarium call in
# onMobInitialize. It gives each fomor of a patrol or guard its party leader's id as a superlink.
FOMOR_PARTY = 'xi.mix.fomorParty.onPartySpawn'

# Helpers whose link changes the reader can't follow from the call.
KNOWN_LINK_HELPERS = {
    # fomor_superlinks reads its patrols and guards from the mixin.
    FOMOR_PARTY,
}

# In fomor_party.lua: a patrol's leader and how many follow it, a guard's members, and one member. In a zone's
# IDs.lua: a table of one script's ids.
FOMOR_PATROL = r'leader\s*=\s*%s\.mob\.(\w+)\[(\d+)\]\s*,\s*followers\s*=\s*(\d+)'
FOMOR_GUARD = re.compile(r'members\s*=\s*\{([^}]*)\}')
FOMOR_MEMBER = r'%s\.mob\.(\w+)\[(\d+)\]'
TABLE_OF_IDS = re.compile(r"(\w+)\s*=\s*GetTableOfIDs\('([^']+)'\)")

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
        # How it links when the monster calling it doesn't share its superlink.
        self.way = 'neither'
        self.party = None


def check_scripts(kind, script_dir):
    """Stops on a link change the reader can't hold, unless the hand lists above cover it."""
    unknown = [reason for reason in kind.effects.link_runtime
               if not any(' %s ' % helper in reason for helper in KNOWN_LINK_HELPERS)]
    if unknown and (script_dir, kind.script) not in KNOWN_LINK_SCRIPTS:
        raise RuntimeError('The exporter can\'t read these link changes:\n  ' + '\n  '.join(unknown))


def sense_way(state, detects):
    """
    How a monster in this state links when it doesn't share the caller's superlink, as a rows.LINK_WAYS key. CanLink
    only reads sight and hearing. True detection doesn't change a link, but the addon words it the way aggro does.
    """
    bits = state.mob_mods['detection']
    sees, hears = bits & detects['sight'], bits & detects['hearing']
    if not (sees or hears):
        # The other senses aggro shows, in its order, like magic or magic_low_hp. Scent has no word, so a monster
        # that only smells you is neither.
        return '_'.join(name for bit, name in aggro.DETECTS if bits & detects[bit]) or 'neither'
    way = 'both' if sees and hears else 'sight' if sees else 'sound'
    return 'true_' + way if state.true_detection else way


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
    # An ambush antlion sits underground with its name hidden whenever it's idle, and CanLink turns it away then
    # (mob_entity.cpp:459-463), so like NO_LINK it only joins a fight it shares a superlink with.
    hidden = 'ambush' in kind.roam and 'families/antlion_ambush' in kind.effects.mixins + kind.group_mixins
    linker.no_link = fight.mob_mods.get('no_link', 0) > 0 or hand == 'no_link' or hidden
    linker.one_way = fight.mob_mods.get('one_way_linking', 0) > 0
    linker.way = sense_way(fight, detects)
    return linker


def fomor_superlinks(tree, ids):
    """
    {spawn id: superlink} for the fomors of the zone's patrols and guards in scripts/mixins/fomor_party.lua. A
    patrol is its leader and the spawns right after it, and a guard the members it lists. getFomorParty takes the
    first party a spawn is in, patrols before guards, and onPartySpawn gives it that party leader's id.
    """
    text = open(os.path.join(tree, 'scripts', 'mixins', 'fomor_party.lua'), encoding='utf-8').read()
    aliases = [alias for alias, zone in battlefields.ALIAS.findall(text) if zone == ids.script_dir.upper()]
    if not aliases:
        return {}
    alias = re.escape(aliases[0])
    path = os.path.join(tree, 'scripts', 'zones', ids.script_dir, 'IDs.lua')
    scripts = dict(TABLE_OF_IDS.findall(open(path, encoding='utf-8').read()))

    def spawn_id(name, number):
        spawns = ids.tables.get(scripts.get(name), [])
        if not 1 <= int(number) <= len(spawns):
            raise RuntimeError('fomor_party.lua names %s mob.%s[%s], which the exporter can\'t find'
                               % (ids.script_dir, name, number))
        return spawns[int(number) - 1]

    patrols = re.findall(FOMOR_PATROL % alias, text)
    guards = [re.findall(FOMOR_MEMBER % alias, members) for members in FOMOR_GUARD.findall(text)]
    if len(re.findall(r'\b%s\.mob\.' % alias, text)) != len(patrols) + sum(len(guard) for guard in guards):
        raise RuntimeError('The fomor party reader needs updating: fomor_party.lua names %s monsters it can\'t read'
                           % ids.script_dir)
    parties = [[spawn_id(name, number) + i for i in range(int(followers) + 1)] for name, number, followers in patrols]
    parties += [[spawn_id(name, number) for name, number in guard] for guard in guards if guard]
    superlinks = {}
    for party in parties:
        for member in party:
            superlinks.setdefault(member, int16(party[0]))
    return superlinks


def calls_fomor_party(ctx, script_dir, script):
    """
    Whether the monster script calls onPartySpawn. It has to be in onMobInitialize, which runs before the zone
    builds its link parties, so the superlink counts there and in a fight.
    """
    source = ctx.scripts.lua(ctx.scripts.mob_script_path(script_dir, script))
    handlers = {handler for handler, _, name, _ in (source.helpers if source else []) if name == FOMOR_PARTY}
    if handlers - {'onMobInitialize'}:
        raise RuntimeError('%s %s calls %s outside onMobInitialize, which the exporter can\'t read'
                           % (script_dir, script, FOMOR_PARTY))
    return bool(handlers)


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


def closure(members):
    """{linker: set of linkers} of everyone each member's fight can pull in, not counting the member itself."""
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
        helpers = set()
        for other in reached - {index}:
            helpers.update(groups[other])
        for linker in group:
            own = {other for other in group if other is not linker} if index in reached else set()
            out[linker] = helpers | own
    return out


def link_way(caller, helper):
    """How helper links when caller calls it. CanLink checks the superlink first and then nothing else."""
    if caller.fight_superlink and helper.fight_superlink == caller.fight_superlink:
        return 'superlink'
    return helper.way


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


def zone_names(ctx, placed, in_dynamis, fights, script_dir, ids, fomors):
    """
    Sets kind.links, the names each kind links with by how each one links, for every kind in one zone or instance.
    placed is [(spawn id, kind)] for every placed monster, and fomors what fomor_superlinks gives.
    """
    by_id = {}
    for spawn_id, kind in placed:
        check_scripts(kind, script_dir)
        linker = make_linker(spawn_id, kind, ids, in_dynamis, ctx.tables.detects, script_dir)
        if spawn_id in fomors and calls_fomor_party(ctx, script_dir, kind.script):
            linker.superlink = linker.fight_superlink = fomors[spawn_id]
            linker.force = linker.fight_force = True
        by_id[spawn_id] = linker
    mark_pets(ctx, placed, by_id, script_dir, ids)
    zone_parties(by_id.values())
    seats = fight_seats(fights, by_id)
    by_party = {}
    for linker in list(by_id.values()) + seats:
        if linker.party is not None:
            by_party.setdefault(linker.party, []).append(linker)
    for members in by_party.values():
        for caller, helpers in closure(members).items():
            partners = {}
            for helper in helpers:
                if helper.fight_superlink:
                    partners.setdefault(helper.fight_superlink, []).append(helper)
            for helper in helpers:
                caller.kind.links.setdefault(link_way(caller, helper), set()).add(helper.name)
                # Another one in the fight that shares its superlink calls it in from anywhere.
                others = partners.get(helper.fight_superlink, ())
                if any(other is not helper and calls(other, helper) for other in others):
                    caller.kind.links.setdefault('superlink', set()).add(helper.name)


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
