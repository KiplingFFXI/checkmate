"""
Reads the skill caps, skill ranks, job grades, job traits and enums the monster math needs from the server tables.

Skill data uses the loaded YAML overlays. SQL traits and older skill tables get the UPDATE lines of every
SQL module in modules/init.txt applied first, because dbtool runs those on the live database.
"""
from pathlib import Path
import glob
import os
import re

from . import overlays
from . import sqlfile

JOBS = ['none', 'war', 'mnk', 'whm', 'blm', 'rdm', 'thf', 'pld', 'drk', 'bst', 'brd', 'rng', 'sam', 'nin',
        'drg', 'smn', 'blu', 'cor', 'pup', 'dnc', 'sch', 'geo', 'run']

# Stat rank letters as the engine numbers them. 0 means none.
RANKS = {'none': 0, 'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7}

# Tables whose module UPDATE lines the exporter applies.
UPDATED_TABLES = ('traits', 'skill_ranks')

# Tables no module may change without the exporter learning about it.
GUARDED_TABLES = ('skill_caps', 'mob_pools', 'mob_groups', 'mob_spawn_points', 'instance_entities',
                  'instance_list', 'mob_droplist', 'pet_list', 'fishing_mob')

# Module SQL the exporter knows is safe to skip, with why.
KNOWN_SQL = {
    # The Twinkling Treant pool and group for the GM-started Pernicious Presents event. The treant is a
    # dynamic mob, so it gets no row.
    'phoenix/sql/pernicious_presents_event.sql': {'mob_pools', 'mob_groups'},
}


def read_enum(tree, name):
    """data/enums/<name>.yaml values as {name: number}."""
    values = overlays.load_yaml(os.path.join(tree, 'data', 'enums', name + '.yaml'))['values']
    return {str(key): int(value) for key, value in values.items()}


def lua_enum(path, table):
    """The NAME = number entries of a Lua enum table."""
    text = Path(path).read_text(encoding='utf-8')
    body = text[text.index(table + ' ='):]
    body = body[:body.index('\n}')]
    return {name: int(value) for name, value in re.findall(r'^\s*(\w+)\s*=\s*(\d+)', body, re.M)}


def lua_true_set(path, table):
    """The names in a local Lua table of [xi.trait.NAME] = true entries."""
    text = Path(path).read_text(encoding='utf-8')
    body = text[text.index('local %s =' % table):]
    body = body[:body.index('\n}')]
    return set(re.findall(r'\[xi\.trait\.(\w+)\s*\]\s*=\s*true', body))


def module_sql_files(tree):
    files = []
    for entry in overlays.init_entries(tree):
        if 'sql' not in entry.split('/'):
            continue
        base = os.path.join(tree, 'modules', *entry.split('/'))
        if os.path.isfile(base):
            files.append(base)
        else:
            files.extend(sorted(glob.glob(os.path.join(base, '**', '*.sql'), recursive=True)))
    return files


def parse_pairs(text, where):
    """Splits `a = 1, b = 'x'` or `a = 1 AND b = 2` into a dict. Anything else is an error."""
    pairs = {}
    for part in re.split(r'\s*,\s*|\s+AND\s+', text.strip(), flags=re.I):
        match = re.fullmatch(r"`?(\w+)`?\s*=\s*('([^']*)'|-?\d+)", part.strip())
        if match is None:
            raise RuntimeError('%s: the exporter can\'t read "%s"' % (where, part))
        pairs[match.group(1)] = match.group(3) if match.group(3) is not None else int(match.group(2))
    return pairs


def module_statements(tree):
    """
    (module file, table, statement) for each statement in the SQL modules init.txt loads that changes a table, with
    the comments taken out and the spaces run together.
    """
    for path in module_sql_files(tree):
        rel = os.path.relpath(path, os.path.join(tree, 'modules')).replace('\\', '/')
        text = Path(path).read_text(encoding='utf-8-sig', errors='replace')
        text = re.sub(r'/\*.*?\*/', '', text, flags=re.S)
        text = re.sub(r'--[^\n]*', '', text)
        for statement in text.split(';'):
            statement = ' '.join(statement.split())
            target = re.match(r'(?:UPDATE|INSERT INTO|REPLACE INTO|DELETE FROM)\s+`?(\w+)`?', statement, re.I)
            if target is not None:
                yield rel, target.group(1), statement


def apply_module_sql(tree, sql_tables):
    """Applies simple UPDATE lines on traits and skill_ranks. Fails on anything touching a guarded table."""
    for rel, table, statement in module_statements(tree):
        if table in GUARDED_TABLES and table not in KNOWN_SQL.get(rel, set()):
            raise RuntimeError('%s changes %s, which the exporter reads. Teach it this change.' % (rel, table))
        if table == 'item_basic' and re.search(r'\bSET\b.*`?\bname`?\s*=', statement, re.I):
            raise RuntimeError('%s renames items, which the exporter reads by name.' % rel)
        if table not in UPDATED_TABLES:
            continue
        if table not in sql_tables:
            raise RuntimeError('%s changes %s after its move to YAML. Review the skill data module.' % (rel, table))
        update = re.fullmatch(r'UPDATE\s+`?\w+`?\s+SET\s+(.*?)\s+WHERE\s+(.*)', statement, re.I)
        if update is None:
            raise RuntimeError('%s: the exporter can\'t read "%s"' % (rel, statement))
        changes = parse_pairs(update.group(1), rel)
        where = parse_pairs(update.group(2), rel)
        for row in sql_tables[table]:
            if all(row.get(key) == value for key, value in where.items()):
                row.update(changes)


SKILL_CAP_RANKS = ('a_plus', 'a', 'b_plus', 'b', 'b_minus', 'c_plus', 'c', 'c_minus', 'd', 'e', 'f', 'g')


def skill_document(path):
    document = overlays.load_yaml(path)
    if isinstance(document, dict) and isinstance(document.get('skills'), dict):
        caps = document['skills'].get('caps')
        if isinstance(caps, dict):
            levels = {}
            for level, row in caps.items():
                if type(level) is not int and not (isinstance(level, str) and re.fullmatch(r'\d+', level)):
                    raise RuntimeError('Unreadable skill cap level: %s.' % level)
                number = int(level)
                if number in levels:
                    raise RuntimeError('Duplicate skill cap level: %s.' % level)
                levels[number] = row
            document['skills']['caps'] = levels
    return document


def read_skill_tables(tree, sql_ranks=None):
    """Native caps and job ranks, including loaded module changes."""
    path = Path(tree) / 'data/skills.yaml'
    if not path.is_file():
        # Older pinned source and SQL fixtures still use the original tables.
        caps = sorted(sqlfile.rows(Path(tree) / 'sql/skill_caps.sql', 'skill_caps'), key=lambda row: row['level'])
        if sql_ranks is None:
            values = {'traits': [], 'skill_ranks': sqlfile.rows(Path(tree) / 'sql/skill_ranks.sql', 'skill_ranks')}
            apply_module_sql(tree, values)
            sql_ranks = values['skill_ranks']
        return ([[row['r%d' % rank] for rank in range(14)] for row in caps[:100]],
                {row['skillid']: {job: max(0, min(11, row[job])) for job in JOBS[1:]} for row in sql_ranks})

    for module, table, _ in module_statements(tree):
        if table in ('skill_caps', 'skill_ranks'):
            raise RuntimeError('%s changes %s after its move to YAML. Review the skill data module.' % (module, table))
    document = skill_document(path)
    for module in overlays.overlay_files(overlays.data_roots(str(tree)), 'skills'):
        document = overlays.merge_patch(document, skill_document(module))
    if not isinstance(document, dict) or set(document) != {'skills'}:
        raise RuntimeError('skills.yaml needs one skills block.')
    values = document['skills']
    if not isinstance(values, dict) or set(values) != {'ranks', 'caps'}:
        raise RuntimeError('skills.yaml needs ranks and caps.')
    skill_ids, job_ids, rank_ids = (read_enum(tree, name) for name in ('skill_type', 'job', 'skill_rank'))
    if rank_ids != {'none': 0, **{name: rank for rank, name in enumerate(SKILL_CAP_RANKS, 1)}}:
        raise RuntimeError('Skill rank enum changed. Review the skill data reader.')
    if any(not 0 <= value < 64 for value in skill_ids.values()):
        raise RuntimeError('Skill IDs are outside the native 64-entry table.')
    ranks = {skill: {job: 0 for job in job_ids} for skill in range(64)}
    if not isinstance(values['ranks'], dict):
        raise RuntimeError('skills.yaml ranks must be a map.')
    seen_skills = set()
    for skill, jobs in values['ranks'].items():
        if skill not in skill_ids or not isinstance(jobs, dict):
            raise RuntimeError('Unknown or unreadable skill rank: %s.' % skill)
        if skill_ids[skill] in seen_skills:
            raise RuntimeError('Duplicate skill rank entry: %s.' % skill)
        seen_skills.add(skill_ids[skill])
        seen_jobs = set()
        for job, rank in jobs.items():
            if job not in job_ids or not isinstance(rank, str) or rank not in rank_ids:
                raise RuntimeError('Unknown skill job or rank: %s/%s/%s.' % (skill, job, rank))
            if job_ids[job] in seen_jobs:
                raise RuntimeError('Duplicate skill job entry: %s/%s.' % (skill, job))
            seen_jobs.add(job_ids[job])
            ranks[skill_ids[skill]][job] = rank_ids[rank]

    caps = [[0] * len(rank_ids) for _ in range(100)]
    source = values['caps']
    if not isinstance(source, dict) or set(source) != set(range(1, 100)) or any(type(level) is not int for level in source):
        raise RuntimeError('Skill caps must cover every level from 1 to 99.')
    for level, row in source.items():
        if not isinstance(row, dict) or set(row) != set(SKILL_CAP_RANKS):
            raise RuntimeError('Missing, unknown or unreadable skill caps at level %s.' % level)
        for rank, name in enumerate(SKILL_CAP_RANKS, 1):
            cap = row[name]
            if type(cap) is not int or not 0 <= cap <= 65535:
                raise RuntimeError('Invalid skill cap at level %s, rank %s.' % (level, name))
            caps[level][rank] = cap
    return caps, ranks


class Tables:
    def __init__(self, tree, content):
        sql = os.path.join(tree, 'sql')
        names = ('traits',) if (Path(tree) / 'data/skills.yaml').is_file() else UPDATED_TABLES
        sql_tables = {name: sqlfile.rows(os.path.join(sql, name + '.sql'), name) for name in names}
        apply_module_sql(tree, sql_tables)

        self.skill_caps, self.skill_ranks = read_skill_tables(tree, sql_tables.get('skill_ranks'))

        grades = overlays.load_yaml(os.path.join(tree, 'data', 'grades.yaml'))['grades']['jobs']
        order = ['hp', 'mp', 'str', 'dex', 'vit', 'agi', 'int', 'mnd', 'chr']
        self.grades = {'none': {key: 0 for key in order}}
        for job, row in grades.items():
            self.grades[job] = {key: RANKS[str(row[key]).lower()] for key in order}

        self.mods = {number: name for name, number in read_enum(tree, 'mod').items()}
        # Scripts sometimes pass a mob mod to setMod. The server then changes the mod with that number.
        self.mod_aliases = {'xi.mobMod.%s' % name.upper(): self.mods.get(number, 'none')
                            for name, number in read_enum(tree, 'mob_mod').items()}
        self.immunities = read_enum(tree, 'immunity')
        self.drop_rates = read_enum(tree, 'drop_rate')
        self.zones = read_enum(tree, 'zone')
        # The aggro reader names detection, behavior and roam bits the way the YAML does.
        self.detects = read_enum(tree, 'detects')
        self.behaviors = read_enum(tree, 'behavior')
        self.roam_flags = read_enum(tree, 'roam_flag')

        trait_ids = lua_enum(os.path.join(tree, 'scripts', 'enum', 'trait.lua'), 'xi.trait')
        traits_lua = os.path.join(tree, 'scripts', 'globals', 'traits.lua')
        self.resist_traits = {trait_ids[name] for name in lua_true_set(traits_lua, 'resistTraits')}
        self.mob_excluded_traits = {trait_ids[name] for name in lua_true_set(traits_lua, 'mobExcludedTraits')}

        # trait.cpp LoadTraitsList drops content-gated rows and orders by job, traitid, then rank high to low.
        self.traits_by_job = {}
        trait_rows = [row for row in sql_tables['traits'] if content.allows(row['content_tag'])]
        trait_rows.sort(key=lambda r: (r['job'], r['traitid'], -r['rank'], r['level'], r['modifier']))
        for row in trait_rows:
            if row['job'] >= len(JOBS):
                continue
            trait = {'id': row['traitid'], 'level': row['level'], 'rank': row['rank'],
                     'mod': self.mods[row['modifier']], 'value': row['value']}
            self.traits_by_job.setdefault(JOBS[row['job']], []).append(trait)

    def max_skill(self, skill_id, job, level):
        """battleutils::GetMaxSkill(skill, job, level)."""
        level = max(0, min(level, 99, len(self.skill_caps) - 1))
        return self.skill_caps[level][self.skill_ranks[skill_id][job]]

    def cap_by_rank(self, rank, level):
        """battleutils::GetMaxSkill(rank, level)."""
        level = max(0, min(level, len(self.skill_caps) - 1))
        return self.skill_caps[level][max(0, min(rank, len(self.skill_caps[level]) - 1))]
