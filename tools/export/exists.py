"""
Which placed spawns can ever be up on Phoenix, and which confrontation event each one fights in.

The server builds a monster for every placed spawn (zoneutils.cpp InsertMobs), but a spawn whose type is scripted
and that has no respawn time never comes up on its own (zoneutils.cpp: m_AllowRespawn stays false and
registerForRespawn returns at once). Such a spawn is only up when something spawns it. So a spawn is up when one
of these holds:

  - its spawn type isn't scripted (normal, lottery, windowed, night, evening, weather or fog), or it's scripted
    with a respawn time
  - a battlefield group names it
  - an enabled fishing_mob row names it (fishingutils.cpp LoadFishMobs reads disabled = 0 only)
  - in Dynamis, the zone's spawn table names it or a statue's add walk reaches it (dynamis_mobinfo.lua
    spawnNextMobsOnce)
  - it's in a Garrison pool (garrison.lua: the boss and the 8 ids before it)
  - it's the pet of a monster that comes up, apart from BOUND_ONLY_PETS below
  - a live Lua file that spawns monsters reaches it (see reach below)

A file reaches a spawn when it holds a spawn call (SpawnMob, popFromQM, callPets, :spawn, setRespawnTime,
phOnDespawn, xi.confrontation.start, xi.follow.spawnFollowers) and names the spawn by its IDs.lua key (with a literal
offset or index, a loop's range, or 0 to 8 for an offset it can't work out, and with a '+' one, every later spawn of
the key's script too), by its id, by its script name in queryEntitiesByName, or, for a monster script, mixin or mob
skill, by an offset from its own id. A followers table for xi.follow.spawnFollowers, like [ID.mob.KEY[3]] = 2, names
the ids right after that leader, as many as it gives. A key it looks up through zones[...] with anything but
xi.zone.X inside, like zones[mob:getZoneID()], counts in every zone, since the file runs in whichever zone calls it. A
monster script also reaches by an offset from its own id through the scripts/globals functions it calls, like the
Memory Receptacle's xi.promyvion.receptacleOnMobRoam. A monster that can use Astral Flow, from its skill list, an
xi.mobSkill name in its script or job_special, reaches its avatar at its ASTRAL_PET_OFFSET from its own id, 2 by
default. Any other mob skill that spawns has to name what it spawns in a way the reader follows, or the export stops.
Which files are live:

  - the zone's Zone.lua and its other helpers at the top of its folder, like globals.lua, battlefield files,
    scripts/globals and loaded module Lua
  - an NPC script when an NPC with that script is placed, its content is on or Phoenix's npc_visibility module
    shows it, and that module doesn't hide it
  - a mission or quest file when its expansion's content is on (each expansion's first mission checks
    ENABLE_<EXP>)
  - a monster script's onMobInitialize, for every placed spawn of it (the server runs it for every mob at load)
  - the rest of a monster script, its mixins and its mob skills, only for spawns that are up (a fixpoint)

A spawn that only a confrontation spawner reaches (a file that gives its monsters the CONFRONTATION flag or calls
xi.confrontation.start, like the Expeditionary Force banner, Garrison or a Pirate's Chart) fights in that event and
can't link with anyone outside it. The server tells events apart by the confrontation's power, and the
Expeditionary Force and Garrison both use the zone's level cap, so where their caps match they count as one event.
"""
from pathlib import Path
import glob
import os
import re

from . import lua_source
from . import overlays
from . import sqlfile
from .tables import module_statements

# These owners bind a pet but never summon it. Keep the binding for the Dynamis statue walk and link checks;
# it does not make the pet reachable. A real spawn call still can.
# onBossInitialize binds Dagourmarche's avatar, but the BOSS handlers never call it. Dagourmarche is WAR/WAR,
# with no summoning skill or mixin, and spawnNextMobsOnce skips the bound avatar.
BOUND_ONLY_PETS = {('Dynamis-Beaucedine', 'Dagourmarche', 'Dagourmarches_Avatar')}

# Calls that spawn a monster or arm its respawn.
SPAWN_CALL = re.compile(r'(?<![\w.])(?:xi\.mob\.|npcUtil\.)?(?:SpawnMob|spawnMob|popFromQM|callPets|setRespawnTime|'
                        r'phOnDespawn)\s*\(|:\s*spawn\s*\(|'
                        r'(?<![\w.])xi\.(?:confrontation\.start|follow\.spawnFollowers)\s*\(')
