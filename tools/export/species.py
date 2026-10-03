"""
The monster attribute chain runs ecosystem, family, species (data/ecosystems.yaml), then the zone template, then
the spawn.

Each layer overrides its parent field by field (mob_attributes/dataset.cpp applyOverrides). Stat ranks and
jobs replace. Resistance ranks, magic damage, mods and mob mods merge key by key, and a key a child sets replaces
the parent's value. immune_status, detects and the behavior flags replace the whole list. aggressive, links and
true_detection each replace.
"""
from . import overlays
from .lua_source import ELEMENTS
from .tables import RANKS

STAT_KEYS = ['str', 'dex', 'vit', 'agi', 'int', 'mnd', 'chr', 'def', 'eva', 'att', 'acc']

# The YAML resist blocks that set a <name>_res_rank mod (convertResists).
RANK_BLOCKS = ('rank_element', 'rank_status')

# The dmg_magic keys and the mods they set (convertResists). all is on top of every element.
MAGIC_DAMAGE_KEYS = dict({'all': 'udmgmagic'}, **{element: element + '_sdt' for element in ELEMENTS})


# The behaviors switches that each replace the parent's value. They default to false (dataset.h).
BEHAVIOR_SWITCHES = ('aggressive', 'links', 'true_detection')


def names(value):
    """A YAML name or list of names as a list."""
    if value is None:
        return []
    return [str(value)] if isinstance(value, str) else [str(item) for item in value]


def new_attributes():
    """StatRanksData defaults are C for every stat except attack and accuracy, which are A."""
    stats = {key: RANKS['c'] for key in STAT_KEYS}
    stats['att'] = RANKS['a']
    stats['acc'] = RANKS['a']
    out = {'stats': stats, 'jobs': None, 'resists': {}, 'mods': {}, 'immune': None, 'entity_flags': None,
           'detects': [], 'behavior_flags': [], 'mob_mods': {}, 'animation_sub': 0}
    for key in BEHAVIOR_SWITCHES:
        out[key] = False
    return out


def apply(attributes, source):
    """Returns a copy of attributes with one YAML attributes block laid over it."""
    # Copy the dicts that get changed key by key below, so the parent layer keeps its own.
    out = dict(attributes)
    for key in ('stats', 'resists', 'mods', 'mob_mods'):
        out[key] = dict(attributes[key])
    if not source:
        return out
    for key, value in (source.get('stats') or {}).items():
        if key in out['stats']:
            out['stats'][key] = RANKS[str(value).lower()]
    if source.get('jobs'):
        out['jobs'] = (str(source['jobs'][0]).lower(), str(source['jobs'][1]).lower())
    resists = source.get('resists') or {}
    for block in RANK_BLOCKS:
        for key, value in (resists.get(block) or {}).items():
            out['resists'][key + '_res_rank'] = int(value)
    for key, value in (resists.get('dmg_magic') or {}).items():
        out['resists'][MAGIC_DAMAGE_KEYS[key]] = int(value)
    if 'immune_status' in resists:
        out['immune'] = [str(name) for name in (resists['immune_status'] or [])]
    for key, value in (source.get('mods') or {}).items():
        out['mods'][str(key).lower()] = int(value)
    render = source.get('render') or {}
    if 'entity_flags' in render:
        out['entity_flags'] = int(render['entity_flags'])
    if 'animation_sub' in render:
        out['animation_sub'] = int(render['animation_sub'])
    if 'detects' in source:
        out['detects'] = names(source['detects'])
    behaviors = source.get('behaviors') or {}
    for key in BEHAVIOR_SWITCHES:
        if behaviors.get(key) is not None:
            out[key] = bool(behaviors[key])
    if 'flags' in behaviors:
        out['behavior_flags'] = names(behaviors['flags'])
    for key, value in (source.get('mob_mods') or {}).items():
        out['mob_mods'][str(key).lower()] = int(value)
    return out


class Species:
    def __init__(self, number, ecosystem, family, attributes):
        self.id = number
        self.ecosystem = ecosystem
        # The family number, which decides who links with whom (m_Family).
        self.family = family
        self.attributes = attributes


def load(tree, roots):
    """Every species by name and by id, with its whole ecosystem and family chain applied."""
    document = overlays.load_merged(tree, roots, 'ecosystems')
    by_name, by_id = {}, {}
    for eco_name, eco in document['ecosystems'].items():
        eco_attrs = apply(new_attributes(), eco.get('attributes'))
        for family_name, family in (eco.get('families') or {}).items():
            family_attrs = apply(eco_attrs, family.get('attributes'))
            for name, entry in (family.get('species') or {}).items():
                entry = entry or {}
                species = Species(int(entry['id']), eco_name, int(family['id']),
                                  apply(family_attrs, entry.get('attributes')))
                by_name[name] = species
                by_id[species.id] = species
    return by_name, by_id
