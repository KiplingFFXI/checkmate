"""
What a monster's Lua does to its numbers, immunities and drops.

onMobInitialize runs once when the zone loads and its mods are saved. onMobSpawn runs after the spawn math on
every spawn. A literal call at the top of either handler is applied in source order, and so is the top of any
xi.* helper they call with the monster. Everything else that touches a number marks the monster as changing at
runtime.
"""
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
        # Magic damage changes that don't always run.
        self.element_runtime = []
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

    def add_aggro_runtime(self, name, reason):
        """Files a change that doesn't always run under aggro_runtime or link_runtime, by the name it changes."""
        if name in lua_source.AGGRO_NAMES:
            self.aggro_runtime.append(reason)
        else:
            self.link_runtime.append(reason)


def known_unreadable(path, detail):
    return any(path.endswith(end) and call in detail for end, call in KNOWN_UNREADABLE)


def split_ops(ops):
    """(ops on numbers, ranks and immunities, ops on magic damage mods)."""
    damage = [op for op in ops if op[1] in lua_source.ELEMENT_DAMAGE_MODS]
    return [op for op in ops if op not in damage], damage


class ScriptIndex:
    """Reads mob scripts, mixins and xi.* helpers once each and works out their effects."""

    def __init__(self, tree, immunities, aliases):
        self.tree = tree
        self.immunities = immunities
        self.aliases = aliases
        self.files = {}
        self.helpers = self.index_helpers()
        self.mixin_kinds = {}
        self.mixin_aggros = {}

    def index_helpers(self):
        """Where each xi.* function in scripts/globals and scripts/mixins is defined."""
        index = {}
        pattern = re.compile(r'^(?:(xi\.[\w.]+)\s*=\s*function\b|function\s+(xi\.[\w.]+)\s*\()', re.M)
        for folder in ('globals', 'mixins'):
            for path in glob.glob(os.path.join(self.tree, 'scripts', folder, '**', '*.lua'), recursive=True):
                text = open(path, encoding='utf-8', errors='replace').read()
                for assigned, declared in pattern.findall(text):
                    index.setdefault(assigned or declared, path)
        return index

    def lua(self, path):
        """The parsed Lua file at path, named by its path inside the tree, or None when it doesn't exist."""
        if path not in self.files:
            source = None
            if os.path.exists(path):
                name = os.path.relpath(path, self.tree).replace(os.sep, '/')
                source = lua_source.LuaFile(name, open(path, encoding='utf-8', errors='replace').read())
            self.files[path] = source
        return self.files[path]

    def mob_script_path(self, zone_dir, script):
        return os.path.join(self.tree, 'scripts', 'zones', zone_dir, 'mobs', script + '.lua')

    def mixin_kind(self, name):
        """
        (changes numbers, changes drops, changes magic damage) for one mixin. Everything a mixin does happens in
        listeners.
        """
        if name not in self.mixin_kinds:
            source = self.lua(os.path.join(self.tree, 'scripts', 'mixins', name + '.lua'))
            numbers, drops, damage = False, False, False
            if source is not None:
                drops = source.item_drops
                for call in source.calls:
                    kind, _ = lua_source.call_effect(call, False, self.immunities, self.aliases)
                    numbers = numbers or kind == 'runtime'
                    damage = damage or kind == 'element_runtime'
                    drops = drops or lua_source.drop_effect(call, False) is not None
            self.mixin_kinds[name] = (numbers, drops, damage)
        return self.mixin_kinds[name]

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
                if result == 'unreadable' and known_unreadable(source.path, detail):
                    result = 'runtime'
                if result == 'op':
                    effects.ops.append(detail)
                elif result == 'runtime':
                    effects.runtime.append('%s %s' % (source.path, detail))
                elif result == 'element_runtime':
                    effects.element_runtime.append('%s %s' % (source.path, detail))
                elif result == 'unreadable':
                    effects.unreadable.append('%s %s' % (source.path, detail))
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
                effects.unreadable += helper.unreadable
                effects.drops_off = effects.drops_off or helper.drops_off
                effects.aggro_ops += helper.aggro_ops
            else:
                reason = '%s calls %s in %s' % (source.path, name, handler)
                numbers, damage = split_ops(helper.ops)
                if numbers or helper.runtime or helper.unreadable:
                    effects.runtime.append(reason)
                if damage or helper.element_runtime:
                    effects.element_runtime.append(reason)
                for changed, _ in helper.aggro_ops:
                    effects.add_aggro_runtime(changed, reason)
            effects.aggro_runtime += helper.aggro_runtime
            effects.link_runtime += helper.link_runtime
            effects.scripted_drops += helper.scripted_drops
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
            effects.scripted_drops += part.scripted_drops
            # A row holds the links a monster starts with, so later link changes are left out.
            effects.aggro_runtime += part.aggro_runtime
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
            effects.unreadable += part.unreadable
            effects.drops_off = effects.drops_off or part.drops_off
            effects.scripted_drops += part.scripted_drops
            effects.aggro_runtime += part.aggro_runtime
            effects.link_runtime += part.link_runtime
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
        return effects

    def mob_effects(self, zone_dir, script, ignored_helpers=()):
        """Effects of scripts/zones/<zone_dir>/mobs/<script>.lua, or empty effects when it has no file."""
        source = self.lua(self.mob_script_path(zone_dir, script))
        if source is None:
            return Effects()
        return self.file_effects(source, ignored=ignored_helpers)
