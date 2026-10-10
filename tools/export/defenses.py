"""Shield and Parry inputs from the loaded Phoenix rules."""
from pathlib import Path
import hashlib
import re

from . import aggro, content, effects, lua_source, lua_writer, modifiers, overlays, tables

PHYSICAL = 'scripts/combat/physical_utilities.lua'
SKILLS = 'scripts/data/skill_ranks.lua'
SOURCE_GUARD = 'd3e755c1441ef127acaa08f9811097a5e5ae9f956baf1349d2b3c301ffba2956'
PATHS = (PHYSICAL, SKILLS, 'src/map/utils/attackutils.cpp', 'src/map/attack.cpp',
         'src/map/utils/charutils.cpp', 'src/map/utils/mobutils.cpp', 'src/map/utils/battleutils.cpp',
         'src/map/utils/zoneutils.cpp', 'src/map/entities/battle_entity.cpp',
         'src/map/lua/lua_base_entity.cpp', 'src/map/status_effect_container.cpp',
         'src/map/status_effect_container.h', 'src/map/lua/lua_item.cpp',
         'src/map/items/item_equipment.cpp', 'src/map/utils/itemutils.cpp', 'scripts/globals/job_utils/rune_fencer.lua',
         'scripts/globals/job_utils/paladin.lua', 'scripts/globals/job_utils/ninja.lua')
MODS = {'parry': 'parry', 'inquartata': 'inquartata',
        'palisade_block_bonus': 'palisade', 'reprisal_block_bonus': 'reprisal'}
PREVENT = ('sleep_i', 'sleep_ii', 'petrification', 'lullaby', 'charm_i', 'charm_ii',
           'penalty', 'stun', 'terror')


def source_digest(tree):
    root = Path(tree)
    paths = set(PATHS) | set(aggro.lua_files_loaded(str(tree)))
    paths.update(p.relative_to(root).as_posix() for p in (root / 'scripts/effects').glob('*.lua'))
    direct = re.compile(r'xi\.mod\.(?:PARRY|INQUARTATA|PALISADE_BLOCK_BONUS|REPRISAL_BLOCK_BONUS)\b')
    for path in (root / 'scripts').rglob('*.lua'):
        text = path.read_text(encoding='utf8')
        if direct.search(text) and direct.search(lua_source.strip_comments(text)):
            paths.add(path.relative_to(root).as_posix())
    chunks = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in sorted(paths):
        path = root / rel
        if not path.is_file():
            raise RuntimeError('Shield and Parry verification needs ' + rel + '; extract this source again.')
        text = path.read_text(encoding='utf8')
        text = lua_source.strip_comments(text) if rel.endswith('.lua') else re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
        chunks.append(rel + '\n' + ' '.join(text.split()))
    return hashlib.sha256('\n'.join(chunks).encode()).hexdigest()


def check_source(tree):
    if source_digest(tree) != SOURCE_GUARD:
        raise RuntimeError('Shield or Parry source changed; review the rates, skills, equipment and action gates.')


def equipment(tree):
    ids = tables.read_enum(str(tree), 'mod')
    wanted = {ids[name]: field for name, field in MODS.items()}
    items = {row['itemId']: row for row in modifiers.sql_rows(tree, 'item_equipment')}
    shields = {number: {'name': row['name'], 'level': row['level'], 'size': row['shieldSize']}
               for number, row in items.items() if 1 <= row['shieldSize'] <= 6}
    gear = {}
    for table, conditional in [('item_mods', False), ('item_latents', True)]:
        for row in modifiers.sql_rows(tree, table):
            field, item = wanted.get(row['modId']), items.get(row['itemId'])
            if field is None or item is None or item['level'] > 75 or not row['value']:
                continue
            entry = gear.setdefault(row['itemId'], {'name': item['name'], 'level': item['level']})
            if conditional:
                if field != 'parry':
                    raise RuntimeError('A conditional Shield or Parry rate modifier needs a new reader.')
                bounds = entry.setdefault('conditional_parry', {'low': 0, 'high': 0})
                bounds['low'] += min(0, row['value'])
                bounds['high'] += max(0, row['value'])
            else:
                entry[field] = entry.get(field, 0) + row['value']
    return shields, gear


