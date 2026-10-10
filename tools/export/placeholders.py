"""
Which monsters are placeholders (PH) for an NM, the way xi.mob.phOnDespawn in scripts/globals/mobs.lua works it out.

A PH's onMobDespawn calls xi.mob.phOnDespawn(mob, ID.mob.SOME_NM, ...). That reads the phList in SOME_NM's script,
and when the list holds the PH's id, the NM under that id can pop. Both halves count. Some list entries are only there
to keep one NM from popping while another is up, and a call does nothing when the list doesn't hold the PH. The PH, the
NM the call names and the NM that pops all have to be monsters the server makes.

Phoenix's Dynamis swaps every Dynamis monster's onMobDespawn for its own, so no Dynamis monster is a PH. A loaded module
can wrap a PH's onMobDespawn, or swap it for one that calls phOnDespawn for the same NMs the way pxi_nm_spawn_points.lua
does to move where an NM pops. Either way the PHs are the same whether the module runs or not. A module that touches a
phList, calls phOnDespawn outside an onMobDespawn override, or changes onMobDespawn or phOnDespawn any other way stops
the export.
"""
from pathlib import Path
import os
import re

from . import aggro
from . import battlefields
from . import dynamis
from . import lua_source
from . import ph_rules

# The call a PH's onMobDespawn makes.
PH_CALL = 'xi.mob.phOnDespawn'
CALL = re.compile(r'xi\.mob\.phOnDespawn\s*\(')

# One monster the way a phList or a phOnDespawn call names it: ID.mob.NAME, ALIAS.mob.NAME or
# zones[xi.zone.ZONE].mob.NAME, then an optional [n] for one id of a table and an optional + n or - n.
TERM = re.compile(r'(?:zones\[xi\.zone\.(\w+)\]|(\w+))\.mob\.(\w+)(?:\[(\d+)\])?(?:\s*([+-])\s*(\d+))?')

# A local that holds a zone's IDs, like local ID = zones[xi.zone.VALKURM_DUNES].
ALIAS = re.compile(r'^local\s+(\w+)\s*=\s*zones\[xi\.zone\.(\w+)\]\s*$', re.M)

# The value of an IDs.lua mob name that is a plain GetFirstID or GetTableOfIDs of one monster script.
ID_VALUE = re.compile(r"(GetFirstID|GetTableOfIDs)\('([^']+)'\)")

PH_LIST = re.compile(r'^entity\.phList\s*=\s*\{', re.M)

# A module override of a monster's onMobDespawn. It holds the line's indent, whether string.format makes the name,
# and the zone script folder and monster script the name gives.
DESPAWN_OVERRIDE = re.compile(r"^([ \t]*)\w+:addOverride\((string\.format\()?\s*'xi\.zones\.([^.']+)\.mobs\.([^.']+)"
                              r"\.onMobDespawn'", re.M)

NEEDS_UPDATE = 'The PH reader needs updating.'

# The Dynamis module's override file, which dynamis.py reads.
DYNAMIS_FILE = dynamis.OVERRIDES.replace(os.sep, '/')


def call_nm(line, where):
    """The NM argument of the one phOnDespawn call on a line."""
    calls = list(CALL.finditer(line))
    args = lua_source.call_arguments(line, calls[0].end() - 1) if len(calls) == 1 else None
    if not args or len(args) < 2:
        raise RuntimeError('%s calls %s in a way the PH reader can\'t read. %s' % (where, PH_CALL, NEEDS_UPDATE))
    return args[1]


