"""
Reads Effects from Phoenix's status YAML, spell tables, move scripts, merits and item mods.

Loaded modules apply after core. The hand cases and duration helpers are checked against their comment-free
source. A new or changed override stops the export until it is read. Unknown move durations have no timer.
The reader accepts only the duration rules it knows. All times are estimates before resists.
"""
from collections import Counter, defaultdict
import hashlib
import os
from pathlib import Path
import re

from . import aggro, lua_source, overlays, sqlfile, tables

GEAR_MODS = {'requiem': 'requiem_effect', 'elegy': 'elegy_effect', 'threnody': 'threnody_effect',
             'lullaby': 'lullaby_effect', 'songs': 'all_songs_effect', 'shadowbind': 'shadow_bind_ext'}
SONGS = {'REQUIEM_EFFECT': 'requiem', 'ELEGY_EFFECT': 'elegy', 'THRENODY_EFFECT': 'threnody',
         'LULLABY_EFFECT': 'lullaby'}
MERITS = {'dia_iii': ('rdm_group_2', 0), 'bio_iii': ('rdm_group_2', 0), 'angon': ('drg_group_2', 15)}
MODULE_TARGET = re.compile(r"['\"]xi\.(?:effects\.|actions\.(?:spells|mobskills|abilities\.pets)\."
                           r'|spells\.(?:enfeebling|enhancing)\.|job_utils\.(?:ranger\.useShadowbind'
                           r'|dragoon\.useAngon|corsair\.useElementalShot)|mobskills\.(?:mobBuffMove'
                           r'|mobStatusEffectMove|calculateDuration)|combat\.action\.executeMobskillStatusEffect)')
# The guards below cover source that is not a plain table. Hashing its comment-free words also catches a new
# condition around an unchanged duration. A new hash must only be added after reading the changed behavior.
CORE_GUARDS = {
    'scripts/globals/spells/enfeebling_spell.lua':
        'a9fec830186f0a14bca6c0062754d88a8974358098bb95a761f51b2749853029',
    'scripts/globals/spells/enfeebling_song.lua':
        'fd4b793d68fd12dc355b5fea584f2b36a1d087fa1c31543cffa4e1e74a032e9a',
    'scripts/globals/spells/enhancing_spell.lua':
        '88bbe018a4569a088ca3186148d348108aaf54c80a05b7358148256f4421ec9b',
    'scripts/globals/spells/enhancing_song.lua':
        'b78e39e3380f5bd75c283cd10300a591b0e96dd9223225a23d0b3658ce036719',
    'scripts/globals/job_utils/ranger.lua':
        'b6034bfc3d759723ef5d674109a6cfe8530298583679424102de97ba9b20fa42',
    'scripts/globals/job_utils/dragoon.lua':
        '005bb3cee7a8c410f88616e5b2325db67f003746f23529d94931f36bae09e991',
    'scripts/globals/job_utils/corsair.lua':
        'f1fd83ad41606f0a6ea3b53d3eb6033a44ef9a8741279731b1e69abd70522d31',
    'scripts/actions/abilities/pets/nightmare.lua':
        '6c3b35149bcdf2a1a36b56ef053c04487ff1eb9a2d4fbbd0ca636b41c98d50ef',
}

