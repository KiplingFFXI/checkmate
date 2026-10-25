"""Reads PH lottery rules. The client cannot see whether a lottery is open."""
import ast
from pathlib import Path
import hashlib
import re

from . import aggro, lua_source

CALL = re.compile(r'xi\.mob\.phOnDespawn\s*\(')

# Reviewed modules that change NM cooldowns and respawns.
ERA_TIMERS = 'modules/era/lua/globals/old_nm_respawn_timers.lua'
PERSISTENCE = 'modules/phoenix/lua/custom/pxi_timed_nm_respawn_persistence.lua'
NM_MODULES = {
    ERA_TIMERS: '0fc1cac8a149adcc7de27f772613abe97aba0e95fb5a306689ca133c65dfce6c',
    PERSISTENCE: '99e833335da377afaa831c4ac5caa1ea5c92f450476852a58491e0dad3429334',
}
NM_SCRIPTS = {
    ('Attohwa_Chasm', 'Citipati'): '216b4142232194ea310ec282cab218c349e01a07bb8f19513590aa16a990f825',
    ('Bostaunieux_Oubliette', 'Manes'): 'd45cbbfdf061b2fbc95371d88f97cf8239951228bf581b16f2d9b3a4cab11c1f',
    ('Bostaunieux_Oubliette', 'Shii'): '11eaf50a920601599a5ae2ec87419430dcf920a76159a998110ab0e558f93020',
    ('Rolanberry_Fields', 'Black_Triple_Stars'): '990083259f3460f26c2486c2d8618284ad7dfeddb8bb495604511a1c0c5c5804',
    ('The_Boyahda_Tree', 'Leshonki'): 'ba6f1e634f45160bcebbdf2517cb3a9ae7f023209c81233b8c447c36a77a8001',
}
NM_STATE = re.compile(r'''['"]pop['"]|doNotInvokeCooldown|DESPAWN_''')


def guarded(tree, path, expected):
    text = lua_source.strip_comments((Path(tree) / path).read_text(encoding='utf8'))
    digest = hashlib.sha256(' '.join(text.split()).encode()).hexdigest()
    if expected is None or digest != expected:
        raise RuntimeError('%s changes NM lottery state. Review its cooldown rules before exporting.' % path)
    return text


class NmRules:
    """Apply reviewed NM callbacks after reading the PH's helper call."""

    def __init__(self, tree):
        self.tree, self.checked = tree, set()
        self.cooldowns = {}
        for path in aggro.lua_files_loaded(tree):
            text = lua_source.strip_comments((Path(tree) / path).read_text(encoding='utf8'))
            if path in NM_MODULES or NM_STATE.search(text):
                text = guarded(tree, path, NM_MODULES.get(path))
            if path == ERA_TIMERS:
                body = re.search(r'local lotteryNMs\s*=\s*\{(.*?)\n\}', text, re.S).group(1)
                for zone, mob, cooldown in re.findall(r"\{\s*'([^']+)',\s*'([^']+)',\s*(\d+)\s*\}", body):
                    self.cooldowns[zone, mob] = int(cooldown)

    def apply(self, zone, mob, rule):
        rule = dict(rule, conditions=list(rule['conditions']))
        key = zone, mob
        if key not in self.checked:
            path = 'scripts/zones/%s/mobs/%s.lua' % key
            file = Path(self.tree) / path
            text = lua_source.strip_comments(file.read_text(encoding='utf8')) if file.exists() else ''
            if key in NM_SCRIPTS or NM_STATE.search(text):
                guarded(self.tree, path, NM_SCRIPTS.get(key))
            self.checked.add(key)
        if key in self.cooldowns:
            rule['cooldown_min'] = rule['cooldown_max'] = self.cooldowns[key]
            rule['conditions'].append('This era cooldown ignores the server lottery cooldown multiplier.')
        return rule


