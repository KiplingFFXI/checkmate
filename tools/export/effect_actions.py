"""Action-specific status durations. Unreadable durations stay unknown."""
from pathlib import Path
import hashlib
import re

from . import lua_source

HELPERS = {
    'modules/module_utils.lua': 'e6a96f7f7a73e02a53a436440524b67ae94735e3488ac1466455a18a19919b5c',
    'scripts/globals/bluemagic.lua': 'd71f8797b10f6e9a5849cfd2b60001be1831ebb6a82b130cd0723185c6c3ee28',
    'scripts/globals/weaponskills.lua': '2934a6720464b53e5a80f45198b6165df5461be378af7726d6635e3501e81d61',
    'scripts/globals/spells/absorb_spell.lua': 'ab296eede4669210021dfb043bd951c1392934c670416b07eddee9cec46e5037',
    'src/map/action/action.h': '6013e5670f23c0d2b631fe16afb39e983251fa6654dc7b8cff7792ed3cf2ca3c',
    'src/map/enums/action/react_kind.h': '452e4a905923fca0826cfee8c12847da8602adab3854b5f2729cb0ec43a7211c',
    'src/map/utils/messageutils.cpp': 'c72873a032924975eaf58d7fab209e4945991d57d528ec420020b20e7496e3d3',
    'src/map/utils/messageutils.h': '5972e4d1f00bd8fe2b842985f7498710afe3194440cb12175a9a2eab681fd1c2',
    'src/map/ai/states/item_state.cpp': 'cc21468e41ddbd63047182c439dcaaea5b0a49d280e21619f61bcf80c0a5c402',
    'scripts/items/bottle_of_psychoanima.lua': 'e082eed36c9e035eb47d6887e5c3795d756b9a163c916fb51a8f2feaddeb9191',
    'scripts/items/bottle_of_hysteroanima.lua': '06e74783db97094297d7ed01f3b49a6803daf69e2421c47f9dedad5e7cf6848e',
    'scripts/items/ccb_polymer_pump.lua': '65555714957c34b49ea1dd1bf0bdead61a67bd9acb3978bfe00c79ccaae6c333',
    'scripts/effects/tomahawk.lua': '0dd0db89f80863b0247d7bf0545cea0e34edbbb9575816d61c4b28d43b99c104',
    'scripts/enum/msg.lua': '4fbd7753ff4c7215bf86b3bc1472e1a51e43d696b66aee125a8c5d569dc29546',
}
MODULES = '2b790caf960a502e5e9871b4c3d41c53eab3ed0d428fd7107a94af52798ecf59'
NATIVE = {
    ('src/map/data/datasets/weapon_skills/dataset.cpp', 'Dataset::decode'):
        '27adae6e7df9c1d335385ce7fbca228affad7580a7fe2235e782fe7773c2761e',
    ('src/map/entities/battle_entity.cpp', 'CBattleEntity::OnWeaponSkillFinished'):
        '5099715f498c5c65327078f302bf25ffed3dba6413e3219b013222510b8905c6',
    ('src/map/packets/entity_update.cpp', 'CEntityUpdatePacket::updateWith'):
        'd8d8c8ff6598479391d43356ce514b55e9ebdc0ef8c2b01bded33261d95cfdd2',
    ('src/map/entities/pet_entity.cpp', 'CPetEntity::OnPetSkillFinished'):
        '97327a2093a2dac9dd7fbc4faf3d23e9d03ff0225583ce725067e28a28f5566d',
    ('src/map/entities/battle_entity.cpp', 'CBattleEntity::OnMobSkillFinished'):
        '665f5b70e8806b8926619adbcee9bb195093920ac001a24707ba49b352c75260',
    ('src/map/petskill.cpp', 'CPetSkill::getSkillFinishCategory'):
        '5553c31dee7f3258ee814d02709df777e74b558f4a2e405a8f67a3ac39c09864',
    ('src/map/entities/char_entity.cpp', 'CCharEntity::OnItemFinish'):
        'ccdd97505b65ff9a93036a27f09f016b7f65666f0b02ca23b4dfed9f4dbe7af7',
    ('src/map/entities/char_entity.cpp', 'CCharEntity::OnAbility'):
        '8b873ee56df1d09abbf49daba683e6175ddca5660ef7d5cb3dbd38c87508b9a8',
    ('src/map/entities/battle_entity.cpp', 'CBattleEntity::OnAttack'):
        'dfe6a673ac7ba108f762f83fc78a268f3edb5e89718d1b1b71cca113435a6c76',
    ('src/map/utils/battleutils.cpp', 'HandleSpikesStatusEffect'):
        'c74146269ae1f2303d14ab1e32c971b9a62608731ee70ab2f7fa265fbb7f38f7',
    ('src/map/utils/battleutils.cpp', 'HandleSpikesDamage'):
        '8a42a4aeefeb0ef9f4cb75f18ed582ea69f642668ebf444725517899ef9a2627',
    ('src/map/utils/battleutils.cpp', 'HandleSpikesEquip'):
        '2a483e09829c6d0c321d1d3909c6533ff0aa2bb293d60360d78867b0e32ed2ef',
    ('src/map/lua/luautils.cpp', 'OnItemUse'):
        '407d1afdc51f0bc3c7d29ece4c9318f6481af6d9154f29951d22e825a024ef1d',
}
INFERENCE_GUARD = 'c14fb49005ebf554baf366be2f0044a8d1563e98571e5cabc8332fccc913e03e'

