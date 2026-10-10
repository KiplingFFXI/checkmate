"""Spawn rules, reviewed danger moves and possible Blue Magic lessons."""
from collections import defaultdict
import hashlib
from pathlib import Path
import re

from . import aggro, danger_attacks, danger_crit, danger_effects, danger_jobs, lua_source, outside, overlays, sqlfile, tables as source_tables

CLAIM = 'modules/custom/lua/claim_shield.lua'
KIT_TABLES = ('mob_skill_lists', 'mob_spell_lists', 'blue_spell_list', 'mob_skills')
MOVE_TARGETING = {0: 'single target', 1: 'area around the monster', 2: 'area around the target',
                  4: 'cone', 8: 'rear cone'}
DANGERS = {
    'mortal_ray': ('Mortal Ray: Doom gaze', 'Attempts Doom when the target faces the monster and the monster is in front of the target.'),
    'spike_flail': ('Spike Flail: rear attack', 'Can hit from behind while grounded. Its skill check also excludes several special buffs.'),
    'self-destruct_bomb': ('Self-Destruct: explosion', 'Area fire damage based on remaining HP; ignores shadows and defeats the bomb.'),
    'final_sting': ('Final Sting: heavy damage', 'Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows.'),
    'charm': ('Charm', 'Can charm a player; the target and effect check still have to pass.'),
    'danse_macabre': ('Danse Macabre: charm', 'Can charm a player; the target and effect check still have to pass.'),
    'bad_breath': ('Bad Breath: many ailments', 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows.'),
    'baleful_gaze_cockatrice': ('Baleful Gaze: petrification gaze', 'Attempts Petrification when the target faces the monster and the monster is in front of the target.'),
    'baleful_gaze_lizard': ('Baleful Gaze: petrification gaze', 'Attempts Petrification when the target faces the monster and the monster is in front of the target.'),
    'petrifactive_breath': ('Petrifactive Breath: petrification', 'Attempts Petrification through a status-effect check; this move does not use the gaze-facing check.'),
    'chaotic_eye': ('Chaotic Eye: silence gaze', 'Attempts Silence when the target faces the monster and the monster is in front of the target.'),
    'blaster': ('Blaster: paralysis', 'Attempts Paralysis. This move does not use the gaze-facing check.'),
    'roar': ('Roar: paralysis', 'Attempts Paralysis on its targets.'),
    'dream_flower': ('Dream Flower: sleep', 'Attempts Sleep on its targets.'),
    'sheep_song': ('Sheep Song: sleep', 'Attempts Sleep on its targets.'),
    'soporific': ('Soporific: sleep', 'Attempts Sleep on its targets.'),
    'spore': ('Spore: paralysis', 'Attempts Paralysis on its target.'),
    'sand_trap': ('Sand Trap: petrification', 'Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset.'),
    'venom_spray': ('Venom Spray: poison', 'Attempts Poison. The source uses different poison power and duration for notorious monsters.'),
    'poison_breath_crawler': ('Poison Breath: poison', 'Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration.'),
    'heat_breath': ('Heat Breath: fire breath', 'Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply.'),
    'blank_gaze': ('Blank Gaze: paralysis gaze', 'Attempts Paralysis when the target faces the monster and the monster is in front of the target.'),
    'blank_gaze_dispel': ('Blank Gaze: dispel gaze', 'Attempts to remove one dispellable status effect when the target faces the monster.'),
    'curse': ('Curse: curse', 'Attempts Curse on its targets.'),
    'hex_eye': ('Hex Eye: paralysis gaze', 'Attempts Paralysis when the target faces the monster and the monster is in front of the target.'),
    'frightful_roar': ('Frightful Roar: defense down', 'Attempts Defense Down on its targets.'),
    'hecatomb_wave': ('Hecatomb Wave: blindness', 'Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness.'),
    'radiant_breath': ('Radiant Breath: silence and slow', 'Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow.'),
    'whirl_of_rage': ('Whirl of Rage: stun', 'Physical damage with a four-shadow check. On a successful damage result it attempts Stun.'),
    'silence_seal': ('Silence Seal: silence', 'Attempts Silence on its targets.'),
    'stinking_gas': ('Stinking Gas: vitality down', 'Attempts Vitality Down on its targets.'),
    'numbing_noise': ('Numbing Noise: stun', 'Attempts Stun on its targets.'),
    'scream': ('Scream: mind down', 'Attempts Mind Down on its targets.'),
    'bomb_toss': ('Bomb Toss: fire damage', 'Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move.'),
    'blood_saber': ('Blood Saber: HP drain', 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster.'),
}
SPELL_DANGERS = {
    'death': 'Death: instant KO',
    'sleepga': 'Sleepga: area sleep',
    'sleepga_ii': 'Sleepga II: area sleep',
    'sleep': 'Sleep: sleep',
    'sleep_ii': 'Sleep II: sleep',
    'break': 'Break: petrification',
    'breakga': 'Breakga: area petrification',
    'bind': 'Bind: bind',
    'dispel': 'Dispel: removes a buff',
    'silence': 'Silence: silence',
    'paralyze': 'Paralyze: paralysis',
    'slow': 'Slow: slow',
    'stun': 'Stun: stun',
    'poisonga': 'Poisonga: area poison',
    'poisonga_ii': 'Poisonga II: area poison',
}
KIT_CHANGE = re.compile(r'onMobMobskillChoose|onMobSpellChoose|onMobWeaponSkillPrepare|onMobMagicPrepare|setSpellList|'
                        r'setMobSkillAttack|(?:set|add)MobMod\(\s*xi\.mobMod\.(?:SKILL_LIST|SPECIAL_SKILL|MAGIC_COOL)|'
                        r'changeJob|useMobAbility|castSpell')
BOREAL = 'modules/phoenix/lua/zones/Xarcabard/mobs/boreal_draw_in.lua'
BOREAL_NAMES = {'Boreal_Coeurl', 'Boreal_Hound', 'Boreal_Tiger'}
TIAMAT = ('Attohwa_Chasm', 'Tiamat')
GUARDS = {
    'src/map/enums/action/category.h': '55febb1a546c1d69b45fd8270bf1fc27771a0b64b2cb82950b7f39602bf4482d',
    'scripts/mixins/families/ladybug.lua': '78c94b266c78d72e2fb11471a12fb596266449298910fae4f446112b2aab99d8',
    'scripts/mixins/families/uragnite.lua': '5c31926ff3c6eeb4af82621cd5859ab7437e4aa429739ea30a1a22c9bb4cd95f',
    'modules/custom/lua/claim_shield.lua': '83a4562f08b2217a6a6f48760653e2e699d2109e76f84ad0223e520c3c0a622d',
    'modules/phoenix/lua/zones/Xarcabard/mobs/boreal_draw_in.lua': '6ba20618b9bebbb0e1cfdc5d9b9a8994464c980c081a2d1c3561b9ac70aefa5e',
    'scripts/zones/Attohwa_Chasm/mobs/Tiamat.lua': 'eacf53692fcbad4a60d22ce8b6ad349ae99fb29fb1b710005686de560b785bc9',
    'scripts/mixins/rage.lua': 'cdf86c77249a15b9afda448ac455dd00d0a6e99dd76ba33219e529f566e242ed',
    'scripts/mixins/draw_in.lua': '67814cf192a172d0d309b989e828f9266a559474b2a50da00c086f52d0842246',
    'scripts/actions/mobskills/mortal_ray.lua': 'e3c61b39f2b4307d507523a8a6ba93729eff24ec28150f1f366bdab439c28169',
    'scripts/actions/mobskills/spike_flail.lua': 'fee3b9263325e0dfddc94bba0544fca5a4ef8e6becf21803e8405b01b000f6eb',
    'scripts/actions/mobskills/self-destruct_bomb.lua': '296a6b2b8bb9629ad803c3dc5cf7a879cfaf19330ab199d9fbc3c3f20df24e5b',
    'scripts/actions/mobskills/final_sting.lua': '41abc29e7dc5e0414702bb1da192411af8fbb8348e54c7b672436694add2d8fe',
    'scripts/actions/mobskills/charm.lua': '71c10d45e30ffd8e660cde975355028fa38102f7e84dab36b79cba05adcd33ad',
    'scripts/actions/mobskills/danse_macabre.lua': 'a8a6e1a02ce555637c8faf553614932a6e7fc6946577c16d8d30c25d7daa580b',
    'scripts/actions/spells/black/death.lua': '9f3ca6cb7a8319ac33249910a9b0ef182bbec9c761168a52952a083802e62550',
    'scripts/actions/spells/black/sleepga.lua': 'd2c8333b809b69e4b227137789b081a503291aebc60a589e1226e309128c2c3f',
    'scripts/actions/spells/black/sleepga_ii.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'modules/phoenix/lua/actions/mobskills/final_sting_pre_2013.lua': 'a237aabe1a3d390e39c66c4a6bc6b1b702e356354abbd3ac4ad851e9b5bba7bd',
    'scripts/actions/mobskills/bad_breath.lua': '8540a0c4a936be10766668a16d06ec09d9e01fdb8dbdefb575407498e73121db',
    'scripts/actions/mobskills/baleful_gaze_cockatrice.lua': 'd88e7f0951e1facfbed2bdc5c61eacb965b95ea22961156e28c99399f1961ba5',
    'scripts/actions/mobskills/baleful_gaze_lizard.lua': '27ad561020427bf324a2b6fc402681fe624410cf33eb9e6a7a77849595acd92d',
    'scripts/actions/mobskills/petrifactive_breath.lua': 'b0b244c1340886b70618fde3abdaeb572e5c5a9f24a5a37c63897a9d69c32b37',
    'scripts/actions/mobskills/chaotic_eye.lua': '8403ff8af06e57543aa7b258cff9f69b59abc82be284f59578f3e80039c546eb',
    'scripts/actions/mobskills/blaster.lua': '98cee57d2d18e01de3522e77fe735b5c8ca3516410fc110f2ab55acbd8ce4ae5',
    'scripts/actions/mobskills/roar.lua': '498f9dcff054db23b66b078a21e17bd0f9da301c85f5301b572c2cb3f6be16dc',
    'scripts/actions/mobskills/dream_flower.lua': '853a47490762e793246716d52b1a556f21c82653c0ecb312ff79ca6db9bcdc53',
    'scripts/actions/mobskills/sheep_song.lua': '752a24d4d518de83bfbcb85fabbd5dd258a66f044af2cac56a222e914c35e957',
    'scripts/actions/mobskills/soporific.lua': '955ae43ab405447ad69446e23c61f068c1515ba78f886922d106892b337716e4',
    'scripts/actions/mobskills/spore.lua': 'cf7480633dffb90c3c2d4e6caa76c5a6d8612c630993106d455aeaf133a149dd',
    'scripts/actions/mobskills/sand_trap.lua': '00a1ef1c92524e9570040af5453e8ec6910827e9418d065a6fa9ace1fb5c8494',
    'scripts/actions/mobskills/venom_spray.lua': '8ef06166dded42666341f9d0ebe93814e0478ed56cf227c72bb9c8ce1fca3e41',
    'scripts/actions/mobskills/poison_breath_crawler.lua': '6c62a4c86b71b6ff6cbe0339f8a3a55f1fe77060ca024d1bb015644d023bbf16',
    'scripts/actions/mobskills/heat_breath.lua': 'a2f1748dc3898636ec9fb2a0f442fcc745a22c92602257ece39919ed6fce9855',
    'scripts/actions/mobskills/blank_gaze.lua': '2e20c81efe2610e6a0f6b238b231418c49521f65c48dbc5736b1523129ec7feb',
    'scripts/actions/mobskills/blank_gaze_dispel.lua': '07b95707530e63fee3a7176667e449865a170ce85ddc11c6d45c64eb684add55',
    'scripts/actions/mobskills/curse.lua': '50c792998ef7f7cc397557b7490fa2af9dacf45730b87db5a77b76606fc18ab4',
    'scripts/actions/mobskills/hex_eye.lua': 'f40f4ee41b744312fb8dd27260dacebfc85f7cc560c254a6d2c9397347e7be43',
    'scripts/actions/mobskills/frightful_roar.lua': 'dcb3e7a2fc095e6e8a3a9a2f423130fc467385f2634e0f490a913de50a46e26c',
    'scripts/actions/mobskills/hecatomb_wave.lua': '0b533cab41a67d0e0c171bb168d2caccb7db37b09ffd0435c4918d90641d43a0',
    'scripts/actions/mobskills/radiant_breath.lua': 'c4a72e8cd412d96360d52ef2ef4c8aa282470a44054bab911e4fdddf2d2ff3f9',
    'scripts/actions/mobskills/whirl_of_rage.lua': '770361e0b9de692473a3326c34e57488a7ad88ab91282cc0600614b2c9b6c55e',
    'scripts/actions/mobskills/silence_seal.lua': 'ff57fdb91f83f4713214120ae72c49e94c6e8f320e0832555f6f4e09ffde1ca1',
    'scripts/actions/mobskills/stinking_gas.lua': 'a2d2c2cadbe834de17fa7851ea91286efc2fc3e24cb1a7134592671dc7c25b4d',
    'scripts/actions/mobskills/numbing_noise.lua': '969e92ec1675281daf63bed26c0d267fe2ada3bb8f986fe0ef2b2ccf553510cc',
    'scripts/actions/mobskills/scream.lua': '22a39cc80ed8d20d95ace51587df583743aec3eabc1530c4a44a32845b45eb12',
    'scripts/actions/mobskills/bomb_toss.lua': '657ab77a327828bab9f30087843b5a63a2076a391cb6993d058b6e9f238230e1',
    'scripts/actions/mobskills/blood_saber.lua': '5f4280784fc3083284abbf5d103b3d1a957387def5de8e5cd99f334192b33325',
    'scripts/actions/spells/black/sleep.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/sleep_ii.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/break.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/breakga.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/bind.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/dispel.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/white/silence.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/white/paralyze.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/white/slow.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/stun.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/poisonga.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/actions/spells/black/poisonga_ii.lua': '9bdcfbd090aec044006e8a00de85a52c5e842aa9d56d0e6a552e4c43dfd7ef9a',
    'scripts/globals/mobskills.lua': '4143e78653e6fd944978f6d4ad3c21e8c30342d7eb830e9a8282e8a617d74397',
    'scripts/globals/spells/enfeebling_spell.lua': 'a9fec830186f0a14bca6c0062754d88a8974358098bb95a761f51b2749853029',
    'scripts/combat/action_mobskill_status_effect.lua': '1a8a4762bb79b3f869f2382b239c3bcd46f31c999666b4df9b86ce16084c8b56',
}
MODULE_GUARD = '85a7f9dfd484684c1a8a027475de2f1da7a87afe12bf006012bd9bf65b68e528'
NATIVE_GUARDS = {
    ('src/map/lua/lua_base_entity.cpp', 'CLuaBaseEntity::setSpellList'): '98465dae5a7b72aa7afa158aec5284908960d6f93c9d1e89b75d2780da768a23',
    ('src/map/utils/mobutils.cpp', 'SetSpellList'): '4d5256637436468c0c41eca0e990eb087e5cdb5908192b82d97b5107a5022b35',
    ('src/map/utils/mobutils.cpp', 'RecalculateSpellContainer'): '73067866e6b540c0ede552be06184f2323e428df03cffa88d79de061fb8a0716',
    ('src/map/mob_spell_list.cpp', 'LoadMobSpellList'): '330c538bc5a9103c6ae4aef008443e695e7651284dea7814abf695dfe2e1dec6',
    ('src/map/mob_spell_list.cpp', 'GetMobSpellList'): '2beb9238cf2dea223b97b3f3aeb5ff2c96fab29dfb83c5b1b7448132510e2593',
    ('src/map/entities/battle_entity.cpp', 'CBattleEntity::OnMobSkillFinished'): 'ddc709c74fcb5f02ab83d0750d81313c58c73928107d5d12f0cc6bc6a66a59f9',
    ('src/map/action/action.cpp', 'action_t::normalize'): 'b1acece5a0d5e5f15d53662abd8f100e579cd2ea77898a127304423b4b35d194',
    ('src/map/packets/s2c/0x028_battle2.cpp', 'GP_SERV_COMMAND_BATTLE2::pack'): 'f06619391dd67720e395b8a5f11e039ca6dd927bdf4b005a792615acde943ea9',
    ('src/map/action/interrupts.cpp', 'AbilityInterrupt'): 'f9bcbee6bce229c10e94a2c7d52ca656ceecaef24bd1051e8184304c43016bdb',
    ('src/map/action/interrupts.cpp', 'MobSkillNoTargetInRange'): '86f6b0bf26c936c97e90c34449aef0d689f7488429870091d5f55102895fbaab',
    ('src/map/action/interrupts.cpp', 'MobSkillOutOfRange'): 'ff43de34134ec1f59c00bc3dc46df79ff36c1ca9cd88c6e3383b9bfbe1dd78ce',
    ('src/map/ai/controllers/mob_controller.cpp', 'CMobController::MobSkill'): '41b42421b6a76cd78c02d0cca77464e6c968202105448a3524c82785cdb75d3e',
    ('src/map/ai/controllers/mob_controller.cpp', 'CMobController::TryMobSkill'): '72a9858ce83997e1321958e80b925beeb35b12f8b5ca4656d66c72547bdc00d9',
    ('src/map/ai/controllers/mob_controller.cpp', 'CMobController::TrySpecialSkill'): '4c207c89149afdcc64a6832ac1b6615b884af169328de17463cc8a1dc499748e',
    ('src/map/lua/lua_base_entity.cpp', 'CLuaBaseEntity::useMobAbility'): 'a787d0d8b4443bdf630ccc69d4d84e62bfea4d0a49fd6679cfbd64ce9ab07511',
    ('src/map/utils/mobutils.cpp', 'SetupJob'): '2514743e2a594b20cb72906112209a563a12cc34d500ddd3e403f92b1525429a',
    ('src/map/spawn_handler.cpp', 'hourInWindow'): '6c93d49e3d27378c6d7221df1422a472c704faeeffb32230d1a8b5fecad3f3ed',
    ('src/map/spawn_handler.cpp', 'spawnWindowOf'): '0f2c575815922d82299b659f3e7198ffe61e31a4950c926ade31ad0e782d3df5',
    ('src/map/spawn_handler.cpp', 'SpawnHandler::canSpawnNow'): '1e78ca08f24d5dcc45caaa48872dcbc30eed53d0c6b5c0154062e9d23b2bc461',
    ('src/map/spawn_handler.cpp', 'SpawnHandler::onGameHour'): '32396b99f84b9279701293eb1aef2d3ccbd5b2f5a0343b595d4044966a219025',
    ('src/map/spawn_handler.cpp', 'SpawnHandler::onWeatherChange'): 'f4096b2c65386c78e754fd917d9b7fab9d9c7723b34d12b378cc97072c8fc24b',
    ('src/map/spawn_handler.cpp', 'SpawnHandler::Tick'): 'abe36001157afba334fe6ca920ffc0b65d06f6a925de7cef1ac23d3f7472668f',
    ('src/map/utils/blueutils.cpp', 'TryLearningSpells'): '343dd7ca9e943e2bfd8cbb709f77ea8c1b3bae66245dfd36408d7cdfa5f49b10',
    ('src/map/entities/mob_entity.cpp', 'CMobEntity::DistributeRewards'): '195fda1214756a597dad53efdf2a31f55a1ed6bbe6895d2f9cf89d669a9471ea',
    ('src/map/spell.cpp', 'LoadSpellList'): 'e61fc2f6670c056570fe390dc0ef203518aa115b3f9029fbaa39b8ab1bbdb5bf',
    ('src/map/spell.cpp', 'CSpell::getJob'): '05f5549f6c334d97891f1fc0fcb6bfecae2c7f11989701e45378e9e869e4455a',
    ('src/map/utils/battleutils.cpp', 'GetMaxSkill'): 'a97ae9f95003ff2c180867a2bd56b4cb62f28c89fdc96db62ed8f9e2a1432e9b',
    ('src/map/utils/battleutils.cpp', 'LoadSkillTable'): 'e24b885a3be09fed37ba2c2a81c08ca9e42222ad2484ee2646856bc6a9f005ee',
    ('src/map/mobskill.cpp', 'CMobSkill::isAoE'): '2931b3481c6ec82aaafc4ebc9fc0791679fe41dd461e678001ab08117f3bcc7a',
    ('src/map/mobskill.cpp', 'CMobSkill::isConal'): '31ea8198df1076834da05cc53162bcc0267e208c3114624690df5a253db3eb3a',
    ('src/map/mobskill.cpp', 'CMobSkill::isSingle'): 'c4863473bdda75c75dc268a1c439a21b50535baf6f25f233634a8ea4f66751da',
    ('src/map/utils/battleutils.cpp', 'LoadMobSkillsList'): 'a8e66b21d2fe01d6b89f9208c42532270f311f228e43766c47e83236efe6258d',
    ('src/map/lua/lua_base_entity.cpp', 'CLuaBaseEntity::isFacing'): 'ae1436006f3d905d318426c2d00cd02e33a690db615a6c508f236eef82ed8a31',
    ('src/map/lua/lua_base_entity.cpp', 'CLuaBaseEntity::isInfront'): 'b80b1296c47f749faff58e26e6b5f4eafaaa2ca977b050eb46c2c777768c7c1e',
}


def text_at(tree, rel):
    path = Path(tree) / rel
    return lua_source.strip_comments(path.read_text(encoding='utf8')) if path.is_file() else ''


def digest(text):
    return hashlib.sha256(' '.join(text.split()).encode()).hexdigest()


def section(value, notes=(), **fields):
    return dict(value=value, notes=list(dict.fromkeys(notes)), **fields)


def duration(seconds):
    seconds = float(seconds)
    for unit, count in (('hour', 3600), ('minute', 60)):
        if seconds >= count and seconds % count == 0:
            value = seconds / count
            return '%g %s%s' % (value, unit, '' if value == 1 else 's')
    return '%g second%s' % (seconds, '' if seconds == 1 else 's')


def label(name):
    name = str(name).replace('_', ' ').title()
    return re.sub(r'\bIi(?:i|v)?\b|\bVi(?:i|ii)?\b', lambda match: match[0].upper(), name)


def module_digest(tree, loaded):
    relevant = ['\n'.join(overlays.init_entries(str(tree)))]
    for rel in sorted(loaded):
        text = text_at(tree, rel)
        if KIT_CHANGE.search(text) or re.search(r'onMob|xi\.actions\.(?:mobskills|spells)\.|xi\.(?:mobskills|spells\.enfeebling)\.|xi\.combat\.action\.executeMobskillStatusEffect', text):
            relevant.append(rel + '\n' + ' '.join(text.split()))
    return digest('\n'.join(relevant))


def helper_body(text, name):
    start = re.search(r'^(?:' + re.escape(name) + r'\s*=\s*function\b|function\s+' + re.escape(name) + r'\s*\()', text, re.M)
    if start is None:
        return ''
    end = re.search(r'^end\b', text[start.end():], re.M)
    return text[start.start():start.end() + end.end()] if end else ''


def function_parts(text):
    """Named source functions with their own column-level closing end."""
    pattern = re.compile(r'^(?P<pad> *)(?:local function (?P<local>\w+)\s*\(|'
                         r'(?:local )?(?P<name>[\w.]+)\s*=\s*function\s*\()(?P<args>[^)]*)\)', re.M)
    out = {}
    for match in pattern.finditer(text):
        end = re.search(r'^' + re.escape(match['pad']) + r'end\b[^\n]*', text[match.end():], re.M)
        if end:
            out[match['local'] or match['name']] = text[match.start():match.end() + end.end()]
    return out


def overrides(text):
    """Literal module overrides. Computed target names stay outside this reader."""
    pattern = re.compile(r"^(?P<pad> *)\w+:addOverride\(\s*['\"](?P<target>xi\.[^'\"]+)['\"],\s*function\((?P<args>[^)]*)\)", re.M)
    for match in pattern.finditer(text):
        end = re.search(r'^' + re.escape(match['pad']) + r'end\)', text[match.end():], re.M)
        if end:
            body = text[match.end():match.end() + end.start()]
            if match['pad']:
                body = re.sub(r'^' + re.escape(match['pad']), '', body, flags=re.M)
            yield match['target'], match['args'], body


def mixin_names(text):
    return {name.replace('.', '/') for name in re.findall(r"require\(['\"]scripts[./]mixins[./]([^'\"]+)['\"]\)", text)}


def literal(expression, enum, prefix):
    expression = expression.strip()
    if re.fullmatch(r'-?\d+', expression):
        return int(expression)
    match = re.fullmatch(re.escape(prefix) + r'\.(\w+)', expression)
    return enum.get(match[1]) if match else None


def chooser(text, name, enum, prefix, trail=()):
    """A bounded return/table chooser: IDs, pass-through, and literal choice pools."""
    functions = function_parts(text)
    body = functions.get(name, '')
    if not body or name in trail:
        return set(), False, ['The scripted move chooser is not resolved.']
    candidates, fallback, reasons = set(), False, []
    returns = re.findall(r'^\s*return\s+([^\n]+)', body, re.M)
    def choice_tables(source):
        found = defaultdict(list)
        for match in re.finditer(r'\b(?:local\s+)?(\w+)\s*=\s*\{', source):
            payload = lua_source.block(source, match.start(), 'move chooser')
            values = [item.strip() for item in payload.split(',') if item.strip()]
            numbers = [literal(item, enum, prefix) for item in values]
            found[match[1]].append(frozenset(numbers) if values and all(n is not None for n in numbers) else None)
        return found
    tables, local_tables = choice_tables(text), choice_tables(body)
    for expression in returns:
        expression = expression.strip().rstrip(';')
        number = literal(expression, enum, prefix)
        if number is not None:
            if number > 0:
                candidates.add(number)
            else:
                fallback = True
            continue
        if expression in ('skillId', 'spellId'):
            fallback = True
            continue
        call = re.fullmatch(r'([\w.]+)\([^\n]*\)', expression)
        if call and call[1] in functions:
            found, base, unknown = chooser(text, call[1], enum, prefix, trail + (name,))
            candidates.update(found)
            fallback = fallback or base
            reasons.extend(unknown)
            continue
        pool = re.fullmatch(r'(\w+)\[math\.randomInt\(1,\s*#\1\)\]', expression)
        if pool and pool[1] in tables:
            definitions = local_tables.get(pool[1], tables[pool[1]])
            if None in definitions or len(set(definitions)) != 1:
                reasons.append('A scripted choice table has conflicting or unreadable definitions.')
                continue
            candidates.update(definitions[0])
            inserts = re.findall(r'table\.insert\(\s*' + re.escape(pool[1]) + r'\s*,\s*([^\n]+)\)', body)
            for inserted in inserts:
                number = literal(inserted, enum, prefix)
                if number is None:
                    reasons.append('A scripted choice table adds a move that is not resolved.')
                elif number > 0:
                    candidates.add(number)
            continue
        branch = re.fullmatch(r'.+\band\s+(' + re.escape(prefix) + r'\.\w+|\d+)\s+or\s+(' + re.escape(prefix) + r'\.\w+|\d+)', expression)
        if branch:
            numbers = [literal(branch[1], enum, prefix), literal(branch[2], enum, prefix)]
            if all(number is not None for number in numbers):
                candidates.update(number for number in numbers if number > 0)
                fallback = fallback or any(number <= 0 for number in numbers)
                continue
        if 'chooseAction' in expression:
            # Only literal first entries in the table passed to the shared chooser count.
            args = lua_source.call_arguments(expression, expression.index('('))
            table_name = args[2] if prefix == 'xi.mobSkill' and len(args) > 2 else args[3] if len(args) > 3 else ''
            match = re.search(r'\blocal\s+' + re.escape(table_name) + r'\s*=\s*\{', body) if re.fullmatch(r'\w+', table_name) else None
            if match:
                payload = lua_source.block(body, match.start(), 'action chooser')
                entries = re.findall(r'\[\s*\d+\s*\]\s*=\s*\{\s*([^,]+),', payload)
                numbers = [literal(entry, enum, prefix) for entry in entries]
                if entries and all(number is not None for number in numbers):
                    candidates.update(number for number in numbers if number > 0)
                    continue
        reasons.append('A scripted move chooser return is not resolved.')
    if not returns:
        reasons.append('The scripted move chooser has no readable return.')
    return candidates, fallback, list(dict.fromkeys(reasons))


def possible_skill(text):
    match = re.search(r'\bonMobSkillCheck\s*=\s*function\([^)]*\)(.*?)^end\b', text, re.S | re.M)
    if match is None:
        return False
    body = match[1].strip().rstrip(';')
    bare = re.fullmatch(r'return\s+(.+)', body)
    return not bare or bare[1].strip() == '0'


def native_digest(text, name):
    pattern = r'^[^\n;{}]*\b(?P<code>' + re.escape(name) + r'\([^)]*\)[^{;\n]*\n\{.*?^})'
    matches = list(re.finditer(pattern, text, re.S | re.M))
    if not matches:
        raise RuntimeError('Encounter source has no readable ' + name)
    code = '\n'.join(re.sub(r'/\*.*?\*/|//[^\n]*', '', match['code'], flags=re.S) for match in matches)
    return digest(code)


def check_source(tree, loaded):
    for rel, expected in GUARDS.items():
        if digest(text_at(tree, rel)) != expected:
            raise RuntimeError('%s changed; review encounter source notes' % rel)
    if module_digest(tree, loaded) != MODULE_GUARD:
        raise RuntimeError('Loaded encounter modules changed; review their move and fight rules')
    for (rel, name), expected in NATIVE_GUARDS.items():
        path = Path(tree) / rel
        if not path.is_file() or native_digest(path.read_text(encoding='utf8'), name) != expected:
            raise RuntimeError('%s changed or is missing; review encounter rules in %s' % (name, rel))


def sql_rows(path, table):
    text = Path(path).read_text(encoding='utf8')
    columns = sqlfile.columns(text, table)
    out = []
    for values in re.findall(r'^INSERT INTO `%s` VALUES \((.*?)\);' % re.escape(table), text, re.M):
        values = sqlfile.split_values(values)
        if len(values) != len(columns):
            raise RuntimeError('%s has an unreadable row' % path)
        out.append(dict(zip(columns, values)))
    return out


def apply_sql(rows, columns, statement, where):
    """The simple kit-table mutations in the loaded era SQL, in init order."""
    match = re.fullmatch(r'INSERT INTO `?\w+`? VALUES \((.*)\)', statement, re.I)
    if match:
        values = sqlfile.split_values(match[1])
        if len(values) != len(columns):
            raise RuntimeError('%s has an unreadable kit INSERT' % where)
        rows.append(dict(zip(columns, values)))
        return rows
    match = re.fullmatch(r'(UPDATE `?\w+`? SET (.*?)|DELETE FROM `?\w+`?) WHERE (.*)', statement, re.I)
    if not match:
        raise RuntimeError('%s changes a kit table in an unreadable way' % where)
    condition = source_tables.parse_pairs(match[3], where)
    changes = source_tables.parse_pairs(match[2], where) if match[2] else None
    out = []
    for row in rows:
        if all(row.get(key) == value for key, value in condition.items()):
            if changes is None:
                continue
            row.update(changes)
        out.append(row)
    return out


def apply_spell_jobs(rows, statement, where):
    """Keep loaded level/targeting changes; reject unreadable lesson identity changes."""
    match = re.fullmatch(r'UPDATE\s+`?\w+`?\s+SET\s+(.*?)\s+WHERE\s+(.*)', statement, re.I)
    if match is None:
        raise RuntimeError('%s changes spell identity/content; review encounter lessons' % where)
    changed = {name.lower() for name in re.findall(r'`?(\w+)`?\s*=', match[1])}
    if changed & {'name', 'spellid', 'content_tag'}:
        raise RuntimeError('%s changes spell identity/content; review encounter lessons' % where)
    if not changed & {'jobs', 'aoe'}:
        return rows
    # The source stores jobs as a 22-byte SQL hex literal.
    assignments = re.sub(r'0x[0-9A-Fa-f]+', lambda value: str(int(value[0], 16)), match[1])
    changes = {key.lower(): value for key, value in source_tables.parse_pairs(assignments, where).items()}
    names = re.fullmatch(r"`?name`?\s+IN\s*\(\s*('[^']+'(?:\s*,\s*'[^']+')*)\s*\)", match[2], re.I)
    condition = None if names else {key.lower(): value for key, value in source_tables.parse_pairs(match[2], where).items()}
    selected = set(re.findall(r"'([^']+)'", names[1])) if names else set()
    for row in rows:
        normalized = {key.lower(): value for key, value in row.items()}
        if (row['name'] in selected if names else all(normalized.get(key) == value for key, value in condition.items())):
            for key in ('jobs', 'AOE'):
                if key.lower() in changes:
                    row[key] = changes[key.lower()]
    return rows


def blue_entry(spell, tables, skill_id):
    jobs = spell.get('jobs')
    if not isinstance(jobs, int) or jobs < 0 or jobs >= 1 << (22 * 8):
        raise RuntimeError('Unreadable Blue spell job levels: %s' % spell.get('name'))
    level = jobs.to_bytes(22, 'big')[15] or 255
    return dict(id=spell['spellid'], name=label(spell['name']), level=level,
                min_skill=max(0, tables.max_skill(skill_id, 'blu', level) - 31))


def move_danger(row):
    entry = DANGERS.get(row['mob_skill_name'])
    if entry is None:
        return None
    scope = MOVE_TARGETING.get(row.get('mob_skill_aoe'))
    return entry[0], entry[1] + (' Source targeting: %s.' % scope if scope else '')


def danger_entry(name, reviewed, effect, critical=None, mighty_strikes=False, targeting=None):
    """Keep reviewed details while adding source effects and critical-hit conditions."""
    effect, critical = effect or {}, critical or {}
    labels = list(effect.get('effects', ()))
    crit_labels = []
    if critical.get('can_crit'):
        crit_labels.append(critical.get('display_label', 'can crit'))
    elif mighty_strikes and critical.get('mighty_strikes'):
        crit_labels.append('can crit during Mighty Strikes')
    if not reviewed and not labels and not crit_labels:
        return None
    summary = reviewed[0] if reviewed else name + ': ' + ', '.join(labels + crit_labels)
    if reviewed and crit_labels:
        summary += ', ' + ', '.join(crit_labels)
    notes = [reviewed[1]] if reviewed and reviewed[1] else []
    if reviewed and labels:
        notes.append('Possible effects: %s.' % ', '.join(labels))
    notes.extend(effect.get('notes', ()))
    if critical.get('can_crit'):
        notes.extend(critical.get('notes', ()))
    elif crit_labels:
        notes.extend(critical.get('mighty_notes', ()))
    if not reviewed and targeting:
        notes.append('Source targeting: %s.' % targeting)
    notes.extend(effect.get('unknown', ()))
    notes.extend(critical.get('unknown', ()))
    return summary, ' '.join(dict.fromkeys(notes))



def structured_danger(kind, number, name, rendered, effect, critical=False, details=None):
    labels = sorted(set(effect.get('effects', ())))
    categories = set()
    for value in labels:
        if value in ('Buff removal', 'Buff theft'):
            categories.add('dispel')
        elif value.endswith(' drain'):
            categories.add('drain')
        elif value in ('Instant KO', 'Forced Escape', 'Enmity reset'):
            categories.add('other')
        else:
            categories.add('debuff')
    if critical:
        categories.add('crit')
    if not categories:
        categories.add('other')
    notes = [rendered[1]] if rendered[1] else []
    return dict(kind=kind, id=number, name=name, summary=rendered[0], notes=notes,
                categories=sorted(categories), effects=labels, details=details or {})


def danger_section(entries, reasons=(), notes=()):
    reasons = list(dict.fromkeys(reasons))
    coverage = 'partial' if reasons and entries else 'unresolved' if reasons else 'resolved'
    value = '; '.join(dict.fromkeys(entry['summary'] for entry in entries))
    if not value:
        value = 'Move list unresolved' if reasons else 'No listed threats'
    lines = [entry['summary'] + ('. ' + ' '.join(entry['notes']) if entry['notes'] else '.') for entry in entries]
    lines.extend(notes)
    lines.extend(reasons)
    if not entries:
        lines.append('An empty list does not mean this monster is safe.')
    return section(value, list(dict.fromkeys(lines)), entries=entries, coverage=coverage,
                   incomplete=bool(reasons), reasons=reasons, general_notes=list(dict.fromkeys(notes)))


class SpellCandidates(list):
    def __init__(self, values=(), reasons=()):
        super().__init__(values)
        self.reasons = list(dict.fromkeys(reasons))


def merge_ranges(ranges):
    out = []
    for low, high in sorted(set(tuple(value) for value in ranges)):
        if out and low <= out[-1][1] + 1:
            out[-1][1] = max(out[-1][1], high)
        else:
            out.append([low, high])
    return out



def actor_names(text):
    names = {'mob', 'mobArg'}
    names.update(re.findall(r'\b(\w+Mob):', text))
    names.update(re.findall(r'(?:entity\.onMob\w+|g_mixins\.[\w.]+)\s*=\s*function\(\s*(\w+)', text))
    for match in re.finditer(r"\b(\w+):addListener\(\s*['\"][^'\"]+['\"],\s*['\"][^'\"]+['\"],\s*function\(\s*(\w+)", text):
        if match[1] in names:
            names.add(match[2])
    return names


def list_values(expression, text, enum, prefix):
    """A local variable is fixed only when every reachable write agrees."""
    number = literal(expression, enum, prefix)
    if number is not None:
        return {number}, False
    read = re.fullmatch(r"(\w+):getLocalVar\(\s*(['\"])(.*?)\2\s*\)", expression.strip())
    actors = actor_names(text)
    if read is None or read[1] not in actors:
        return set(), True
    values, unknown, writes = set(), False, 0
    for match in re.finditer(r'\b(\w+):setLocalVar\s*\(', text):
        args = lua_source.call_arguments(text, match.end() - 1)
        if match[1] not in actors or not args or len(args) != 2 or args[0].strip("'\"") != read[3]:
            continue
        writes += 1
        number = literal(args[1], enum, prefix)
        if number is None:
            unknown = True
        else:
            values.add(number)
    if unknown or not writes or len(values) != 1:
        return set(), True
    return values, False


def claim_rules(text):
    if not text:
        return {}
    default = re.search(r'local claimshieldTime\s*=\s*(\d+)', text)
    if default is None:
        raise RuntimeError('Claimshield has no readable default duration')
    body = lua_source.block(text, text.index('local shieldedEntities'), CLAIM)
    out = {}
    for match in re.finditer(r"\['([^']+)'\]\s*=\s*\{", body):
        zone = match[1]
        members = lua_source.block(body, match.start(), CLAIM)
        for entry in re.finditer(r"\{\s*name\s*=\s*'([^']+)'\s*,\s*time\s*=\s*(\d+)\s*\}|'([^']+)'", members):
            name, millis = (entry[1], int(entry[2])) if entry[1] else (entry[3], int(default[1]))
            out[zone, name] = millis / 1000
    return out


class Reader:
    def __init__(self, tree, tables, scripts, roots, allowed):
        self.tree, self.tables, self.scripts = str(tree), tables, scripts
        if self.tables is None:
            self.tables = source_tables.Tables(tree, allowed)
        self.roots, self.allowed = roots, allowed
        self.documents, self.sources, self.trades = {}, {}, {}
        self.loaded = aggro.lua_files_loaded(self.tree)
        self.claims = claim_rules(text_at(tree, CLAIM)) if CLAIM in self.loaded else {}
        self.module_targets = set()
        for rel in self.loaded:
            text = text_at(tree, rel)
            for zone, mob, handler in re.findall(r'xi\.zones\.(\w+)\.mobs\.(\w+)\.(onMob\w+)', text):
                if handler not in ('onMobDeath', 'onMobDespawn'):
                    self.module_targets.add((zone, mob))
        self.data = {}
        spell_rows = sql_rows(Path(tree) / 'sql/spell_list.sql', 'spell_list')
        columns = {}
        for table in KIT_TABLES:
            path = Path(tree) / 'sql' / (table + '.sql')
            self.data[table] = sql_rows(path, table)
            columns[table] = sqlfile.columns(path.read_text(encoding='utf8'), table)
        for rel, table, statement in source_tables.module_statements(self.tree):
            if table in KIT_TABLES:
                self.data[table] = apply_sql(self.data[table], columns[table], statement, rel)
            if table == 'spell_list':
                spell_rows = apply_spell_jobs(spell_rows, statement, rel)
        self.skills = {row['mob_skill_id']: row for row in self.data['mob_skills']}
        self.skill_lists, self.spell_lists, self.blue = defaultdict(set), defaultdict(list), defaultdict(set)
        for row in self.data['mob_skill_lists']:
            self.skill_lists[row['skill_list_id']].add(row['mob_skill_id'])
        for row in self.data['mob_spell_lists']:
            self.spell_lists[row['spell_list_id']].append(row)
        self.spells = {row['spellid']: row for row in spell_rows
                       if allowed.allows(row['content_tag'])}
        self.blue_skill = source_tables.read_enum(tree, 'skill_type')['blue_magic']
        self.blue_entries = {}
        self.move_enum = source_tables.lua_enum(str(Path(tree) / 'scripts/enum/mob_skill.lua'), 'xi.mobSkill')
        self.spell_enum = source_tables.lua_enum(str(Path(tree) / 'scripts/enum/magic.lua'), 'xi.magic.spell')
        self.move_sources, self.module_overrides = {}, defaultdict(list)
        for rel in self.loaded:
            for target, args, body in overrides(text_at(tree, rel)):
                self.module_overrides[target].append((args, body))
        for row in self.data['blue_spell_list']:
            if row['spellid'] in self.spells:
                self.blue[row['mob_skill_id']].add(row['spellid'])
                self.blue_entries[row['spellid']] = blue_entry(self.spells[row['spellid']], self.tables, self.blue_skill)
        check_source(tree, self.loaded)
        self.danger_effects = danger_effects.build(self.tree, self.skills.values(), self.spells.values(), self.loaded)
        self.danger_crit = danger_crit.Reader(self.tree, self.loaded)
        from . import danger_details
        self.danger_details = danger_details.Reader(self.tree, self.loaded)
        self.danger_attacks = danger_attacks.Reader(self.tree, self.loaded)
        danger_jobs.check_source(self.tree, self.loaded)

    def dangers(self, kind, attrs, kit_text, skills, spells, reasons):
        effects = getattr(self, 'danger_effects', {})
        critical = getattr(self, 'danger_crit', None)
        details_reader = getattr(self, 'danger_details', None)
        skill_facts = {n: critical.read(self.skills[n]['mob_skill_name']) for n in skills} if critical else {}
        statuses, status_notes = danger_jobs.available_statuses(kind, attrs, kit_text, skill_facts) if critical else (set(), [])
        if (kind.zone_dir, kind.script) == TIAMAT:
            statuses.discard('MIGHTY_STRIKES')
        forced = set()
        for match in re.finditer(r'\b(?:mob\w*|\w+Mob):useMobAbility\s*\(', kit_text):
            args = lua_source.call_arguments(kit_text, match.end() - 1)
            number = literal(args[0], getattr(self, 'move_enum', {}), 'xi.mobSkill') if args else None
            if number is not None:
                forced.add(number)
        entries, unknown = [], list(getattr(spells, 'reasons', ()))
        attack_reader = getattr(self, 'danger_attacks', None)
        if attack_reader:
            attack = attack_reader.read(kind, attrs, kit_text, statuses, skills)
            if attack['effects']:
                rendered = ('Normal attacks: ' + ', '.join(attack['effects']), ' '.join(attack['notes']))
                entry = structured_danger('attack', 0, 'Normal attacks', rendered, attack)
                if details_reader:
                    entry['details'] = {'notes': [], 'unknown': []}
                    details_reader.removals(attack, entry['details'])
                entries.append(entry)
            unknown.extend(attack['unknown'])
        unresolved_buffs = 'Some job-special buff choices depend on script values that could not be resolved.'
        if unresolved_buffs in status_notes:
            unknown.append(unresolved_buffs)
        for n in sorted(skills):
            row = self.skills[n]
            targets = row.get('mob_valid_targets', 4)
            if not targets & 4 and not (targets & 2048 and n in forced):
                continue
            effect, crit = effects.get('skills', {}).get(n, {}), skill_facts.get(n, {})
            mighty = 'MIGHTY_STRIKES' in statuses and (n in forced or 'MIGHTY_STRIKES' not in crit.get('blocked_statuses', ()))
            rendered = danger_entry(label(row['mob_skill_name']), move_danger(row), effect, crit, mighty,
                                    MOVE_TARGETING.get(row.get('mob_skill_aoe')))
            details = details_reader.skill(dict(row, forced=n in forced), effect) if details_reader and rendered else {}
            if rendered:
                entry = structured_danger('skill', n, label(row['mob_skill_name']), rendered, effect,
                                          bool(crit.get('can_crit') or mighty and crit.get('mighty_strikes')), details)
                if n in forced:
                    entry['forced'] = True
                entries.append(entry)
            unknown.extend(effect.get('unknown', ()))
            unknown.extend(crit.get('unknown', ()))
            unknown.extend(details.get('unknown', ()))
        for spell in spells:
            reviewed = (SPELL_DANGERS[spell['name']], '') if spell['name'] in SPELL_DANGERS else None
            effect = effects.get('spells', {}).get(spell['spellid'], {})
            crit = critical.spell(spell['name']) if critical else {}
            buffs = [name for name in crit.get('required_statuses', ()) if name in statuses]
            sneak = crit.get('sneak_attack') and 'SNEAK_ATTACK' in statuses and spell.get('AOE') == 0
            shown_crit = {}
            if buffs or sneak:
                conditions = [label(name.lower()) for name in buffs] + (['Sneak Attack'] if sneak else [])
                shown_crit = dict(can_crit=True, display_label='can crit during ' + ' or '.join(conditions), notes=[
                    'Requires one of these buffs to be active. The current critical chance is not known.'])
                if sneak:
                    shown_crit['notes'].append('Sneak Attack also requires the caster to be behind the target or have Hide.')
            rendered = danger_entry(label(spell['name']), reviewed, effect, shown_crit)
            details = details_reader.spell(spell, effect) if details_reader and rendered else {}
            if rendered:
                entry = structured_danger('spell', spell['spellid'], label(spell['name']), rendered, effect,
                                          bool(shown_crit), details)
                if spell.get('level_ranges'):
                    entry['level_ranges'] = spell['level_ranges']
                if spell.get('forced'):
                    entry['forced'] = True
                if spell.get('conditional_list'):
                    entry['notes'].append('The monster switches spell lists during the fight. These are possible source spells, not its current phase.')
                if spell.get('scripted'):
                    entry['notes'].append('Scripted spell selection has separate conditions from the ordinary spell-list level limits.')
                entries.append(entry)
            unknown.extend(effect.get('unknown', ()))
            unknown.extend(crit.get('unknown', ()))
            unknown.extend(details.get('unknown', ()))
        notes = ['These are possible moves from the source. They do not predict the next move.',
                 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.']
        if any(entry.get('level_ranges') for entry in entries):
            notes.append("Listed spells can depend on the monster's level; explicit scripted casts have separate conditions.")
        reasons = list(dict.fromkeys(list(reasons) + unknown))
        notes.extend(status_notes)
        return danger_section(entries, reasons, notes)

    def kit_source(self, kind):
        """Effective callbacks and the local/helpers/mixins they can call, not unused functions."""
        cache = getattr(self, 'move_sources', {})
        key = kind.zone_dir, kind.script, tuple(sorted(kind.group_mixins))
        if key in cache:
            return cache[key]
        text = text_at(self.tree, 'scripts/zones/%s/mobs/%s.lua' % key[:2])
        functions = function_parts(text)
        active = {name for name in functions if name.startswith('entity.on') and name not in
                  {'entity.onMobDeath', 'entity.onMobDespawn', 'entity.onSteal'}}
        prefix = 'xi.zones.%s.mobs.%s.' % key[:2]
        for target, changes in getattr(self, 'module_overrides', {}).items():
            if not target.startswith(prefix):
                continue
            handler = 'entity.' + target[len(prefix):]
            if handler in {'entity.onMobDeath', 'entity.onMobDespawn', 'entity.onSteal'}:
                continue
            for index, (args, body) in enumerate(changes):
                if re.search(r'\bsuper\s*\(', body) and handler in functions:
                    previous = 'entity.previous_%d_%s' % (index, target[len(prefix):])
                    functions[previous] = functions[handler].replace(handler, previous, 1)
                    body = re.sub(r'\bsuper\s*\(', previous + '(', body)
                functions[handler] = handler + ' = function(' + args + ')\n' + body + '\nend'
                active.add(handler)
        mixins = mixin_names(text) | set(kind.group_mixins)
        for mixin in sorted(mixins):
            extra = text_at(self.tree, 'scripts/mixins/' + mixin + '.lua')
            found = function_parts(extra)
            functions.update(found)
            active.update(name for name in found if name.startswith('g_mixins.'))
            text += '\n' + extra
        bodies, seen, reasons = [], set(), []
        pending = list(sorted(active))
        while pending:
            name = pending.pop()
            if name in seen:
                continue
            seen.add(name)
            body = functions.get(name)
            if body is None:
                path = self.scripts.helpers.get(name)
                if path:
                    extra = text_at(self.tree, str(Path(path).relative_to(self.tree)).replace('\\', '/'))
                    functions.update(function_parts(extra))
                    text += '\n' + extra
                    body = functions.get(name)
            if body is None:
                reasons.append('A helper used by the monster could not be read: %s.' % name)
                continue
            bodies.append(body)
            actors = '|'.join(re.escape(value) for value in sorted(actor_names(text)))
            calls = re.findall(r'(?<![\w.:])([\w.]+)\s*\(\s*(?:' + actors + r')\b', body)
            for called in calls:
                if called != name and (called in functions or called.startswith('xi.')):
                    pending.append(called)
        # Literal global choice tables are data, not additional callbacks.
        tables = []
        for match in re.finditer(r'^local\s+(\w+)\s*=\s*\{', text, re.M):
            payload = lua_source.block(text, match.start(), 'monster choice table')
            tables.append('local %s = {%s}' % (match[1], payload))
        result = '\n'.join(tables + bodies), list(dict.fromkeys(reasons))
        cache[key] = result
        self.move_sources = cache
        return result

    def document(self, kind):
        zone = getattr(kind, 'data_zone', None)
        if not zone:
            return {}
        if zone not in self.documents:
            self.documents[zone] = overlays.load_merged(self.tree, self.roots, 'zones/%s/mobs' % zone)
        return self.documents[zone]

    def source(self, kind):
        key = kind.zone_dir, kind.script, tuple(sorted(kind.group_mixins))
        if key not in self.sources:
            text = text_at(self.tree, 'scripts/zones/%s/mobs/%s.lua' % key[:2])
            source = lua_source.LuaFile('/'.join(key[:2]), text)
            mixins = set(source.mixins) | set(kind.group_mixins)
            related = [text]
            pending = [source]
            seen = set()
            while pending:
                part = pending.pop()
                paths = [('scripts/mixins/' + name + '.lua', None) for name in part.mixins]
                if part is source:
                    paths.extend(('scripts/mixins/' + name + '.lua', None) for name in kind.group_mixins)
                for handler, _, helper, _ in part.helpers:
                    if handler not in ('onMobDeath', 'onMobDespawn'):
                        path = self.scripts.helpers.get(helper)
                        if path:
                            paths.append((str(Path(path).relative_to(self.tree)).replace('\\', '/'), helper))
                        else:
                            related.append('setSpellList')
                for path, helper in paths:
                    if (path, helper) in seen:
                        continue
                    seen.add((path, helper))
                    extra = text_at(self.tree, path)
                    if helper:
                        extra = helper_body(extra, helper) or 'setSpellList'
                    nested = lua_source.LuaFile(path, extra)
                    mixins.update(nested.mixins)
                    related.append(extra)
                    pending.append(nested)
            self.sources[key] = source, '\n'.join(related), mixins
        return self.sources[key]

    def pop_items(self, zone):
        if zone in self.trades:
            return self.trades[zone]
        out = defaultdict(list)
        names = outside.id_names(self.tree, zone)
        folder = Path(self.tree) / 'scripts/zones' / zone / 'npcs'
        for file in sorted(folder.glob('*.lua')):
            text = lua_source.strip_comments(file.read_text(encoding='utf8'))
            pops = re.findall(r'npcUtil\.popFromQM\(player,\s*npc,\s*ID\.mob\.(\w+)', text)
            items = re.findall(r'npcUtil\.tradeHas\(trade,\s*xi\.item\.(\w+)\s*\)', text)
            if len(set(pops)) == 1 and len(set(items)) == 1 and pops[0] in names:
                out[names[pops[0]]].append('Trade %s to the ???; other trade and spawn checks still apply.' % label(items[0]))
        self.trades[zone] = out
        return out

    def spawn(self, kind, attrs, combined):
        spawn = attrs.get('spawn') or {}
        kinds = spawn.get('type') or []
        kinds = [kinds] if isinstance(kinds, str) else kinds
        notes, values = [], []
        window = spawn.get('window')
        if not window:
            if 'at_night' in kinds:
                window = {'start': 20, 'end': 4}
            elif 'at_evening' in kinds:
                window = {'start': 18, 'end': 6}
        if window and window.get('start') is not None and window.get('end') is not None:
            hours = '%02d:00-%02d:00' % (window['start'], window['end'])
            values.append(hours)
            notes.append('Source spawn window: %s Vana\'diel time. The end hour is excluded.' % hours)
            notes.append('The source despawns this monster outside its time window.')
        if 'fog' in kinds:
            values.append('Fog')
            notes.append('Requires fog weather.')
        if 'weather' in kinds and kind.ecosystem == 'elemental':
            element = attrs.get('element')
            values.append('%s weather' % label(element) if element else 'Matching weather')
            notes.append('An unowned elemental requires weather matching its source element. Weather ending can make it despawn.')
        timer = spawn.get('respawn')
        if isinstance(timer, (int, float)) and timer > 0:
            if not kind.nm and not re.search(r'setRespawnTime|setLocalVar\([\'\"](?:pop|respawn)', combined):
                values.append('Respawn ' + duration(timer))
                notes.append('Base respawn delay: %s after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.' % duration(timer))
            elif kind.nm:
                notes.append('The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.')
        if 'lottery' in kinds:
            values.append('Lottery')
            notes.append('Lottery spawn; see a listed placeholder for its chance and cooldown rules.')
        pops = self.pop_items(kind.zone_dir).get(kind.script, [])
        if pops:
            values.append('Trade pop')
            notes.extend(pops)
        if re.search(r'onMobSpawnCheck|setRespawnTime', combined):
            notes.append('Scripted spawn or respawn checks also apply. Their current state is not visible.')
            if not values:
                values.append('Scripted spawn')
        if not values and not notes:
            return None
        notes.append('Source rules only; no remaining time or open spawn window is known.')
        return section('; '.join(dict.fromkeys(values)) or 'Spawn rules', notes)

    def kit(self, kind, attrs, combined, extra_reasons=()):
        mob_mods = attrs.get('mob_mods') or {}
        pool = getattr(kind, 'instance_pool', {}) or {}
        list_id = mob_mods.get('skill_list', pool.get('skill_list_id', attrs.get('skill_list_id', 0)))
        skills = set(self.skill_lists.get(list_id, ()))
        extra, special, forced, reasons = set(), set(), set(), list(extra_reasons)
        move_enum, spell_enum = getattr(self, 'move_enum', {}), getattr(self, 'spell_enum', {})
        if list_id and list_id not in self.skill_lists:
            reasons.append('The assigned TP-move list is missing from the source tables.')
        if kind.zone_dir.startswith('Dynamis-') or 'battlefield' in getattr(kind, 'types', ()) or pool:
            reasons.append('Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.')
            return set(), [], list(dict.fromkeys(reasons))
        if getattr(getattr(kind, 'effects', None), 'job_changes', ()):
            reasons.append('Scripted job changes may add move lists that are not resolved.')
        parsed = lua_source.LuaFile('kit', combined)
        calls = [call for call in parsed.calls if call.own and call.method == 'setMobMod' and len(call.args) == 2]
        for call in sorted(calls, key=lambda call: (0 if call.handler == 'onMobInitialize' else 1 if call.handler == 'onMobSpawn' else 2, call.line_no)):
            name, expression = call.args
            if name not in ('xi.mobMod.SKILL_LIST', 'xi.mobMod.SPECIAL_SKILL', 'xi.mobMod.ATTACK_SKILL_LIST'):
                continue
            numbers, unknown = list_values(expression, combined, move_enum, 'xi.mobSkill')
            if unknown:
                if name == 'xi.mobMod.SKILL_LIST':
                    skills.clear()
                reasons.append('A scripted %s value is not resolved.' % name.split('.')[-1].lower().replace('_', ' '))
            if name == 'xi.mobMod.SKILL_LIST' and call.top and call.handler in ('onMobInitialize', 'onMobSpawn'):
                skills.clear()
            for number in numbers:
                if name == 'xi.mobMod.SPECIAL_SKILL':
                    if number > 0:
                        special.add(number)
                else:
                    (extra if name == 'xi.mobMod.ATTACK_SKILL_LIST' else skills).update(self.skill_lists.get(number, ()))
                    if number and number not in self.skill_lists:
                        reasons.append('A scripted TP-move list is missing from the source tables.')
        if mob_mods.get('special_skill', 0) > 0:
            special.add(mob_mods['special_skill'])
        if mob_mods.get('skill_list_2'):
            reasons.append('An alternate TP-move list has unresolved selection rules.')
        if mob_mods.get('attack_skill_list'):
            extra.update(self.skill_lists.get(mob_mods['attack_skill_list'], ()))
        functions = function_parts(combined)
        for match in re.finditer(r'\b(?:mob\w*|\w+Mob):(?P<method>useMobAbility|setMobSkillAttack)\s*\(', combined):
            args = lua_source.call_arguments(combined, match.end() - 1)
            number = literal(args[0], move_enum, 'xi.mobSkill') if args else None
            if number is None:
                reasons.append('A scripted %s argument is not resolved.' % ('move' if match['method'] == 'useMobAbility' else 'attack list'))
            elif number > 0:
                if match['method'] == 'useMobAbility':
                    forced.add(number)
                else:
                    extra.update(self.skill_lists.get(number, ()))
        # Ordinary attack lists run through the same chooser as the TP pool.
        selector = 'entity.onMobMobskillChoose'
        if selector in functions or 'onMobMobskillChoose' in combined:
            normal_available = any(n in self.skills for n in skills | extra)
            selected, fallback, unknown = chooser(combined, selector, move_enum, 'xi.mobSkill')
            if not fallback:
                skills.clear()
                extra.clear()
            if normal_available:
                skills.update(selected)
            reasons.extend(unknown)
        if re.search(r':setMobAbilityEnabled\(false\)', combined) and not re.search(r':setMobAbilityEnabled\((?!false\))', combined):
            skills.clear()
            reasons.append('Scripts disable ordinary TP moves; only explicit scripted moves are listed.')
        # Forced actions bypass the ordinary move check. Attack lists still use it.
        skills.update(extra | special | forced)
        valid = set()
        for skill_id in skills:
            row = self.skills.get(skill_id)
            if row is None:
                reasons.append('A referenced monster move is missing from the source tables.')
                continue
            text = text_at(self.tree, 'scripts/actions/mobskills/%s.lua' % row['mob_skill_name'])
            target = 'xi.actions.mobskills.%s.onMobSkillCheck' % row['mob_skill_name']
            for args, body in getattr(self, 'module_overrides', {}).get(target, ()):
                if 'super(' not in body:
                    text = 'mobskill.onMobSkillCheck = function(' + args + ')\n' + body + '\nend'
            # Missing checks and bare rejections cannot offer a move. Conditional checks stay possible.
            if skill_id not in forced and not possible_skill(text):
                continue
            valid.add(skill_id)
        spell_ids, forced_spells, selected_spells = set(), set(), set()
        ranges, spell_reasons = defaultdict(list), []
        spell_list = pool.get('spellList', attrs.get('spell_list_id', 0))
        lists, changed, conditional_lists = {spell_list}, False, False
        list_calls = [call for call in parsed.calls if call.own and call.method == 'setSpellList']
        for call in sorted(list_calls, key=lambda item: (0 if item.handler == 'onMobInitialize' else 1 if item.handler == 'onMobSpawn' else 2, item.line_no)):
            values, missing = list_values(call.args[0], combined, {}, '') if len(call.args) == 1 else (set(), True)
            top = call.top and call.handler in ('onMobInitialize', 'onMobSpawn')
            valid_lists = {value for value in values if value == 0 or value in self.spell_lists}
            invalid = values - valid_lists
            # A missing native list leaves the previous container untouched.
            if top and not invalid:
                lists.clear()
            if not top:
                conditional_lists = True
            lists.update(valid_lists)
            changed = True
            if missing:
                spell_reasons.append('A scripted spell-list replacement is not resolved.')
            if invalid:
                spell_reasons.append('A scripted spell-list ID is missing from the source; its previous list is retained.')
        if ('setSpellList' in combined and not list_calls) or 'xi.mobMod.SPELL_LIST' in combined:
            lists.clear()
            spell_reasons.append('A scripted spell-list replacement is not resolved.')
        for current_list in sorted(lists):
            if current_list and current_list not in self.spell_lists:
                spell_reasons.append('An assigned spell list is missing from the source tables.')
            for row in self.spell_lists.get(current_list, ()):
                if row['spell_id'] in self.spells and any(row['min_level'] <= n <= row['max_level'] for n in kind.levels):
                    spell_ids.add(row['spell_id'])
                    ranges[row['spell_id']].append([row['min_level'], row['max_level']])
        if 'entity.onMobSpellChoose' in functions:
            selected, fallback, unresolved = chooser(combined, 'entity.onMobSpellChoose', spell_enum, 'xi.magic.spell')
            if not fallback:
                spell_ids.clear()
            spell_ids.update(selected)
            selected_spells.update(selected)
            spell_reasons.extend(unresolved)
        elif 'onMobSpellChoose' in combined:
            spell_ids.clear()
            spell_reasons.append('A scripted spell chooser is not resolved.')
        for match in re.finditer(r'\b(?:mob\w*|\w+Mob):castSpell\s*\(', combined):
            args = lua_source.call_arguments(combined, match.end() - 1)
            number = literal(args[0], spell_enum, 'xi.magic.spell') if args else None
            if number is not None:
                spell_ids.add(number)
                forced_spells.add(number)
            else:
                spell_reasons.append('A scripted spell argument is not resolved.')
        spells = SpellCandidates(reasons=spell_reasons)
        for number in sorted(spell_ids):
            if number not in self.spells:
                spells.reasons.append('A scripted spell is missing or disabled in the source tables.')
                continue
            row = dict(self.spells[number])
            if changed and conditional_lists and number not in selected_spells | forced_spells:
                row['conditional_list'] = True
            if re.search(r':set(?:AoE|Radius|Range)\s*\(', combined):
                row['targeting_scripted'] = True
            if number in forced_spells:
                row['forced'] = True
            if number in selected_spells:
                row['scripted'] = True
            elif ranges.get(number):
                row['level_ranges'] = merge_ranges(ranges[number])
            spells.append(row)
        return valid, spells, list(dict.fromkeys(reasons))

    def fight(self, kind, source, combined, mixins, attrs):
        values, notes = [], []
        if 'rage' in mixins:
            timers = re.findall(r"setLocalVar\(['\"]\[rage\]timer['\"],\s*([^\n]+)\)", source.text)
            time = int(timers[0]) if len(set(timers)) == 1 and timers[0].isdigit() else 1200 if not timers else None
            values.append('Rage ' + duration(time) if time is not None else 'Rage timer varies')
            notes.append('Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.')
        idle = (attrs.get('mob_mods') or {}).get('idle_despawn')
        calls = [call for call in source.calls if call.method == 'setMobMod' and call.args
                 and call.args[0] == 'xi.mobMod.IDLE_DESPAWN']
        if calls:
            fixed = [call for call in calls if call.top and call.handler in ('onMobInitialize', 'onMobSpawn')
                     and len(call.args) > 1 and call.args[1].isdigit()]
            idle = int(fixed[-1].args[1]) if len(fixed) == len(calls) else None
            if idle is None:
                values.append('Idle despawn varies')
        if idle and idle > 0:
            values.append('Idle despawn ' + duration(idle))
            notes.append('Source idle-despawn delay: %s. This is not its remaining lifetime.' % duration(idle))
        if kind.zone_dir == 'Xarcabard' and kind.script in BOREAL_NAMES and BOREAL in self.loaded:
            values.append('Tunnel draw-in')
            notes.append('Phoenix replaces this fight handler: crossing its tunnel boundary stops movement and draws the target in after a 2-second wait. No safe map area is inferred.')
        elif 'draw_in' in mixins:
            values.append('Draw-in')
            notes.append('The draw-in mixin checks the current target at twice the monster\'s melee range or farther.')
        elif re.search(r'utils\.drawIn|:drawIn\(', combined):
            values.append('Conditional draw-in')
            notes.append('Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.')
        if (kind.zone_dir, kind.script) in self.module_targets:
            # Module wrappers can replace a fight handler, so keep only the generic boundary.
            if 'Draw-in' in values or 'Conditional draw-in' in values:
                notes.append('Loaded Phoenix overrides can change the pull boundary; no map-safe area is inferred.')
        if (kind.zone_dir, kind.script) == TIAMAT:
            values.append('Flight and low-HP phases')
            notes.extend([
                'Flight phases can change after 120 seconds or more than 10,000 HP lost in that phase; busy actions and Mighty Strikes can delay the change.',
                'At 25% HP or lower, Tiamat gains a 75-power attack boost. At 10% HP or lower, its source attack delay falls from 210 to 160.',
                'Mighty Strikes stops its casting, TP moves and phase changes while active. These are source rules, not a forecast of the next action.'])
        return section('; '.join(values), notes) if values else None

    def read(self, kind, levels=None):
        info, by_index = {}, {}
        source, combined, mixins = self.source(kind)
        attrs = dict((kind.attributes or {}).get('source') or {})
        doc = self.document(kind)
        template = (doc.get('templates') or {}).get(kind.template) or {}
        for key in ('skill_list_id', 'spell_list_id'):
            if key in template:
                attrs[key] = template[key]
        spawn_info = self.spawn(kind, attrs, combined)
        spawns = {key & 0xFFF: value for key, value in (doc.get('spawns') or {}).items()
                  if isinstance(key, int) and value and (key & 0xFFF) in kind.ids}
        effective = getattr(kind, 'source_by_index', {})
        per_spawn = {index: self.spawn(kind, effective.get(index) or overlays.merge_patch(attrs, spawn.get('attributes') or {}), combined)
                     for index, spawn in spawns.items()}
        if per_spawn and all(value == next(iter(per_spawn.values())) for value in per_spawn.values()):
            spawn_info = next(iter(per_spawn.values()))
        elif per_spawn:
            spawn_info = section('Spawn rules vary by spawn', ['Select a known spawn for its source window and respawn rules.'])
            for index, value in per_spawn.items():
                by_index[index] = {'spawn': value or section('No listed spawn condition', ['No extra declarative condition was found for this spawn. Scripts can still apply.'])}
        if spawn_info:
            info['spawn'] = spawn_info
        claim = self.claims.get((kind.zone_dir, kind.script))
        if claim is not None:
            info['claim'] = section('Claimshield ' + duration(claim), [
                'This Phoenix list entry is unclaimable and unkillable for %s after spawning. Call for Help is blocked during the shield.' % duration(claim),
                'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.'])
        fight = self.fight(kind, source, combined, mixins, attrs)
        if fight:
            info['fight'] = fight
        kit_text, source_reasons = self.kit_source(kind)
        skills, spells, reasons = self.kit(kind, attrs, kit_text, source_reasons)
        danger = self.dangers(kind, attrs, kit_text, skills, spells, reasons)
        if danger:
            info['dangers'] = danger
        lessons = sorted({spell for skill in skills for spell in self.blue.get(skill, ())})
        if lessons:
            entries = [dict(self.blue_entries[n], skill_ids=sorted(skill for skill in skills if n in self.blue.get(skill, ()))) for n in lessons]
            notes = ['Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.']
            requirements = [
                'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.',
                'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.',
                'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.']
            if reasons:
                notes += ['Additional lessons are unknown because part of the move selection is unresolved.'] + reasons
            info['blue'] = section(', '.join(item['name'] for item in entries), notes, spells=entries,
                                   requirements=requirements, incomplete=bool(reasons))
        elif reasons:
            info['blue'] = section('Unknown', reasons, incomplete=True)
        else:
            info['blue'] = section('No learnable Blue spells', ['No enabled Blue Magic lesson is mapped to the usable source moves for this monster.'])
        if (kind.zone_dir, kind.script) == TIAMAT:
            extra = 'Low-HP attack boost; flight; Firaga III'
            existing = info['dangers']
            fight_notes = [
                'The reviewed fight script gains an attack boost at 25% HP and attacks faster at 10% HP.',
                'Its spell chooser includes Firaga III and Blaze Spikes. Flight changes its normal attacks and landing uses Touchdown.',
                'Mighty Strikes and other fight conditions restrict these actions. This is a reviewed danger summary, not a complete kit or next-move prediction.']
            entry = dict(kind='fight', id=0, name='Fight conditions', summary=extra, notes=fight_notes,
                         categories=['other'], effects=[], details={})
            info['dangers'] = danger_section(existing['entries'] + [entry], existing['reasons'], existing['general_notes'])
        return info, by_index
