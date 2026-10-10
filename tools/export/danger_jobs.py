"""Status buffs a monster can obtain through its effective encounter code."""
import hashlib
from pathlib import Path
import re

from . import aggro, danger_crit, danger_effects, lua_source

STATUSES = {'MIGHTY_STRIKES', 'AZURE_LORE', 'EFFLUX', 'CHAIN_AFFINITY', 'SNEAK_ATTACK', 'BLOOD_WEAPON'}
DEFAULTS = {'war': 'MIGHTY_STRIKES', 'blu': 'AZURE_LORE', 'drk': 'BLOOD_WEAPON'}
ABILITIES = {'MIGHTY_STRIKES_1': 'MIGHTY_STRIKES', 'MIGHTY_STRIKES_MAAT': 'MIGHTY_STRIKES',
             'MIGHTY_STRIKES_AUTOMATON': 'MIGHTY_STRIKES', 'AZURE_LORE': 'AZURE_LORE',
             'AZURE_LORE_RAUBAHN': 'AZURE_LORE', 'BLOOD_WEAPON_1': 'BLOOD_WEAPON',
             'BLOOD_WEAPON_MAAT': 'BLOOD_WEAPON', 'BLOOD_WEAPON_IXDRK': 'BLOOD_WEAPON'}
IDS = {688: 'MIGHTY_STRIKES', 1008: 'MIGHTY_STRIKES', 2939: 'MIGHTY_STRIKES',
       1933: 'AZURE_LORE', 2006: 'AZURE_LORE', 695: 'BLOOD_WEAPON',
       1015: 'BLOOD_WEAPON', 2249: 'BLOOD_WEAPON'}
GUARDS = {
    'scripts/mixins/job_special.lua': '6e578870a225d6a8900de4a4861137f14c02a7c7f46d4257fa9b41587d354557',
    'scripts/enum/mob_skill.lua': '994d405e58536e0562cd5919836d97b233b036b3d5bff0145251b25f808ab0ff',
    'scripts/globals/dynamis/dynamis_mobinfo.lua': 'cb01a238320f744784bb38478d0f516a5e6bd7b4956e44d6ab86c96f9972d176',
    'scripts/zones/AlTaieu/mobs/Absolute_Virtue.lua': '3d2464d301b360f3b0ace6cb508429ca0c15749fa0eefbbfbd6492bd3f46cc36',
    'scripts/zones/Dynamis-Xarcabard/mobs/Dynamis_Lord.lua': '1920e35de7eaafc99cf7d92465c38156f804b5396f2411a4a108b1f6337aee6d',
    'scripts/zones/Grand_Palace_of_HuXzoi/mobs/Ixghrah.lua': '3d16f2bdb0ab84321f5fa0dd0227bf33db5bc33fefba6f01ca70da098aba19c4',
    'scripts/zones/Monarch_Linn/mobs/Hotupuku.lua': 'cbf01706e74caa071332d1c7629f812c766a0f296afa30a4856bedacd3fc6bbe',
    'scripts/zones/Waughroon_Shrine/mobs/Osschaart.lua': '9c6b6fea8a7903bae528880e1611f3437c8a58f187e66bc4d4a6b04a9547b7a6',
    'scripts/zones/Mine_Shaft_2716/mobs/Fantoccini.lua': '8255cc0df3b660802bcecef52368785f45264e88d677512b8bbb255245d302a9',
    'scripts/globals/dynamis/zonemechs/buburimu.lua': '65d2fd3dd8438643e54dd2bff6d6907208db0fc1034d09ec9586ebb86392926b',
    'modules/phoenix/dynamis/lua/dynamis_overrides.lua': '40a7f3dac6b13789d48a036f19c61f2db9061211526646ad641cfdf78a067b5b',
}

