"""Compare hand-kept addon tables and formulas with the source being exported.

Runs Phoenix math in a separate LuaJIT and reads spell, staff and skill-cap values from source tables.
Source guards cover the rules these comparisons do not test directly.
"""
from pathlib import Path
import re

from lupa import luajit21

from . import aggro, defenses, effects, lua_source, pdif, sqlfile, tables, weapons

ADDON = Path(__file__).resolve().parents[2] / 'checkmate'
MAGIC = 'scripts/combat/basic/magic_hit_rate.lua'
TH = 'scripts/combat/basic/treasure_hunter.lua'
STATUS = 'scripts/data/status_effect_tables.lua'
GUARDS = {
    'scripts/combat/basic/magic_hit_rate.lua':
        'fbc693800ada2b1c59f24329007a6f29ffb5a143da6c5d610c96a12f54bd70ad',
    'scripts/combat/basic/treasure_hunter.lua':
        'a56ad444745473dbdb75ae52f7f57e7d1cfe5088b85fe412a8f2359083c06e0c',
    'scripts/data/status_effect_tables.lua':
        '62277663ad614770011d2a0992ad188a8c9df2d25897b1059bee98883a146a0b',
    'scripts/globals/spells/damage_spell.lua':
        'a5d0bcb607f5c2600480cde87cb51fc16809951e7d66c2d68a84ef85ce9f917d',
    'scripts/globals/spells/enfeebling_spell.lua':
        'a9fec830186f0a14bca6c0062754d88a8974358098bb95a761f51b2749853029',
    'scripts/globals/spells/enfeebling_song.lua':
        'fd4b793d68fd12dc355b5fea584f2b36a1d087fa1c31543cffa4e1e74a032e9a',
    'scripts/globals/spells/absorb_spell.lua':
        'ab296eede4669210021dfb043bd951c1392934c670416b07eddee9cec46e5037',
    'scripts/globals/bluemagic.lua':
        '26c2132d9a8ba81f122896b68218cad92853103951bec0827875ae083f114aff',
    'scripts/actions/spells/blue/firespit.lua':
        '91665a3fdad87a5666e1fbf280abbdb2d08c16c34d8573e88d89e02c1aed7607',
    'scripts/actions/spells/blue/ice_break.lua':
        'c33337efd90158d4d837d5a6dd3fedcb2c0d7157d0716a7caffc930c166427bf',
    'scripts/actions/spells/blue/sandspin.lua':
        'd300d725986a6d9fa8b2c335b588ebfd5c6e9cba21152a0527b4c457c7bf10b3',
    'scripts/actions/spells/blue/blitzstrahl.lua':
        'cbb2ebf4d3813ce26824b59e0a94d0d667f7a67bcedfa021fd29aa1f417e4e10',
    'scripts/actions/spells/blue/maelstrom.lua':
        'b293352fcc008d65b9d46ff9708371de2db6fa328fdeaff699ae8b18a84192a5',
    'scripts/actions/spells/blue/death_ray.lua':
        '0efff1be14172128d0c980e3144c0c54bc5fc326e459017cb8e743f7df6460df',
}
MODULE_GUARDS = {
    'modules/era/lua/combat/magic_burst.lua':
        '2ebc2acb2c14b42117c64680f9cfc0a2d9b7de00d0b6573e26a96479de32fe22',
    'modules/phoenix/lua/actions/spells/ninjutsu/damage_ninjutsu.lua':
        '822bfdd492a5ea4a060e016a29b19f3d400827894ee0d354a449e01eca4a9aa8',
    'modules/phoenix/lua/globals/spells/enfeebling_spell.lua':
        '83dd8b4ea5270b7b8be9604abe1794746c9a0ff48b34ef51aa590eb892f33c02',
    'modules/phoenix/lua/globals/spells/damage_spell.lua':
        '7d370faf65dbd2a6605752670aa8455948eb98a3f85384048e5ec8cc99aae594',
    'modules/era/lua/actions/spells/spell_adjustments.lua':
        '27967532d3848883b94d72a5b8851b8f19b6365f70c46d9b3d3fb3f03cb00d7e',
}


def same(actual, expected, where):
    if actual != expected:
        raise RuntimeError('Source parity failed for %s: addon %r, source %r.' % (where, actual, expected))