NAMESPACE_GUARDS = {
    'src/map/data/yaml/enum_token.h':
        '968ac895da0d2e5f24465610f407a6e9a13f428cedb4fdd5f3f98c96a32251a6',
    'src/common/enum_traits.h':
        '3c8b708b52defe7a84301f3117127455a64d5de4f144c363339418b307425094',
    'tools/codegen/enum_codegen.py':
        '9f502bb4be7c3f8fab112464cf2e39779a5a1675756ce2a2ce49342b682b97ea',
    'tools/codegen/common.py':
        '38296a284ff0494b87f465c07d489290c6d56f226e9c350eae96d223c97a08f6',
    'tools/codegen/templates/enum.h.j2':
        '692e73aa7396abb6e916fb77cd5d20ee1bc458a5ec2a32890cbdc6cb136c5a4f',
}


def inference_digest(tree):
    """Keep the reviewed damage and target checks tied to their source scripts."""
    from . import effects
    paths = set()
    for folder in ('scripts/actions/weaponskills', 'scripts/actions/spells/blue',
                   'scripts/actions/abilities', 'scripts/globals/job_utils', 'scripts/items'):
        paths.update(Path(tree, folder).rglob('*.lua'))
    # Jug-pet abilities can forward their whole action to a monster skill.
    paths.update(Path(tree, 'scripts/actions/mobskills').glob('*.lua'))
    rows = [(path.relative_to(tree).as_posix(), effects.fingerprint(path.read_text(encoding='utf8')))
            for path in paths]
    return hashlib.sha256('\n'.join(name + ' ' + digest for name, digest in sorted(rows)).encode()).hexdigest()


def check_source(tree, loaded):
    from . import effects
    from .encounters import native_digest
    for path, digest in NAMESPACE_GUARDS.items():
        if effects.fingerprint(Path(tree, path).read_text(encoding='utf8')) != digest:
            raise RuntimeError(path + ' changed. Review the weapon-skill YAML namespace.')
    for path, digest in HELPERS.items():
        if effects.fingerprint(effects.source(tree, path)) != digest:
            raise RuntimeError(path + ' changed. Review action-specific Effects durations.')
    for (path, name), digest in NATIVE.items():
        if native_digest(Path(tree, path).read_text(encoding='utf8'), name) != digest:
            raise RuntimeError(path + ' changed. Review Effects action namespaces.')
    pattern = re.compile(r'xi\.(?:spells\.blue\.|weaponskills\.|job_utils\.|actions\.(?:spells|weaponskills|abilities)\.|items\.(?:bottle_of_psychoanima|bottle_of_hysteroanima|ccb_polymer_pump)\.)')
    rows = []
    for path in loaded:
        text = effects.source(tree, path)
        if 'addOverride' in text and pattern.search(text):
            rows.append((path, effects.fingerprint(text)))
    digest = effects.fingerprint('\n'.join(path + ' ' + value for path, value in sorted(set(rows))))
    if digest != MODULES:
        raise RuntimeError('Loaded player-action overrides changed. Review action-specific Effects durations.')
    if inference_digest(tree) != INFERENCE_GUARD:
        raise RuntimeError('Player and pet action sources changed. Review inferred secondary effects.')


