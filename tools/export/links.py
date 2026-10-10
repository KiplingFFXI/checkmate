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
go back to their family or sublink party, and one its group gives another battle ID, like a Limbus crate, links
with no one. Each arena is a fight of its own, and a monster that several fights use links with the partners from
each.

Only a spawn that comes up on Phoenix links (exists.py). A confrontation event's monsters only link inside it, a
battlefield pool only links inside one room, an add that's only up while its owner fights counts as a pet (ASSIST_ONLY
holds the ones the reader can't find), and NEVER_TOGETHER holds the pairs that are never up at the same time.
"""
from pathlib import Path
import copy
import os
import re

from . import aggro
from . import battlefields
from . import dynamis
from . import exists
from . import outside

# Pairs of monster scripts that are never up together, so they never link, by zone script folder. The data can't
# show it because one only comes up while the other is down.
NEVER_TOGETHER = {
    # Cherry Saplings only come from the Cherry's own timers while it's down, and the Cherry only spawns once
    # every Sapling is dead (Cemetery_Cherry.lua, Cherry_Sapling.lua).
    ('King_Ranperres_Tomb', 'Cemetery_Cherry', 'Cherry_Sapling'),
    # Each Yagudo's Avatar is Astral Flow's call from Yagudo Avatar or from Tzee Xicu, which swap NQ and HQ and are
    # never up together (Yagudo_Avatar.lua, Tzee_Xicu_the_Manifest.lua). Each avatar's only other force-linker is the
    # other one.
    ('Castle_Oztroja', 'Yagudos_Avatar', 'Yagudos_Avatar'),
    # Osschaart copies one two-hour a fight (twoHourUsed in Osschaart.lua), so it only ever calls one of its Bat,
    # Wyvern, Avatar and Automaton.
    ('Waughroon_Shrine', 'Osschaarts_Bat', 'Osschaarts_Wyvern'),
    ('Waughroon_Shrine', 'Osschaarts_Bat', 'Osschaarts_Avatar'),
    ('Waughroon_Shrine', 'Osschaarts_Bat', 'Osschaarts_Automaton'),
    ('Waughroon_Shrine', 'Osschaarts_Wyvern', 'Osschaarts_Avatar'),
    ('Waughroon_Shrine', 'Osschaarts_Wyvern', 'Osschaarts_Automaton'),
    ('Waughroon_Shrine', 'Osschaarts_Avatar', 'Osschaarts_Automaton'),
    # Omega only comes up from the airship door once every Mammet is dead, and Ultima only once Omega is
    # (one_to_be_feared.lua).
    ('Sealions_Den', 'Mammet-22_Zeta', 'Omega'),
    ('Sealions_Den', 'Mammet-22_Zeta', 'Ultima'),
    ('Sealions_Den', 'Omega', 'Ultima'),
    # Shadow Lord's second form only spawns once the first is dead (shadow_lord_battle.lua).
    ('Throne_Room', 'Shadow_Lord_Phase_1', 'Shadow_Lord_Phase_2'),
    # Zeid despawns under 70% before Zeid_2 spawns, and only Zeid_2 calls the Shadows of Rage
    # (where_two_paths_converge.lua, Zeid_2.lua).
    ('Throne_Room', 'Zeid', 'Zeid_2'),
    ('Throne_Room', 'Zeid', 'Shadow_of_Rage'),
    # Promathia_2 only spawns once Promathia is dead (dawn.lua).
    ('Empyreal_Paradox', 'Promathia', 'Promathia_2'),
    # Ealdnarche_2 only spawns once Ealdnarche is dead, and its Orbitals go when it dies. Ealdnarche can't die until
    # Exoplates despawns (celestial_nexus.lua, Ealdnarche.lua, Exoplates.lua).
    ('The_Celestial_Nexus', 'Ealdnarche', 'Ealdnarche_2'),
    ('The_Celestial_Nexus', 'Exoplates', 'Ealdnarche_2'),
    ('The_Celestial_Nexus', 'Orbital', 'Ealdnarche_2'),
    # Undying Promise's tick only brings up Ghul-I-Beaban's DRK or BLM form when neither is up (undying_promise.lua).
    ('QuBia_Arena', 'Ghul-I-Beaban_DRK', 'Ghul-I-Beaban_BLM'),
    # The Sons only spawn after Anansi dies (Anansi.lua).
    ('QuBia_Arena', 'Anansi', 'Son_of_Anansi'),
}

# Adds a script brings into its own fight without callPets, as (zone script folder, owner script, add script). Like
# the callPets helpers exists.Zone.assist_only finds, each is only up while it fights, so no one finds it idle to call
# and it counts as a pet.
ASSIST_ONLY = {
    # Pkuucha spawns Percipient mid-fight already engaged, despawns it in onMobDisengage and onMobRoam, and stays
    # unkillable until Percipient dies (Zoraal_Jas_Pkuucha.lua). Percipient makes Pkuucha its pet, so they fight
    # together anyway.
    ('Wajaom_Woodlands', 'Zoraal_Jas_Pkuucha', 'Percipient_Zoraal_Ja'),
}

# Battlefield pool monsters whose spawn points are further apart than this, with no chain of nearer ones between
# them, stand in different rooms or floors and never link. Limbus floors sit 100 yalms and more apart, and the
# spawn points on one floor chain within 90, so each floor is one room.
ROOM_GAP = 90.0

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
    # sw_apollyon.lua sets NO_LINK on the seven mimics it keeps and despawns the other three. revealMimic sets the
    # battle ID back to 0 but never clears NO_LINK.
    ('Apollyon', 'Armoury_Crate_Mimic'): 'no_link',
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

# The one way a Dynamis type's onMobInitialize helper gives a monster a pet, by its name, like Dagourmarche's avatar
# in xi.dynamis.onBossInitialize.
NAMED_PET = re.compile(r"\bif\s+mob\s*:\s*getName\(\)\s*==\s*'(\w+)'\s+then\s+"
                       r"xi\.pet\.setMobPet\(\s*mob\s*,\s*(\d+)\s*,\s*'([^']+)'\s*\)\s+end\b")

# Scripts that pair each of their spawns with a pet through two ID tables, as (zone script folder, script):
# (pet script, how many of the pet's spawns come before the first one it pairs with).
TABLE_PETS = {
    # The first pet of each kind belongs to Ulaern.
    ('AlTaieu', 'Omaern_BST'): ('Aerns_Xzomit', 1),
    ('AlTaieu', 'Omaern_DRG'): ('Aerns_Wynav', 1),
    ('AlTaieu', 'Omaern_SMN'): ('Aerns_Elemental', 1),
    ('Misareaux_Coast', 'Gigas_Warwolf'): ('Gigass_Sheep', 0),
}

# Pets a script takes in a way the reader can't follow, by (zone script folder, script): [(offset, pet script)].
HAND_PETS = {
    # Takes the pet for the initiator's job from jobTable when it spawns.
    ('Mine_Shaft_2716', 'Fantoccini'): [('1', 'Fantoccini_Monster'), ('2', 'Fantoccini_Wyvern'),
                                       ('3', 'Fantoccini_Avatar'), ('4', 'Fantoccini_Automaton')],
    # Takes the pet for the two-hour it copies from its pets table. Its avatar is Astral Flow's call, not a pet.
    ('Waughroon_Shrine', 'Osschaart'): [('2', 'Osschaarts_Bat'), ('3', 'Osschaarts_Wyvern'),
                                        ('5', 'Osschaarts_Automaton')],
    # Calls the tiger or the mandragora of its arena when it engages and makes it its pet with setPet. They sit 3 and
    # 6 past it in Ark Angels 3, and 1 and 2 past it in Divine Might (ark_angels_3.lua, divine_might.lua).
    ('LaLoff_Amphitheater', 'Ark_Angel_MR'): [('3', 'Ark_Angels_Tiger'), ('6', 'Ark_Angels_Mandragora'),
                                              ('1', 'Ark_Angels_Tiger'), ('2', 'Ark_Angels_Mandragora')],
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
        # The confrontation event it fights in, or None. Monsters only link inside one event.
        self.event = None
        # The scripts it's never up together with.
        self.apart = frozenset()


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
    text = Path(os.path.join(tree, 'scripts', 'mixins', 'fomor_party.lua')).read_text(encoding='utf-8')
    aliases = [alias for alias, zone in battlefields.ALIAS.findall(text) if zone == ids.script_dir.upper()]
    if not aliases:
        return {}
    alias = re.escape(aliases[0])
    path = os.path.join(tree, 'scripts', 'zones', ids.script_dir, 'IDs.lua')
    scripts = dict(TABLE_OF_IDS.findall(Path(path).read_text(encoding='utf-8')))

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
    # A confrontation target check fails across events, which differ in power (mob_controller.cpp TryDeaggro,
    # ValidTarget).
    if caller.event != helper.event:
        return False
    if helper.kind.script in caller.apart or caller.kind.script in helper.apart:
        return False
    if helper.family == caller.family and not caller.fight_force and not caller.links:
        return False
    if helper.no_link and not (caller.fight_superlink and caller.fight_superlink == helper.fight_superlink):
        return False
    return True


def closure(members):
    """{linker: set of linkers} of everyone each member's fight can pull in, not counting the member itself."""
    classes = {}
    for linker in members:
        key = (linker.family, linker.links, linker.fight_force, linker.fight_superlink, linker.no_link,
               linker.one_way, linker.pet, linker.event, linker.apart, linker.kind.script if linker.apart else None)
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
            # One it's never up with can't come in through anyone else either.
            out[linker] = {other for other in helpers | own if other.kind.script not in linker.apart}
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