ALIAS = re.compile(r'local\s+(\w+)\s*=\s*zones\[\s*([^\]\n]+?)\s*\]')
ALIAS_REQUIRE = re.compile(r"local\s+(\w+)\s*=\s*require\(\s*'scripts/zones/([\w-]+)/IDs'\s*\)")
KEY = r'(?:(?<![\w.\]])(\w+)|zones\[\s*([^\]\n]+?)\s*\])\.mob\.(\w+)'
KEY_REF = re.compile(KEY + r'(?:\s*\[\s*(\d+)\s*\])?(?:\s*([+-])\s*(\w+))?')
# for i = ID.mob.KEY + 1, ID.mob.KEY + 27 do, and local nm = ID.mob.KEY.
KEY_LOOP = re.compile(r'\bfor\s+\w+\s*=\s*' + KEY + r'(?:\s*([+-])\s*(\d+))?\s*,\s*' + KEY + r'(?:\s*([+-])\s*(\d+))?')
KEY_LOCAL = re.compile(r'local\s+(\w+)\s*=\s*' + KEY + r'[ \t]*(?=\n|;|$)')
# xi.follow.spawnFollowers spawns a leader's next ids from a table like [ID.mob.KEY[3]] = 2 (leader + 1 and + 2).
FOLLOWERS = re.compile(r'\[\s*' + KEY + r'\s*\[\s*(\d+)\s*\]\s*\]\s*=\s*(\d+)')
SELF_OFFSET = re.compile(r':\s*getID\(\)\s*([+-])\s*(\w+)')
SELF_VAR = re.compile(r'local\s+(\w+)\s*=\s*\w+\s*:\s*getID\(\)(?!\s*[+-])')
LOOP = re.compile(r'\bfor\s+(\w+)\s*=\s*(-?\d+)\s*,\s*(-?\d+)')
LITERAL_ID = re.compile(r'(?<![\w.])(1[67]\d{6})(?![\w.])')
STRING = re.compile(r"'([A-Za-z][\w'-]*)'")
BY_NAME = re.compile(r"queryEntitiesByName\(\s*'([\w-]+)'\s*\)")
HANDLER = re.compile(r'^(?:entity\.(\w+)|local\s+function\s+(\w+)|(\w+)\s*=\s*function)\b')
# A call to a scripts/globals function, like xi.promyvion.receptacleOnMobRoam(mob), and how such a function starts.
GLOBAL_CALL = re.compile(r'(?<![\w.])(xi\.(\w+)\.\w+)\s*\(')
GLOBAL_FUNCTION = re.compile(r'^(?:(xi\.\w+\.\w+)\s*=\s*function|local\s+function\s+(\w+))\b')
DESPAWN = re.compile(r'DespawnMob\(\s*([^)]*)\)')
# A GetFirstID or GetTableOfIDs call in IDs.lua. A table can be cut down with utils.slice(table, first[, last]) and then
# [n], both 1-based like Lua (scripts/utils/utils.lua), and a single id can have + or - n after it.
ID_CALL = re.compile(r"(utils\.slice\(\s*)?(GetFirstID|GetTableOfIDs)\('([^']+)'\)"
                     r"(?(1)\s*,\s*(\d+)\s*(?:,\s*(\d+)\s*)?\))(?:\s*\[\s*(\d+)\s*\])?(?:\s*([+-])\s*(\d+))?")
# A loop over a table, like for _, petId in ipairs(pets) do.
LOOPED = re.compile(r'\bi?pairs\(\s*(\w+)\s*\)')
CONFRONTATION = re.compile(r'effectFlag\.CONFRONTATION|xi\.confrontation\.start\s*\(')

# An offset the reader can't work out, like getID() + offset, counts as each of these.
UNKNOWN_OFFSETS = range(0, 9)

# The zone of zones[...] with anything but xi.zone.X inside, like zones[mob:getZoneID()]. The file runs in whatever
# zone calls it, so it stands for the zone being read.
ANY_ZONE = '*'

# The Lua files at the top of a zone folder that never spawn anything.
ZONE_DATA_FILES = {'IDs.lua', 'DefaultActions.lua'}

# Mission and quest folders and the content tag each belongs to. A folder not listed here is always on. Each
# expansion's first mission checks ENABLE_<EXP>, so the whole chain is off with it.
FOLDER_CONTENT = {
    'missions/wotg': 'wotg', 'missions/acp': 'acp', 'missions/amk': 'amk', 'missions/asa': 'asa',
    'missions/soa': 'soa', 'missions/rov': 'rov', 'missions/tvr': 'tvr', 'missions/cop': 'cop',
    'missions/rotz': 'rotz', 'missions/toau': 'toau',
    'quests/crystalWar': 'wotg', 'quests/abyssea': 'abyssea', 'quests/adoulin': 'soa',
}

# Phoenix's NPC visibility module.
NPC_VISIBILITY = 'modules/phoenix/lua/zones/npc_visibility.lua'

# The mob skill scripts folder, and the xi.mobSkill names scripts use for the skills, like xi.mobSkill.ASTRAL_FLOW_1.
MOBSKILLS = os.path.join('scripts', 'actions', 'mobskills')
MOB_SKILL_ENUM = 'scripts/enum/mob_skill.lua'

# Astral Flow calls the avatar at the summoner's id plus its ASTRAL_PET_OFFSET mob mod, or 2 when that's 0
# (astral_flow.lua). Zone.astral_offsets reads the mob mod.
ASTRAL_FLOW = 'astral_flow'
ASTRAL_OFFSET = 2

# The Garrison data file and how many ids before the boss its pool takes (garrison.lua: boss id - 8).
GARRISON_DATA = os.path.join('scripts', 'globals', 'garrison_data.lua')
GARRISON_FILE = 'scripts/globals/garrison.lua'
GARRISON_POOL = 8

# The Expeditionary Force file. Its zoneInfoTable gives each zone's level cap.
EF_FILE = 'scripts/globals/expeditionary_force.lua'

# The level cap that stands for the server's MAX_LEVEL. Garrison's 99 means it (garrison.lua addLevelCap), and so
# does the Expeditionary Force's xi.settings.main.MAX_LEVEL.
MAX_CAP = 'max'

# Dynamis spawn tables, one file per zone, and how far a statue's add walk looks (dynamis_mobinfo.lua).
DYNAMIS_MOBS = os.path.join('scripts', 'globals', 'dynamis', 'mobs')
DYNAMIS_WALK = 20


def enum_name(script_dir):
    """The xi.zone name of a zone script folder."""
    return re.sub(r'[^A-Z0-9_]', '', script_dir.upper().replace('-', '_'))


