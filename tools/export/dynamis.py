"""
Dynamis as Phoenix runs it, from modules/phoenix/dynamis/lua/dynamis_overrides.lua.

Every placed Dynamis monster is named in the override file's mobNames table with a type. The override swaps the
base script's handlers for the type's handlers. It runs the base handler first (super) only for the events
baseScriptMobs marks 'original'. specialMobHooks add xi.dynamis functions after the type's handler. So the base
script counts only for its kept events, and the type's xi.dynamis helpers count for the rest.
"""
from pathlib import Path
import os
import re

from . import lua_source
from . import mobscripts

OVERRIDES = os.path.join('modules', 'phoenix', 'dynamis', 'lua', 'dynamis_overrides.lua')

# Hooks that turn a dragon's drops off only while despawning it after the megaboss dies. No kill follows.
DESPAWN_HOOKS = {'xi.dynamis.onFightDragon', 'xi.dynamis.onRoamDragon'}

# When the zone loads, a master-type monster makes the next monster by id its pet.
MASTER = 'MASTER'
MASTER_PET = 'xi.pet.setMobPet(mob, 1, pet:getName())'


def table_after(text, marker, where):
    at = text.find(marker)
    if at < 0:
        raise RuntimeError('%s no longer has %s. The Dynamis reader needs updating.' % (OVERRIDES, marker))
    return lua_source.block(text, at, where)