class ZoneIds:
    """One zone's IDs.lua mob names and the spawn ids of each monster script, to read the monsters a script names."""

    def __init__(self, tree, dir_name, script_dir, tables):
        self.dir_name = dir_name
        self.script_dir = script_dir
        self.tables = tables
        self.entries = {}
        path = os.path.join(tree, 'scripts', 'zones', script_dir, 'IDs.lua')
        if os.path.exists(path):
            text = lua_source.strip_comments(Path(path).read_text(encoding='utf-8', errors='replace'))
            start = re.search(r'^    mob\s*=', text, re.M)
            if start is not None:
                body = lua_source.block(text, start.end(), path)
                # Only the names at the top of the mob table count, the way Lua reads ID.mob.NAME.
                for name, value in battlefields.fields(body).items():
                    found = ID_VALUE.fullmatch(value)
                    if found:
                        self.entries[name] = found.groups()

    def ids(self, text, aliases, where, table=True):
        """
        The monster ids text names, as a list. A table, or a name GetTableOfIDs gives, holds more than one. With table
        False, text has to be one id, like a phList key or a monster inside a table.
        """
        text = text.strip()
        if table and text.startswith('{') and text.endswith('}'):
            return [found for part in battlefields.entries(text[1:-1])
                    for found in self.ids(part, aliases, where, False)]
        match = TERM.fullmatch(text)
        if match is None:
            raise RuntimeError('%s names a monster as %s, which the PH reader can\'t read. %s'
                               % (where, text, NEEDS_UPDATE))
        zone, alias, name, index, sign, offset = match.groups()
        if (zone or aliases.get(alias, '')).lower() != self.dir_name:
            raise RuntimeError('%s names %s, which isn\'t a monster of %s. %s'
                               % (where, text, self.script_dir, NEEDS_UPDATE))
        if name not in self.entries:
            raise RuntimeError('%s names mob.%s, which %s IDs.lua doesn\'t set to a plain GetFirstID or '
                               'GetTableOfIDs. %s' % (where, name, self.script_dir, NEEDS_UPDATE))
        call, script = self.entries[name]
        found = self.tables.get(script, [])
        if not found:
            raise RuntimeError('%s names mob.%s, but %s(\'%s\') finds no monster. %s'
                               % (where, name, call, script, NEEDS_UPDATE))
        if call == 'GetFirstID':
            found = found[:1]
        # [n] picks one id of a GetTableOfIDs name. Without it that name is a table in Lua even when it holds one id,
        # so it can't take + n or be one id.
        if index is not None and call == 'GetTableOfIDs' and 1 <= int(index) <= len(found):
            found = [found[int(index) - 1]]
        elif index is not None or (call == 'GetTableOfIDs' and (sign is not None or not table)):
            raise RuntimeError('%s names a monster as %s, which the PH reader can\'t read. %s'
                               % (where, text, NEEDS_UPDATE))
        if sign is not None:
            found = [found[0] + int(sign + offset)]
        return found