def handler_bodies(text, header=HANDLER):
    """{handler name: [body text]} for top-level handlers (they start at column 0 and end at a column 0 end)."""
    bodies, name, lines = {}, None, []
    for line in text.split('\n'):
        match = header.match(line)
        if match:
            name, lines = match.group(match.lastindex), []
            continue
        if name and re.match(r'^end\b', line):
            bodies.setdefault(name, []).append('\n'.join(lines))
            name = None
            continue
        if name:
            lines.append(line)
    return bodies


def handler_text(text, name, header=HANDLER):
    """One handler's body with the bodies of the file's own functions it calls, and theirs, added."""
    bodies = handler_bodies(text, header)
    seen, todo, parts = set(), [name], []
    while todo:
        current = todo.pop()
        if current in seen or current not in bodies:
            continue
        seen.add(current)
        body = '\n'.join(bodies[current])
        parts.append(body)
        todo += [called for called in re.findall(r'(?<![\w.:])(\w+)\s*\(', body) if called in bodies]
    return '\n'.join(parts)


def local_table(text, name):
    """The text of a top-level local table like local pets = { ... }, or '' when there's none."""
    match = re.search(r'^local\s+%s\s*=\s*\n?\{.*?^\}' % re.escape(name), text, re.M | re.S)
    return match.group(0) if match else ''


def zone_of(index):
    """The zone enum a zones[...] index names, or ANY_ZONE."""
    match = re.fullmatch(r'xi\.zone\.(\w+)', index)
    return match.group(1) if match else ANY_ZONE


class Unknown(list):
    """The offsets UNKNOWN_OFFSETS gives one offset the reader can't work out."""


def offsets(sign, value, loops):
    """The offsets one '+ value' or '- value' can mean. One the reader can't work out comes back as an Unknown."""
    if re.fullmatch(r'\d+', value):
        found = [int(value)]
    elif value in loops:
        low, high = loops[value]
        found = list(range(low, high + 1))
    else:
        return Unknown(number if sign == '+' else -number for number in UNKNOWN_OFFSETS)
    return [number if sign == '+' else -number for number in found]


class Refs:
    """The monsters one piece of Lua names, unresolved."""

    def __init__(self, text, own_enum=None):
        self.spawns = bool(SPAWN_CALL.search(text))
        self.confrontation = bool(CONFRONTATION.search(text))
        loops = {var: (min(int(a), int(b)), max(int(a), int(b))) for var, a, b in LOOP.findall(text)}
        aliases = {alias: zone_of(index) for alias, index in ALIAS.findall(text)}
        aliases.update({alias: enum_name(folder) for alias, folder in ALIAS_REQUIRE.findall(text)})
        if own_enum and 'ID' not in aliases:
            aliases['ID'] = own_enum
        # (zone enum, key, index or None, offsets or None)
        self.keys = []
        for alias, inline, key, index, sign, value in KEY_REF.findall(text):
            zone = zone_of(inline) if inline else aliases.get(alias)
            if not zone:
                continue
            self.keys.append((zone, key, int(index) if index else None,
                              offsets(sign, value, loops) if sign else None))
        for (alias, inline, key, sign, value, alias2, inline2, key2, sign2, value2) in KEY_LOOP.findall(text):
            zone = zone_of(inline) if inline else aliases.get(alias)
            zone2 = zone_of(inline2) if inline2 else aliases.get(alias2)
            if zone and zone == zone2 and key == key2:
                low = int(value or 0) * (-1 if sign == '-' else 1)
                high = int(value2 or 0) * (-1 if sign2 == '-' else 1)
                self.keys.append((zone, key, None, list(range(low, high + 1))))
        for var, alias, inline, key in KEY_LOCAL.findall(text):
            zone = zone_of(inline) if inline else aliases.get(alias)
            if not zone:
                continue
            for sign, value in re.findall(r'(?<![\w.])%s\b(?:\s*([+-])\s*(\w+))?' % re.escape(var), text):
                self.keys.append((zone, key, None, offsets(sign, value, loops) if sign else None))
        if 'spawnFollowers' in text:
            for alias, inline, key, index, count in FOLLOWERS.findall(text):
                zone = zone_of(inline) if inline else aliases.get(alias)
                if zone:
                    self.keys.append((zone, key, int(index), list(range(1, int(count) + 1))))
        self.ids = {int(number) for number in LITERAL_ID.findall(text)}
        # zone:queryEntitiesByName('Dalham') names every spawn of that script.
        self.names = set(BY_NAME.findall(text))
        found = set()
        for sign, value in SELF_OFFSET.findall(text):
            found.update(offsets(sign, value, loops))
        for var in set(SELF_VAR.findall(text)):
            for sign, value in re.findall(r'\b%s\s*([+-])\s*(\w+)' % re.escape(var), text):
                found.update(offsets(sign, value, loops))
        self.self_offsets = found