def plain(value):
    if luajit21.lua_type(value) == 'table':
        return {key: plain(each) for key, each in value.items()}
    return value


def body(text, name):
    start = re.search(re.escape(name) + r'\s*=\s*\{', text)
    if not start:
        raise RuntimeError('Source parity cannot find table ' + name)
    return lua_source.block(text, start.start(), name)


def numeric_table(runtime, text, name):
    value = body(lua_source.strip_comments(text), name)
    if re.search(r'[^\d\s.,=\[\]{}+\-]', value):
        raise RuntimeError('Source parity needs a new reader for ' + name)
    return runtime.execute('return {' + value + '}')


def check_guards(tree):
    for path, expected in GUARDS.items():
        same(effects.fingerprint(effects.source(tree, path)), expected, path + ' behavior guard')
    cpp = (Path(tree) / 'src/map/utils/mobutils.cpp').read_text(encoding='utf8')
    match = re.search(r'uint16 GetMagicEvasion\(CMobEntity\* PMob\)(.*?)\n}', cpp, re.S)
    if not match:
        raise RuntimeError('Source parity cannot find GetMagicEvasion.')
    code = re.sub(r'//[^\n]*', '', match[1])
    expected = '{ uint8 mlvl = std::min<uint8>(PMob->GetMLevel(), 99); if (PMob->objtype == TYPE_TRUST) { return battleutils::GetMaxSkill(12, mlvl); } return battleutils::GetMaxSkill(7, mlvl);'
    same(' '.join(code.split()), expected, 'GetMagicEvasion C-rank basis')
    loaded = set(aggro.lua_files_loaded(tree))
    for path, expected in MODULE_GUARDS.items():
        if path not in loaded:
            raise RuntimeError('Source parity module is no longer loaded: ' + path)
        same(effects.fingerprint(effects.source(tree, path)), expected, path + ' behavior guard')
    # Calls to these helpers are fine. Overrides or direct assignments must be reviewed.
    targets = r'xi\.(?:combat\.(?:magicHitRate|treasureHunter)|data\.statusEffect|spells\.(?:damage|enfeebling|absorb))\.'
    for path in loaded - set(MODULE_GUARDS):
        text = effects.source(tree, path)
        if re.search(r"['\"]" + targets, text) or re.search(targets + r'[\w.\[\]]+\s*=(?!=)', text):
            raise RuntimeError('Source parity found an unreviewed module: ' + path)
    for module, target, statement in tables.module_statements(tree):
        if target == 'skill_caps' or (target == 'spell_list' and re.search(r'\b(?:element|skill)\s*=', statement)):
            raise RuntimeError('Source parity must follow this module SQL: ' + module)


def check_math(tree, addon=ADDON):
    runtime = luajit21.LuaRuntime()
    runtime.execute("package.path = [[%s/?.lua;]] .. package.path; AshitaCore = {GetResourceManager=function() return {} end}"
                    % str(addon).replace('\\', '/'))
    runtime.execute("package.loaded['core.modifiers'] = {}")
    magic = runtime.execute((Path(addon) / 'core/magic.lua').read_text(encoding='utf8'))
    drops = runtime.execute((Path(addon) / 'core/drops.lua').read_text(encoding='utf8'))
    runtime.execute('utils = {clamp=function(x,a,b) return math.max(a,math.min(b,x)) end, '
                    'defaultIfNil=function(x,d) if x==nil then return d end return x end}; '
                    'xi = {data={levelCorrection={isLevelCorrectedZone=function() return true end}}}')
    source = effects.source(tree, MAGIC)
    native = runtime.execute(source + '\nreturn {stat=magicAccuracyFromStatDifference, hit=calculateMagicHitRate, '
                             'ranks=resistRankMultiplier}')
    addon_ranks = numeric_table(runtime, (Path(addon) / 'core/magic.lua').read_text(encoding='utf8'), 'RANK_MULTIPLIER')
    for rank in range(-3, 10):
        same(addon_ranks[rank], native['ranks'][rank], 'magic resistance rank %d' % rank)
    actor = runtime.eval('function(n) return {getStat=function() return n end,getMainLvl=function() return 75 end} end')
    target = runtime.eval('function(n,g) return {getStat=function() return n end,getMainLvl=function() return 75+g end,'
                          'isPC=function() return false end} end')
    for diff in range(-160, 161):
        params = runtime.table_from({'actorStat': 1, 'targetStat': 1})
        same(magic.stat_bonus(diff), native['stat'](actor(diff), target(0, 0), params), 'stat difference %d' % diff)
    for accuracy in range(0, 501, 13):
        for evasion in range(0, 401, 17):
            for gap in (-10, 0, 1, 5, 20):
                params = runtime.table_from({'actorMagicAccuracy': accuracy, 'targetMagicEvasion': evasion})
                expected = native['hit'](actor(0), target(0, gap), params) * 100
                if abs(magic.hit_percent(accuracy, evasion, gap) - expected) > 1e-9:
                    raise RuntimeError('Source parity failed for magic hit rate at %s.' % ((accuracy, evasion, gap),))
    runtime.execute(effects.source(tree, TH))
    native_drop = runtime.globals().xi.combat.treasureHunter.getDropRate
    for th in range(5):
        for rate in range(1001):
            expected = native_drop(th, rate * 10) / 10000
            if abs(drops.roll_chance(rate, th) - expected) > 1e-12:
                raise RuntimeError('Source parity failed for TH %d at rate %d.' % (th, rate))
    return runtime