def check_traits(tree, allowed):
    ids = tables.read_enum(str(tree), 'mod')
    wanted = {ids[name] for name in set(MODS) | {'shield'}}
    for row in modifiers.sql_rows(tree, 'traits'):
        if row['modifier'] in wanted and row['value'] and row['level'] <= 75 and allowed.allows(row['content_tag']):
            raise RuntimeError('An enabled Shield or Parry skill/rate trait needs a new reader: ' + row['name'])


def build(tree, roots, allowed=None):
    check_source(tree)
    allowed = allowed or content.Content(True, ['rotz', 'cop', 'toau'])
    check_traits(tree, allowed)
    shields, gear = equipment(tree)
    skill_rows = modifiers.sql_rows(tree, 'skill_ranks')
    ranks = {row['skillid']: row for row in skill_rows}
    jobs = {job: {'block': max(0, min(11, ranks[30][name])),
                  'parry': max(0, min(11, ranks[31][name]))}
            for job, name in enumerate(tables.JOBS) if job}
    skill_text = effects.source(tree, SKILLS)
    base_caps = {int(level): int(value) for level, value in
                 re.findall(r'\[\s*(\d+)\]\s*=\s*\{\s*(\d+)', skill_text)}
    if set(base_caps) != set(range(100)):
        raise RuntimeError('Parry skill caps need a new reader.')
    caps = {level: base_caps[min(level, 99)] + max(0, level - 99) for level in range(256)}
    statuses = overlays.load_merged(tree, roots, 'status_effects')['status_effects']
    status_id = lambda name: statuses[name]['id']
    # The Lua binding takes no ignoreCharm argument, so the native default includes Charm.
    prevent_names = ('Sleep', 'Sleep II', 'Petrification', 'Lullaby', 'Charm', 'Charm II',
                     'Penalty', 'Stun', 'Terror')
    prevent = {status_id(name): label for name, label in zip(PREVENT, prevent_names)}
    unknown = {status_id('palisade'): {'block': True, 'name': 'Palisade'},
               status_id('issekigan'): {'parry': True, 'name': 'Issekigan'},
               status_id('battuta'): {'parry': True, 'name': 'Battuta'}}
    return {'version': 1, 'shield_rates': {1: 55, 2: 40, 3: 45, 4: 30, 5: 50, 6: 100},
            'shields': shields, 'gear': gear, 'job_ranks': jobs, 'parry_caps': caps,
            'prevent_effects': prevent, 'unknown_effects': unknown,
            'reprisal_effect': status_id('reprisal'), 'issekigan_effect': status_id('issekigan'),
            'palisade_effect': status_id('palisade'), 'battuta_effect': status_id('battuta')}


def attack_skill(kind, source_tables, level):
    """The monster's actual main-weapon skill, not Accuracy or the Parry comparison cap."""
    if getattr(kind.effects, 'job_changes', None):
        kind.flags.add('scripted_attack_skill')
    pool = getattr(kind, 'instance_pool', None)
    if pool is not None:
        skill = int(pool['cmbSkill'])
    else:
        raw = (kind.attributes or {}).get('source', {})
        name = (raw.get('combat') or {}).get('skill', 'none')
        skills = {'none': 0, 'hand_to_hand': 1, 'dagger': 2, 'sword': 3, 'great_sword': 4,
                  'axe': 5, 'great_axe': 6, 'scythe': 7, 'polearm': 8, 'katana': 9,
                  'great_katana': 10, 'club': 11, 'staff': 12,
                  'archery': 25, 'marksmanship': 26, 'throwing': 27}
        if name not in skills:
            kind.flags.add('scripted_attack_skill')
            return None
        skill = skills[name]
    if skill in (0, 25, 26, 27):
        return 0
    if 1 <= skill <= 12:
        return source_tables.cap_by_rank(3, min(level, 99))
    kind.flags.add('scripted_attack_skill')
    return None