def rooms(points):
    """{spawn id: room number} for points {spawn id: (x, y, z)}, chaining points within ROOM_GAP of each other."""
    room, number = {}, 0
    for start in sorted(points):
        if start in room:
            continue
        number += 1
        room[start] = number
        todo = [start]
        while todo:
            here = todo.pop()
            for other, point in points.items():
                if other not in room and sum((a - b) ** 2 for a, b in zip(points[here], point)) <= ROOM_GAP ** 2:
                    room[other] = number
                    todo.append(other)
    return room


def other_floors(members, pool, linkers, points):
    """
    The pool members of a one-arena fight that are another floor's copies. addGroups finds such a fight's monsters by
    name in the whole zone, so a Limbus floor's pool holds the copies other floors spawn too. A member the fight
    doesn't spawn at the start is another floor's copy when it stands in a room where none of the starters stand, or
    when it has no point and the pool has a waiting one of its script that does.
    """
    starters = {spawn_id for spawn_id, group in members if group.spawned}
    waiting = pool - starters
    room = rooms({spawn_id: points[spawn_id] for spawn_id in pool if spawn_id in points})
    start_rooms = {room[spawn_id] for spawn_id in starters if spawn_id in room}
    gone = set()
    if start_rooms:
        gone = {spawn_id for spawn_id in waiting if spawn_id in room and room[spawn_id] not in start_rooms}
    for spawn_id in waiting - set(room):
        script = linkers[spawn_id].kind.script
        if any(other in room and other not in gone and linkers[other].kind.script == script for other in waiting):
            gone.add(spawn_id)
    return gone