def check_tables(tree, runtime, addon=ADDON):
    spells = runtime.execute((Path(addon) / 'data/spells.lua').read_text(encoding='utf8'))
    expected_caps = {row['level']: row['r7'] for row in sqlfile.rows(str(Path(tree) / 'sql/skill_caps.sql'), 'skill_caps')
                     if 1 <= row['level'] <= 99}
    same(plain(spells.MEVA_BY_LEVEL), expected_caps, 'MEVA_BY_LEVEL')
    elements = ['fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark']
    staff = {}
    for row in effects.sql_rows(tree, 'item_mods'):
        if 347 <= row['modId'] <= 354:
            staff.setdefault(row['itemId'], {})[elements[row['modId'] - 347]] = row['value']
    # These are outside the classic staff table; keep them visible to the source check.
    other = {18057: {'dark': 2, 'light': -2},
             18632: dict.fromkeys(elements, 2), 18633: dict.fromkeys(elements, 3),
             26194: {'light': 11}}
    same({item: staff.pop(item, None) for item in other}, other, 'unmodeled elemental affinity gear')
    same(plain(spells.STAFF), staff, 'classic elemental staff item mods')
    damage = dict(effects.table_rows(effects.source(tree, 'scripts/globals/spells/damage_spell.lua'),
                                    'xi.spells.damage.pTable', 'damage spells'))
    enfeebling = dict(effects.table_rows(effects.source(tree, 'scripts/globals/spells/enfeebling_spell.lua'),
                                        'pTable', 'enfeebling spells'))
    songs = dict(effects.table_rows(effects.source(tree, 'scripts/globals/spells/enfeebling_song.lua'),
                                   'pTable', 'songs'))
    status = {name: [x.strip() for x in fields.split(',')] for name, fields in
              re.findall(r'\[xi\.effect\.(\w+)\s*\]\s*=\s*\{([^{}]*)\}', effects.source(tree, STATUS))}
    sql = {row['name']: row for row in effects.sql_rows(tree, 'spell_list')}
    sql_text = (Path(tree) / 'sql/spell_list.sql').read_text(encoding='utf8')
    variables = {name: int(value) for name, value in re.findall(r'SET\s+(@\w+)\s*=\s*(\d+)', sql_text)}

    def check(spell, school, name):
        row = sql[name.lower()]
        element = variables.get(row['element'], row['element'])
        skill = variables.get(row['skill'], row['skill'])
        same(school.skill, skill, name + ' skill')
        if spell.element:
            same(spell.element, elements[element - 1], name + ' element')
        else:
            if elements[element - 1] not in list(spell.elements.values()):
                raise RuntimeError('Source parity failed for ' + name + ' element list.')
        effect = None
        if name in damage:
            same(spell.stat, damage[name][0].split('.')[-1].lower(), name + ' stat')
            same(spell.bonus, int(damage[name][1]), name + ' bonus')
        elif name in enfeebling:
            fields = enfeebling[name]
            effect = fields[0].split('.')[-1]
            same(spell.stat, fields[2].split('.')[-1].lower(), name + ' stat')
            same(spell.bonus, int(fields[8]), name + ' bonus')
        elif name in songs:
            effect = songs[name][0].split('.')[-1]
            same((spell.stat, spell.bonus), ('chr', 0), name + ' song accuracy (guarded helper)')
        else:
            same((spell.stat, spell.bonus), ('int', 0), name + ' accuracy (guarded helper)')
        if effect:
            fields = status[effect]
            same(spell.state, int(fields[0]), name + ' resist state')
            expected = {}
            for key, index, prefix, suffix in [('immune', 5, 'xi.immunity.', ''), ('trait', 6, 'xi.mod.', 'RES'),
                                              ('rank', 7, 'xi.mod.', '_RES_RANK'), ('effect', 8, 'xi.mod.', '_MEVA')]:
                value = fields[index]
                expected[key] = value.removeprefix(prefix).removesuffix(suffix).lower() if value != '0' else None
            if effect == 'SLEEP_I' and spell.element == 'light':
                expected['rank'] = expected['immune'] = 'light_sleep'
            if effect == 'REQUIEM':
                # The core immunity check covers Requiem even though the Lua table leaves it out.
                expected['immune'] = 'requiem'
            for key, value in expected.items():
                same(spell[key], value, name + ' ' + key)

    choices = {'elemental': {f'tier{n}': [name + suffix for name in ('FIRE', 'BLIZZARD', 'AERO', 'STONE', 'THUNDER', 'WATER')]
                            for n, suffix in enumerate(('', '_II', '_III', '_IV'), 1)},
               'enfeebling': {name: [name.upper()] for name in ('slow', 'paralyze', 'silence', 'sleep', 'bind', 'gravity', 'blind', 'poison')},
               'dark': {'bio': ['BIO'], 'drain': ['DRAIN'], 'stun': ['STUN']},
               'divine': {'banish': ['BANISH'], 'flash': ['FLASH'], 'holy': ['HOLY']}, 'healing': {'cure': ['CURE']},
               'ninjutsu': {'ichi': [name + '_ICHI' for name in ('KATON', 'HYOTON', 'HUTON', 'DOTON', 'RAITON', 'SUITON')],
                            **{name: [name.upper() + '_ICHI'] for name in ('kurayami', 'hojo', 'jubaku', 'dokumori')}},
               'singing': {'lullaby': ['FOE_LULLABY'], 'elegy': ['BATTLEFIELD_ELEGY'], 'requiem': ['FOE_REQUIEM']},
               'blue': {'magical': ['FIRESPIT', 'ICE_BREAK', 'SANDSPIN', 'BLITZSTRAHL', 'MAELSTROM', 'DEATH_RAY']}}
    for school_name, school in spells.schools.items():
        for spell in school.spells.values():
            for name in choices[school_name][spell.id]:
                check(spell, school, name)


