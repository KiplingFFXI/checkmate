"""
Item mods and item levels from item_mods.sql and item_equipment.sql, which the pet, steal and crit readers share.

Gear only adds its mods once your main level reaches its own level (battleutils.cpp GetScaledItemModifier), so each
reader needs both.
"""
import os
import re

from . import sqlfile

# One item_mods row. A few lines have spaces around the values.
ITEM_MOD = re.compile(r'^INSERT INTO `item_mods` VALUES \(\s*(\d+)\s*,\s*(\d+)\s*,\s*(-?\d+)\s*\);')


def mod_values(tree, mod_id):
    """{item id: value} of every item with that mod. It stops on any item_mods INSERT line it can't read."""
    found = {}
    with open(os.path.join(tree, 'sql', 'item_mods.sql'), encoding='utf-8', errors='replace') as source_file:
        for line in source_file:
            if not line.startswith('INSERT'):
                continue
            match = ITEM_MOD.match(line)
            if match is None:
                raise RuntimeError('The item reader can\'t read this item_mods line: %s' % line.strip())
            if int(match.group(2)) == mod_id:
                found[int(match.group(1))] = int(match.group(3))
    return found


def levels(tree, item_ids, what):
    """{item id: its own level} from item_equipment for each of item_ids. It stops if one of them has no row there."""
    found = {row['itemId']: row['level'] for row in sqlfile.rows(os.path.join(tree, 'sql', 'item_equipment.sql'),
                                                                 'item_equipment') if row['itemId'] in item_ids}
    missing = sorted(set(item_ids) - set(found))
    if missing:
        raise RuntimeError('item_equipment has no level for the %s items %s. The item reader needs updating.'
                           % (what, ', '.join(str(item) for item in missing)))
    return found
