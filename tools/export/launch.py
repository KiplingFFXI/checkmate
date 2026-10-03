"""
The extra launch-day monsters from modules/phoenix/lua/custom/pxi_launch_names.lua.

Each starter zone has 200 extra spawns. The first kind uses indexes 824-923 and the second 924-1023. The module
renames them on spawn and turns their drops off until the credited killer earns combat EXP.
"""
import os
import re

from . import overlays

MODULE = os.path.join('modules', 'phoenix', 'lua', 'custom', 'pxi_launch_names.lua')

# The first extra's index, and how many indexes each kind gets. The module works them out as 824 + (index - 1) * 100.
FIRST_INDEX = 824
PER_KIND = 100


def load(tree):
    """{(zone script folder, script name): (first index, last index, shown name)}, or {} when the module is off."""
    path = os.path.join(tree, MODULE)
    module = MODULE.replace(os.sep, '/')
    loaded = any(module.startswith('modules/%s/' % entry) for entry in overlays.init_entries(tree))
    if not os.path.exists(path) or not loaded:
        return {}
    text = open(path, encoding='utf-8').read()
    if '824 + (index - 1) * 100' not in text:
        raise RuntimeError('%s changed its index layout. The launch reader needs updating.' % MODULE)
    extras = {}
    for zone, mobs in re.findall(r"name\s*=\s*'(\w+)',\s*mobs\s*=(.*)$", text, re.M):
        for number, (script, shown) in enumerate(re.findall(r"\{\s*'(\w+)',\s*'([^']+)'\s*\}", mobs)):
            first = FIRST_INDEX + number * PER_KIND
            extras[(zone, script)] = (first, first + PER_KIND - 1, shown)
    if not extras:
        raise RuntimeError('%s did not read as expected. The launch reader needs updating.' % MODULE)
    return extras
