"""Source guards for the weapon damage values written with each monster."""
import hashlib
from pathlib import Path
import re

from . import aggro, lua_source
from .lua_source import WEAPON_DAMAGE_MODS

NATIVE = 'src/map/utils/battleutils.cpp'
GUARDS = {
    'PhysicalDmgTaken': '6d490bb46fe4ead7df44c222d7fd7249581f55188bc529cd7aafc03b90fb0f8b',
    'RangedDmgTaken': 'dac4a6f53bcfef4f331bcc9892cc4723771058e17ae7b2a8d44970a25f24a645',
}
MODULE_GUARD = '87feee7e39a6076837dd86ebfe7e7974c2d99ccbb35390dcb46ea006da240cae'


def module_digest(tree):
    """Loaded monster callbacks and modules that name weapon damage rules or modifiers."""
    watch = re.compile(r'onMob\w+|xi\.(?:combat|weaponskills)|physicalDmgTaken|rangedDmgTaken|\b(?:%s)\b'
                       % '|'.join(name.upper() for name in sorted(WEAPON_DAMAGE_MODS)))
    kept = []
    for rel in sorted(aggro.lua_files_loaded(tree)):
        text = lua_source.strip_comments((Path(tree) / rel).read_text(encoding='utf8'))
        if watch.search(text):
            kept.append(rel + ':' + digest(text))
    return digest('\n'.join(kept))


def native_body(text, name):
    match = re.search(r'\bauto\s+' + name + r'\(', text)
    if match is None:
        raise RuntimeError('Weapon damage source no longer has %s' % name)
    start = text.index('{', match.end())
    depth = 0
    for index in range(start, len(text)):
        if text[index] == '{':
            depth += 1
        elif text[index] == '}':
            depth -= 1
            if depth == 0:
                return text[start:index + 1]
    raise RuntimeError('Weapon damage source has an incomplete %s' % name)


def digest(text):
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    return hashlib.sha256(re.sub(r'\s+', '', text).encode()).hexdigest()


def check_source(tree):
    path = Path(tree) / NATIVE
    if not path.is_file():
        raise RuntimeError('Weapon damage verification needs %s; extract this source revision again.' % NATIVE)
    text = path.read_text(encoding='utf8')
    for name, expected in GUARDS.items():
        if digest(native_body(text, name)) != expected:
            raise RuntimeError('Weapon damage source changed in %s; review its exported reductions.' % name)
    expected = {'Piercing': 'PIERCE_SDT', 'Slashing': 'SLASH_SDT', 'Blunt': 'IMPACT_SDT', 'HandToHand': 'HTH_SDT'}
    found = dict(re.findall(r'case xi::DamageType::(\w+):\s*damage = damage \* '
                            r'\(1 \+ PDefender->getMod\(xi::Mod::(\w+)\) / 10000\.0f\);', text))
    if found != expected:
        raise RuntimeError('Weapon damage type mapping changed in battleutils.cpp.')
    if module_digest(tree) != MODULE_GUARD:
        raise RuntimeError('Loaded weapon-damage or monster overrides changed; review the Weapons exporter.')