def fight_seats(fights, linkers, points=None):
    """
    A copy of a monster's linker for each fight that puts it in a party of the fight's own, holding that party and
    superlink. A monster its fights never put back in its zone party leaves that party. In a zone with
    battlefields, an arena monster that no fight names never spawns, so it links with no one, and neither does one
    its group gives another battle ID. A one-arena fight leaves out the other floors' copies (see other_floors). A
    battlefield pool splits into rooms by points (see rooms and ROOM_GAP), and each room is a party of its own.
    Without points, the pool stays one room.
    """
    seats, back, fenced = [], set(), set()
    points = points or {}
    for fight_number, arenas in enumerate(fights):
        for arena, members in enumerate(arenas):
            pool = {spawn_id for spawn_id, _ in members if spawn_id in linkers and linkers[spawn_id].battlefield}
            if len(arenas) == 1:
                gone = other_floors(members, pool, linkers, points)
                members = [(spawn_id, group) for spawn_id, group in members if spawn_id not in gone]
                pool -= gone
            # One with no point of its own stands where the placed ones of its script in the pool stand. If they
            # don't share a room, or there are none, the pool stays one room.
            room = rooms({spawn_id: points[spawn_id] for spawn_id in pool if spawn_id in points})
            for spawn_id in sorted(pool - set(room)):
                script = linkers[spawn_id].kind.script
                shared = {room[other] for other in room if linkers[other].kind.script == script}
                if len(shared) != 1:
                    room = {}
                    break
                room[spawn_id] = shared.pop()
            party, superlink = {}, {}
            for spawn_id, group in members:
                if group.party:
                    party[spawn_id] = ('party', fight_number, arena, id(group))
                if group.superlink:
                    superlink[spawn_id] = (fight_number, arena) + group.superlink
            # A monster its group gives another battle ID never fights, so it gets no seat and links with no one. It
            # still counts in the rooms above.
            here = {spawn_id for spawn_id, group in members if group.battle_id}
            fenced |= here
            for spawn_id in {spawn_id for spawn_id, _ in members} - here:
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
                    seat.party = ('pool', fight_number, arena, room.get(spawn_id))
                else:
                    # The party search puts any other monster back in the family or sublink party it had.
                    back.add(spawn_id)
                    continue
                seats.append(seat)
    seated = ({seat.id for seat in seats} | fenced) - back
    for linker in linkers.values():
        if (fights and linker.battlefield) or linker.id in seated:
            linker.party = None
    return seats