def check(tree, addon=ADDON):
    from . import info, encounters, danger_crit, danger_effects, danger_jobs, danger_details, danger_attacks
    info.check_source(tree)
    encounters.check_source(tree, aggro.lua_files_loaded(tree))
    danger_crit.check_source(tree)
    danger_effects.check_source(tree)
    danger_jobs.check_source(tree)
    danger_details.check_source(tree)
    danger_attacks.check_source(tree)
    weapons.check_source(tree)
    pdif.check_math(tree, addon)
    defenses.check_math(tree, addon)
    check_guards(tree)
    runtime = check_math(tree, addon)
    check_tables(tree, runtime, addon)
    return 'Source parity passed: magic math, resistance ranks, TH 0-4, spell choices, staves, MEVA caps, pDIF, Defense, Shield and Parry rules, weapon damage, monster facts and encounter guards.'


def check_modifiers(tree, data):
    """Check the generated staff bonuses independently of the modifier reader's field mapping."""
    levels = {row['itemId']: row['level'] for row in sqlfile.rows(str(Path(tree) / 'sql/item_equipment.sql'), 'item_equipment')}
    elements = ['fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark']
    expected = {}
    for row in effects.sql_rows(tree, 'item_mods'):
        if 347 <= row['modId'] <= 354 and levels.get(row['itemId'], 100) <= 75:
            expected.setdefault(row['itemId'], {})['staff_' + elements[row['modId'] - 347]] = row['value']
    actual = {item: {key: value for key, value in row.items() if key.startswith('staff_')}
              for item, row in data['items'].items() if any(key.startswith('staff_') for key in row)}
    same(actual, expected, 'generated elemental staff bonuses')
