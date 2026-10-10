"""Reads PH lottery rules. The client cannot see whether a lottery is open."""
import ast
from pathlib import Path
import hashlib
import re

from . import aggro, lua_source

CALL = re.compile(r'xi\.mob\.phOnDespawn\s*\(')

# These loaded modules can replace the helper's cooldown from the NM side.
ERA_TIMERS = 'modules/era/lua/globals/old_nm_respawn_timers.lua'
PERSISTENCE = 'modules/phoenix/lua/custom/pxi_timed_nm_respawn_persistence.lua'
NM_MODULES = {
    ERA_TIMERS: '0ee28751acdca6103e51ee2cb3d5e2b16f8eb18c15593fb60e79293dd26cad98',
    PERSISTENCE: '5d3036e1f0221ad657fbe56620f1f24d3d88723aa62e9c1622622bdb0d27f5ed',
}
NM_SCRIPTS = {
    ('Attohwa_Chasm', 'Citipati'): '40f5e21066e3e258d56b184ce6a0f4b773879513b39427e4d0cf49bed2b874d4',
    ('Bostaunieux_Oubliette', 'Manes'): 'e1b372355e0440815cb21fbbde75b244d67b0a69f2656ef82751832c5005e285',
    ('Bostaunieux_Oubliette', 'Shii'): '263676c036c56998bc48ea917b0479a308d37451b1f6f9129996175446a49d0c',
    ('Rolanberry_Fields', 'Black_Triple_Stars'): '7f574030563107f74b607c666cb99dccf7b6107a5e7a89e639b5bec6ed2ac6e7',
    ('The_Boyahda_Tree', 'Leshonki'): '88c0dd578ca39d67d84c71eb64765dfe7353a38fd3dae2cee64e9a8a8b65bc48',
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
        self.cooldowns, self.persistent = {}, False
        for path in aggro.lua_files_loaded(tree):
            text = lua_source.strip_comments((Path(tree) / path).read_text(encoding='utf8'))
            if path in NM_MODULES or NM_STATE.search(text):
                text = guarded(tree, path, NM_MODULES.get(path))
            if path == ERA_TIMERS:
                body = re.search(r'local lotteryNMs\s*=\s*\{(.*?)\n\}', text, re.S).group(1)
                for zone, mob, cooldown in re.findall(r"\{\s*'([^']+)',\s*'([^']+)',\s*(\d+)\s*\}", body):
                    self.cooldowns[zone, mob] = int(cooldown)
                # Later table.insert calls are WotG-only, outside the enabled row set.
            if path == PERSISTENCE:
                self.persistent = True

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
        if key in NM_SCRIPTS and mob != 'Leshonki':
            rule['conditions'].append('This cooldown starts only after a kill; a natural despawn skips it.')
        # Leshonki's source checks NIGHT and MIDNIGHT at once, so its skip never runs.
        if self.persistent and key == ('Jugner_Forest', 'Fradubio'):
            rule['cooldown_min'] = rule['cooldown_max'] = 75600
            rule['conditions'].append('Its cooldown deadline is saved across server restarts.')
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