def action_sources(tree, loaded):
    from . import effects
    from .danger_effects import Sources
    reader = Sources(tree, [])
    eras = {'ROTZ': 1, 'COP': 2, 'TOAU': 3, 'WOTG': 4, 'ACP': 5, 'AMK': 6, 'ASA': 7,
            'ABYSSEA': 8, 'VOIDWATCH': 9, 'SOA': 10, 'ROV': 11, 'TVR': 12}
    for path in loaded:
        text = effects.source(tree, path)
        for match in re.finditer(r"\w+:addOverride(ByEra)?\(\s*['\"](xi\.[^'\"]+)['\"]", text):
            if not re.match(r'xi\.(?:job_utils|actions|spells|weaponskills)\.', match[2]):
                continue
            args = lua_source.call_arguments(text, text.index('(', match.start()))
            if args is None or len(args) < 2:
                raise RuntimeError(path + ': unreadable action override')
            args = [args[0], ', '.join(args[1:])]
            handlers = []
            if match[1]:
                for case in re.finditer(r'(?m)^( *)\[xi\.expansion\.(\w+)\]\s*=\s*function\(([^)]*)\)', args[1]):
                    end = re.search(r'^' + re.escape(case[1]) + r'end\s*,?', args[1][case.end():], re.M)
                    if not end or case[2] not in eras:
                        raise RuntimeError(path + ': unreadable era action override')
                    if eras[case[2]] > 3:
                        handlers.append((eras[case[2]], case[3], args[1][case.end():case.end() + end.start()]))
                if not handlers and not re.search(r'xi\.expansion\.(?:ROTZ|COP|TOAU)\]', args[1]):
                    raise RuntimeError(path + ': missing era action override')
                handlers.sort(reverse=True)
            else:
                handler = re.fullmatch(r'\s*function\(([^)]*)\)(.*)end\s*', args[1], re.S)
                if not handler:
                    # Only literal callbacks are used by the guarded player-action modules.
                    if re.match(r'xi\.(?:job_utils|actions|spells|weaponskills)\.', match[2]):
                        raise RuntimeError(path + ': nonliteral action override')
                    continue
                handlers = [(0, handler[1], handler[2])]
            for _, parameters, body in handlers:
                # Sources.read expects callback bodies indented from column zero.
                body = re.sub(r'(?m)^    ', '', body)
                reader.overrides[match[2]].append((parameters, body))
    return reader


def resolved(expression, text, ids):
    from .danger_effects import Values
    indexed = re.fullmatch(r'(\w+)(?:\[[^]]+\])+', expression.strip())
    if indexed:
        expression = indexed[1]
    text = re.sub(r'(\w+\[[^]]+\])(?:\[[^]]+\])+', r'\1', text)
    names, unknown = Values(text, ids).resolve(expression)
    return [ids[name] for name in names if name in ids], unknown


def random_duration(expression, text, trail=()):
    expression = expression.strip()
    if re.search(r'math\.(?:random|randomInt|randomFloat)\(', expression):
        return True
    if re.fullmatch(r'[\w.]+', expression) and expression not in trail:
        values = re.findall(r'(?m)^\s*(?:local\s+)?' + re.escape(expression) + r'\s*=\s*([^\n]+)', text)
        return any(random_duration(value, text, trail + (expression,)) for value in values)
    return False