def write(path, data, stamp):
    lines = ['-- Phoenix Shield and Parry rules for eligible ordinary melee attacks.']
    lines += lua_writer.stamp_lines(stamp)
    lines += ['return {', '    built = %s,' % lua_writer.quote(stamp.built),
              '    content = %s,' % lua_writer.quote(stamp.content)]
    for key, value in data.items():
        if isinstance(value, dict):
            lines.append('    %s = {' % key)
            for number, child in sorted(value.items()):
                lines.append('        [%d] = %s,' % (number, lua_writer.effect_value(child)))
            lines.append('    },')
        else:
            lines.append('    %s = %s,' % (key, lua_writer.effect_value(value)))
    return lua_writer.write_file(path, lines + ['}'])


def check_math(tree, addon):
    """Execute the pinned helpers and compare both rates with the addon."""
    from lupa import luajit21
    runtime = luajit21.LuaRuntime()
    data = build(tree, overlays.data_roots(str(tree)))
    runtime.globals().defense_data = runtime.table_from(data, recursive=True)
    runtime.execute("""
        package.loaded['data.defenses']=defense_data
        local function enum()
            local n=0
            return setmetatable({}, {__index=function(t,k) n=n+1; rawset(t,k,n); return n end})
        end
        xi={combat={physical={}},skill=enum(),skillchainType=enum(),effect=enum(),slot=enum(),
            mod=enum(),job=enum(),physicalAttackType=enum(),data={skillLevel={}}}
        utils={clamp=function(x,a,b) return math.max(a,math.min(b,x)) end}
        xi.data.skillLevel.getSkillCap=function(level) return defense_data.parry_caps[level] end
    """)
    runtime.execute(effects.source(tree, PHYSICAL))
    module = runtime.execute((Path(addon) / 'core/defenses.lua').read_text(encoding='utf8'))
    block = runtime.eval("""function(skill,attacker,size,reprisal,bonus,palisade)
        local defender={isPC=function() return true end,getSkillLevel=function() return skill end,
            getEquippedItem=function() return {isShield=function() return true end,getShieldSize=function() return size end} end,
            getMod=function(_,id) return id==xi.mod.PALISADE_BLOCK_BONUS and palisade or bonus end,
            hasStatusEffect=function() return reprisal end}
        local enemy={isUsingH2H=function() return true end,getSkillLevel=function() return attacker end}
        local rate=xi.combat.physical.calculateBlockRate(defender,enemy)
        return math.min(100,math.max(0,math.floor(rate*100)/100))
    end""")
    parry = runtime.eval("""function(skill,attacker,extra,inquartata,issekigan)
        local defender={isPC=function() return true end,getSkillLevel=function() return skill end,
            getMod=function(_,id) return id==xi.mod.PARRY and extra or inquartata end,
            getILvlParry=function() return 0 end,hasStatusEffect=function() return issekigan~=0 end,
            getStatusEffect=function() return {getPower=function() return issekigan end} end}
        local enemy={isPC=function() return true end,getSkillLevel=function() return attacker end,
            getWeaponSkillType=function() return xi.skill.SWORD end,getILvlSkill=function() return 0 end}
        local rate=xi.combat.physical.calculateParryRate(defender,enemy)
        return math.min(100,math.max(0,math.floor(rate*100)/100))
    end""")
    count = 0
    for skill in (0, 1, 100, 200, 256, 276, 300, 424):
        for enemy in (0, 1, 200, 256, 276, 404, 500):
            for size in range(1, 7):
                for reprisal in (False, True):
                    for bonus, palisade in ((0, 0), (1, 0), (0, 30), (1, 30)):
                        args = skill, enemy, size, reprisal, bonus, palisade
                        expected, actual = block(*args), module.block_rate(*args)
                        if abs(expected - actual) > 1e-9:
                            raise RuntimeError('Shield source parity failed at %r: %r versus %r' % (args, actual, expected))
                        count += 1
            for delta in (-200, -20, -14, -13, -1, 0, 5, 6, 7, 40, 106, 200):
                for extra, inquartata, issekigan in ((0, 0, 0), (10, 0, 0), (-5, 3, 25), (20, 20, 90)):
                    args = enemy + delta, enemy, extra, inquartata, issekigan
                    expected, actual = parry(*args), module.parry_rate(*args)
                    if abs(expected - actual) > 1e-9:
                        raise RuntimeError('Parry source parity failed at %r: %r versus %r' % (args, actual, expected))
                    count += 1
    return count
