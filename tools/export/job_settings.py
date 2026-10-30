"""Treasure Hunter trait values and equipment bonuses used by Automatic mode."""
import hashlib
from pathlib import Path
import re

from . import aggro, lua_source, modifiers, overlays, tables

SOURCE_GUARD = '3848ab05c4b0e09aa50156fdb32776e7ac12a49a5054246992eb4e3ebf406cd0'
PATHS = (('src/map/utils/battleutils.cpp', 'int32 GetScaledItemModifier('),)


def function_body(text, signature):
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    if text.count(signature) != 1:
        raise RuntimeError('Automatic Treasure Hunter cannot locate ' + signature)
    start = text.index(signature)
    opening = text.index('{', start)
    depth = 1
    for index in range(opening + 1, len(text)):
        if text[index] == '{':
            depth += 1
        elif text[index] == '}':
            depth -= 1
            if depth == 0:
                return ' '.join(text[start:index + 1].split())
    raise RuntimeError('Automatic Treasure Hunter found an incomplete source function.')


def source_digest(tree):
    root = Path(tree)
    paths = []
    direct = re.compile(r'\bTREASURE_HUNTER\b|(?:addMod|setMod|delMod)\(\s*303\b|\bGetScaledItemModifier\b')
    chunks = [relative + '\n' + function_body((root / relative).read_text(encoding='utf8'), signature)
              for relative, signature in PATHS]
    for relative in aggro.lua_files_loaded(str(tree)):
        text = lua_source.strip_comments((root / relative).read_text(encoding='utf8'))
        if direct.search(text):
            paths.append(relative)
    for entry in overlays.init_entries(str(tree)):
        path = root / 'modules' / entry
        if path.is_file() and path.suffix in ('.cpp', '.h'):
            paths.append(path.relative_to(root).as_posix())
        elif path.is_dir():
            paths.extend(sorted(p.relative_to(root).as_posix() for p in path.rglob('*') if p.suffix in ('.cpp', '.h')))
    for path in sorted((root / 'scripts').rglob('*.lua'), key=lambda p: p.relative_to(root).as_posix()):
        if '/enum/' not in path.as_posix() and direct.search(lua_source.strip_comments(path.read_text(encoding='utf8'))):
            paths.append(path.relative_to(root).as_posix())
    for relative in paths:
        text = (root / relative).read_text(encoding='utf8')
        text = lua_source.strip_comments(text) if relative.endswith('.lua') else re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
        if direct.search(text):
            chunks.append(relative + '\n' + ' '.join(text.split()))
    return hashlib.sha256('\n'.join(chunks).encode()).hexdigest()


def traits(tree, allowed, number):
    found = {}
    for table in ('traits', 'blue_traits'):
        for row in modifiers.sql_rows(tree, table):
            if row['modifier'] != number or row['value'] == 0:
                continue
            if table == 'traits' and (row['level'] > 75 or not allowed.allows(row['content_tag'])):
                continue
            if table == 'blue_traits' and row['job_points_only']:
                continue
            previous = found.setdefault(row['traitid'], row['value'])
            if previous != row['value']:
                raise RuntimeError('Treasure Hunter trait %d has multiple values that the client trait bit cannot distinguish.' % row['traitid'])
    if not found:
        raise RuntimeError('Treasure Hunter has no enabled client traits.')
    return found


def equipment(tree, number):
    equipped = {row['itemId']: row for row in modifiers.sql_rows(tree, 'item_equipment')}
    found, conditional = {}, {}
    for table in ('item_mods', 'item_latents'):
        for row in modifiers.sql_rows(tree, table):
            if row['modId'] != number or row['value'] == 0:
                continue
            item = equipped.get(row['itemId'])
            if item is None:
                raise RuntimeError('Treasure Hunter item %d has no equipment level.' % row['itemId'])
            if table == 'item_latents':
                conditional[row['itemId']] = item['level']
            elif row['itemId'] in found:
                raise RuntimeError('Duplicate Treasure Hunter modifier on item %d.' % row['itemId'])
            else:
                found[row['itemId']] = {'level': item['level'], 'value': row['value']}
    return found, conditional


def build(tree, allowed):
    if source_digest(tree) != SOURCE_GUARD:
        raise RuntimeError('Automatic Treasure Hunter source changed; review traits, equipment and conditional bonuses.')
    number = tables.read_enum(str(tree), 'mod')['treasure_hunter']
    items, conditional = equipment(tree, number)
    return {'maximum': 4, 'learning_job': 16, 'traits': traits(tree, allowed, number),
            'items': items, 'conditional_items': conditional}


def write(path, data, stamp):
    text = '-- Current job traits and equipped Treasure Hunter bonuses.\n' \
           '-- Built from ' + stamp.built + '. Conditional bonuses need a manual value.\n' \
           'return ' + modifiers.lua(dict(data, built=stamp.built, content=stamp.content)) + ';\n'
    Path(path).write_text(text, encoding='ascii', newline='\n')
    return text