# Pet/mob handlers are read below. Spell overrides have explicit cases below.
# Other guarded effect hooks change power or player-only effects, not these durations.
KNOWN_MODULES = {
    # This direct song-table patch only changes potency columns.
    'modules/phoenix/lua/globals/spells/enhancing_song.lua':
        'e741e5349313f64e99e62c4f534a5eaad07dc073a4c94a21baa9ad7a1072982b',
    'modules/era/lua/actions/abilities/pets/bloodpact_rage.lua':
        'e1c593b4ebac9a818c7e4382d6acf970bb2353f877718a20cf85b5af8fe9156f',
    'modules/era/lua/actions/abilities/pets/bloodpact_ward.lua':
        '4d491a27835b695681c2ccc01761fb39f1c9f11931c3c1195a54e6dfa398bc5c',
    'modules/era/lua/actions/abilities/pets/automaton/attachments.lua':
        '3b375400f2b806977ff49f206455bf3d1c233662be122c8dc87ce7489a509c0c',
    'modules/era/lua/actions/spells/spell_adjustments.lua':
        '27967532d3848883b94d72a5b8851b8f19b6365f70c46d9b3d3fb3f03cb00d7e',
    'modules/era/lua/actions/weaponskills/automaton.lua':
        'cbd383efa60bebf0623e225e9fce96ba954a961e888176444c051657f3c013da',
    'modules/era/lua/effects/ancient_circle.lua':
        'ef9d8a538a32853d51108ba0aff4fa214a482fb2e66410e241e74b4fdb2ece07',
    'modules/era/lua/effects/arcane_circle.lua':
        '7c962d534a5b68b3c1278c75cdfd279b6c703b5965d1ea79e8337fdd54cfc417',
    'modules/era/lua/effects/composure.lua':
        'eec335e3ee5ec4e1b026b460ca13abe6b09ba0c613845d5192cee4d89af345a3',
    'modules/era/lua/effects/era_signet_effects.lua':
        '01ad736af59f03e7620883fa510ae5b96615c22f18acbfb65bafbef693b9f00b',
    'modules/era/lua/effects/holy_circle.lua':
        '99bde0a978b34dd002c1e020762bcb9f30a4769e14733a3e5863886ee87b3439',
    'modules/era/lua/effects/level_restriction.lua':
        '03b3e963f1705aeb0303987636a1909261ef4fd7480f2d6cdbe356434b2b06a2',
    'modules/era/lua/effects/warding_circle.lua':
        '4795182c955c31c75f9d62b5acb356963ccc9f5895d89b353030ae70eba5caa2',
    'modules/era/lua/effects/weight.lua':
        '70b7f57d099b709b4cfd5b9f78d5b9433f2ae8a8cea37daa841279f6781b92b7',
    'modules/era/lua/globals/job_utils/corsair.lua':
        'ee4a332355d21fea23b30a196acb3ef18959bb321fe8458f11527faf1133cc67',
    'modules/era/lua/globals/job_utils/dark_knight.lua':
        '6e5715fb8d991c33e5a91ba5915f8685960216cc28a3ca3c6dc874668b079f64',
    'modules/era/lua/globals/job_utils/dragoon.lua':
        '6b3b5c14029fbc240abd13732cb6136292268884aac4bf1a71ab5b40b907e405',
    'modules/era/lua/globals/job_utils/monk.lua':
        '2f1ac67b39b2a34fa50198629fbc589b5fa2dc5dba86d24f25c15af24ad59b93',
    'modules/era/lua/globals/job_utils/ninja.lua':
        '6e87568f012cb3d86bcc97d6169b275977e0b7b7fef75300ca5da1faa17e6686',
    'modules/era/lua/globals/job_utils/paladin.lua':
        '3ccf61703489d68492ca31843734b1e53b8771e0b82d03fec07dae44e3ac0f36',
    'modules/era/lua/globals/job_utils/ranger.lua':
        '5f74cfff6ce9fd98c7d27c113466902bf3181ac6025178ef599d279ab7eb0b4b',
    'modules/era/lua/globals/job_utils/samurai.lua':
        'f77f7074cbb80d2d62f24325c4c0d6a696e47d32a4a1654987b562aa44ebfecb',
    'modules/era/lua/globals/job_utils/thief.lua':
        '44af69bfd6a7b9b4f80f32fef58af7f373463ae50007279dc45d183fa1683bda',
    'modules/era/lua/globals/job_utils/warrior.lua':
        '20c8072d5f562a6ad20d2410cae3e9d050f1f36a7032f5c94dbf988513b01c5d',
    'modules/phoenix/lua/actions/mobskills/final_sting_pre_2013.lua':
        'a237aabe1a3d390e39c66c4a6bc6b1b702e356354abbd3ac4ad851e9b5bba7bd',
    'modules/phoenix/lua/actions/mobskills/leaf_dagger_pre_wotg.lua':
        '2a80d21fef781f2c5d19f8174ceec140b4487b1083f51c53b1432ad7c1bcaf17',
    'modules/phoenix/lua/actions/mobskills/plague_breath_pre_wotg.lua':
        'fe69cc3bbd1bd25e6145a20a647c4052e4436a340029c2ad01b1243fb9b5f8ab',
    'modules/phoenix/lua/actions/mobskills/poison_breath_crawler_pre_wotg.lua':
        '0baa460e2b3f3179465322600258644bd2df9134fe9bd7594e9d3b3887da0554',
    'modules/phoenix/lua/actions/mobskills/queasyshroom_pre_wotg.lua':
        'b7adee6863f2cf0da1b9a50c9ea8c52d1a3f6357b86f06609afafe41f0d4e930',
    'modules/phoenix/lua/custom/level_sync_penalty.lua':
        '8a6332cff6735001cf68402ffe959af8c30be4c46affd5a7df84894c51cc7325',
    'modules/phoenix/lua/custom/pernicious_presents_event.lua':
        '9da1df942e47ad794ac2add235c9f6e449caeb7fcf3227e87597d39cc8fae7f6',
    'modules/phoenix/lua/effects/bio.lua':
        '8f34b87c6d75beef6c4faa3e62a57be49bab0ba8ab1d89a42b36e80cde593214',
    'modules/phoenix/lua/effects/dia.lua':
        '8d858935936abc40338ab02dae7facb1a2d09c837e40f6a4dd4d9441918fda26',
    'modules/phoenix/lua/globals/spells/enfeebling_spell.lua':
        '83dd8b4ea5270b7b8be9604abe1794746c9a0ff48b34ef51aa590eb892f33c02',
    'modules/phoenix/lua/globals/spells/enhancing_spell.lua':
        '3e00373c93633f57c9bcb2feb484ef09933dd2939b450ec8ebee4ef4f791ed7b',
}