# Each path has a reviewed table-to-useMobAbility route. The effective callback must retain that route.
ROUTES = {
    ('AlTaieu', 'Absolute_Virtue'): ('MIGHTY_STRIKES', (r'xi\.av\.sps\s*=', r'mob:useMobAbility\(sp\)'),
        'Mighty Strikes is possible while its special remains unlocked.'),
    ('Dynamis-Xarcabard', 'Dynamis_Lord'): ('MIGHTY_STRIKES', (r'local specialTable\s*=', r'mob:useMobAbility\(special\.skill\)'),
        'Mighty Strikes is possible through the encounter special sequence.'),
    ('Grand_Palace_of_HuXzoi', 'Ixghrah'): ('MIGHTY_STRIKES', (r'local formConfig\s*=', r'mob:useMobAbility\(formConfig\[mob:getAnimationSub\(\)\]\[2\]\)'),
        'Mighty Strikes is possible in spider form at the special-ability threshold.'),
    ('Monarch_Linn', 'Hotupuku'): ('MIGHTY_STRIKES', (r'local twoHours\s*=', r'mob:useMobAbility\(twoHours\['),
        'Mighty Strikes is one possible random special.'),
    ('Waughroon_Shrine', 'Osschaart'): ('MIGHTY_STRIKES', (r'local twoHourAbilities\s*=', r"mob:setLocalVar\('copiedTwoHour', twoHour\.abilityId\)", r'mob:useMobAbility\(copiedTwoHour\)'),
        'Mighty Strikes is possible after copying a charmed Warrior.'),
    ('Mine_Shaft_2716', 'Fantoccini'): ('MIGHTY_STRIKES', (r'local jobTable\s*=', r'mob:useMobAbility\(jobInfo\.twoHour\)'),
        'Mighty Strikes is possible in the Warrior form selected from the initiator.'),
    # The guarded loaded module attaches onApocFight through specialMobHooks.
    ('Dynamis-Buburimu', 'Apocalyptic_Beast'): ('MIGHTY_STRIKES', (r'xi\.dynamis\.mobInfo\(mob\)',),
        'Mighty Strikes is possible while its Bloodspiller lockout remains open.'),
}


def check_source(tree, loaded=None):
    tree = Path(tree)
    for rel, expected in GUARDS.items():
        path = tree / rel
        if not path.is_file() or hashlib.sha256(path.read_text(encoding='utf8').encode()).hexdigest() != expected:
            raise RuntimeError('%s changed; review monster status-buff availability' % rel)
    loaded = aggro.lua_files_loaded(str(tree)) if loaded is None else loaded
    if 'modules/phoenix/dynamis/lua/dynamis_overrides.lua' in GUARDS and 'modules/phoenix/dynamis/lua/dynamis_overrides.lua' not in loaded:
        raise RuntimeError('Dynamis encounter hooks are no longer loaded; review monster status-buff availability')
    for rel in loaded:
        text = lua_source.strip_comments((tree / rel).read_text(encoding='utf8'))
        if re.search(r'xi\.mix\.jobSpecial|g_mixins\.job_special|\[jobSpecial\]', text):
            raise RuntimeError('%s changes job specials; review monster status-buff availability' % rel)


def ability_status(expression):
    expression = expression.strip()
    if expression.isdigit():
        return IDS.get(int(expression))
    match = re.fullmatch(r'xi\.mobSkill\.(\w+)', expression)
    return ABILITIES.get(match[1]) if match else None


def job_text(text, job):
    """Remove branches excluded by this monster's fixed main job, leaving other conditions possible."""
    aliases = set(re.findall(r'\blocal\s+(\w+)\s*=\s*mob:getMainJob\(\)', text))
    aliases.add('mob:getMainJob()')
    def condition(value):
        for alias in sorted(aliases, key=len, reverse=True):
            value = re.sub(re.escape(alias) + r'\s*(==|~=)\s*xi\.job\.(\w+)',
                           lambda m: str((job == m[2].lower()) == (m[1] == '==')), value)
        if not re.fullmatch(r'[()\s]*(?:(?:True|False|and|or|not)[()\s]*)+', value):
            return None
        try:
            return bool(eval(value, {'__builtins__': {}}, {}))
        except (SyntaxError, NameError):
            return None
    stack, out, returned = [], [], False
    for line in text.splitlines(keepends=True):
        stripped = line.strip()
        indent = len(line) - len(line.lstrip())
        if indent == 0 and re.search(r'\bfunction\b', stripped):
            stack, returned = [], False
        if re.match(r'(?:end|until)\b', stripped):
            stack = [entry for entry in stack if entry[0] < indent]
        branch = re.match(r'(if|elseif)\s+(.+?)\s+then\s*$', stripped)
        if branch or stripped == 'else':
            if branch and branch[1] == 'if':
                result = condition(branch[2])
                stack.append((indent, result, result is True))
            elif stack and stack[-1][0] == indent:
                previous = stack.pop()
                result = condition(branch[2]) if branch else True
                current = False if previous[2] else result
                stack.append((indent, current, previous[2] or result is True))
        elif stripped == 'if' or re.match(r'(?:for|while|repeat)\b', stripped) or (
                indent > 0 and re.search(r'\bfunction\s*\([^)]*\)\s*$', stripped)):
            stack.append((indent, None, False))
        active = not returned and all(entry[1] is not False for entry in stack)
        out.append(line if active else re.sub(r'[^\n]', ' ', line))
        if active and re.match(r'return\b', stripped) and all(entry[1] is True for entry in stack):
            returned = True
    return ''.join(out)