class Dynamis:
    def __init__(self, tree):
        text = lua_source.strip_comments(Path(os.path.join(tree, OVERRIDES)).read_text(encoding='utf-8'))
        self.events = re.findall(r"'(\w+)'", table_after(text, 'local mobOverrideOrder =', 'mobOverrideOrder'))
        self.zone_dirs = re.findall(r"\{\s*xi\.zone\.DYNAMIS_\w+,\s*'([\w-]+)',\s*\d+\s*\}",
                                    table_after(text, 'local dynamisZones =', 'dynamisZones'))
        self.types = self.read_mob_names(table_after(text, 'local mobNames =', 'mobNames'))
        self.kept = self.read_kept(table_after(text, 'local baseScriptMobs =', 'baseScriptMobs'))
        self.hooks = self.read_hooks(table_after(text, 'local specialMobHooks =', 'specialMobHooks'))
        self.handlers = self.read_handlers(table_after(text, 'local mobOverrideHandlers =', 'handlers'))
        self.read_spawn_handlers(text)
        if not self.zone_dirs or not self.types or not self.handlers or not self.events or MASTER_PET not in text:
            raise RuntimeError('%s did not read as expected. The Dynamis reader needs updating.' % OVERRIDES)

    @staticmethod
    def read_mob_names(body):
        types = {}
        for zone, zone_body in re.findall(r"\['([\w-]+)'\]\s*=\s*\{(.*?)\n    \}", body, re.S):
            for name, kind in re.findall(r"\{\s*'(\w+)',\s*mobType\.(\w+)\s*,\s*\d+\s*\}", zone_body):
                types[(zone, name)] = kind
        return types

    @staticmethod
    def read_kept(body):
        kept = {}
        for zone, zone_body in re.findall(r"\['([\w-]+)'\]\s*=\s*\{(.*?)\n    \}", body, re.S):
            for name, mode in re.findall(r"^\s*(\w+)\s*=\s*('original'|'only'|\{[^}]*\})", zone_body, re.M):
                if mode == "'original'":
                    kept[(zone, name)] = {'all'}
                elif mode == "'only'":
                    raise RuntimeError('%s marks %s base-script only. The Dynamis reader needs updating.'
                                       % (OVERRIDES, name))
                else:
                    kept[(zone, name)] = set(re.findall(r"(\w+)\s*=\s*'original'", mode))
        return kept

    @staticmethod
    def read_hooks(body):
        hooks = {}
        for zone, zone_body in re.findall(r"\['([\w-]+)'\]\s*=\s*\{(.*?)\n    \}", body, re.S):
            for name, mob_body in re.findall(r'^\s*(\w+)\s*=\s*\{([^}]*)\}', zone_body, re.M):
                for event, function in re.findall(r"(\w+)\s*=\s*'(\w+)'", mob_body):
                    hooks.setdefault((zone, name), {})[event] = 'xi.dynamis.' + function
        return hooks

    @staticmethod
    def read_handlers(body):
        """{type: {event: [helper names]}} from mobOverrideHandlers."""
        handlers = {}
        parts = re.split(r'\[mobType\.(\w+)\]\s*=', body)
        for index in range(1, len(parts), 2):
            kind, kind_body = parts[index], parts[index + 1]
            events = {}
            for event, event_body in re.findall(r'(\w+)\s*=\s*function\s*\([^)]*\)(.*?)\n\s*end,', kind_body, re.S):
                events[event] = re.findall(r'(xi\.[\w.]+)\(mob', event_body)
            for event in re.findall(r'(\w+)\s*=\s*noMobDespawn', kind_body):
                events[event] = []
            handlers[kind] = events
        return handlers

    def read_spawn_handlers(self, text):
        """The onMobSpawn closures registerMobOverrides builds for each type."""
        body = text[text.index('local function registerMobOverrides'):]
        body = body[:body.index('local spawnHandler = handler')]
        branches = re.findall(r'(if|elseif|else)\s*(?:overrideMobType == mobType\.(\w+)\s*then)?\s*'
                              r'handler = function\(mob\)(.*?)\n\s*end', body, re.S)
        default = None
        for keyword, kind, branch in branches:
            helpers = re.findall(r'(xi\.[\w.]+)\(mob', branch)
            if keyword == 'else':
                default = helpers
            else:
                self.handlers.setdefault(kind, {})['onMobSpawn'] = helpers
        if default is None:
            raise RuntimeError('%s onMobSpawn closures did not read as expected.' % OVERRIDES)
        for kind in self.handlers:
            self.handlers[kind].setdefault('onMobSpawn', default)

    def mob_type(self, zone_dir, script):
        kind = self.types.get((zone_dir, script))
        if kind is None:
            raise RuntimeError('Dynamis mob %s in %s is not in the mobNames table.' % (script, zone_dir))
        return kind

    def keeps(self, zone_dir, script, event):
        """Whether the base script's handler for event still runs."""
        kept = self.kept.get((zone_dir, script), set())
        return 'all' in kept or event in kept

    def effects(self, index, zone_dir, script):
        """What the base script's kept events, the type's handlers and any hooks do to one Dynamis mob."""
        kind = self.mob_type(zone_dir, script)
        path = index.mob_script_path(zone_dir, script)
        source = index.lua(path)
        if source is None:
            raise RuntimeError('Dynamis mob %s in %s has no script file, so Phoenix can\'t override it.'
                               % (script, zone_dir))
        kept = self.kept.get((zone_dir, script), set())
        if 'all' in kept:
            kept = set(self.events)
        static = [event for event in (mobscripts.INIT, mobscripts.SPAWN) if event in kept]
        effects = index.file_effects(source, static_handlers=static, runtime_handlers=kept - set(static))
        hooks = self.hooks.get((zone_dir, script), {})
        for event in self.events:
            helpers = list(self.handlers[kind].get(event, []))
            if event in hooks:
                helpers.append(hooks[event])
            for name in helpers:
                helper = index.helper_effects(name, 0)
                if helper is None:
                    continue
                if event == mobscripts.INIT:
                    effects.init_ops += helper.ops
                    effects.init_aggro += helper.aggro_ops
                    effects.unreadable += helper.unreadable
                    effects.link_runtime += helper.link_runtime
                    effects.tp_moves += helper.tp_moves
                    effects.no_swings += helper.no_swings
                elif event == mobscripts.SPAWN:
                    effects.spawn_ops += helper.ops
                    effects.spawn_aggro += helper.aggro_ops
                    effects.unreadable += helper.unreadable
                    effects.link_runtime += helper.link_runtime
                    effects.tp_moves += helper.tp_moves
                    effects.no_swings += helper.no_swings
                else:
                    numbers, damage = mobscripts.split_ops(helper.ops)
                    if numbers or helper.unreadable:
                        effects.runtime.append('%s %s runs %s' % (script, event, name))
                    if damage or helper.unreadable:
                        effects.element_runtime.append('%s %s runs %s' % (script, event, name))
                    if mobscripts.defense_ops(helper.ops) or helper.unreadable:
                        effects.defense_runtime.append('%s %s runs %s' % (script, event, name))
                    if mobscripts.weapon_ops(helper.ops) or helper.unreadable:
                        effects.weapon_runtime.append('%s %s runs %s' % (script, event, name))
                    if any(changed in lua_source.AGGRO_NAMES for changed, _ in helper.aggro_ops):
                        effects.aggro_runtime.append('%s %s runs %s' % (script, event, name))
                effects.runtime += helper.runtime
                effects.job_changes += helper.job_changes
                effects.normal_swings += helper.normal_swings
                effects.element_runtime += helper.element_runtime
                effects.weapon_runtime += helper.weapon_runtime
                effects.defense_runtime += helper.defense_runtime
                effects.aggro_runtime += helper.aggro_runtime
                if name not in DESPAWN_HOOKS:
                    effects.scripted_drops += helper.scripted_drops
        return effects
