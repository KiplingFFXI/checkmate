"""Pinned physical damage rules and the effects that can change monster Defense."""
import hashlib
from pathlib import Path
import re

from . import aggro, content, danger_effects, effects, lua_source, lua_writer, modifiers, overlays, tables

PHYSICAL = 'scripts/combat/physical_utilities.lua'
ERA = 'modules/era/lua/combat/pdif_caps.lua'
LEVEL = 'scripts/data/level_correction.lua'
NATIVE = 'src/map/entities/battle_entity.cpp'
SOURCE_GUARD = 'a056163e4907e455bf83e2c125e60ba9fe38d42df4114691750baa30e35aef04'


def source_digest(tree):
    root = Path(tree)
    paths = {PHYSICAL, ERA, LEVEL, NATIVE, 'scripts/combat/ranged_utilities.lua',
             'src/map/utils/mobutils.cpp', 'src/map/lua/luautils.cpp', 'src/common/xirand.h',
             'settings/default/main.lua', 'data/enums/zone.yaml'}
    paths.update(aggro.lua_files_loaded(str(tree)))
    paths.update(path.relative_to(root).as_posix() for path in (root / 'scripts/effects').glob('*.lua'))
    chunks = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in sorted(paths):
        path = root / rel
        if not path.is_file():
            raise RuntimeError('pDIF verification needs ' + rel + '; extract this source revision again.')
        text = path.read_text(encoding='utf8')
        text = lua_source.strip_comments(text) if rel.endswith('.lua') else re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
        chunks.append(rel + '\n' + ' '.join(text.split()))
    return hashlib.sha256('\n'.join(chunks).encode()).hexdigest()


def check_source(tree):
    if source_digest(tree) != SOURCE_GUARD:
        raise RuntimeError('pDIF or Defense source changed; review the math, loaded rules and effect flags.')
    if ERA not in aggro.lua_files_loaded(str(tree)):
        raise RuntimeError('The era pDIF cap module is not loaded.')


def effect_inputs(tree, roots):
    """Presence warns about hidden powers; no guessed buff strength changes the estimate."""
    rows = overlays.load_merged(tree, roots, 'status_effects')['status_effects']
    overrides = modifiers.effect_overrides(tree)
    defense, ranged, limits, critical = {}, {}, {}, {}
    for name, row in sorted(rows.items()):
        path = Path(tree) / 'scripts/effects' / (name + '.lua')
        if not path.is_file():
            continue
        text = lua_source.strip_comments(path.read_text(encoding='utf8'))
        funcs = danger_effects.function_parts(text)
        gain = funcs.get('effectObject.onEffectGain', '')
        if name in overrides:
            keeps, replacement = overrides[name]
            gain = (gain if keeps else '') + '\n' + replacement
        # Named local tables also feed dynamic modifiers such as Debilitation.
        declarations = text
        for body in funcs.values():
            declarations = declarations.replace(body, '')
        active = declarations + '\n' + gain + '\n' + funcs.get('effectObject.onEffectTick', '')
        jp_names = re.findall(r'local\s+(\w+)\s*=\s*\w+:getJobPoint\w*\(', active)
        active = '\n'.join(line for line in active.splitlines() if 'getJobPoint' not in line
                           and not any(re.search(r'\b' + re.escape(name) + r'\b', line) for name in jp_names))
        calls = re.findall(r'(?:effect|target):(addMod|setMod)\(\s*([^,]+)', active)
        used = set()
        for _, argument in calls:
            match = re.fullmatch(r'xi\.mod\.([A-Z0-9_]+)', argument.strip())
            if match:
                used.add(match[1])
            else:
                used.update(re.findall(r'xi\.mod\.([A-Z0-9_]+)', declarations))
        label = name.replace('_', ' ')
        if used & {value.upper() for value in lua_source.DEFENSE_MODS} or name == 'counterstance':
            defense[row['id']] = label
        if 'RA_IGNORE_LVL_DIFF' in used:
            ranged[row['id']] = label
        if used & {'DAMAGE_LIMIT', 'DAMAGE_LIMITP'}:
            limits[row['id']] = label
        if used & {'CRIT_DMG_INCREASE', 'RANGED_CRIT_DMG_INCREASE', 'CRIT_DEF_BONUS'}:
            critical[row['id']] = label
    return defense, ranged, limits, critical


def check_cap_inputs(tree, allowed):
    ids = tables.read_enum(str(tree), 'mod')
    cap_mods = {ids['damage_limit'], ids['damage_limitp']}
    for row in modifiers.sql_rows(tree, 'traits'):
        if row['modifier'] in cap_mods and row['value'] and allowed.allows(row['content_tag']):
            raise RuntimeError('An enabled Damage Limit trait needs a pDIF reader.')
    equipped = {row['itemId']: row for row in modifiers.sql_rows(tree, 'item_equipment')}
    for name in ('item_mods', 'item_latents'):
        for row in modifiers.sql_rows(tree, name):
            if row['modId'] in cap_mods and row['value'] and equipped.get(row['itemId'], {}).get('level', 999) <= 75:
                raise RuntimeError('An era equipment Damage Limit modifier needs a pDIF reader.')