def seconds(expression):
    """Bounds of literal seconds, products, utils.hours and math.randomInt. No Lua is run."""
    expression = expression.strip()
    match = re.fullmatch(r'math\.randomInt\((.+),\s*(.+)\)(.*)', expression)
    if match:
        low, high = seconds(match[1]), seconds(match[2])
        tail = match[3].strip()
        scale = seconds('1' + tail) if not tail or tail.startswith('*') else None
        if low and high and scale and low[0] == low[1] and high[0] == high[1] and scale[0] == scale[1]:
            return low[0] * scale[0], high[1] * scale[1]
        return None
    match = re.fullmatch(r'utils\.hours\((.+)\)', expression)
    if match:
        value = seconds(match[1])
        return (value[0] * 3600, value[1] * 3600) if value else None
    try:
        node = ast.parse(expression, mode='eval').body
    except SyntaxError:
        return None

    def literal(node):
        if isinstance(node, ast.Constant) and type(node.value) in (int, float) and node.value >= 0:
            return node.value
        if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Mult):
            return literal(node.left) * literal(node.right)
        raise ValueError('not literal seconds')

    try:
        value = literal(node)
        return value, value
    except ValueError:
        return None


def read(text):
    """One rule per call, including its NM expression. Values the reader cannot resolve stay unknown."""
    found = []
    text = lua_source.strip_comments(text)
    for match in CALL.finditer(text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if len(args) < 4:
            raise RuntimeError('A PH call has no chance or cooldown. The PH rules reader needs updating.')
        rule = {}
        notes = []
        chance = seconds(args[2])
        cooldown = seconds(args[3])
        if chance and chance[0] == chance[1] and 0 <= chance[0] <= 100:
            rule['chance'] = chance[0]
        else:
            notes.append('The lottery chance depends on script state.')
        if cooldown:
            rule['cooldown_min'], rule['cooldown_max'] = cooldown
        else:
            notes.append('The cooldown depends on script state.')
        params = args[4] if len(args) > 4 else ''
        if re.fullmatch(r'\w+', params):
            # Only these assignments describe the helper's known boolean switches.
            params = '\n'.join(re.findall(r'\b' + re.escape(params) + r'\.(\w+\s*=\s*[^\n]+)', text))
        if re.search(r'\bnightOnly\s*=\s*true', params):
            notes.append('The next PH respawn must fall at night (20:00-04:00 Vana\'diel time).')
        if re.search(r'\bdayOnly\s*=\s*true', params):
            # The pinned helper tests hour < 4 AND hour >= 20, so it cannot enforce this option.
            notes.append('Its day-only option is not enforced by this source version.')
        if re.search(r'\bimmediate\s*=\s*true', params):
            notes.append('A successful roll spawns the NM immediately.')
        else:
            notes.append('A successful roll uses the PH respawn delay.')
        # Most scripts just call the helper. These wrappers have reviewed behavior.
        before = text[:match.start()]
        if 'zone:getWeather() == xi.weather.SAND_STORM' in before:
            notes.append('Sandstorm weather is required when the PH despawns.')
        elif re.search(r'\b(if|for|while)\b', before):
            harmless = (re.fullmatch(r'\s*local zone = mob:getZone\(\)\s*if zone then\s*'
                                    r"zone:setLocalVar\('DespotPlaceholderID', mob:getID\(\)\)\s*end\s*", before)
                        or re.fullmatch(r'\s*local params = \{\s*\}\s*if not\s*', before))
            if not harmless:
                notes.append('Additional scripted eligibility applies.')
        rule['conditions'] = notes
        found.append((args[1], rule))
    return found


def check_helper(tree):
    path = Path(tree) / "scripts/globals/mobs.lua"
    text = lua_source.strip_comments(path.read_text(encoding="utf8"))
    digest = hashlib.sha256(" ".join(text.split()).encode()).hexdigest()
    if digest != "2e5497cfd0ab359cb3a3d80b608df5ae130ba10a6d86865db143b2fe234a39aa":
        raise RuntimeError("The PH helper changed. Review lottery, cooldown and time gates before exporting rules.")