def assist_scripts(placed, script_dir, up):
    """
    The add scripts ASSIST_ONLY holds for the zone. Stops when the zone doesn't place the owner and the add, or when
    something other than the owner brings the add up.
    """
    scripts = {kind.script for _, kind in placed}
    found = set()
    for zone, owner, add in ASSIST_ONLY:
        if zone != script_dir:
            continue
        if owner not in scripts or add not in scripts:
            raise RuntimeError('links.ASSIST_ONLY names %s %s and %s, but the zone doesn\'t place both. Check it.'
                               % (zone, owner, add))
        for spawn_id, kind in placed:
            sources = up.sources.get(spawn_id, ()) if up else ()
            if kind.script == add and any(not (isinstance(source, tuple) and source[:2] == ('mob', owner))
                                          for source in sources):
                raise RuntimeError('links.ASSIST_ONLY says only %s brings up %s %s, but something else does. Check it.'
                                   % (owner, zone, add))
        found.add(add)
    return found


def zone_names(ctx, placed, in_dynamis, fights, script_dir, ids, fomors, up=None, points=None):
    """
    Sets kind.links, the names each kind links with by how each one links, for every kind in one zone or instance.
    placed is [(spawn id, kind)] for every placed monster, and fomors what fomor_superlinks gives. up is the
    exists.Zone for the zone, or None to count every placed spawn as up. points is what zones.spawn_points gives,
    {spawn id: (x, y, z)}, for splitting battlefield pools into rooms, or None to keep each pool one room.
    """
    by_id = {}
    events = up.events() if up else {}
    assist = up.assist_only() if up else set()
    assist_adds = assist_scripts(placed, script_dir, up)
    pets = up.pets if up else pet_masters(ctx, placed, script_dir, ids)
    apart = {}
    for zone, first, second in NEVER_TOGETHER:
        if zone == script_dir:
            apart.setdefault(first, set()).add(second)
            apart.setdefault(second, set()).add(first)
    for spawn_id, kind in placed:
        check_scripts(kind, script_dir)
        # A spawn that never comes up on Phoenix links with no one, and no one lists it.
        if up is not None and spawn_id not in up.sources:
            continue
        linker = make_linker(spawn_id, kind, ids, in_dynamis, ctx.tables.detects, script_dir)
        linker.event = events.get(spawn_id)
        linker.apart = frozenset(apart.get(kind.script, ()))
        if spawn_id in assist or kind.script in assist_adds:
            linker.pet = True
        if spawn_id in fomors and calls_fomor_party(ctx, script_dir, kind.script):
            linker.superlink = linker.fight_superlink = fomors[spawn_id]
            linker.force = linker.fight_force = True
        by_id[spawn_id] = linker
    for pet in pets:
        if pet in by_id:
            by_id[pet].pet = True
    zone_parties(by_id.values())
    seats = fight_seats(fights, by_id, points)
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