def source(tree, path):
    return lua_source.strip_comments(Path(tree, path).read_text(encoding='utf-8-sig'))


def fingerprint(text):
    return hashlib.sha256(' '.join(text.split()).encode('utf-8')).hexdigest()


def check_source(tree):
    loaded = list(dict.fromkeys(aggro.lua_files_loaded(tree)))
    for path in loaded:
        text = source(tree, path)
        direct_table = re.search(r'xi\.spells\.(?:enfeebling|enhancing)\.(?:spellPTable|songPTable|pTable)\b', text)
        if (('addOverride' in text and MODULE_TARGET.search(text)) or direct_table) and path not in KNOWN_MODULES:
            raise RuntimeError('%s changes an Effects source. Read it and update export/effects.py.' % path)
    for path, expected in CORE_GUARDS.items():
        if fingerprint(source(tree, path)) != expected:
            raise RuntimeError('%s changed. Recheck the Effects duration assumptions in export/effects.py.' % path)
    for path, expected in KNOWN_MODULES.items():
        if path not in loaded:
            raise RuntimeError('%s is no longer loaded. Recheck Effects before exporting.' % path)
        if fingerprint(source(tree, path)) != expected:
            raise RuntimeError('%s changed. Recheck its Effects override in export/effects.py.' % path)
    return loaded


def mode(values):
    """The most common duration, the longer on a tie."""
    counts = Counter(value for value in values if value is not None and value > 0)
    return max(counts, key=lambda value: (counts[value], value)) if counts else None


def effect_name(value, ids, where):
    match = re.fullmatch(r'xi\.effect\.(\w+)', value.strip())
    if not match or match[1] not in ids:
        raise RuntimeError('%s: unknown status effect %s' % (where, value))
    return ids[match[1]]


def table_rows(text, name, where):
    """Every spell row, with no unparsed remainder."""
    start = re.search(r'(?:local\s+)?' + re.escape(name) + r'\s*=\s*\{', text)
    if not start:
        raise RuntimeError('%s has no %s' % (where, name))
    body = lua_source.block(text, start.start(), where)
    pattern = re.compile(r'\[xi\.magic\.spell\.(\w+)\s*\]\s*=\s*\{([^{}]*)\}\s*,?')
    found = pattern.findall(body)
    if not found or pattern.sub('', body).strip():
        raise RuntimeError('%s: unreadable %s row' % (where, name))
    return [(name, [part.strip() for part in row.split(',')]) for name, row in found]



