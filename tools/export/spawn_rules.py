"""Native lottery slots and the ferry deck spawner."""
import hashlib
from pathlib import Path
import re

from . import aggro, battlefields, lua_source


FERRY = 'scripts/globals/ferry.lua'
FERRY_GUARD = '726b6ddade4a8b2ae4a551436db850bea2c3def81a5ecc17c047249eca2ea16f'
FERRY_ZONES = {
    'Open_sea_route_to_Al_Zahbi', 'Open_sea_route_to_Mhaura',
    'Ship_bound_for_Mhaura', 'Ship_bound_for_Mhaura_Pirates',
    'Ship_bound_for_Selbina', 'Ship_bound_for_Selbina_Pirates',
    'Silver_Sea_route_to_Al_Zahbi', 'Silver_Sea_route_to_Nashmau',
}
FERRY_ROUTES = {
    'Open_sea_route_to_Al_Zahbi': '0e57ab1e7589163ba1e00b7bd23ea607fa32f20603c3c0a9bc32c3bcc51aae37',
    'Open_sea_route_to_Mhaura': '80d24344da1863c87129d5b6ead9735e891bbd864c36721c610430e7b297a3af',
    'Ship_bound_for_Mhaura': '091ae411504b12e448376c08e6314110c4fb140f74a0aa33cc43b280ebfa792b',
    'Ship_bound_for_Mhaura_Pirates': '614a41beadf302df547d6573b2f85554286860650975bb4ed2ea07d2ae7b24d6',
    'Ship_bound_for_Selbina': 'f236327e9e1627b38d4bc1b8fa0711e4dcf88c1598699e057cc68b4c76f8ee78',
    'Ship_bound_for_Selbina_Pirates': '718c48132f66bcd9a5efdbe3051afb579b0fc3fe24f92f70b3489e74ef506f49',
    'Silver_Sea_route_to_Al_Zahbi': 'a1053c63d6a74059c379f275f41a7860615049f7ef2bcd307d0e7d2a09325af9',
    'Silver_Sea_route_to_Nashmau': '3b650056474aa0bad87df584fdf05b68bc69a55267f6c6f9344cd74fd3b373be',
}


def digest(text):
    return hashlib.sha256(' '.join(lua_source.strip_comments(text).split()).encode()).hexdigest()


def ferry_entries(text, keys):
    """Only entries passed to the registered ferry tick count as deck spawns."""
    text = lua_source.strip_comments(text)
    handler = re.search(r'zoneObject\.onZoneTick\s*=\s*function\(zone\)\s*'
                        r'xi\.ferry\.onZoneTick\(zone,\s*(\w+)\)\s*end', text)
    if not handler:
        raise RuntimeError('The ferry tick has an unreadable slot table.')
    name = handler[1]
    declarations = list(re.finditer(r'\blocal\s+' + re.escape(name) + r'\s*=\s*\{', text))
    if len(declarations) != 1:
        raise RuntimeError('The ferry slot table is ambiguous.')
    body = lua_source.block(text, declarations[0].end() - 1, 'ferry slots')
    out = {}
    for entry in battlefields.entries(body):
        fields = battlefields.fields(entry.strip()[1:-1])
        if set(fields) - {'id', 'night', 'weather'}:
            raise RuntimeError('The ferry slot has unreadable conditions.')
        match = re.fullmatch(r'ID\.mob\.(\w+)(?:\[(\d+)\])?', fields.get('id', ''))
        if not match:
            raise RuntimeError('The ferry slot has an unreadable monster ID.')
        ids = keys.get(match[1], [])
        selected = int(match[2]) - 1 if match[2] else 0
        if not ids or selected >= len(ids) or (not match[2] and len(ids) != 1):
            raise RuntimeError('The ferry slot does not select one known monster ID.')
        if 'night' in fields and fields['night'] != 'true':
            raise RuntimeError('The ferry night condition is unreadable.')
        weather = fields.get('weather')
        weather_names = []
        if weather:
            if not weather.startswith('{') or not weather.endswith('}'):
                raise RuntimeError('The ferry weather list is unreadable.')
            for value in battlefields.entries(weather[1:-1]):
                found = re.fullmatch(r'xi\.weather\.(\w+)', value.strip())
                if not found:
                    raise RuntimeError('The ferry weather list is unreadable.')
                weather_names.append(found[1].replace('_', ' ').title())
        notes = ['The ferry shares a deck-spawn roll every 60 seconds; a successful spawn delays the next roll to 180 seconds.',
                 'The deck lottery chance depends on how many deck monsters are already up. It is not this monster\'s individual chance.']
        if 'night' in fields:
            notes.append('Can join the deck lottery from 20:00 to 03:59 Vana\'diel time.')
        if weather_names:
            notes.append('Requires %s weather. Elementals roll only when the regular deck lottery does not spawn a monster.' % ' or '.join(weather_names))
            notes.append('Despawns when its matching weather ends.')
        elif 'night' not in fields:
            notes.append('The ferry schedules despawn 210-630 seconds after this deck spawn.')
        notes.append('The ferry clears its monsters at the end of the voyage.')
        if ids[selected] in out:
            raise RuntimeError('The ferry slot repeats a monster ID.')
        out[ids[selected]] = {'value': 'Ferry deck lottery', 'notes': notes, 'ferry': True}
    return out