def available_statuses(kind, attrs, kit_text, skill_facts):
    """Return proven possible buffs and notes about conditional or unreadable routes."""
    statuses, notes = set(), []
    for facts in skill_facts.values():
        statuses.update(set(facts.get('grants_statuses') or ()) & STATUSES)
        if facts.get('grants_mighty_strikes'):
            statuses.add('MIGHTY_STRIKES')
    jobs = attrs.get('jobs') or getattr(kind, 'jobs', ())
    job = str(jobs[0]).lower() if jobs else ''
    text = lua_source.strip_comments(kit_text)
    functions = danger_effects.function_parts(text)
    attached = ('g_mixins.job_special' in functions or
                'job_special' in (list(getattr(getattr(kind, 'effects', None), 'mixins', ())) +
                                  list(getattr(kind, 'group_mixins', ()))))
    for name in ('g_mixins.job_special', 'xi.mix.jobSpecial.config'):
        text = text.replace(functions.get(name, '\0'), '')
    text = job_text(text, job)
    # Checks and effect-name tables are not grants.
    statuses.update(danger_crit.grants_statuses(text))
    for match in re.finditer(r'\b(?:mob|mobArg|actor):useMobAbility\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if args and (status := ability_status(args[0])):
            statuses.add(status)
    route = ROUTES.get((getattr(kind, 'zone_dir', ''), getattr(kind, 'script', '')))
    if route and all(re.search(pattern, text) for pattern in route[1]):
        statuses.add(route[0])
        notes.append(route[2])
        if getattr(kind, 'script', '') == 'Fantoccini' and 'xi.mobSkill.AZURE_LORE' in text:
            statuses.add('AZURE_LORE')
            notes.append('Azure Lore is possible in the Blue Mage form selected from the initiator.')
    if not attached:
        return statuses, notes
    configurations = []
    for match in re.finditer(r'xi\.mix\.jobSpecial\.config\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        prefix = text[text.rfind('\n', 0, match.start()) + 1:match.start()]
        conditional = len(prefix) - len(prefix.lstrip()) > 4
        if args and len(args) == 2 and args[0] in ('mob', 'mobArg', 'actor'):
            configurations.append((args[1], conditional))
        else:
            configurations.append(('unknown', True))
    blocked = bool(re.search(r"mob:setLocalVar\(\s*['\"]\[jobSpecial\]chance['\"]\s*,\s*0\s*\)", text))
    if re.search(r"mob:removeListener\(\s*['\"]JOB_SPECIAL_(?:SPAWN|ENGAGE|CTICK)['\"]", text):
        blocked = True
    explicit, replaced, unknown = set(), False, False
    for config, conditional in configurations:
        if not config.startswith('{'):
            unknown = True
            continue
        if re.search(r'\bchance\s*=\s*0\s*[,}]', config):
            blocked = True
            unknown |= conditional
        special = re.search(r'\bspecials\s*=\s*', config)
        if not special:
            continue
        replaced = True
        unknown |= conditional
        tail = config[special.end():].lstrip()
        if not tail.startswith('{'):
            unknown = True
            continue
        payload = lua_source.block(tail, 0, 'job special list')
        current = set()
        for entry in re.finditer(r'\bid\s*=\s*([^,}\n]+)', payload):
            if status := ability_status(entry[1]):
                entry_end = payload.find('}', entry.end())
                if not re.search(r'\bhpp\s*=\s*0\s*[,}]', payload[entry.start():entry_end + 1] + '}'):
                    current.add(status)
        explicit = explicit | current if conditional else current
    if not blocked:
        statuses.update(explicit)
        if not replaced and not unknown and not re.search(r'\bchangeJob\s*\(', text):
            if status := DEFAULTS.get(job):
                statuses.add(status)
    if unknown or re.search(r'\bchangeJob\s*\(', text):
        notes.append('Some job-special buff choices depend on script values that could not be resolved.')
    return statuses, list(dict.fromkeys(notes))


def mighty_strikes(kind, attrs, kit_text, skill_facts):
    statuses, notes = available_statuses(kind, attrs, kit_text, skill_facts)
    return 'MIGHTY_STRIKES' in statuses, notes


def has_mighty_strikes(kind, attrs, kit_text, skill_facts):
    return mighty_strikes(kind, attrs, kit_text, skill_facts)[0]