def sql_rows(tree, table):
    """Apply module SQL when it changes IDs, names, content gates or item mods used here."""
    path = Path(tree, 'sql', table + '.sql')
    names = sqlfile.columns(path.read_text(encoding='utf-8'), table)
    rows = sqlfile.rows(str(path), table)
    fields = {'spell_list': {'spellid', 'name', 'content_tag'},
              'mob_skills': {'mob_skill_id', 'mob_skill_name'},
              'pet_skills': {'pet_skill_id', 'pet_skill_name'},
              'item_mods': set(names)}[table]
    for module, target, statement in tables.module_statements(tree):
        if target != table:
            continue
        update = re.fullmatch(r'UPDATE\s+`?\w+`?\s+SET\s+(.*?)\s+WHERE\s+(.*)', statement, re.I)
        if update:
            changed = set(re.findall(r'`?(\w+)`?\s*=', update[1]))
            if not changed & fields:
                continue
            changes, where = tables.parse_pairs(update[1], module), tables.parse_pairs(update[2], module)
            for row in rows:
                if all(row.get(key) == value for key, value in where.items()):
                    row.update(changes)
            continue
        insert = re.fullmatch(r'INSERT INTO\s+`?\w+`?\s+VALUES\s*\((.*)\)', statement, re.I)
        if insert:
            values = sqlfile.split_values(insert[1])
            if len(values) != len(names):
                raise RuntimeError('%s: unreadable Effects SQL insert: %s' % (module, statement))
            rows.append(dict(zip(names, values)))
            continue
        delete = re.fullmatch(r'DELETE FROM\s+`?\w+`?\s+WHERE\s+(.*)', statement, re.I)
        if delete:
            where = tables.parse_pairs(delete[1], module)
            rows = [row for row in rows if not all(row.get(key) == value for key, value in where.items())]
            continue
        raise RuntimeError('%s changes %s. Teach the Effects reader this SQL: %s' % (module, table, statement))
    return rows


def spell_rows(tree, ids, allowed):
    spells = tables.lua_enum(os.path.join(tree, 'scripts', 'enum', 'magic.lua'), 'xi.magic.spell')
    sql = {row['spellid']: row for row in sql_rows(tree, 'spell_list')}
    found = {}
    layouts = [('enfeebling_spell', 'pTable', 0, 1, 5, None),
               ('enfeebling_song', 'pTable', 0, 1, 4, 5),
               ('enhancing_spell', 'xi.spells.enhancing.spellPTable', 1, 0, 4, None),
               ('enhancing_song', 'xi.spells.enhancing.songPTable', 1, 0, None, None)]
    for file, table, effect_col, tier_col, duration_col, song_col in layouts:
        path = 'scripts/globals/spells/%s.lua' % file
        for name, cells in table_rows(source(tree, path), table, path):
            number = spells.get(name)
            if number is None:
                raise RuntimeError('%s has no spell enum %s' % (path, name))
            if number not in sql:
                continue  # Unimplemented spells have an enum and table entry but no loadable SQL row.
            if not allowed.allows(sql[number]['content_tag']):
                continue
            effect = effect_name(cells[effect_col], ids, path)
            if effect in (ids['NONE'], ids['CHARM_I']):
                continue
            try:
                row = {'effect': effect, 'seconds': int(cells[duration_col]) if duration_col is not None else 120,
                       'tier': int(cells[tier_col]), '_name': sql[number]['name']}
            except (ValueError, IndexError) as error:
                raise RuntimeError('%s: unreadable duration/tier for %s' % (path, name)) from error
            if song_col is not None:
                mod = cells[song_col].removeprefix('xi.mod.')
                if mod not in SONGS:
                    raise RuntimeError('%s: unknown song mod %s' % (path, mod))
                row['song'] = SONGS[mod]
            found[number] = row
    # These are the checked Phoenix/core duration branches, before resists and player-only bonuses.
    ranges = {'BIND': (13, 60), 'STUN': (2, 7), 'BLIND': (80, 300), 'BLIND_II': (80, 300),
              'PARALYZE': (30, 120), 'PARALYZE_II': (30, 120), 'SILENCE': (2, 120),
              'DEODORIZE': (30, 300), 'INVISIBLE': (30, 300), 'SNEAK': (30, 300)}
    for name, (low, high) in ranges.items():
        if spells[name] in found:
            found[spells[name]].update(seconds=low, top=high)
    for name in ('POISON', 'POISONGA'):
        if spells[name] in found:
            found[spells[name]]['seconds'] = 30
    for row in found.values():
        if ids['BARFIRE'] <= row['effect'] <= ids['BARWATER']:
            row['seconds'] = 150  # Monster bar-element casts always take this branch in core.
    # Phalanx II's modern table includes five ranks. Phoenix monsters have no merit and get rank one.
    if spells['PHALANX_II'] in found:
        found[spells['PHALANX_II']]['seconds'] = 120
    for name, effect, seconds, tier in [('DIA', 'DIA', 60, 1), ('DIAGA', 'DIA', 60, 1),
                                      ('DIA_II', 'DIA', 120, 3), ('DIA_III', 'DIA', None, 5),
                                      ('BIO', 'BIO', 60, 2), ('BIO_II', 'BIO', 120, 4),
                                      ('BIO_III', 'BIO', None, 6), ('DREAD_SPIKES', 'DREAD_SPIKES', 60, 1)]:
        number = spells[name]
        if allowed.allows(sql[number]['content_tag']):
            row = {'effect': ids[effect], 'tier': tier, '_name': sql[number]['name']}
            if seconds is None:
                row['merit'] = name.lower()
            else:
                row['seconds'] = seconds
            found[number] = row
    return found