def dynamis_pets(ctx, script_dir, script):
    """
    (offset, pet script) for each pet the onMobInitialize helpers of a Dynamis monster's type, and its hook, give it.
    The only form they can take is NAMED_PET. A master's own call on the next monster is dynamis.MASTER_PET.
    """
    kind = ctx.dynamis.mob_type(script_dir, script)
    names = list(ctx.dynamis.handlers[kind].get('onMobInitialize', []))
    hook = ctx.dynamis.hooks.get((script_dir, script), {}).get('onMobInitialize')
    if hook:
        names.append(hook)
    found = []
    for name in names:
        if kind == dynamis.MASTER and name == 'xi.pet.setMobPet':
            continue
        path = ctx.scripts.helpers.get(name)
        source = ctx.scripts.lua(path) if path else None
        if source is None or name not in exists.handler_bodies(source.text, exists.GLOBAL_FUNCTION):
            raise RuntimeError('The exporter can\'t find the Dynamis onMobInitialize helper %s' % name)
        body = exists.handler_text(source.text, name, exists.GLOBAL_FUNCTION)
        named = NAMED_PET.findall(body)
        if len(ANY_PET.findall(body)) > len(named):
            raise RuntimeError('%s sets a pet the exporter can\'t read' % name)
        found += [(offset, pet) for owner, offset, pet in named if owner == script]
    return found


def pet_calls(ctx, script_dir, script):
    """(offset, pet script or None for any) for each pet a monster takes when the zone loads."""
    found, base = [], True
    if script_dir in ctx.dynamis.zone_dirs:
        if ctx.dynamis.mob_type(script_dir, script) == dynamis.MASTER:
            found.append(('1', None))
        found += dynamis_pets(ctx, script_dir, script)
        base = ctx.dynamis.keeps(script_dir, script, 'onMobInitialize')
    source = ctx.scripts.lua(ctx.scripts.mob_script_path(script_dir, script)) if base else None
    if source is None:
        return found
    text = source.text
    calls = SET_PET.findall(text) + [(offset, None) for offset in SET_PET_BY_ID.findall(text)]
    read = len(calls) + (1 if (script_dir, script) in TABLE_PETS else 0)
    if len(ANY_PET.findall(text)) > read and (script_dir, script) not in KNOWN_PET_SCRIPTS:
        raise RuntimeError('%s %s sets a pet the exporter can\'t read' % (script_dir, script))
    return found + calls + HAND_PETS.get((script_dir, script), [])


def pet_masters(ctx, placed, script_dir, ids):
    """
    {pet spawn id: master spawn id} for the spawns a monster makes its pet, with a setMobPet or setPet call at a
    fixed offset, through the TABLE_PETS tables, from HAND_PETS, or in Dynamis as a master or through its type's
    helpers.
    """
    kinds = dict(placed)
    offsets, masters = {}, {}
    for spawn_id, kind in placed:
        if kind.script not in offsets:
            offsets[kind.script] = pet_calls(ctx, script_dir, kind.script)
        for offset, name in offsets[kind.script]:
            pet = kinds.get(spawn_id + int(offset))
            if pet is not None and name in (None, pet.script):
                masters[spawn_id + int(offset)] = spawn_id
        table = TABLE_PETS.get((script_dir, kind.script))
        if table is not None:
            pets = ids.tables.get(table[0], [])
            index = ids.tables[kind.script].index(spawn_id) + table[1]
            if index < len(pets) and pets[index] in kinds:
                masters[pets[index]] = spawn_id
    return masters
