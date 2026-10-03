"""
Monster loot from a zone template's loot block, the way zoneutils.cpp buildDropList and the kill roll in
mob_entity.cpp use it.

Each roll is independent. A named chance resolves through data/enums/drop_rate.yaml and a number is a percent,
stored as per-mille. A one_of list gives each member weight 1. A one_of map gives each member its percent in
basis points. Despoil entries sit in the same list with their weight as the rate. The kill roll never checks
the drop type, so a nonzero despoil weight is one more kill roll. Steal entries have rate 0 and never drop.
"""
import os
import re

# Item names in YAML resolve to item_basic ids. 'nothing' is id 0, which drops nothing.
NOTHING = 'nothing'


def item_ids(tree):
    """{item_basic name: id}. Two items with one name resolve to the lower id (xi::items::lookupIdByName)."""
    ids = {NOTHING: 0}
    row = re.compile(r"^INSERT INTO `item_basic` VALUES \((\d+),\d+,'((?:[^'\\]|\\.)*)'")
    for line in open(os.path.join(tree, 'sql', 'item_basic.sql'), encoding='utf-8', errors='replace'):
        match = row.match(line)
        if match:
            number, name = int(match.group(1)), match.group(2).replace("\\'", "'")
            if name not in ids or number < ids[name]:
                ids[name] = number
    return ids


def per_mille(chance, rates, where):
    if isinstance(chance, str):
        if chance not in rates:
            raise RuntimeError('%s uses unknown drop rate %s' % (where, chance))
        return rates[chance]
    if not 0 <= float(chance) <= 100:
        raise RuntimeError('%s has a loot chance of %s%%, outside 0-100' % (where, chance))
    return int(round(float(chance) * 10))


def lookup(ids, name, where):
    if name not in ids:
        raise RuntimeError('%s names unknown item %s' % (where, name))
    return ids[name]


def rolls(loot, ids, rates, where):
    """
    The kill rolls of one loot block. A single roll is {'rate': per-mille, 'item': id, 'name': item name}.
    A group is {'rate': per-mille, 'group': [(id, weight, name), ...]}.
    """
    out = []
    for roll in (loot or {}).get('drops') or []:
        rate = per_mille(roll.get('chance'), rates, where)
        if ('item' in roll) == ('one_of' in roll):
            raise RuntimeError('%s has a roll that names both or neither of item and one_of' % where)
        if 'item' in roll:
            if roll['item'] != NOTHING:
                out.append({'rate': rate, 'item': lookup(ids, roll['item'], where), 'name': roll['item']})
            continue
        members = roll['one_of']
        if isinstance(members, list):
            group = [(lookup(ids, name, where), 1, name) for name in members]
        else:
            group = [(lookup(ids, name, where), int(round(float(share) * 100)), name)
                     for name, share in members.items()]
            if sum(weight for _, weight, _ in group) != 10000:
                raise RuntimeError('%s has one_of shares that do not total 100' % where)
        out.append({'rate': rate, 'group': group})
    for name, weight in sorted(((loot or {}).get('despoil') or {}).items()):
        if int(weight) > 0:
            out.append({'rate': int(weight), 'item': lookup(ids, name, where), 'name': name, 'despoil': True})
    return out