def module_overrides(tree):
    """
    {(zone script folder, monster script): [(module file, calls super, [NM texts], aliases)]} for the onMobDespawn
    overrides the loaded modules make by name. It stops on any other module change the PH reader can't follow: a phList,
    an onMobDespawn or phOnDespawn named some other way than a call or a single-quoted override, an override with no
    end) of its own, like one that passes a function made somewhere else or fits on one line, a phOnDespawn call it
    can't read or one outside an onMobDespawn override, or an override string.format names for a list of monsters that
    doesn't call super or calls phOnDespawn.
    """
    found = {}
    for path in aggro.lua_files_loaded(tree):
        text = lua_source.strip_comments(Path(os.path.join(tree, path)).read_text(encoding='utf-8', errors='replace'))
        if 'phList' in text:
            raise RuntimeError('%s touches a phList. %s' % (path, NEEDS_UPDATE))
        # Every onMobDespawn here has to be a call or an override the loop below can read, and every phOnDespawn a
        # call. A path built from a variable, in double quotes or made with fmt, or an override of phOnDespawn
        # itself, isn't. The Dynamis file's swaps are dynamis.py's to read.
        despawns = len(re.findall(r'onMobDespawn(?!\s*\()', text))
        if path != DYNAMIS_FILE and despawns != len(DESPAWN_OVERRIDE.findall(text)):
            raise RuntimeError('%s changes an onMobDespawn in a way the PH reader can\'t follow. %s'
                               % (path, NEEDS_UPDATE))
        if text.count('phOnDespawn') != len(CALL.findall(text)):
            raise RuntimeError('%s uses %s in a way the PH reader can\'t follow. %s' % (path, PH_CALL, NEEDS_UPDATE))
        lines = text.split('\n')
        aliases = dict(ALIAS.findall(text))
        read = 0
        for match in DESPAWN_OVERRIDE.finditer(text):
            indent, formatted, script_dir, script = match.groups()
            first = text.count('\n', 0, match.start())
            last = next((at for at in range(first + 1, len(lines)) if lines[at].startswith(indent + 'end)')), None)
            # Another override before that end) means this one has no end) of its own, like one that passes a
            # function made somewhere else or fits on one line.
            if last is None or any('addOverride(' in line for line in lines[first + 1:last]):
                raise RuntimeError('%s line %d has an onMobDespawn override the PH reader can\'t find the end of. %s'
                                   % (path, first + 1, NEEDS_UPDATE))
            body = lines[first:last + 1]
            calls = [call_nm(line, '%s line %d' % (path, number)) for number, line in enumerate(body, first + 1)
                     if CALL.search(line)]
            keeps = any('super(' in line for line in body)
            read += len(calls)
            if formatted and not keeps:
                raise RuntimeError('%s line %d overrides onMobDespawn for a list of monsters without keeping what '
                                   'their scripts do. %s' % (path, first + 1, NEEDS_UPDATE))
            if formatted and calls:
                raise RuntimeError('%s line %d calls %s for a list of monsters, which the PH reader can\'t follow. %s'
                                   % (path, first + 1, PH_CALL, NEEDS_UPDATE))
            if not formatted:
                found.setdefault((script_dir, script), []).append((path, keeps, calls, aliases, "\n".join(body[1:-1])))
        if len(CALL.findall(text)) != read:
            raise RuntimeError('%s calls %s outside an onMobDespawn override. %s' % (path, PH_CALL, NEEDS_UPDATE))
    return found