def duration_value(expression, text, seen=()):
    """A literal, a simple local, or a checked top of a random/TP duration. None means unknown."""
    expression = expression.strip()
    if re.fullmatch(r'\d+(?:\.\d+)?', expression):
        value = float(expression)
        return int(value) if value.is_integer() else value
    if re.fullmatch(r'\w+', expression) and expression not in seen:
        assignments = re.findall(r'(?m)^\s*' + re.escape(expression) + r'\s*=\s*([^\n]+)', text)
        # A later branch may replace or scale a local. Table fields ending in a comma are not assignments.
        if any(value.strip().rstrip(',') != expression and not value.rstrip().endswith(',')
               for value in assignments):
            return None
        values = re.findall(r'(?m)^\s*local\s+' + re.escape(expression) + r'\s*=\s*([^\n]+)', text)
        resolved = [duration_value(value, text, seen + (expression,)) for value in values]
        return resolved[0] if resolved and all(value == resolved[0] for value in resolved) else None
    match = re.fullmatch(r'(?:xi\.mobskills\.)?calculateDuration\([^,]+,\s*(\d+),\s*(\d+)\)', expression)
    if match:
        return int(match[2])
    match = re.fullmatch(r'math\.(?:random|randomInt)\(\s*(\d+),\s*(\d+)\)', expression)
    if match:
        return int(match[2])
    # A resist can only shorten this base duration.
    match = re.fullmatch(r'(?:math\.floor\()?\s*(\d+)\s*\*\s*(?:resist|resistRate|resistanceRate)\s*\)?', expression)
    if match:
        return int(match[1])
    return None


