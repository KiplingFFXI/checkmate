"""
Changes other scripts make to monsters. ??? NPCs add loot listeners to the NM they pop, and battlefield scripts
give their monsters mixins or change their numbers or aggro mid-fight.

The exporter has to know every one of these calls. It reads the ??? loot listeners and battlefield group mixins
from source. The rest sit in HAND below with what they do, and any other call stops the export.
"""
import glob
import os
import re

from . import lua_source

# Calls that change a monster's numbers, magic damage, loot or aggro, whatever receives them.
CHANGE_CALL = re.compile(r'(\w+|\))\s*:\s*(?:(?:set|add|del)Mod\(xi\.mod\.(?:%s)\b|(?:add|del)Immunity\(|setMobLevel\(|'
                         r"addListener\('ITEM_DROPS'|setAggressive\(|setTrueDetection\(|"
                         r'setMobMod\(xi\.mobMod\.(?:ALWAYS_AGGRO|NO_AGGRO|DETECTION)\b)'
                         % '|'.join(sorted(m.upper() for m in
                                           lua_source.RELEVANT_MODS | lua_source.ELEMENT_DAMAGE_MODS)))

# Receivers that are always players in these scripts. This list is shorter than lua_source.PLAYER_RECEIVERS on purpose.
# Battlefield scripts call their monsters target, so adding target here would drop their HAND flags.
PLAYER_RECEIVERS = {'player', 'PChar', 'playerArg'}

# Script files whose monster changes the exporter knows, with what they mean.
# Each entry is (zone script folder, monster scripts, flag), or None for calls on allies, which get no row.
HAND = {
    # A partner's death gives the survivor +30 accuracy, evasion and magic evasion 15 seconds later.
    'battlefields/Temenos/central_temenos_1st_floor.lua':
        [('Temenos', ['Airi', 'Temenos_Cleaner', 'Iruci', 'Temenos_Weapon'], 'scripted_stats')],
    # Carbuncle gets +100 evasion and takes more magic damage when the floor starts. Each elemental's death takes
    # away its element's damage cut.
    'battlefields/Temenos/central_temenos_2nd_floor.lua':
        [('Temenos', ['Mystic_Avatar_Carbuncle'], 'scripted_stats'),
         ('Temenos', ['Mystic_Avatar_Carbuncle'], 'scripted_elements')],
    # Each escort's death lowers the damage cut of the boss it guards.
    'battlefields/Temenos/central_temenos_3rd_floor.lua':
        [('Temenos', ['Abyssdweller_Jhabdebb', 'Orichalcum_Quadav', 'Pee_Qoho_the_Python'], 'scripted_elements')],
    # Each Aern adds Ancient Beastcoins for its reraises.
    'battlefields/Temenos/central_temenos_basement.lua':
        [('Temenos', ['Temenos_Aern_%s' % job for job in ('WAR', 'MNK', 'WHM', 'BLM', 'RDM', 'THF', 'PLD', 'DRK',
                                                          'BST', 'BRD', 'RNG', 'SAM', 'NIN', 'DRG', 'SMN')],
          'scripted_drops')],
    # Evil Armory stops ignoring players once the first of its guards dies. It stops nullifying magic once all
    # eight are dead.
    'battlefields/Apollyon/se_apollyon.lua': [('Apollyon', ['Evil_Armory'], 'scripted_aggro'),
                                              ('Apollyon', ['Evil_Armory'], 'scripted_elements')],
    # A manticore that outlives the other while a dhalmel is still up takes 30 percent less magic damage.
    'battlefields/Apollyon/ne_apollyon.lua': [('Apollyon', ['Criosphinx', 'Hieracosphinx'], 'scripted_elements')],
    # Cynoprosopi starts the fight with a 75 percent damage cut, and each escort's death takes part of it away.
    'battlefields/Apollyon/nw_apollyon.lua': [('Apollyon', ['Cynoprosopi'], 'scripted_elements')],
    # The chest mimics on the third floor ignore players until someone opens one.
    'battlefields/Apollyon/sw_apollyon.lua': [('Apollyon', ['Armoury_Crate_Mimic'], 'scripted_aggro')],
    # Carbuncle stops aggroing while it is away between phases.
    'battlefields/Full_Moon_Fountain/waking_the_beast.lua': [('Full_Moon_Fountain', ['Carbuncle_Prime'],
                                                             'scripted_aggro')],
    # Lamia No.19 aggroes at any level, by sight, while she is out.
    'zones/Arrapago_Reef/Zone.lua': [('Arrapago_Reef', ['Lamia_No19'], 'scripted_aggro')],
    # These set the level of an allied NPC fighter.
    'battlefields/Empyreal_Paradox/dawn.lua': None,
    'battlefields/Full_Moon_Fountain/moon_reading.lua': None,
    'battlefields/Navukgo_Execution_Chamber/shield_of_diplomacy.lua': None,
    'battlefields/QuBia_Arena/heir_to_the_light.lua': None,
    'battlefields/Throne_Room/where_two_paths_converge.lua': None,
}