class Index:
    """Every Lua file's spawn references, read once for the whole export."""

    def __init__(self, tree, content):
        self.tree = tree
        self.content = content
        self.cache = {}
        self.globals = []
        for rel in self.global_files():
            refs = self.refs(rel)
            if refs.spawns:
                self.globals.append((rel, refs))
        self.hidden, self.shown = self.read_visibility()
        self.garrison = self.read_garrison()
        self.shared_caps = self.read_shared_caps()
        self.fishing = {row['mobid'] for row in sqlfile.rows(os.path.join(tree, 'sql', 'fishing_mob.sql'),
                                                             'fishing_mob') if not row['disabled']}
        self.skill_names = {row['mob_skill_id']: row['mob_skill_name'] for row in
                            sqlfile.rows(os.path.join(tree, 'sql', 'mob_skills.sql'), 'mob_skills')}
        self.by_enum = self.read_skill_enum()
        self.skill_lists, self.list_ids = {}, {}
        text = Path(os.path.join(tree, 'sql', 'mob_skill_lists.sql')).read_text(encoding='utf-8', errors='replace')
        for name, list_id, skill in re.findall(r"(?m)^INSERT INTO `mob_skill_lists` VALUES \('([^']*)',(\d+),(\d+)\);",
                                               text):
            self.skill_lists.setdefault(int(list_id), set()).add(int(skill))
            self.list_ids[name] = int(list_id)
        self.dynamis = self.read_dynamis()

    def text(self, rel):
        path = os.path.join(self.tree, rel)
        if not os.path.exists(path):
            return None
        return lua_source.strip_comments(Path(path).read_text(encoding='utf-8', errors='replace'))

    def refs(self, rel, own_enum=None, part=None):
        key = (rel, part)
        if key not in self.cache:
            text = self.text(rel)
            if text is not None and part is not None:
                text = handler_text(text, part)
            self.cache[key] = Refs(text, own_enum) if text is not None else None
        return self.cache[key]

    def function_refs(self, rel, names):
        """The Refs for some xi.* functions of a scripts/globals file, with the file's own functions they call."""
        key = (rel, names)
        if key not in self.cache:
            text = self.text(rel) or ''
            self.cache[key] = Refs('\n'.join(handler_text(text, name, GLOBAL_FUNCTION) for name in names))
        return self.cache[key]

    def global_files(self):
        """Live Lua outside the zone folders: globals, battlefields, missions and quests whose content is on, and
        loaded modules."""
        files = []
        scripts = os.path.join(self.tree, 'scripts')
        for folder in ('globals', 'battlefields', 'missions', 'quests'):
            for path in glob.glob(os.path.join(scripts, folder, '**', '*.lua'), recursive=True):
                rel = os.path.relpath(path, self.tree).replace(os.sep, '/')
                part = '/'.join(rel.split('/')[1:3])
                tag = FOLDER_CONTENT.get(part)
                if tag and not self.content.allows(tag):
                    continue
                files.append(rel)
        for entry in overlays.init_entries(self.tree):
            base = os.path.join(self.tree, 'modules', *entry.split('/'))
            if entry.endswith('.lua') and os.path.isfile(base):
                found = [base]
            elif os.path.isdir(base) and 'data' not in entry.split('/') and 'sql' not in entry.split('/'):
                found = glob.glob(os.path.join(base, '**', '*.lua'), recursive=True)
            else:
                found = []
            files += [os.path.relpath(path, self.tree).replace(os.sep, '/') for path in found]
        return files

    def read_visibility(self):
        """
        Two {zone script folder: NPC scripts} from npc_visibility.lua, the ones Phoenix hides at zone load and the ones
        it shows. It puts a shown NPC back up when the content gate hid it, so a shown NPC is up even with its content
        off.
        """
        text = self.text(NPC_VISIBILITY)
        # Its own TODO says it moves to YAML, so a missing file means the hiding moved, not that it's off.
        if text is None:
            raise RuntimeError('%s is gone. The NPC visibility reader needs updating.' % NPC_VISIBILITY)
        hidden, shown = {}, {}
        for zone, body in re.findall(r'\n    (\w+) =\s*\{(.*?)\n    \},', text, re.S):
            block = re.search(r'hidden\s*=\s*\{(.*?)\}', body, re.S)
            if block:
                hidden[zone] = set(re.findall(r"'([^']+)'", block.group(1)))
            # Each shown entry is { name = 'x', pos = { ... } }.
            at = re.search(r'\bshown\s*=\s*(?=\{)', body)
            if at:
                entries = lua_source.block(body, at.end(), NPC_VISIBILITY)
                shown[zone] = set(re.findall(r"\bname\s*=\s*'([^']+)'", entries))
        if (len(hidden) != len(re.findall(r'\bhidden\s*=', text))
                or len(shown) != len(re.findall(r'\bshown\s*=', text))
                or sum(len(names) for names in shown.values()) != len(re.findall(r'\bpos\s*=', text))):
            raise RuntimeError('%s did not read as expected. The NPC visibility reader needs updating.'
                               % NPC_VISIBILITY)
        return hidden, shown

    def read_garrison(self):
        """{zone enum: Garrison boss script}."""
        text = self.text(GARRISON_DATA)
        if text is None:
            raise RuntimeError('%s is gone. The Garrison reader needs updating.' % GARRISON_DATA)
        bosses = dict(re.findall(r"\[xi\.zone\.(\w+)\]\s*=\s*\{[^{}]*?mobBoss\s*=\s*'([\w-]+)'", text, re.S))
        if len(bosses) != len(re.findall(r'\bmobBoss\s*=', text)):
            raise RuntimeError('%s did not read as expected. The Garrison reader needs updating.' % GARRISON_DATA)
        return bosses

    def read_shared_caps(self):
        """
        {zone enum: level cap} for the zones where the Expeditionary Force and Garrison cap at the same level. Both
        give their monsters and players the cap as the confrontation's power.
        """
        text = self.text(GARRISON_DATA)
        garrison = {zone: MAX_CAP if cap == '99' else int(cap) for zone, cap in
                    re.findall(r"\[xi\.zone\.(\w+)\]\s*=\s*\{[^{}]*?levelCap\s*=\s*(\d+)\s*,", text, re.S)}
        if len(garrison) != len(re.findall(r'\blevelCap\s*=', text)):
            raise RuntimeError('%s did not read as expected. The Garrison reader needs updating.' % GARRISON_DATA)
        text = self.text(EF_FILE)
        at = re.search(r'\blocal\s+zoneInfoTable\s*=', text or '')
        if at is None:
            raise RuntimeError('%s has no zoneInfoTable. The Expeditionary Force reader needs updating.' % EF_FILE)
        body = lua_source.block(text, at.end(), EF_FILE)
        ef = {}
        for zone, cap in re.findall(r'\[xi\.zone\.(\w+)\s*\]\s*=\s*\{[^{}]*?\blevelCap\s*=\s*([\w.]+)', body):
            if cap == 'xi.settings.main.MAX_LEVEL':
                ef[zone] = MAX_CAP
            elif re.fullmatch(r'\d+', cap):
                ef[zone] = int(cap)
            else:
                raise RuntimeError('%s gives %s a level cap the exporter can\'t read: %s' % (EF_FILE, zone, cap))
        if not ef or len(ef) != len(re.findall(r'\blevelCap\s*=', body)):
            raise RuntimeError('%s did not read as expected. The Expeditionary Force reader needs updating.' % EF_FILE)
        return {zone: cap for zone, cap in ef.items() if garrison.get(zone) == cap}

    def read_dynamis(self):
        """{zone enum: (every id the zone's Dynamis tables name, {statue id: adds})}."""
        out = {}
        for path in glob.glob(os.path.join(self.tree, DYNAMIS_MOBS, '*.lua')):
            text = lua_source.strip_comments(Path(path).read_text(encoding='utf-8', errors='replace'))
            zone = re.search(r'local zoneID = xi\.zone\.(\w+)', text)
            start = text.find('xi.dynamis.spawnTable[zoneID]')
            if not zone or start < 0:
                raise RuntimeError('%s did not read as expected. The Dynamis reader needs updating.' % path)
            named = {int(number) for number in LITERAL_ID.findall(text)}
            body = lua_source.block(text, start, path)
            entries = re.findall(r'\[(\d{8})\]\s*=\s*\{\s*(\d+)\s*\}', body)
            if len(entries) != len(re.findall(r'\]\s*=', body)):
                raise RuntimeError('%s did not read as expected. The Dynamis reader needs updating.' % path)
            table = {int(sid): int(count) for sid, count in entries}
            out[zone.group(1)] = (named, table)
        return out

    def read_skill_enum(self):
        """{xi.mobSkill name: its mob skill script, or None when its id has no skill row}."""
        text = self.text(MOB_SKILL_ENUM) or ''
        at = re.search(r'^xi\.mobSkill\s*=\s*(?=\{)', text, re.M)
        if at is None:
            raise RuntimeError('%s has no xi.mobSkill. The mob skill reader needs updating.' % MOB_SKILL_ENUM)
        body = lua_source.block(text, at.end(), MOB_SKILL_ENUM)
        names = re.findall(r'^\s*(\w+)\s*=\s*(\d+)\s*,?\s*$', body, re.M)
        if not names or len(names) != body.count('='):
            raise RuntimeError('%s did not read as expected. The mob skill reader needs updating.' % MOB_SKILL_ENUM)
        return {name: self.skill_names.get(int(number)) for name, number in names}

    def skill_files(self, list_id):
        """The mob skill files of a skill list that spawn monsters."""
        return self.spawning_skills(self.skill_names.get(skill) for skill in sorted(self.skill_lists.get(list_id, ())))

    def spawning_skills(self, names):
        """The mob skill files of the skill scripts named that spawn monsters."""
        found = []
        for name in names:
            if not name:
                continue
            rel = '%s/%s.lua' % (MOBSKILLS.replace(os.sep, '/'), name)
            refs = self.refs(rel)
            if refs is not None and refs.spawns and rel not in found:
                found.append(rel)
        return found