class Reader:
    def __init__(self, tree):
        self.tree, self.cache, self.checked = Path(tree), {}, False

    def ferry(self, script_dir, keys):
        if script_dir in self.cache:
            return self.cache[script_dir]
        path = self.tree / 'scripts/zones' / script_dir / 'Zone.lua'
        text = path.read_text(encoding='utf8') if path.is_file() else ''
        if script_dir in FERRY_ROUTES and digest(text) != FERRY_ROUTES[script_dir]:
            raise RuntimeError('The ferry route changed; review its spawn callbacks: ' + script_dir)
        if 'xi.ferry.onZoneTick' not in lua_source.strip_comments(text):
            self.cache[script_dir] = {}
            return {}
        if script_dir not in FERRY_ZONES:
            raise RuntimeError('Review the new ferry route ' + script_dir)
        if not self.checked:
            if digest((self.tree / FERRY).read_text(encoding='utf8')) != FERRY_GUARD:
                raise RuntimeError('The ferry deck rules changed; review their spawn conditions.')
            for relative in aggro.lua_files_loaded(self.tree):
                loaded = lua_source.strip_comments((self.tree / relative).read_text(encoding='utf8'))
                if 'xi.ferry' in loaded or any('xi.zones.' + zone + '.Zone.' in loaded for zone in FERRY_ZONES):
                    raise RuntimeError('A loaded module changes ferry callbacks: ' + relative)
            self.checked = True
        self.cache[script_dir] = ferry_entries(text, keys)
        return self.cache[script_dir]


def native_slots(document, placed):
    """Return PH pairs and per-member notes from the merged native slot definitions."""
    placed = set(placed)
    pairs, facts = [], {}
    seen = set()
    for slot in document.get('slots') or []:
        if not isinstance(slot, dict) or set(slot) != {'members'}:
            raise RuntimeError('A native spawn slot has unreadable fields.')
        members = slot.get('members') or {}
        if not isinstance(members, dict) or seen.intersection(members):
            raise RuntimeError('Native spawn slots repeat a member or have an unreadable member map.')
        seen.update(members)
        if any(not isinstance(key, int) or not isinstance(value, dict) or set(value) - {'chance', 'cooldown'}
               for key, value in members.items()):
            raise RuntimeError('A native lottery slot has unreadable members.')
        for value in members.values():
            if any(type(value.get(key, 0)) is not int or value.get(key, 0) < 0 for key in ('chance', 'cooldown')):
                raise RuntimeError('A native lottery slot has unreadable chance or cooldown.')
        if not any(value.get('chance', 0) for value in members.values()):
            continue
        if sum(value.get('chance', 0) for value in members.values()) > 100:
            raise RuntimeError('A native lottery slot exceeds 100 percent.')
        if not any(not value.get('chance', 0) for value in members.values()):
            raise RuntimeError('A native lottery slot has no fallback member.')
        placeholders = [key for key, value in members.items() if not value.get('chance', 0) and key in placed]
        for nm, value in members.items():
            chance = value.get('chance', 0)
            if not chance or nm not in placed:
                continue
            cooldown = value.get('cooldown', 0)
            conditions = ['This native slot rolls only when empty and eligible; only one member can be up.',
                          'A placeholder takes the first roll after a server restart. Time and weather checks still apply.',
                          'A scripted or deaggro respawn can keep the same member instead of rerolling the slot.']
            rule = {'chance': chance, 'cooldown_min': cooldown, 'cooldown_max': cooldown,
                    'conditions': conditions}
            for ph in placeholders:
                pairs.append((ph, nm, rule))
            facts[nm] = {'value': 'Lottery', 'notes': [
                'Native slot chance: %d%% on an eligible reroll.' % chance,
                'The member cooldown is %d seconds after despawn; it does not reveal the current spawn window.' % cooldown,
                *conditions]}
    return pairs, facts