# A ??? script that adds a loot listener to the NM it pops, found through the zone's IDs.lua.
QM_LISTENER = re.compile(r"GetMobByID\(ID\.mob\.(\w+)\):addListener\('ITEM_DROPS'")


def id_names(tree, zone_dir):
    """{ID.mob name: monster script} from GetFirstID('Name') lines in the zone's IDs.lua."""
    path = os.path.join(tree, 'scripts', 'zones', zone_dir, 'IDs.lua')
    if not os.path.exists(path):
        return {}
    text = open(path, encoding='utf-8', errors='replace').read()
    return dict(re.findall(r"(\w+)\s*=\s*GetFirstID\('([^']+)'\)", text))


def group_mixins(text):
    """(monster names, mixin names) for each battlefield group that lists its own mixins."""
    found = []
    for mobs, mixins in re.findall(r'mobs\s*=\s*\{([^}]*)\}(?:(?!mobs\s*=).){0,600}?mixins\s*=\s*\{([^}]*)\}', text, re.S):
        found.append((re.findall(r"'(\w+)'", mobs), lua_source.MIXIN_REQUIRE.findall(mixins)))
    return found


def scan(tree, scripts, zone_dirs):
    """
    {(zone script folder, monster script): set of flags} from battlefield scripts and the NPC and Zone.lua scripts
    of zone_dirs.
    """
    marks = {}
    root = os.path.join(tree, 'scripts')
    files = glob.glob(os.path.join(root, 'zones', '*', 'npcs', '*.lua'))
    files += glob.glob(os.path.join(root, 'zones', '*', 'Zone.lua'))
    files += glob.glob(os.path.join(root, 'battlefields', '**', '*.lua'), recursive=True)
    for path in sorted(files):
        rel = os.path.relpath(path, root).replace('\\', '/')
        if rel.startswith('zones/') and rel.split('/')[1] not in zone_dirs:
            continue
        text =lua_source.strip_comments(open(path, encoding='utf-8', errors='replace').read())
        if rel.startswith('battlefields/'):
            zone_dir = rel.split('/')[1]
            for mobs, mixins in group_mixins(text):
                for mixin in mixins:
                    numbers, loot, damage = scripts.mixin_kind(mixin)
                    for mob in mobs:
                        if numbers:
                            marks.setdefault((zone_dir, mob), set()).add('scripted_stats')
                        if loot:
                            marks.setdefault((zone_dir, mob), set()).add('scripted_drops')
                        if damage:
                            marks.setdefault((zone_dir, mob), set()).add('scripted_elements')
        hits = [match for match in CHANGE_CALL.finditer(text) if match.group(1) not in PLAYER_RECEIVERS]
        if not hits:
            continue
        if rel in HAND:
            for zone_dir, mobs, flag in HAND[rel] or []:
                for mob in mobs:
                    marks.setdefault((zone_dir, mob), set()).add(flag)
            continue
        listeners = QM_LISTENER.findall(text)
        if rel.startswith('zones/') and listeners and len(listeners) == len(hits):
            zone_dir = rel.split('/')[1]
            names = id_names(tree, zone_dir)
            for listener in listeners:
                if listener not in names:
                    raise RuntimeError('%s adds a loot listener to ID.mob.%s, which IDs.lua does not name'
                                       % (rel, listener))
                marks.setdefault((zone_dir, names[listener]), set()).add('scripted_drops')
            continue
        raise RuntimeError('%s changes a monster the exporter does not know about. Add it to outside.HAND.' % rel)
    return marks