class Reader:
    """Finds the PHs of each zone. It reads the loaded modules once, when the export starts."""

    def __init__(self, tree, scripts, dynamis):
        self.tree = tree
        self.scripts = scripts
        self.dynamis = dynamis
        self.overrides = module_overrides(tree)
        ph_rules.check_helper(tree)
        self.nm_rules = ph_rules.NmRules(tree)

    def mark(self, dir_name, script_dir, tables, placed):
        """
        Fills in kind.ph_for, {spawn index: set of NM spawn indexes}, for each PH in one zone. placed is [(spawn id,
        kind)] for every monster in the zone's rows, and tables what zones.id_tables gives.
        """
        ids = ZoneIds(self.tree, dir_name, script_dir, tables)
        kinds = dict(placed)
        calls, lists, rules = {}, {}, {}
        for spawn_id, kind in placed:
            if kind.script not in calls:
                calls[kind.script] = self.despawn_nms(ids, script_dir, kind.script)
                rules[kind.script] = self.despawn_rules(ids, script_dir, kind.script) if calls[kind.script] else {}
            for called in calls[kind.script]:
                # An NM the server never makes, like a WotG one, has no script for the call to read.
                if called not in kinds:
                    continue
                nm_script = kinds[called].script
                if nm_script not in lists:
                    lists[nm_script] = self.ph_list(ids, script_dir, nm_script)
                for nm in lists[nm_script].get(spawn_id, []):
                    if nm not in kinds:
                        continue
                    # The note prints the NM's row name, so it has to be the name players see.
                    if kinds[nm].name != kinds[nm].link_name:
                        raise RuntimeError('%s has the NM %s, which players see as %s, so its PH note would '
                                           'print the wrong name. %s'
                                           % (dir_name, kinds[nm].name, kinds[nm].link_name, NEEDS_UPDATE))
                    kind.ph_for.setdefault(spawn_id & 0xFFF, set()).add(nm & 0xFFF)
                    rule = rules[kind.script].get(called)
                    if rule is not None:
                        kind.ph_rules.setdefault(spawn_id & 0xFFF, {})[nm & 0xFFF] = self.nm_rules.apply(
                            script_dir, kinds[nm].script, rule)

    def despawn_nms(self, ids, script_dir, script):
        """The NM ids a monster's onMobDespawn names in its phOnDespawn calls, as Phoenix runs it."""
        if script_dir in self.dynamis.zone_dirs and not self.dynamis.keeps(script_dir, script, 'onMobDespawn'):
            return set()
        source = self.scripts.lua(self.scripts.mob_script_path(script_dir, script))
        nms = set()
        if source is not None:
            helpers = [(handler, number) for handler, number, name, _ in source.helpers if name == PH_CALL]
            if len(helpers) != source.text.count('phOnDespawn'):
                raise RuntimeError('%s uses %s in a way the PH reader can\'t follow. %s'
                                   % (source.path, PH_CALL, NEEDS_UPDATE))
            aliases = dict(ALIAS.findall(source.text))
            lines = source.text.split('\n')
            for handler, number in helpers:
                where = '%s line %d' % (source.path, number)
                if handler != 'onMobDespawn':
                    raise RuntimeError('%s calls %s in %s, not onMobDespawn. %s'
                                       % (where, PH_CALL, handler, NEEDS_UPDATE))
                nms.update(ids.ids(call_nm(lines[number - 1], where), aliases, where))
        for module, keeps, texts, aliases, _ in self.overrides.get((script_dir, script), []):
            ran = set(nms) if keeps else set()
            for text in texts:
                ran.update(ids.ids(text, aliases, module))
            if ran != nms:
                raise RuntimeError('%s changes which NMs %s %s can pop. %s'
                                   % (module, script_dir, script, NEEDS_UPDATE))
        return nms

    def despawn_rules(self, ids, script_dir, script):
        """The rules of the call that actually runs, after named loaded overrides."""
        if script_dir in self.dynamis.zone_dirs and not self.dynamis.keeps(script_dir, script, 'onMobDespawn'):
            return {}
        source = self.scripts.lua(self.scripts.mob_script_path(script_dir, script))
        rules = {}

        def add(body, aliases, where):
            for nm_text, rule in ph_rules.read(body):
                for nm in ids.ids(nm_text, aliases, where):
                    if nm in rules and rules[nm] != rule:
                        rules[nm] = {'conditions': ['Lottery rules vary between scripted calls.']}
                    else:
                        rules[nm] = rule

        if source is not None:
            match = re.search(r'entity\.onMobDespawn\s*=\s*function\([^)]*\)(.*?)\nend', source.text, re.S)
            if match:
                add(match[1], dict(ALIAS.findall(source.text)), source.path)
        for module, keeps, _, aliases, body in self.overrides.get((script_dir, script), []):
            if not keeps:
                rules.clear()
            elif re.search(r'\b(if|for|while)\b', body.split('super(', 1)[0]):
                for rule in rules.values():
                    rule['conditions'] = list(rule['conditions']) + ['A loaded module adds scripted eligibility.']
            add(body, aliases, module)
        return rules

    def ph_list(self, ids, script_dir, script):
        """{PH id: [NM ids]} from the phList in an NM's script, or {} when it has none."""
        source = self.scripts.lua(self.scripts.mob_script_path(script_dir, script))
        if source is None or 'phList' not in source.text:
            return {}
        start = PH_LIST.search(source.text)
        if start is None or source.text.count('phList') != 1:
            raise RuntimeError('%s sets phList in a way the PH reader can\'t read. %s' % (source.path, NEEDS_UPDATE))
        aliases = dict(ALIAS.findall(source.text))
        found = {}
        for entry in battlefields.entries(lua_source.block(source.text, start.start(), source.path)):
            match = re.fullmatch(r'\[(.+)\]\s*=\s*(.+)', entry, re.S)
            keys = ids.ids(match.group(1), aliases, source.path, False) if match else []
            if len(keys) != 1:
                raise RuntimeError('%s has a phList entry the PH reader can\'t read: %s. %s'
                                   % (source.path, entry, NEEDS_UPDATE))
            if keys[0] in found:
                raise RuntimeError('%s has two phList entries for one monster, %s. %s'
                                   % (source.path, entry, NEEDS_UPDATE))
            found[keys[0]] = ids.ids(match.group(2), aliases, source.path)
        return found