def check_module_sql(tree, index):
    """
    Stops on module SQL that changes a mob skill that spawns monsters, or deletes from a skill list that holds one,
    since the exporter reads both as the base SQL has them. Any id or name in the statement counts.
    """
    for rel, table, statement in module_statements(tree):
        if table not in ('mob_skills', 'mob_skill_lists'):
            continue
        words = re.findall(r"'([^']*)'", statement)
        numbers = [int(number) for number in re.findall(r'\b\d+\b', statement)]
        skills = words + [index.skill_names.get(number) for number in numbers]
        lists = []
        if table == 'mob_skill_lists' and statement.upper().startswith('DELETE'):
            lists = [index.list_ids.get(word) for word in words] + numbers
        if index.spawning_skills(skills) or any(index.skill_files(list_id) for list_id in lists):
            raise RuntimeError('%s changes a monster skill that spawns monsters, which the exporter reads. Teach it '
                               'this change.' % rel)


def id_keys(tree, script_dir, tables):
    """{IDs.lua mob key: [spawn ids]} for the keys the reader can follow."""
    path = os.path.join(tree, 'scripts', 'zones', script_dir, 'IDs.lua')
    where = 'scripts/zones/%s/IDs.lua' % script_dir
    if not os.path.exists(path):
        return {}
    text = lua_source.strip_comments(Path(path).read_text(encoding='utf-8', errors='replace'))
    at = re.search(r'\bmob\s*=\s*\{', text)
    if not at:
        return {}
    body = lua_source.block(text, at.start(), path)
    keys = {}
    for key, expr in re.findall(r'(?m)^\s*(\w+)\s*=\s*(.+?),?\s*$', body):
        ids = expr_ids(expr, tables, where)
        if ids:
            keys[key] = ids
    # A key whose table starts on the next line, like CHIGOES = { ['Marid'] = GetTableOfIDs('Chigoe') }, takes every
    # id inside it.
    for match in re.finditer(r'(?m)^[ \t]*(\w+)[ \t]*=\s*\{', body):
        ids = expr_ids(lua_source.block(body, match.end() - 1, path), tables, where)
        if ids:
            keys[match.group(1)] = ids
    return keys


