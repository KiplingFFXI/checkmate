"""
What a monster's Lua does to its numbers, immunities and drops.

onMobInitialize runs once when the zone loads and its mods are saved. onMobSpawn runs after the spawn math on
every spawn. A literal call at the top of either handler is applied in source order, and so is the top of any
xi.* helper they call with the monster. Everything else that touches a number marks the monster as changing at
runtime.
"""
from pathlib import Path
import glob
import os
import re

from . import lua_source

INIT = 'onMobInitialize'
SPAWN = 'onMobSpawn'

# How deep helper calls are followed.
HELPER_DEPTH = 3

# Top-level calls the exporter can't work out, as (end of the script path, start of the call), with why.
# They mark the monster as changing at runtime.
KNOWN_UNREADABLE = {
    ('AlTaieu/mobs/Omyovra.lua', 'setMod(xi.mod.AGI'): 'It sets AGI from its own AGI, to land near 76.',
}


class Effects:
    """
    What the scripts do to one monster. An op is (kind, name, value). Kinds are set, add and del for mods,
    and immune_add and immune_del for immunities.
    """

    def __init__(self):
        # A single handler or helper keeps its ops here.
        self.ops = []
        self.init_ops = []
        self.spawn_ops = []
        self.runtime = []
        # Changes to displayed elemental fields that don't always run.
        self.element_runtime = []
        self.weapon_runtime = []
        self.defense_runtime = []
        self.unreadable = []
        self.drops_off = False
        self.scripted_drops = []
        # Aggro and link changes are kept apart as (name, value) ops.
        self.aggro_ops = []
        self.init_aggro = []
        self.spawn_aggro = []
        # Aggro changes that don't always run.
        self.aggro_runtime = []
        # Link changes in onMobInitialize and onMobSpawn that don't always run.
        self.link_runtime = []
        # The mixins the script uses.
        self.mixins = []
        # Where a script, a helper it calls or a mixin changes the monster's job, which makes the data's job wrong.
        self.job_changes = []
        # Where its spawn gives it a TP move list to swing with in place of its normal hits, where its spawn stops its
        # swings, and where a call at spawn or later can undo either (a list of 0, swings turned back on, or a value
        # the reader can't read). Each undoes both, which can only leave a flag off.
        self.tp_moves = []
        self.no_swings = []
        self.normal_swings = []

    def add_aggro_runtime(self, name, reason):
        """Files a change that doesn't always run under aggro_runtime or link_runtime, by the name it changes."""
        if name in lua_source.AGGRO_NAMES:
            self.aggro_runtime.append(reason)
        else:
            self.link_runtime.append(reason)


def known_unreadable(path, detail):
    return any(path.endswith(end) and call in detail for end, call in KNOWN_UNREADABLE)


def split_ops(ops):
    """(number ops, element ops). Elemental rank and evasion changes belong in both."""
    numbers = [op for op in ops if op[1] not in lua_source.ELEMENT_DAMAGE_MODS | lua_source.WEAPON_DAMAGE_MODS | lua_source.DEFENSE_MODS]
    elements = [op for op in ops if op[1] in lua_source.ELEMENT_READOUT_MODS]
    return numbers, elements


def defense_ops(ops):
    return [op for op in ops if op[1] in lua_source.DEFENSE_MODS]


def weapon_ops(ops):
    return [op for op in ops if op[1] in lua_source.WEAPON_DAMAGE_MODS]


