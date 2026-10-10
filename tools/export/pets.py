"""
The pet data in data\\pets.lua: each jug pet's highest level, the names of a summoner's avatars and spirits, the gear
that narrows a jug pet's level, and the Beast Affinity merit.

A jug pet comes out 0 to 2 levels under the lower of its highest level plus Beast Affinity and your main level, and
gear with JUG_LEVEL_RANGE takes levels off that spread (petutils.cpp CalculateJugPetStats). Beast Affinity only
counts with BST as your main job at 75 or higher. LoadPet in petutils.cpp tells an avatar from a jug pet by its
petid. Each reader stops the export when the server stops looking the way it expects, so the weekly job catches it.
"""
from pathlib import Path
import os
import re

from . import items
from . import overlays
from . import sqlfile
from . import tables

# LoadPet's test for an avatar or spirit. Every other pet_list row with a time is a jug pet.
AVATAR_TEST = 'PetID <= PETID_CAIT_SITH || PetID == PETID_SIREN'

# Monster Gloves, the era gloves with JUG_LEVEL_RANGE. If they're gone, the reader is reading the wrong thing.
MONSTER_GLOVES = 15110


def pet_rows(tree):
    return sqlfile.rows(os.path.join(tree, 'sql', 'pet_list.sql'), 'pet_list')


def jugs(tree):
    """{name: highest level} of the jug pets, which are the pet_list rows with a time, by the name the game shows."""
    found = {}
    for row in pet_rows(tree):
        if row['time'] <= 0:
            continue
        if row['name'] in found:
            raise RuntimeError('pet_list has two jug pets named %s' % row['name'])
        found[row['name']] = row['maxLevel']
    if not found:
        raise RuntimeError('pet_list has no jug pets. The pet reader needs updating.')
    return found


def avatars(tree):
    """The sorted names of a summoner's avatars and spirits, the pet_list rows LoadPet types as an avatar."""
    utils = os.path.join(tree, 'src', 'map', 'utils')
    header = Path(os.path.join(utils, 'petutils.h')).read_text(encoding='utf-8', errors='replace')
    ids = {}
    for name in ('PETID_CAIT_SITH', 'PETID_SIREN'):
        match = re.search(r'\b%s\s*=\s*(\d+)' % name, header)
        if match is None:
            raise RuntimeError('petutils.h has no %s, which the pet reader needs to find the avatars.' % name)
        ids[name] = int(match.group(1))
    source = Path(os.path.join(utils, 'petutils.cpp')).read_text(encoding='utf-8', errors='replace')
    if AVATAR_TEST not in source:
        raise RuntimeError('petutils.cpp no longer picks avatars with %s. The pet reader needs updating.'
                           % AVATAR_TEST)
    names = sorted(row['name'] for row in pet_rows(tree)
                   if row['petid'] <= ids['PETID_CAIT_SITH'] or row['petid'] == ids['PETID_SIREN'])
    both = sorted(set(names) & set(jugs(tree)))
    if both:
        raise RuntimeError('These avatar names are jug pet names too: %s' % ', '.join(both))
    return names


def jug_range_items(tree):
    """
    {item id: (value, level)} of the items with JUG_LEVEL_RANGE, which narrows how far under its top a jug pet can be.
    An item only counts at its own level or higher (battleutils.cpp GetScaledItemModifier).
    """
    found = items.mod_values(tree, tables.read_enum(tree, 'mod')['jug_level_range'])
    if MONSTER_GLOVES not in found:
        raise RuntimeError('item_mods has no JUG_LEVEL_RANGE on Monster Gloves (%d). The pet reader needs updating.'
                           % MONSTER_GLOVES)
    levels = items.levels(tree, found, 'JUG_LEVEL_RANGE')
    return {item: (found[item], levels[item]) for item in found}


def beast_affinity(tree, roots):
    """
    {id, per_merit, most} for Beast Affinity, from data/merits.yaml with the module overlays merged in. most is the
    fewer of what its cost list prices (or its own cap) and what its category allows in all.
    """
    merits = overlays.load_merged(tree, roots, 'merits').get('merits') or {}
    category = (merits.get('categories') or {}).get('bst_group_2') or {}
    merit = (category.get('merits') or {}).get('beast_affinity') or {}
    costs = (merits.get('upgrade_costs') or {}).get(merit.get('upgrade_cost'))
    if not merit.get('id') or not merit.get('value') or not costs or not category.get('max_upgrades'):
        raise RuntimeError('data/merits.yaml has no Beast Affinity with an id, value, cost list and category cap. '
                           'The pet reader needs updating.')
    most = min(merit.get('max_upgrades') or len(costs), category['max_upgrades'])
    return {'id': int(merit['id']), 'per_merit': int(merit['value']), 'most': int(most)}