def expr_ids(expr, tables, where):
    """
    The spawn ids the GetFirstID, GetTableOfIDs and literal ids in a piece of IDs.lua give. Stops on a call in any
    form ID_CALL doesn't cover, or one that reads past the end of its ids.
    """
    ids = []
    read = {match.start(2) for match in ID_CALL.finditer(expr)}
    for call in re.finditer(r'\b(?:GetFirstID|GetTableOfIDs)\(', expr):
        if call.start() not in read:
            raise RuntimeError('%s reads mob ids in a way the exporter can\'t: %s'
                               % (where, expr[call.start():].split('\n')[0].strip()))
    for match in ID_CALL.finditer(expr):
        sliced, kind, name, first, last, index, sign, delta = match.groups()
        spawns = tables.get(name, [])
        if kind == 'GetFirstID':
            # It gives one number, which can't be sliced or indexed.
            readable = not (sliced or index)
            spawns = spawns[:1]
        else:
            # A whole table can't have a number added to it.
            readable = bool(index or not sign)
            if sliced:
                last = int(last) if last else len(spawns)
                readable = readable and int(first) <= last <= len(spawns)
                spawns = spawns[int(first) - 1:last]
            if index:
                readable = readable and 0 < int(index) <= len(spawns)
                spawns = spawns[int(index) - 1:int(index)]
        before, after = expr[:match.start()].rstrip(), expr[match.end():].lstrip()
        if not readable or before[-1:] not in ('', '=', '{', ',') or after[:1] not in ('', ',', '}'):
            raise RuntimeError('%s reads mob ids in a way the exporter can\'t: %s'
                               % (where, expr[match.start():].split('\n')[0].strip()))
        step = int(delta) if sign == '+' else -int(delta) if sign else 0
        ids += [spawn + step for spawn in spawns]
    ids += [int(number) for number in LITERAL_ID.findall(expr)]
    return ids


def merged_spawn(template, spawn):
    """(spawn type names, respawn seconds) after the template and spawn layers."""
    types, respawn = [], 0
    for layer in (template.get('attributes'), spawn.get('attributes')):
        block = (layer or {}).get('spawn') or {}
        if block.get('type') is not None:
            value = block['type']
            types = [value] if isinstance(value, str) else list(value)
        if block.get('respawn') is not None:
            respawn = int(block['respawn'])
    return types, respawn