class ScriptIndex:
    """Reads mob scripts, mixins and xi.* helpers once each and works out their effects."""

    def __init__(self, tree, immunities, aliases):
        self.tree = tree
        self.immunities = immunities
        self.aliases = aliases
        self.files = {}
        self.helpers = self.index_helpers()
        self.mixin_kinds = {}
        self.mixin_weapon_flags = {}
        self.mixin_defense_flags = {}
        self.mixin_aggros = {}
        self.mixin_jobs = {}
        self.mixin_swing_marks = {}

    def index_helpers(self):
        """
        Where each xi.* function in scripts/globals, scripts/mixins and scripts/combat is defined. scripts/combat has
        xi.combat.behavior.disableAllActions and enableAllActions, which stop a monster's swings and give them back.
        """
        index = {}
        pattern = re.compile(r'^(?:(xi\.[\w.]+)\s*=\s*function\b|function\s+(xi\.[\w.]+)\s*\()', re.M)
        for folder in ('globals', 'mixins', 'combat'):
            for path in glob.glob(os.path.join(self.tree, 'scripts', folder, '**', '*.lua'), recursive=True):
                text = Path(path).read_text(encoding='utf-8', errors='replace')
                for assigned, declared in pattern.findall(text):
                    index.setdefault(assigned or declared, path)
        return index

    def lua(self, path):
        """The parsed Lua file at path, named by its path inside the tree, or None when it doesn't exist."""
        if path not in self.files:
            source = None
            if os.path.exists(path):
                name = os.path.relpath(path, self.tree).replace(os.sep, '/')
                source = lua_source.LuaFile(name, Path(path).read_text(encoding='utf-8', errors='replace'))
            self.files[path] = source
        return self.files[path]

    def mob_script_path(self, zone_dir, script):
        return os.path.join(self.tree, 'scripts', 'zones', zone_dir, 'mobs', script + '.lua')

    def mixin_kind(self, name):
        """
        (changes numbers, changes drops, changes Elements) for one mixin, including its helpers.
        """
        if name not in self.mixin_kinds:
            source = self.lua(os.path.join(self.tree, 'scripts', 'mixins', name + '.lua'))
            numbers, drops, damage, weapons, defense = False, False, False, False, False
            if source is not None:
                drops = source.item_drops
                for handler in {call.handler for call in source.calls} | {helper[0] for helper in source.helpers}:
                    part = self.handler_effects(source, handler, False)
                    numbers = numbers or bool(part.runtime)
                    damage = damage or bool(part.element_runtime)
                    weapons = weapons or bool(part.weapon_runtime)
                    defense = defense or bool(part.defense_runtime)
                    drops = drops or bool(part.scripted_drops) or part.drops_off
            self.mixin_kinds[name] = (numbers, drops, damage)
            self.mixin_weapon_flags[name] = weapons
            self.mixin_defense_flags[name] = defense
        return self.mixin_kinds[name]

    def mixin_defense(self, name):
        self.mixin_kind(name)
        return self.mixin_defense_flags[name]

    def mixin_weapons(self, name):
        self.mixin_kind(name)
        return self.mixin_weapon_flags[name]

    def mixin_aggro(self, name):
        """(changes aggro, changes links) for one mixin, counting the xi.* helpers it calls."""
        if name not in self.mixin_aggros:
            source = self.lua(os.path.join(self.tree, 'scripts', 'mixins', name + '.lua'))
            aggro, links = False, False
            if source is not None:
                for handler in {call.handler for call in source.calls} | {helper[0] for helper in source.helpers}:
                    part = self.handler_effects(source, handler, False)
                    aggro = aggro or bool(part.aggro_runtime)
                    links = links or bool(part.link_runtime)
            self.mixin_aggros[name] = (aggro, links)
        return self.mixin_aggros[name]

    def mixin_changes_job(self, name):
        """
        True when a mixin changes the job of the monster it's on, like the Trolls' automatons picking a frame,
        counting the xi.* helpers it calls.
        """
        if name not in self.mixin_jobs:
            source = self.lua(os.path.join(self.tree, 'scripts', 'mixins', name + '.lua'))
            changes = False
            if source is not None:
                for handler in {call.handler for call in source.calls} | {helper[0] for helper in source.helpers}:
                    changes = changes or bool(self.handler_effects(source, handler, False).job_changes)
            self.mixin_jobs[name] = changes
        return self.mixin_jobs[name]

    def mixin_swings(self, name):
        """
        True when one mixin can give the normal hits or the swings back, counting the xi.* helpers it calls. A TP move
        list a mixin gives, or swings it stops, never count as at spawn, since a mixin only works through listeners.
        """
        if name not in self.mixin_swing_marks:
            source = self.lua(os.path.join(self.tree, 'scripts', 'mixins', name + '.lua'))
            normal = False
            if source is not None:
                for handler in {call.handler for call in source.calls} | {helper[0] for helper in source.helpers}:
                    normal = normal or bool(self.handler_effects(source, handler, False).normal_swings)
            self.mixin_swing_marks[name] = normal
        return self.mixin_swing_marks[name]

    def handler_effects(self, source, handler, static, depth=0, ignored=()):
        """
        Effects of one handler or helper body, with its ops in order. With static false every change counts
        as runtime. Helpers named in ignored are left out, for callers that account for them another way.
        """
        effects = Effects()
        events = [(call.line_no, 'call', call) for call in source.calls if call.handler == handler]
        events += [(line, 'helper', (name, top)) for name_handler, line, name, top in source.helpers
                   if name_handler == handler]
        for _, kind, item in sorted(events, key=lambda event: event[0]):
            if kind == 'call':
                is_static = static and item.top
                result, detail = lua_source.call_effect(item, is_static, self.immunities, self.aliases)
                if item.method == 'changeJob' and item.own:
                    effects.job_changes.append('%s %s' % (source.path, item.where()))
                if item.method in lua_source.SWING_METHODS and item.own:
                    where = '%s %s' % (source.path, item.where())
                    if item.method == 'setAutoAttackEnabled':
                        if item.args != ['false']:
                            effects.normal_swings.append(where)
                        elif is_static:
                            effects.no_swings.append(where)
                    elif not lua_source.attack_list(item.args):
                        effects.normal_swings.append(where)
                    elif is_static:
                        effects.tp_moves.append(where)
                if result == 'unreadable' and known_unreadable(source.path, detail):
                    result = 'runtime'
                if result == 'op':
                    effects.ops.append(detail)
                elif result == 'runtime':
                    effects.runtime.append('%s %s' % (source.path, detail))
                    if lua_source.changes_elements(item, self.aliases):
                        effects.element_runtime.append('%s %s' % (source.path, detail))
                elif result == 'element_runtime':
                    effects.element_runtime.append('%s %s' % (source.path, detail))
                elif result == 'unreadable':
                    effects.unreadable.append('%s %s' % (source.path, detail))
                if result in ('runtime', 'unreadable', 'defense_runtime') and lua_source.changes_defense(item, self.aliases):
                    effects.defense_runtime.append('%s %s' % (source.path, detail))
                if result in ('runtime', 'element_runtime', 'weapon_runtime') and lua_source.changes_weapons(item, self.aliases):
                    effects.weapon_runtime.append('%s %s' % (source.path, detail))
                drop = lua_source.drop_effect(item, is_static)
                if drop == 'off':
                    effects.drops_off = True
                elif drop == 'changed':
                    effects.scripted_drops.append('%s %s NO_DROPS' % (source.path, item.where()))
                result, changed, detail = lua_source.aggro_effect(item, is_static)
                if result == 'op':
                    effects.aggro_ops.append(detail)
                elif result == 'runtime':
                    effects.add_aggro_runtime(changed, '%s %s' % (source.path, detail))
                elif result == 'unreadable':
                    effects.unreadable.append('%s %s' % (source.path, detail))
                continue
            name, top = item
            helper = None if name in ignored else self.helper_effects(name, depth)
            if helper is None:
                continue
            if static and top:
                effects.ops += helper.ops
                effects.runtime += helper.runtime
                effects.element_runtime += helper.element_runtime
                effects.weapon_runtime += helper.weapon_runtime
                effects.defense_runtime += helper.defense_runtime
                effects.unreadable += helper.unreadable
                effects.drops_off = effects.drops_off or helper.drops_off
                effects.aggro_ops += helper.aggro_ops
                effects.tp_moves += helper.tp_moves
                effects.no_swings += helper.no_swings
            else:
                reason = '%s calls %s in %s' % (source.path, name, handler)
                numbers, damage = split_ops(helper.ops)
                if numbers or helper.runtime or helper.unreadable:
                    effects.runtime.append(reason)
                if damage or helper.element_runtime or helper.unreadable:
                    effects.element_runtime.append(reason)
                if defense_ops(helper.ops) or helper.defense_runtime or helper.unreadable:
                    effects.defense_runtime.append(reason)
                if weapon_ops(helper.ops) or helper.weapon_runtime or helper.unreadable:
                    effects.weapon_runtime.append(reason)
                for changed, _ in helper.aggro_ops:
                    effects.add_aggro_runtime(changed, reason)
            effects.aggro_runtime += helper.aggro_runtime
            effects.link_runtime += helper.link_runtime
            effects.scripted_drops += helper.scripted_drops
            effects.job_changes += helper.job_changes
            effects.normal_swings += helper.normal_swings
        return effects

    def helper_effects(self, name, depth):
        """A helper's own body, read as if it always runs, or None when it can't be found."""
        path = self.helpers.get(name)
        if path is None or depth >= HELPER_DEPTH:
            return None
        source = self.lua(path)
        if source is None or name not in source.params:
            return None
        return self.handler_effects(source, name, True, depth + 1)

    def file_effects(self, source, static_handlers=(INIT, SPAWN), runtime_handlers=None, ignored=()):
        """
        Effects of a whole mob script. The top-level calls of static_handlers always run. The rest of the file
        counts as runtime changes, or only the handlers in runtime_handlers when that is given.
        """
        effects = Effects()
        handlers = {call.handler for call in source.calls} | {helper[0] for helper in source.helpers}
        for handler in sorted(handlers - set(static_handlers)):
            if runtime_handlers is not None and handler not in runtime_handlers:
                continue
            part = self.handler_effects(source, handler, False, ignored=ignored)
            effects.runtime += part.runtime
            effects.element_runtime += part.element_runtime
            effects.weapon_runtime += part.weapon_runtime
            effects.defense_runtime += part.defense_runtime
            effects.scripted_drops += part.scripted_drops
            # A row holds the links a monster starts with, so later link changes are left out.
            effects.aggro_runtime += part.aggro_runtime
            effects.job_changes += part.job_changes
            effects.normal_swings += part.normal_swings
        for handler in (INIT, SPAWN):
            if handler not in static_handlers:
                continue
            part = self.handler_effects(source, handler, True, ignored=ignored)
            if handler == INIT:
                effects.init_ops += part.ops
                effects.init_aggro += part.aggro_ops
            else:
                effects.spawn_ops += part.ops
                effects.spawn_aggro += part.aggro_ops
            effects.runtime += part.runtime
            effects.element_runtime += part.element_runtime
            effects.weapon_runtime += part.weapon_runtime
            effects.defense_runtime += part.defense_runtime
            effects.unreadable += part.unreadable
            effects.drops_off = effects.drops_off or part.drops_off
            effects.scripted_drops += part.scripted_drops
            effects.aggro_runtime += part.aggro_runtime
            effects.link_runtime += part.link_runtime
            effects.job_changes += part.job_changes
            effects.tp_moves += part.tp_moves
            effects.no_swings += part.no_swings
            effects.normal_swings += part.normal_swings
        effects.mixins = list(source.mixins)
        if source.item_drops:
            effects.scripted_drops.append('%s adds an ITEM_DROPS listener' % source.path)
        for mixin in source.mixins:
            numbers, drops, damage = self.mixin_kind(mixin)
            if numbers:
                effects.runtime.append('%s uses mixin %s' % (source.path, mixin))
            if drops:
                effects.scripted_drops.append('%s uses mixin %s' % (source.path, mixin))
            if damage:
                effects.element_runtime.append('%s uses mixin %s' % (source.path, mixin))
            if self.mixin_defense(mixin):
                effects.defense_runtime.append('%s uses mixin %s' % (source.path, mixin))
            if self.mixin_weapons(mixin):
                effects.weapon_runtime.append('%s uses mixin %s' % (source.path, mixin))
            if self.mixin_changes_job(mixin):
                effects.job_changes.append('%s uses mixin %s' % (source.path, mixin))
            if self.mixin_swings(mixin):
                effects.normal_swings.append('%s uses mixin %s' % (source.path, mixin))
        return effects

    def mob_effects(self, zone_dir, script, ignored_helpers=()):
        """Effects of scripts/zones/<zone_dir>/mobs/<script>.lua, or empty effects when it has no file."""
        source = self.lua(self.mob_script_path(zone_dir, script))
        if source is None:
            return Effects()
        return self.file_effects(source, ignored=ignored_helpers)