def choices(text, ids, where):
    from . import effects
    out = effects.move_effects(text, ids, where)

    def add(effect, duration):
        numbers, _ = resolved(effect, text, ids)
        seconds = effects.duration_value(duration, text)
        for number in numbers:
            if number == ids['NONE']:
                continue
            row = {'effect': number}
            if seconds is not None and seconds > 0:
                row['seconds'] = seconds
                if random_duration(duration, text):
                    row['top'] = seconds
            if number in out and out[number] != row:
                row = {'effect': number}
            out[number] = row

    for match in re.finditer(r'xi\.weaponskills\.handleWeaponskillEffect\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if args is None or len(args) < 7:
            raise RuntimeError(where + ': unreadable weapon-skill effect')
        add(args[2], args[6])
    if 'xi.spells.blue.applyBlueAdditionalEffect' in text:
        for match in re.finditer(r'\{\s*(xi\.effect\.\w+)\s*,([^{}]*)\}', text):
            args = lua_source.call_arguments('(' + match[1] + ',' + match[2] + ')', 0)
            if args and len(args) >= 4:
                add(args[0], args[3])
    for match in re.finditer(r'xi\.spells\.blue\.useEnfeeblingSpell\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if args is None or len(args) < 4:
            raise RuntimeError(where + ': unreadable BLU enfeeble')
        prefix = re.escape(args[3].strip())
        status = re.findall(prefix + r'\.effect\s*=\s*([^\n]+)', text)
        duration = re.findall(prefix + r'\.duration\s*=\s*([^\n]+)', text)
        for effect in status:
            add(effect, duration[0] if len(set(duration)) == 1 else '')
    return out


def named_table(text, expression):
    """Read a literal table passed to a status helper, never a selected table entry."""
    expression = expression.strip()
    if expression.startswith('{'):
        return expression
    if not re.fullmatch(r'\w+', expression):
        return ''
    starts = list(re.finditer(r'\blocal\s+' + re.escape(expression) + r'\s*=\s*(?=\{)', text))
    if len(starts) != 1:
        return ''
    return lua_source.block(text, starts[0].end(), 'secondary-effect table')


def infer_damage(statuses, text, ids, name, category):
    """Mark possible harmful secondaries. Damage never proves that these landed."""
    from .danger_effects import HARMFUL
    damage = re.search(r'xi\.weaponskills\.do(?:Physical|Magic|Ranged)Weaponskill\s*\(|'
                       r'xi\.spells\.blue\.use(?:Physical|Magical|Breath)Spell\s*\(|'
                       r'xi\.mobskills\.mob(?:Physical|Ranged|Magical|Breath)Move\s*\(|'
                       r'\btarget:takeDamage\s*\(', text)
    if not damage:
        return statuses
    # Shared ability helpers can contain another action's statuses. Their exact
    # completion messages and prerequisites are handled separately below.
    if category == 'abilities' and name not in {'shield_bash', 'weapon_bash', 'blade_bash'}:
        return statuses
    harmful = {ids[effect] for effect in HARMFUL if effect in ids}
    selected = set()

    def single(expression):
        found, unknown = resolved(expression, text, ids)
        if not unknown and len(found) == 1:
            selected.update(found)

    calls = re.compile(r'(?P<call>xi\.weaponskills\.handleWeaponskillEffect|'
                       r'xi\.spells\.blue\.applyBlueAdditionalEffect|'
                       r'xi\.mobskills\.mobStatusEffectMove|'
                       r'xi\.combat\.action\.executeMobskillStatusEffect|target:addStatusEffect)\s*\(')
    for match in calls.finditer(text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if not args:
            continue
        call = match['call']
        if call == 'target:addStatusEffect':
            single(args[0])
            continue
        if len(args) < 3 or args[1].strip() != 'target':
            continue
        if call.endswith('handleWeaponskillEffect'):
            single(args[2])
            # Full Break attempts every listed effect; it does not choose one at random.
            if name == 'full_break' and 'for index = 1, #effects do' in text:
                found, unknown = resolved(args[2], text, ids)
                if not unknown:
                    selected.update(found)
        elif call.endswith('mobStatusEffectMove'):
            single(args[2])
        elif len(args) >= 4:
            table = named_table(text, args[3])
            pattern = (r'\{\s*(xi\.effect\.\w+)\s*,' if call.endswith('applyBlueAdditionalEffect')
                       else r'\beffectId\s*=\s*(xi\.effect\.\w+)\s*[,}]')
            for expression in re.findall(pattern, table):
                single(expression)
    if category == 'automaton' and name == 'shield_bash':
        # Hammermill and Earth Maneuvers are not established by the damage result.
        selected.discard(ids['SLOW'])
    for effect in selected & harmful & statuses.keys():
        statuses[effect]['infer'] = 'damage'
    # The loaded Phoenix Break handlers use this formula before resistance. The
    # action packet does not tell us TP, so this is an explicit 1000-TP estimate.
    if category == 'weaponskills' and name in {'shield_break', 'armor_break', 'weapon_break', 'full_break'}:
        if re.search(r'local\s+duration\s*=\s*math\.floor\(\(120\s*\+\s*6\s*\*\s*tp\s*/\s*100\)\s*\*\s*resistanceRate\)', text):
            for effect in selected & harmful & statuses.keys():
                statuses[effect].update(seconds=180, default_tp=1000)
    return statuses


def infer_completion(statuses, text, ids, name, category):
    """Use only reviewed completion messages, including actions that deal no damage."""
    rules = {}
    if category == 'abilities':
        if name in {'shield_bash', 'weapon_bash', 'blade_bash'}:
            rules = {key: {'success_messages': [110]} for key in ('STUN', 'PLAGUE')}
            if name in {'shield_bash', 'weapon_bash'}:
                rules['STUN'].update(seconds=8, top=8)
        elif name == 'jump':
            rules = {'DEFENSE_DOWN': {'success_messages': [317], 'requires_effect': ids['SPIRIT_SURGE'],
                                     'condition': 'Jump needs Spirit Surge and a landed hit.'}}
        elif name == 'chi_blast':
            rules = {'INHIBIT_TP': {'success_messages': [110], 'requires_merit': 'penance',
                                   'merit': 'penance', 'condition': 'Chi Blast needs Penance merits.'}}
        elif name == 'tomahawk':
            rules = {'TOMAHAWK': {'success_messages': [100], 'merit': 'tomahawk'}}
    elif category == 'spells' and name in {'enervation', 'light_of_penance'}:
        keys = ('DEFENSE_DOWN', 'MAGIC_DEF_DOWN') if name == 'enervation' else ('BLINDNESS', 'BIND')
        rules = {key: {'success_messages': [236],
                       'condition': 'The spell reported one effect. Its other effect may have resisted.'}
                 for key in keys}
    elif category == 'pacts':
        if name == 'lunar_cry':
            rules = {key: {'success_messages': [144],
                           'condition': 'Lunar Cry attempts both effects. Either can resist.'}
                     for key in ('ACCURACY_DOWN', 'EVASION_DOWN')}
        elif name == 'eerie_eye':
            rules = {key: {'success_messages': [127],
                           'condition': 'Eerie Eye reported one effect. Its other effect may have resisted.'}
                     for key in ('SILENCE', 'AMNESIA')}
    for key, fields in rules.items():
        effect = ids[key]
        if effect in statuses:
            statuses[effect].update(infer='success', **fields)
    if category in {'pacts', 'automaton', 'charmed_skills'}:
        # processDamage accepts a landed hit even when damage is zero. A separate
        # damage comparison can impose a stricter gate, so leave those rows alone.
        if (re.search(r'if\s+xi\.mobskills\.processDamage\(', text)
                and not re.search(r'(?:\b(?:damage|dmg)|\.damage)\s*(?:[<>=~]=?|\))\s*0', text)):
            primary = set(re.findall(r'\bprimaryMessage\s*=\s*xi\.msg\.basic\.(\w+)', text))
            if not primary or primary <= {'DAMAGE', 'USES_JA_TAKE_DAMAGE'}:
                messages = [264, 317] if primary == {'USES_JA_TAKE_DAMAGE'} else [185, 264]
                if 'mobMagicalMove' in text:
                    messages.append(379)
                if 'mobBreathMove' in text:
                    messages.append(747)
                for row in statuses.values():
                    if row.get('infer') == 'damage':
                        row.update(infer='success', success_messages=messages)
    if category == 'automaton' and name == 'shield_bash':
        for key in ('STUN', 'SLOW'):
            if ids[key] in statuses:
                statuses[ids[key]].update(infer='success', success_messages=[185, 264])
        if ids['SLOW'] in statuses:
            statuses[ids['SLOW']]['condition'] = 'Slow needs Hammermill and at least one Earth Maneuver.'
            statuses[ids['SLOW']]['requires_owner_effect'] = ids['EARTH_MANEUVER']
    return statuses


def other_actions(tree, ids, allowed):
    """Keep native reactions and silent item completions separate from action IDs."""
    from . import effects
    usable = {row['itemid']: row for row in effects.sql_rows(tree, 'item_usable')}
    items = {}
    for number, name, effect, seconds, random in (
            (5261, 'bottle_of_psychoanima', 'INTIMIDATE', 32, True),
            (5262, 'bottle_of_hysteroanima', 'HYSTERIA', 32, True),
            (5268, 'ccb_polymer_pump', 'AMNESIA', 60, False)):
        entry = usable.get(number)
        if not entry or entry['name'] != name or not entry['validTargets'] & 4:
            raise RuntimeError(name + ': monster-target item metadata changed')
        text = effects.source(tree, 'scripts/items/' + name + '.lua')
        statuses = choices(text, ids, name)
        row = statuses.get(ids[effect])
        if not row or row.get('seconds') != seconds:
            raise RuntimeError(name + ': item status duration changed')
        row.update(infer='success', success_messages=[0], _name=name)
        if random:
            row['top'] = seconds
        items[number] = row
    reactive = {ids['FEINT']: {'effect': ids['EVASION_DOWN'], 'seconds': 30, 'arm_seconds': 60,
                               'arm_ability': 156, 'arm_messages': [100],
                               'infer': 'melee', 'consume': True,
                               'condition': 'Feint is used by the next landed ordinary attack. The effect can resist.'}}
    spikes = {}
    for reaction, name, effect, seconds in ((2, 'Ice Spikes', 'PARALYSIS', 30),
                                             (4, 'Curse Spikes', 'CURSE_I', 180),
                                             (5, 'Shock Spikes', 'STUN', 3)):
        spikes[reaction] = {'effect': ids[effect], 'seconds': seconds, 'infer': 'reaction',
                            'condition': name + ' may apply this effect when it retaliates.'}
    return items, reactive, spikes


def packed(name, statuses):
    if not statuses:
        return None
    first = min(statuses)
    row = dict(statuses[first], _name=name)
    if len(statuses) > 1:
        row['by_effect'] = statuses
    return row


def with_job_helpers(reader, text, trail=()):
    """Read only named job helpers called by the effective ability callback."""
    extra = []
    for job, method in sorted(set(re.findall(r'xi\.job_utils\.(\w+)\.(\w+)\s*\(', text))):
        key = job, method
        if key in trail:
            continue
        body, _ = reader.read('scripts/globals/job_utils/' + job + '.lua',
                              'xi.job_utils.' + job + '.', method)
        extra.append(with_job_helpers(reader, body, trail + (key,)))
    return text + '\n' + '\n'.join(extra)


def build(tree, ids, allowed, loaded):
    from . import effects
    check_source(tree, loaded)
    reader = action_sources(tree, loaded)
    spells, weaponskills, abilities, automatons = {}, {}, {}, {}
    coverage = []
    for entry in effects.sql_rows(tree, 'spell_list'):
        if not allowed.allows(entry['content_tag']):
            continue
        text, reasons = reader.spell(entry['name'])
        statuses = choices(text, ids, entry['name'])
        infer_damage(statuses, text, ids, entry['name'], 'spells')
        infer_completion(statuses, text, ids, entry['name'], 'spells')
        row = packed(entry['name'], statuses)
        if row:
            spells[entry['spellid']] = row
        coverage.append(('spell', entry['spellid'], entry['name'], statuses, reasons))
    for table, id_key, folder, callback, output in (
            ('weapon_skills', 'weaponskillid', 'weaponskills', 'onUseWeaponSkill', weaponskills),
            ('abilities', 'abilityId', 'abilities', 'onUseAbility', abilities)):
        entries = effects.weapon_skill_rows(tree) if table == 'weapon_skills' else effects.sql_rows(tree, table)
        for entry in entries:
            if table == 'abilities' and (not allowed.allows(entry.get('content_tag')) or entry['level'] > 75):
                continue
            name = entry['name']
            rel = 'scripts/actions/' + folder + '/' + name + '.lua'
            if not Path(tree, rel).is_file():
                continue
            text, reasons = reader.read(rel, 'xi.actions.' + folder + '.' + name + '.', callback)
            if table == 'abilities':
                text = with_job_helpers(reader, text)
            statuses = choices(text, ids, name)
            if table == 'abilities' and name.endswith('_shot') and name != 'light_shot':
                # Quick Draw's shared helper contains Light Shot's Sleep branch.
                statuses = {}
            infer_damage(statuses, text, ids, name, folder)
            infer_completion(statuses, text, ids, name, folder)
            row = packed(name, statuses)
            if row:
                output[entry[id_key]] = row
            coverage.append((folder, entry[id_key], name, statuses, reasons))
    for entry in effects.sql_rows(tree, 'mob_skills'):
        name = entry['mob_skill_name']
        rel = 'scripts/actions/abilities/pets/automaton/' + name + '.lua'
        if not Path(tree, rel).is_file():
            continue
        text, reasons = reader.read(rel, 'xi.actions.abilities.pets.automaton.' + name + '.', 'onAutomatonAbility')
        statuses = choices(text, ids, name)
        infer_damage(statuses, text, ids, name, 'automaton')
        infer_completion(statuses, text, ids, name, 'automaton')
        row = packed(name, statuses)
        automatons[entry['mob_skill_id']] = row or {'_name': name}
        coverage.append(('automaton', entry['mob_skill_id'], name, statuses, reasons))
    return spells, weaponskills, abilities, automatons, coverage