class Zone:
    """Works out which placed spawns of one YAML zone are ever up, and what brings each one up."""

    def __init__(self, ctx, dir_name, script_dir, document, tables, placed, fight_ids, pets, in_dynamis):
        self.ctx = ctx
        self.index = ctx.exists
        self.script_dir = script_dir
        self.enum = enum_name(script_dir)
        self.dir_name = dir_name
        self.templates = document.get('templates') or {}
        self.spawns = document.get('spawns') or {}
        self.placed = dict(placed)
        self.by_script = {}
        for spawn_id, kind in sorted(placed):
            self.by_script.setdefault(kind.script, []).append(spawn_id)
        self.tables = tables
        self.keys = id_keys(ctx.tree, script_dir, self.tables)
        self.sources = {}
        self.natural = set()
        self.pets = pets
        self.mark_static(fight_ids, in_dynamis)
        self.run()

    def add(self, spawn_id, source):
        if spawn_id not in self.placed:
            return False
        new = spawn_id not in self.sources
        self.sources.setdefault(spawn_id, set()).add(source)
        return new

    def mark_static(self, fight_ids, in_dynamis):
        for spawn_id, kind in self.placed.items():
            types, respawn = merged_spawn(self.templates.get(kind.template) or {}, self.spawns[spawn_id])
            if 'scripted' not in types or respawn > 0:
                self.natural.add(spawn_id)
                self.add(spawn_id, 'natural')
        for spawn_id in fight_ids:
            self.add(spawn_id, 'natural')
        for spawn_id in self.placed:
            if spawn_id in self.index.fishing:
                self.add(spawn_id, 'natural')
        if in_dynamis:
            if self.enum not in self.index.dynamis:
                raise RuntimeError('%s has no spawn table in %s. The Dynamis reader needs updating.'
                                   % (self.script_dir, DYNAMIS_MOBS))
            named, table = self.index.dynamis[self.enum]
            for spawn_id in named:
                self.add(spawn_id, 'natural')
            for statue, count in table.items():
                walked, step = 0, 1
                while walked < count and step <= DYNAMIS_WALK:
                    mob_id = statue + step
                    if mob_id in table:
                        break
                    if mob_id in self.placed and mob_id not in self.pets:
                        self.add(mob_id, 'natural')
                        walked += 1
                    step += 1
        boss = self.index.garrison.get(self.enum)
        if boss in self.by_script:
            first = self.by_script[boss][0]
            for spawn_id in range(first - GARRISON_POOL, first + 1):
                self.add(spawn_id, ('event', GARRISON_FILE))

    def resolve(self, refs, self_ids=()):
        """The placed spawn ids a Refs reaches."""
        found = set()
        for zone, key, index, steps in refs.keys:
            if zone not in (self.enum, ANY_ZONE) or key not in self.keys:
                continue
            ids = self.keys[key]
            if index is not None:
                ids = ids[index - 1:index] if 0 < index <= len(ids) else []
            if steps is None:
                found.update(ids)
                # A key named plainly stands for its script's first id. Count all of that script's spawns.
                script = self.script_of(ids[0]) if ids else None
                found.update(self.tables.get(script, []) if script else [])
            else:
                for base in ids[:1]:
                    found.update(base + step for step in steps)
                    # A key plus an offset the reader can't work out walks along the key's own spawns, like
                    # Pso'Xja's GARGOYLE_OFFSET + offset for its 16 doors, so every later one of them counts too.
                    if isinstance(steps, Unknown) and steps[-1] > 0:
                        found.update(spawn_id for spawn_id in self.tables.get(self.script_of(base), [])
                                     if spawn_id >= base)
        found.update(spawn_id for spawn_id in refs.ids if spawn_id in self.placed)
        for name in refs.names:
            found.update(self.by_script.get(name, []))
        for base in self_ids:
            # An unknown offset counts 0 too, but 0 from its own id is the monster itself.
            found.update(base + step for step in refs.self_offsets if step)
        return {spawn_id for spawn_id in found if spawn_id in self.placed}

    def script_of(self, spawn_id):
        kind = self.placed.get(spawn_id)
        return kind.script if kind else None

    def npc_live(self):
        """
        The scripts of the zone's NPCs that are placed, have their content on or are shown, and aren't hidden on
        Phoenix.
        """
        name = self.dir_name
        live = set()
        if not name or not os.path.exists(os.path.join(self.ctx.tree, 'data', 'zones', name, 'npcs.yaml')):
            return live
        document = overlays.load_merged(self.ctx.tree, self.ctx.roots, 'zones/%s/npcs' % name)
        hidden = self.index.hidden.get(self.script_dir, set())
        shown = self.index.shown.get(self.script_dir, set())
        for npc in (document.get('npcs') or {}).values():
            if not npc or not npc.get('script') or npc['script'] in hidden:
                continue
            if npc['script'] not in shown and not self.ctx.content.allows(npc.get('content')):
                continue
            if any(key in npc for key in ('at', 'region', 'path', 'circuit')):
                live.add(npc['script'])
        return live

    def run(self):
        index = self.index
        zone_folder = 'scripts/zones/%s' % self.script_dir
        # Zone.lua, and the zone's own helpers like globals.lua that its scripts require.
        static = []
        folder = glob.escape(os.path.join(self.ctx.tree, 'scripts', 'zones', self.script_dir))
        for path in sorted(glob.glob(os.path.join(folder, '*.lua'))):
            name = os.path.basename(path)
            if name not in ZONE_DATA_FILES:
                rel = '%s/%s' % (zone_folder, name)
                static.append((rel, index.refs(rel, self.enum)))
        for script in sorted(self.npc_live()):
            rel = '%s/npcs/%s.lua' % (zone_folder, script)
            static.append((rel, index.refs(rel, self.enum)))
        static += [(rel, refs) for rel, refs in index.globals]
        for rel, refs in static:
            if refs is None or not refs.spawns:
                continue
            source = ('event', rel) if refs.confrontation else 'reach'
            for spawn_id in self.resolve(refs):
                self.add(spawn_id, source)
            # A zone file's handler that spawns names some monsters by their script name.
            if rel.startswith(zone_folder):
                for name, bodies in handler_bodies(index.text(rel) or '').items():
                    body = '\n'.join(bodies)
                    if SPAWN_CALL.search(body):
                        for string in set(STRING.findall(body)) & set(self.by_script):
                            for spawn_id in self.by_script[string]:
                                self.add(spawn_id, 'reach')
        # The server runs every placed spawn's onMobInitialize at zone load.
        for script, ids in self.by_script.items():
            rel = '%s/mobs/%s.lua' % (zone_folder, script)
            refs = index.refs(rel, self.enum, 'onMobInitialize')
            if refs is None or not refs.spawns:
                continue
            body = handler_text(index.text(rel) or '', 'onMobInitialize')
            if re.search(r'\bmob\s*:\s*(?:setRespawnTime|spawn)\s*\(', body):
                for spawn_id in ids:
                    self.add(spawn_id, 'reach')
            for spawn_id in self.resolve(refs, ids):
                self.add(spawn_id, ('init', script))
        # The rest of a monster's scripts run only while it's up.
        done, changed, refs_of = set(), True, {}
        while changed:
            changed = False
            for spawn_id in sorted(self.sources):
                if spawn_id in done:
                    continue
                done.add(spawn_id)
                kind = self.placed[spawn_id]
                if id(kind) not in refs_of:
                    refs_of[id(kind)] = self.kind_refs(kind)
                for refs in refs_of[id(kind)]:
                    if refs is None or not refs.spawns:
                        continue
                    for target in self.resolve(refs, [spawn_id]):
                        if self.add(target, ('mob', kind.script, spawn_id)):
                            changed = True
                for pet, master in self.pets.items():
                    if (self.script_dir, kind.script, self.script_of(pet)) in BOUND_ONLY_PETS:
                        continue
                    if master == spawn_id and self.add(pet, ('pet', master)):
                        changed = True

    def kind_refs(self, kind):
        """
        The Refs for the monster script, the scripts/globals functions it calls that spawn by an offset from its id,
        its mixins, its spawning mob skills and its job special.
        """
        index = self.index
        rel = 'scripts/zones/%s/mobs/%s.lua' % (self.script_dir, kind.script)
        text = index.text(rel) or ''
        found = [index.refs(rel, self.enum)]
        # A call like xi.promyvion.receptacleOnMobRoam(mob) runs that function of scripts/globals/promyvion.lua as
        # this monster, so its offsets count from this monster's id.
        calls = {}
        for call, owner in GLOBAL_CALL.findall(text):
            calls.setdefault('scripts/globals/%s.lua' % owner, set()).add(call)
        for global_rel, _ in index.globals:
            if global_rel in calls:
                refs = index.function_refs(global_rel, tuple(sorted(calls[global_rel])))
                if refs.spawns and refs.self_offsets:
                    found.append(refs)
        for mixin in kind.effects.mixins + kind.group_mixins:
            found.append(index.refs('scripts/mixins/%s.lua' % mixin))
        template = self.templates.get(kind.template) or {}
        skills = {index.skill_names.get(skill) for skill in index.skill_lists.get(template.get('skill_list_id'), ())}
        # A script can also use a skill its list doesn't hold, like useMobAbility(xi.mobSkill.ECLOSION).
        for name in set(re.findall(r'xi\.mobSkill\.(\w+)', text)):
            if name not in index.by_enum:
                raise RuntimeError('%s names xi.mobSkill.%s, which %s doesn\'t have' % (rel, name, MOB_SKILL_ENUM))
            skills.add(index.by_enum[name])
        # job_special gives a summoner Astral Flow.
        if 'job_special' in kind.effects.mixins + kind.group_mixins and kind.jobs and kind.jobs[0] == 'smn':
            skills.add(ASTRAL_FLOW)
        for skill in index.spawning_skills(sorted(name for name in skills if name)):
            if skill.endswith('/%s.lua' % ASTRAL_FLOW):
                found.append(AstralRefs(self.astral_offsets(kind, text)))
                continue
            refs = index.refs(skill)
            if not (refs.self_offsets or refs.keys or refs.ids or refs.names):
                raise RuntimeError('%s spawns monsters in a way the exporter can\'t read, and %s %s uses it'
                                   % (skill, self.script_dir, kind.script))
            found.append(refs)
        return found

    def astral_offsets(self, kind, text):
        """
        The offsets from the summoner's id Astral Flow can call its avatar at: its ASTRAL_PET_OFFSET from the YAML, or
        from a setMobMod in its script, or 2. One the script works out, like Fantoccini's petData.offset, is an Unknown.
        """
        offset = kind.attributes['mob_mods'].get('astral_pet_offset')
        if offset:
            return [offset]
        found = set()
        for value in re.findall(r'setMobMod\(\s*xi\.mobMod\.ASTRAL_PET_OFFSET\s*,\s*([^)]*?)\s*\)', text):
            found.update(number or ASTRAL_OFFSET for number in offsets('+', value, {}))
        return found or [ASTRAL_OFFSET]

    def owners(self, spawn_id):
        """The spawn ids of the monsters that spawn this one as an add or have it as a pet."""
        found = {source[2] for source in self.sources.get(spawn_id, ())
                 if isinstance(source, tuple) and source[0] == 'mob'}
        if spawn_id in self.pets:
            found.add(self.pets[spawn_id])
        return found

    def events(self):
        """
        {spawn id: event} for spawns that only one confrontation spawner brings up. The event is the spawner file,
        but the Expeditionary Force and Garrison share one where their level caps match, since the server only
        compares the confrontation's power (mob_controller.cpp TryDeaggro, mob_entity.cpp ValidTarget).
        """
        cap = self.index.shared_caps.get(self.enum)
        out = {}
        for spawn_id, sources in self.sources.items():
            files = {source[1] for source in sources if isinstance(source, tuple) and source[0] == 'event'}
            if len(files) == 1 and len(sources) == 1:
                event = files.pop()
                if cap is not None and event in (GARRISON_FILE, EF_FILE):
                    event = ('level cap', cap)
                out[spawn_id] = event
        for pet, master in self.pets.items():
            if master in out and pet in self.sources:
                out[pet] = out[master]
        return out

    def assist_only(self):
        """
        Spawns that only their owner's callPets brings up and that the owner despawns when it stops fighting. They
        are only up while assisting a fight, so no one ever finds them idle to call. Without persistOnDeath, callPets'
        own listener kills a helper that goes idle once its owner is dead (globals/mobs.lua ASSIST_OWNER), so only a
        helper that persists needs the owner's onMobDespawn to despawn it too. links.ASSIST_ONLY holds the few adds an
        owner brings in some other way.
        """
        out = set()
        despawned = {}
        for script, ids in self.by_script.items():
            text = self.index.text('scripts/zones/%s/mobs/%s.lua' % (self.script_dir, script)) or ''
            if 'callPets' not in text:
                continue
            bodies = handler_bodies(text)
            handlers = ['onMobDisengage'] + (['onMobDespawn'] if 'persistOnDeath' in text else [])
            for owner in ids:
                gone = None
                for handler in handlers:
                    body = '\n'.join(bodies.get(handler, []))
                    found = set()
                    if DESPAWN.search(body):
                        # A handler that loops over a table of the file, like Vrtra's pets, despawns what it names.
                        tables = '\n'.join(local_table(text, name) for name in set(LOOPED.findall(body)))
                        found = self.resolve(Refs(body + '\n' + tables, self.enum), [owner]) - {owner}
                    gone = found if gone is None else gone & found
                despawned[owner] = gone
        for spawn_id, sources in self.sources.items():
            if spawn_id in self.natural or not sources:
                continue
            owners = [source for source in sources if isinstance(source, tuple) and source[0] == 'mob']
            if len(owners) != len(sources):
                continue
            if all(spawn_id in despawned.get(owner, ()) for _, _, owner in owners):
                out.add(spawn_id)
        return out


class AstralRefs:
    """Astral Flow's call at the summoner's id plus the avatar offset (Zone.astral_offsets)."""

    def __init__(self, offsets):
        self.spawns = True
        self.confrontation = False
        self.keys = []
        self.ids = set()
        self.names = set()
        self.self_offsets = set(offsets)