def move_effects(text, ids, where):
    """Explicit applied effects; a hidden companion status is handled separately for Nightmare."""
    effects = defaultdict(list)
    call = re.compile(r'(?:xi\.mobskills\.(mobBuffMove|mobStatusEffectMove)|\w+:(addStatusEffect))\s*\(')
    for match in call.finditer(text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if args is None:
            raise RuntimeError('%s: unbalanced status call' % where)
        if match[2]:
            if len(args) < 2:
                raise RuntimeError('%s: short addStatusEffect call' % where)
            effect, payload = args[:2]
            duration = re.search(r'\bduration\s*=\s*(.*?)(?:,\s*\w+\s*=|\s*}\s*$)', payload, re.S)
            expression = duration[1].strip() if duration else ''
        else:
            index = 1 if match[1] == 'mobBuffMove' else 2
            if len(args) < index + 4:
                raise RuntimeError('%s: short %s call' % (where, match[1]))
            effect, expression = args[index], args[index + 3]
        if re.fullmatch(r'xi\.effect\.\w+', effect):
            effects[effect_name(effect, ids, where)].append(duration_value(expression, text))
        else:
            # A locally named effect still identifies what landed, even if its time is calculated.
            values = re.findall(r'\blocal\s+' + re.escape(effect) + r'\s*=\s*(xi\.effect\.\w+)', text)
            for value in set(values):
                effects[effect_name(value, ids, where)].append(duration_value(expression, text))
    # Newer scripts give executeMobskillStatusEffect a table instead of calling mobStatusEffectMove.
    if 'executeMobskillStatusEffect' in text:
        for payload in re.findall(r'\{\s*effectId\s*=\s*xi\.effect\.\w+[^{}]*}', text, re.S):
            effect = re.search(r'effectId\s*=\s*(xi\.effect\.\w+)', payload)[1]
            duration = re.search(r'\bduration\s*=\s*(.*?)(?:,\s*\w+\s*=|\s*}\s*$)', payload, re.S)
            effects[effect_name(effect, ids, where)].append(duration_value(duration[1], text) if duration else None)
    found = {}
    for effect, values in effects.items():
        if effect == ids['NONE']:
            continue
        row = {'effect': effect}
        # Two different branches with different durations do not give a reliable source-specific duration.
        known = {value for value in values if value is not None and value > 0}
        if len(known) == 1 and all(value is not None for value in values):
            row['seconds'] = known.pop()
        found[effect] = row
    return found


def override_moves(tree, loaded):
    """Checked module handlers in init order, keyed by their mob/pet script path."""
    found = {}
    pattern = re.compile(r"\w+:addOverride(?:ByEra)?\(\s*'(xi\.actions\.(mobskills|abilities\.pets)\."
                         r"([\w.]+)\.(onMobWeaponSkill|onPetAbility|onAutomatonAbility))'")
    for path in loaded:
        text = source(tree, path)
        for match in pattern.finditer(text):
            args = lua_source.call_arguments(text, text.index('(', match.start()))
            if args is None or len(args) < 2:
                raise RuntimeError('%s: unreadable move override' % path)
            name = ('scripts/actions/mobskills/' if match[2] == 'mobskills' else 'scripts/actions/abilities/pets/')
            found[name + match[3].replace('.', '/') + '.lua'] = (', '.join(args[1:]), path)
    return found


def moves(tree, ids, overrides, pet=False):
    table = 'pet_skills' if pet else 'mob_skills'
    folder = 'scripts/actions/abilities/pets/' if pet else 'scripts/actions/mobskills/'
    id_key, name_key = ('pet_skill_id', 'pet_skill_name') if pet else ('mob_skill_id', 'mob_skill_name')
    found = {}
    for entry in sql_rows(tree, table):
        path = folder + entry[name_key] + '.lua'
        if not Path(tree, path).is_file():
            # Automaton scripts live below a subfolder and use the same packet pet-skill ID.
            if pet and Path(tree, folder + 'automaton/' + entry[name_key] + '.lua').is_file():
                path = folder + 'automaton/' + entry[name_key] + '.lua'
            else:
                continue
        text, where = overrides.get(path, (source(tree, path), path))
        forwarded = re.search(r'xi\.actions\.mobskills\[([\w\'\"]+)\]\.onMobWeaponSkill', text)
        if forwarded:
            key = forwarded[1].strip('\'"')
            if key == forwarded[1]:
                value = re.search(r'local\s+' + re.escape(key) + r"\s*=\s*'([^']+)'", text)
                key = value[1] if value else ''
            if key:
                path = 'scripts/actions/mobskills/' + key + '.lua'
                text, where = overrides.get(path, (source(tree, path), path))
        choices = move_effects(text, ids, where)
        if pet and entry[name_key] == 'nightmare':
            choices = {ids['SLEEP_I']: {'effect': ids['SLEEP_I'], 'seconds': 90, 'deep': True}}
        if not choices:
            continue
        returned = re.findall(r'\breturn\s+xi\.effect\.(\w+)', text)
        primary = next((ids[name] for name in reversed(returned) if ids.get(name) in choices), min(choices))
        row = dict(choices[primary], _name=entry[name_key])
        if len(choices) > 1:
            row['by_effect'] = choices
        found[entry[id_key]] = row
    return found


def merit_rows(tree, roots):
    document = overlays.load_merged(tree, roots, 'merits')['merits']
    categories, costs = document['categories'], document['upgrade_costs']
    found = {}
    for name, (category_name, base) in MERITS.items():
        category = categories[category_name]
        row = category['merits'][name]
        most = min(row.get('max_upgrades', len(costs[row['upgrade_cost']])), category['max_upgrades'])
        found[name] = {'id': row['id'], 'base': base, 'per_rank': row['value'], 'most': most}
    for category, name in [('blm_group_2', 'elemental_debuff_duration'),
                           ('rdm_group_2', 'enfeebling_magic_duration'), ('rdm_group_2', 'enhancing_magic_duration')]:
        if categories[category]['merits'][name].get('max_upgrades') != 0:
            raise RuntimeError('%s is now enabled. Teach Effects its duration bonus.' % name)
    return found


def equipment(tree):
    mods = tables.read_enum(tree, 'mod')
    rows = sql_rows(tree, 'item_mods')
    wanted = {mods[name] for name in GEAR_MODS.values()} | {951, 953}
    by_mod = defaultdict(dict)
    for row in rows:
        if row['modId'] in wanted:
            item, mod, value = row['itemId'], row['modId'], row['value']
            if item in by_mod[mod]:
                raise RuntimeError('item_mods duplicates item %d mod %d' % (item, mod))
            by_mod[mod][item] = value
    gear = {name: by_mod[mods[mod]] for name, mod in GEAR_MODS.items()}
    proc_effects = by_mod[951]
    procs = {item: duration for item, duration in by_mod[953].items() if item in proc_effects and duration > 0}
    lengths = defaultdict(list)
    for item, duration in procs.items():
        lengths[proc_effects[item]].append(duration)
    return gear, procs, proc_effects, {effect: mode(values) for effect, values in lengths.items()}


def effect_rows(tree, roots):
    rows = overlays.load_merged(tree, roots, 'status_effects')['status_effects']
    groups = defaultdict(set)
    for name, row in rows.items():
        if row.get('exclusion_group'):
            groups[row['exclusion_group']].add(row['id'])
    found = {}
    for name, row in rows.items():
        removed = set(groups[row.get('exclusion_group')]) if row.get('exclusion_group') else set()
        for field in ('negative', 'remove'):
            values = row.get(field) or []
            values = values if isinstance(values, list) else [values]
            for value in values:
                if value not in rows:
                    raise RuntimeError('status_effects %s has unknown %s %s' % (name, field, value))
                removed.add(rows[value]['id'])
        removed.discard(row['id'])
        found[row['id']] = {'drops': sorted(removed), '_name': name}
    return found


def build(tree, roots, allowed):
    # These module hand cases were read for Phoenix's enabled expansions. Other settings need their own audit.
    if not allowed.restrict or set(allowed.enabled) != {'rotz', 'cop', 'toau'}:
        raise RuntimeError('Effects currently requires Phoenix content: RESTRICT_CONTENT on, rotz/cop/toau on.')
    loaded = check_source(tree)
    ids = {name.upper(): row['id'] for name, row in
           overlays.load_merged(tree, roots, 'status_effects')['status_effects'].items()}
    merits = merit_rows(tree, roots)
    spells = spell_rows(tree, ids, allowed)
    overrides = override_moves(tree, loaded)
    skills, pacts = moves(tree, ids, overrides), moves(tree, ids, overrides, pet=True)
    abilities = {57: {'effect': ids['BIND'], 'seconds': 30, 'gear': 'shadowbind', '_name': 'Shadowbind'},
                 170: {'effect': ids['DEFENSE_DOWN'], 'merit': 'angon', '_name': 'Angon'},
                 131: {'effect': ids['SLEEP_I'], 'seconds': 90, '_name': 'Light Shot'}}
    gear, procs, proc_effects, proc_usual = equipment(tree)
    effects = effect_rows(tree, roots)
    durations = defaultdict(list)
    pictured = set(proc_effects.values())
    for section in (spells, abilities, skills, pacts):
        for row in section.values():
            for info in row.get('by_effect', {row['effect']: row}).values():
                effect = info['effect']
                pictured.add(effect)
                seconds = info.get('top', info.get('seconds'))
                if 'merit' in info:
                    merit = merits[info['merit']]
                    seconds = merit['base'] + merit['per_rank'] * merit['most']
                durations[effect].append(seconds)
    for effect, seconds in proc_usual.items():
        durations[effect].append(seconds)
    for effect, values in durations.items():
        usual = mode(values)
        if effect not in effects:
            raise RuntimeError('Effect %d has no status_effects row' % effect)
        if usual is not None:
            effects[effect]['usual'] = usual
    return {'effects': effects, 'spells': spells, 'abilities': abilities, 'skills': skills, 'pacts': pacts,
            'gear': gear, 'procs': procs, 'proc_effects': proc_effects, 'proc_usual': proc_usual,
            'merits': merits, 'pictured': sorted(pictured - {0, 19, 193}), 'troubadour': ids['TROUBADOUR']}
