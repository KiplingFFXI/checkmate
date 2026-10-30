"""The merits used by Checkmate, with the loaded Phoenix caps and bonuses."""
from pathlib import Path
import hashlib
import re

from . import lua_writer, overlays, tables


NATIVE_PATHS = ('src/map/merit.cpp', 'src/map/utils/charutils.cpp',
                'src/map/packets/s2c/0x062_clistatus2.cpp')
SOURCE_GUARD = 'ae21105a666c9d8816e79f69e2b40963ea7507a58c64f79e385c31fe69da223b'

WEAPONS = ('hand_to_hand', 'dagger', 'sword', 'great_sword', 'axe', 'great_axe',
           'scythe', 'polearm', 'katana', 'great_katana', 'club', 'staff',
           'archery', 'marksmanship', 'throwing')
MAGIC = ('divine_magic', 'healing_magic', 'enfeebling_magic', 'elemental_magic',
         'dark_magic', 'ninjutsu', 'singing', 'wind_instrument', 'blue_magic')
ATTRIBUTES = ('str', 'dex', 'agi', 'int', 'mnd', 'chr')
DIRECT = {
    'crit_hit_rate': ('others', 'Critical Hit Rate'),
    'enemy_crit_rate': ('others', 'Enemy Critical Hit Rate'),
    'magical_accuracy': ('blu_group_1', 'Magical Accuracy'),
    'troubadour': ('brd_group_2', 'Troubadour'),
    'dia_iii': ('rdm_group_2', 'Dia III'),
    'bio_iii': ('rdm_group_2', 'Bio III'),
    'angon': ('drg_group_2', 'Angon'),
    'beast_affinity': ('bst_group_2', 'Beast Affinity'),
}
for _element in ('fire', 'ice', 'wind', 'earth', 'lightning', 'water'):
    DIRECT[_element + '_magic_accuracy'] = ('rdm_group_1', _element.title() + ' Magic Accuracy')

CONDITIONS = {
    'troubadour': ['Applies to singing while Troubadour is active. The source converts its merit value to accuracy.'],
    'dia_iii': ['Changes the estimated duration of your Dia III.'],
    'bio_iii': ['Changes the estimated duration of your Bio III.'],
    'angon': ['Changes the estimated duration of your Angon.'],
    'beast_affinity': ['Changes the level cap of a jug pet summoned with these merits.'],
}
PARAMETER_NOTE = 'Already included in server stat readings. Changing this rank does not replace those readings.'


def source_digest(tree):
    """Guard the native level rules and the skills sent to the client."""
    root = Path(tree)
    paths = set(NATIVE_PATHS)
    entries = overlays.init_entries(str(root))
    for entry in entries:
        folder = root / 'modules' / entry
        if folder.is_file() and folder.suffix in ('.cpp', '.h'):
            paths.add(folder.relative_to(root).as_posix())
        elif folder.is_dir():
            paths.update(path.relative_to(root).as_posix() for suffix in ('*.cpp', '*.h')
                         for path in folder.rglob(suffix))
    chunks = ['\n'.join(entries)]
    for relative in sorted(paths):
        path = root / relative
        if not path.is_file():
            raise RuntimeError('Merit verification needs ' + relative + '; extract this source again.')
        text = re.sub(r'/\*.*?\*/|//[^\n]*', '', path.read_text(encoding='utf8'), flags=re.S)
        chunks.append(relative + '\n' + ' '.join(text.split()))
    return hashlib.sha256('\n'.join(chunks).encode()).hexdigest()


def check_source(tree):
    if source_digest(tree) != SOURCE_GUARD:
        raise RuntimeError('Merit source changed; review the level, job and client skill rules.')


def selections():
    selected = {key: ('attributes', key.upper(), 'parameter' if key == 'str' else 'stat', {'stat': key})
                for key in ATTRIBUTES}
    for skill in WEAPONS + ('evasion', 'shield', 'parry'):
        key = ('parrying' if skill == 'parry' else skill) + '_skill'
        name = 'Hand-to-Hand Skill' if skill == 'hand_to_hand' else key.replace('_', ' ').title()
        selected[key] = ('combat_skills', name, 'skill' if skill in ('shield', 'parry') else 'parameter',
                         {'_skill': skill})
    for skill in MAGIC:
        key = skill + '_skill'
        selected[key] = ('magic_skills', key.replace('_', ' ').title(), 'skill', {'_skill': skill})
    for key, (category, name) in DIRECT.items():
        selected[key] = (category, name, 'direct', {})
    return selected