def build(tree, roots, allowed=None):
    check_source(tree)
    check_cap_inputs(tree, allowed or content.Content(True, ['rotz', 'cop', 'toau']))
    text = effects.source(tree, ERA)
    caps = {name: int(value) for name, value in re.findall(r'pDifWeaponCapTable\[xi\.skill\.(\w+)\s*\]\s*=\s*(\d+)', text)}
    melee = ['HAND_TO_HAND', 'DAGGER', 'SWORD', 'GREAT_SWORD', 'AXE', 'GREAT_AXE', 'SCYTHE',
             'POLEARM', 'KATANA', 'GREAT_KATANA', 'CLUB', 'STAFF']
    if {caps.get(name) for name in melee} != {2} or {caps.get(name) for name in ('ARCHERY', 'MARKSMANSHIP', 'THROWING')} != {3}:
        raise RuntimeError('pDIF weapon caps need a new reader.')
    zone_ids = tables.read_enum(str(tree), 'zone')
    corrected = {zone_ids[name.lower()]: True for name in re.findall(r'xi\.zone\.(\w+)', effects.source(tree, LEVEL))}
    default = re.search(r'USE_ADOULIN_WEAPON_SKILL_CHANGES\s*=\s*(true|false)',
                        effects.source(tree, 'settings/default/main.lua'))
    if not default:
        raise RuntimeError('The pDIF level-correction setting is missing.')
    defense, ranged, limits, critical = effect_inputs(tree, roots)
    return {'version': 1, 'melee_cap': 2, 'ranged_cap': 3, 'melee_level_step': 3 / 64,
            'ranged_level_step': 3 / 128, 'max_level_gap': 38,
            'source_setting_default': default[1] == 'true', 'level_corrected_zones': corrected,
            'defense_effects': defense, 'ignore_ranged_level_effects': ranged,
            'damage_limit_effects': limits, 'critical_damage_effects': critical}


def write(path, data, stamp):
    lines = ['-- Phoenix physical damage rules. Buff powers and server settings are not known.']
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
    """Compare addon endpoints with actual source calls under every random branch."""
    from lupa import luajit21
    runtime = luajit21.LuaRuntime()
    data = build(tree, overlays.data_roots(str(tree)))
    runtime.globals().pdif_data = runtime.table_from(data, recursive=True)
    runtime.execute("""
        package.loaded['data.pdif'] = pdif_data
        local function enum()
            local n=0
            return setmetatable({}, {__index=function(t,k) n=n+1; rawset(t,k,n); return n end})
        end
        xi={combat={physical={},ranged={attackDistancePenalty=function() return 0 end}},
            skill=enum(),skillchainType=enum(),effect=enum(),slot=enum(),job=enum(),
            mod=enum(),objType=enum(),physicalAttackType=enum(),region=enum(),mobDifficulty=enum(),
            settings={main={BLUE_SKILL_IS_BLUE_ATTACK=false}},expansion=enum(),pre=function() return true end}
        utils={clamp=function(x,a,b) return math.max(a,math.min(b,x)) end}
        package.loaded['modules/module_utils']={}
        Module={new=function() return {addOverride=function(_,name,fn)
            if name=='xi.server.onServerStart' then fn() else xi.combat.physical.wRatioCapPC=fn end
        end} end}
        super=function() end
    """)
    runtime.execute(effects.source(tree, PHYSICAL))
    runtime.execute(effects.source(tree, ERA))
    addon_module = runtime.execute((Path(addon) / 'core/pdif.lua').read_text(encoding='utf8'))
    endpoints = runtime.eval("""function(attack,defense,ownlevel,moblevel,ranged,critical,correction)
        local actor={isPC=function() return true end,isMob=function() return false end,
            isAutomaton=function() return false end,getMod=function() return 0 end,
            getStat=function() return attack end,getMainLvl=function() return ownlevel end}
        local target={getStat=function() return defense end,getMod=function() return 0 end,
            hasStatusEffect=function() return false end,getMainLvl=function() return moblevel end}
        local low,high=math.huge,-math.huge
        local function round(x) return x<0 and math.ceil(x-.5) or math.floor(x+.5) end
        for spike=0,1 do for floor=0,1 do for endpoint=0,1 do for random=0,1 do
            local call=0
            math.randomInt=function(a,b)
                call=call+1
                a,b=round(a),round(b)
                if ranged then return endpoint==0 and a or math.max(a,b) end
                if call==1 then return spike==0 and 1 or 10000 end
                if call==2 then return floor end
                if call==3 then return endpoint==0 and a or math.max(a,b) end
                if call==4 then return random==0 and 0 or 5 end
                error('Unexpected random call in source pDIF')
            end
            local value
            if ranged then
                value=xi.combat.physical.calculateRangedPDIF(actor,target,xi.skill.ARCHERY,1,
                    critical,correction,false,0,false,0)
            else
                value=xi.combat.physical.calculateMeleePDIF(actor,target,xi.skill.SWORD,1,
                    critical,correction,false,0,false,xi.slot.MAIN,false)
            end
            low,high=math.min(low,value),math.max(high,value)
        end end end end
        return low,high
    end""")
    # Include each piecewise boundary and the source's rounded spike threshold.
    ratios = set(range(1, 6001, 37)) | {379, 380, 499, 500, 501, 699, 700, 899, 900,
                                           1099, 1100, 1199, 1200, 1249, 1250, 1499, 1500,
                                           1509, 1510, 1999, 2000, 2439, 2440, 2999, 3000}
    count = 0
    for attack in sorted(ratios):
        for gap in (-10, 0, 1, 5, 20, 38, 50):
            for kind in ('main', 'offhand', 'ranged'):
                for critical in (False, True):
                    for correction in (False, True):
                        expected = endpoints(attack, 1000, 75, 75 + gap, kind == 'ranged', critical, correction)
                        actual = addon_module.bounds(attack, 1000, 75, 75 + gap, kind, critical, correction)
                        if any(abs(actual[key] - value) > 1e-9 for key, value in zip(('low', 'high'), expected)):
                            raise RuntimeError('pDIF source parity failed at %r: addon %r, source %r.' %
                                               ((attack, gap, kind, critical, correction),
                                                (actual.low, actual.high), expected))
                        count += 1
    return count