def catalogue(document, skill_ids):
    """Select only inputs that a current Checkmate estimate reads."""
    source = document['merits']
    caps = [(row['level'], row['cap']) for row in source['level_caps']]
    if (not caps or caps[0] != (0, 0)
            or any(not isinstance(value, int) or isinstance(value, bool) or value < 0 for row in caps for value in row)
            or any(a[0] >= b[0] or a[1] > b[1] for a, b in zip(caps, caps[1:]))):
        raise RuntimeError('Merit level caps must start at zero and rise in order.')
    entries, ids = {}, set()
    categories = {'attributes': 'Attributes', 'combat_skills': 'Combat skills',
                  'magic_skills': 'Magic skills', 'others': 'Other'}
    for key, (category_key, name, kind, fields) in selections().items():
        try:
            category = source['categories'][category_key]
            row = category['merits'][key]
            costs = source['upgrade_costs'][row['upgrade_cost']]
            most = min(row.get('max_upgrades', len(costs)), category['max_upgrades'])
            number, value = row['id'], row['value']
        except (KeyError, TypeError) as error:
            raise RuntimeError('Missing merit metadata for ' + key) from error
        if (not costs or any(not isinstance(v, int) or isinstance(v, bool) or v < 0 for v in (most, number, value))
                or number == 0 or value == 0 or most > len(costs) or most > caps[-1][1] or number in ids):
            raise RuntimeError('Invalid merit metadata for ' + key)
        if most == 0:
            raise RuntimeError('A supported merit is disabled: ' + key)
        ids.add(number)
        entry = dict(id=number, name=name, category=categories.get(category_key, 'Job merits'),
                     most=most, per_rank=value, kind=kind)
        if '_skill' in fields:
            skill = fields['_skill']
            if row.get('skills') != [skill] or skill not in skill_ids:
                raise RuntimeError('The skill mapping changed for ' + key)
            entry['skill'] = skill_ids[skill]
        elif fields:
            entry.update(fields)
        # General merits apply on every job, even if their menu entry lists jobs.
        if category_key not in categories:
            jobs = row.get('jobs', category.get('jobs'))
            if not isinstance(jobs, list) or len(jobs) != 1 or jobs[0] not in tables.JOBS[1:]:
                raise RuntimeError('The job gate changed for ' + key)
            entry.update(job=tables.JOBS.index(jobs[0]), level=75)
        if key.endswith('_magic_accuracy') and category_key == 'rdm_group_1':
            entry['school'] = key.removesuffix('_magic_accuracy').replace('lightning', 'thunder')
        elif key == 'magical_accuracy':
            entry['school'] = 'blue'
        elif key == 'troubadour':
            entry['school'] = 'singing'
        if kind == 'parameter':
            entry['conditions'] = [PARAMETER_NOTE]
        elif key in CONDITIONS:
            entry['conditions'] = CONDITIONS[key][:]
        entries[key] = entry
    return {'level_caps': caps, 'entries': entries}


def build(tree, roots=None):
    check_source(tree)
    roots = overlays.data_roots(str(tree)) if roots is None else roots
    return catalogue(overlays.load_merged(str(tree), roots, 'merits'), tables.read_enum(str(tree), 'skill_type'))


def write(path, data, stamp):
    lines = ['-- Merits used by the displayed estimates. Client skills and server stats already include their merits.']
    lines += lua_writer.stamp_lines(stamp)
    lines += ['return {', '    built = %s,' % lua_writer.quote(stamp.built),
              '    content = %s,' % lua_writer.quote(stamp.content),
              '    level_caps = %s,' % lua_writer.effect_value([list(row) for row in data['level_caps']]),
              '    entries = {']
    for key, entry in data['entries'].items():
        lines.append('        %s = %s,' % (key, lua_writer.effect_value(entry)))
    lines += ['    },', '}']
    return lua_writer.write_file(path, lines)
