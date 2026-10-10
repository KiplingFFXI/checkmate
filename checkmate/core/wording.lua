--[[
    Fixed words and their default short forms, in the Abbreviations tab's order. An empty short form keeps
    the full word, except for the word after a count. That one can stay empty.

    key is the saved setting and command name. full and short are the two forms. label names a row
    when full needs an example, and before/after add that example's punctuation or number. name is
    a job's full name. Words sharing a spot are checked for matching short forms. apart means the
    level printed after a word keeps it distinct. bare allows the count word to print nothing.

    Schools take their names from data.spells. Elements use ELEMENT_KEYS, and jobs add job_ to the
    data's job key. Words that follow or replace a number belong in the Numbers group.
]]

local spells   = require('data.spells');
local elements = require('core.elements');

local wording = {};

-- The groups shown on Abbreviations, in display order.
wording.GROUPS = {
    {
        name  = 'Difficulty',
        words = {
            { key = 'con_too_weak',             full = 'Too Weak',             short = 'TW',  spot = 'con' },
            { key = 'con_incredibly_easy_prey', full = 'Incredibly Easy Prey', short = 'IEP', spot = 'con' },
            { key = 'con_easy_prey',            full = 'Easy Prey',            short = 'EP',  spot = 'con' },
            { key = 'con_decent_challenge',     full = 'Decent Challenge',     short = 'DC',  spot = 'con' },
            { key = 'con_even_match',           full = 'Even Match',           short = 'EM',  spot = 'con' },
            { key = 'con_tough',                full = 'Tough',                short = 'T',   spot = 'con' },
            { key = 'con_very_tough',           full = 'Very Tough',           short = 'VT',  spot = 'con' },
            { key = 'con_incredibly_tough',     full = 'Incredibly Tough',     short = 'IT',  spot = 'con' },
            { key = 'con_impossible',           full = 'Impossible to Gauge',  short = 'ITG', spot = 'con' },
        },
    },
    {
        name  = 'Evasion and defense',
        words = {
            { key = 'read_high',    full = 'High',    short = 'Hi',  spot = 'high_low' },
            { key = 'read_low',     full = 'Low',     short = 'Lo',  spot = 'high_low' },
            { key = 'read_evasion', full = 'Evasion', short = 'Eva', spot = 'eva_def' },
            { key = 'read_defense', full = 'Defense', short = 'Def', spot = 'eva_def' },
        },
    },
    {
        name  = 'Numbers',
        words = {
            { key = 'num_unknown', full = 'unknown',     short = 'unk' },
            { key = 'num_unavailable', full = 'not available', short = 'N/A' },
            { key = 'num_no_shield', full = 'No shield equipped', short = 'No shield' },
            { key = 'num_cannot_parry', full = 'Weapon cannot parry', short = 'Cannot parry' },
            { key = 'num_job_unavailable', full = 'Not available to your jobs', short = 'Job N/A' },
            { key = 'num_check_again', full = 'Check again', short = 'Check again' },
            { key = 'num_signet',  full = 'with Signet', short = 'w/Sig' },
            { key = 'num_far',     full = 'at 25 yalms', short = '@25y' },
            { key = 'num_distance', full = 'yalms away', short = 'y away' },
            { key = 'pdif_ratio',   full = 'Ratio',     short = 'A/D' },
            { key = 'pdif_attack',  full = 'Attack',    short = 'ATK' },
            { key = 'pdif_defense', full = 'Defense',   short = 'DEF' },
            -- They print in parentheses in place of crit taken, or after it for a monster that counters. The first is
            -- for a monster that swings with nothing but TP moves, and the second for one that never swings.
            { key = 'num_tp_moves',  full = 'TP moves',  short = 'TP',    spot = 'swings', label = '(TP moves)',
              before = '(', after = ')' },
            { key = 'num_no_swings', full = 'no swings', short = 'no sw', spot = 'swings', label = '(no swings)',
              before = '(', after = ')' },
        },
    },
    {
        name  = 'Aggro',
        words = {
            { key = 'aggro_aggressive', full = 'Aggressive',              short = 'A',        spot = 'answer' },
            { key = 'aggro_any_level',  full = 'Aggressive at any level', short = 'A any Lv', spot = 'answer' },
            -- The only full word with a number inside. The printout formats it, and puts the level and a + after a
            -- short one. Its level always follows it, and nothing else in the answer spot has a number.
            { key = 'aggro_from_level', full = 'Aggressive if it\'s level %d or higher', short = 'A if Lv',
              spot = 'answer', label = 'Aggressive if it\'s level 30 or higher', after = ' 30+', apart = true },
            { key = 'aggro_unknown',  full = 'Aggressive (level unknown)', short = 'A Lv?', spot = 'answer' },
            { key = 'aggro_too_weak', full = 'Too weak to aggro you unless you rest', short = 'A if resting',
              spot = 'answer' },
            { key = 'aggro_passive',  full = 'Not aggressive',   short = 'Passive', spot = 'answer' },
            { key = 'aggro_never',    full = 'Never aggressive', short = 'Never',   spot = 'answer' },
        },
    },
    {
        -- The senses and the notes both print in brackets right after the answer, so they share a spot. The senses
        -- also say how each monster in the Links part joins the fight.
        name  = 'How it finds you',
        words = {
            { key = 'sense_sight',      full = 'Sight',      short = 'S',   spot = 'after_answer' },
            { key = 'sense_sound',      full = 'Sound',      short = 'H',   spot = 'after_answer' },
            { key = 'sense_true_sight', full = 'True Sight', short = 'TS',  spot = 'after_answer' },
            { key = 'sense_true_sound', full = 'True Sound', short = 'TH',  spot = 'after_answer' },
            { key = 'sense_magic',      full = 'Magic',      short = 'M',   spot = 'after_answer' },
            { key = 'sense_low_hp',     full = 'Low HP',     short = 'HP',  spot = 'after_answer' },
            { key = 'sense_ability',    full = 'Ability',    short = 'JA',  spot = 'after_answer' },
            { key = 'sense_ambush',     full = 'Ambush',     short = 'Amb', spot = 'after_answer' },
            { key = 'sense_superlink',  full = 'Superlink',  short = 'SL',  spot = 'after_answer' },
        },
    },
    {
        name  = 'Aggro notes',
        words = {
            { key = 'note_form',        full = 'not in its ball form', short = 'not balled', spot = 'after_answer' },
            { key = 'note_apkallu',     full = 'changes with the zone\'s apkallu hate', short = 'apkallu hate',
              spot = 'after_answer' },
            { key = 'note_fomor_hate',  full = 'only if you have fomor hate', short = 'fomor hate',
              spot = 'after_answer' },
            { key = 'note_underground', full = 'only above ground', short = 'above ground', spot = 'after_answer' },
            -- The awake hours follow it, like "awake 6:00-20:59".
            { key = 'note_awake',       full = 'awake', short = 'awake', spot = 'after_answer',
              label = 'awake 6:00-20:59', after = ' 6:00-20:59' },
            { key = 'note_asleep',      full = 'always asleep',           short = 'asleep',     spot = 'after_answer' },
            { key = 'note_scripted',    full = 'can change in the fight', short = 'can change', spot = 'after_answer' },
        },
    },
    {
        name  = 'Links',
        words = {
            -- With the names on, the full word reads "Links with" before them.
            { key = 'link_links', full = 'Links',         short = 'L',       spot = 'link' },
            { key = 'link_none',  full = 'Doesn\'t link', short = 'No link', spot = 'link' },
            { key = 'list_more',  full = 'more',          short = '',        bare = true, label = '+2 more' },
        },
    },
    {
        name  = 'Magic',
        words = {
            { key = 'school_elemental',  full = spells.schools.elemental.label,  short = 'Ele',  spot = 'school' },
            { key = 'school_enfeebling', full = spells.schools.enfeebling.label, short = 'Enf',  spot = 'school' },
            { key = 'school_dark',       full = spells.schools.dark.label,       short = 'Drk',  spot = 'school' },
            { key = 'school_divine',     full = spells.schools.divine.label,     short = 'Div',  spot = 'school' },
            { key = 'school_healing',    full = spells.schools.healing.label,    short = 'Heal', spot = 'school' },
            { key = 'school_ninjutsu',   full = spells.schools.ninjutsu.label,   short = 'Nin',  spot = 'school' },
            { key = 'school_singing',    full = spells.schools.singing.label,    short = 'Sing', spot = 'school' },
            { key = 'school_blue',       full = 'Spell chance',                  short = 'Chance', spot = 'school' },
            { key = 'magic_immune',      full = 'immune', short = 'imm',   spot = 'school_word' },
            { key = 'magic_never',       full = 'never',  short = 'never', spot = 'school_word' },
        },
    },
    {
        -- The debuffs players put on monsters. A monster's own buffs take the game's names, like item names.
        name  = 'Effects',
        words = {
            { key = 'eff_none', full = 'No effects observed', short = 'None observed' },
            { key = 'eff_none_debuffs', full = 'No debuffs observed', short = 'No debuffs' },
            { key = 'eff_none_buffs', full = 'No buffs observed', short = 'No buffs' },
            { key = 'eff_sleep',          full = 'Sleep',               short = 'Slp',   spot = 'effect' },
            { key = 'eff_poison',         full = 'Poison',              short = 'Psn',   spot = 'effect' },
            { key = 'eff_paralysis',      full = 'Paralyze',            short = 'Para',  spot = 'effect' },
            { key = 'eff_blindness',      full = 'Blind',               short = 'Blind', spot = 'effect' },
            { key = 'eff_silence',        full = 'Silence',             short = 'Sil',   spot = 'effect' },
            { key = 'eff_petrification',  full = 'Petrify',             short = 'Petri', spot = 'effect' },
            { key = 'eff_curse',          full = 'Curse',               short = 'Curse', spot = 'effect' },
            { key = 'eff_stun',           full = 'Stun',                short = 'Stun',  spot = 'effect' },
            { key = 'eff_bind',           full = 'Bind',                short = 'Bind',  spot = 'effect' },
            { key = 'eff_weight',         full = 'Gravity',             short = 'Grav',  spot = 'effect' },
            { key = 'eff_slow',           full = 'Slow',                short = 'Slow',  spot = 'effect' },
            { key = 'eff_terror',         full = 'Terror',              short = 'Terr',  spot = 'effect' },
            { key = 'eff_plague',         full = 'Plague',              short = 'Plg',   spot = 'effect' },
            { key = 'eff_burn',           full = 'Burn',                short = 'Burn',  spot = 'effect' },
            { key = 'eff_frost',          full = 'Frost',               short = 'Frost', spot = 'effect' },
            { key = 'eff_choke',          full = 'Choke',               short = 'Choke', spot = 'effect' },
            { key = 'eff_rasp',           full = 'Rasp',                short = 'Rasp',  spot = 'effect' },
            { key = 'eff_shock',          full = 'Shock',               short = 'Shock', spot = 'effect' },
            { key = 'eff_drown',          full = 'Drown',               short = 'Drown', spot = 'effect' },
            { key = 'eff_dia',            full = 'Dia',                 short = 'Dia',   spot = 'effect' },
            { key = 'eff_bio',            full = 'Bio',                 short = 'Bio',   spot = 'effect' },
            { key = 'eff_accuracy_down',  full = 'Accuracy Down',       short = 'Acc-',  spot = 'effect' },
            { key = 'eff_attack_down',    full = 'Attack Down',         short = 'Atk-',  spot = 'effect' },
            { key = 'eff_evasion_down',   full = 'Evasion Down',        short = 'Eva-',  spot = 'effect' },
            { key = 'eff_defense_down',   full = 'Defense Down',        short = 'Def-',  spot = 'effect' },
            { key = 'eff_flash',          full = 'Flash',               short = 'Flash', spot = 'effect' },
            { key = 'eff_magic_def_down', full = 'Magic Defense Down',  short = 'MDef-', spot = 'effect' },
            { key = 'eff_inhibit_tp',     full = 'Inhibit TP',          short = 'TP-',   spot = 'effect' },
            { key = 'eff_magic_acc_down', full = 'Magic Accuracy Down', short = 'MAcc-', spot = 'effect' },
            { key = 'eff_magic_atk_down', full = 'Magic Attack Down',   short = 'MAtk-', spot = 'effect' },
            { key = 'eff_requiem',        full = 'Requiem',             short = 'Req',   spot = 'effect' },
            { key = 'eff_elegy',          full = 'Elegy',               short = 'Elegy', spot = 'effect' },
            { key = 'eff_threnody',       full = 'Threnody',            short = 'Thren', spot = 'effect' },
        },
    },
    {
        name  = 'Elements',
        words = {
            { key = 'elem_fire',    full = 'Fire',         short = 'F',      spot = 'element' },
            { key = 'elem_ice',     full = 'Ice',          short = 'I',      spot = 'element' },
            { key = 'elem_wind',    full = 'Wind',         short = 'Wi',     spot = 'element' },
            { key = 'elem_earth',   full = 'Earth',        short = 'E',      spot = 'element' },
            { key = 'elem_thunder', full = 'Thunder',      short = 'T',      spot = 'element' },
            { key = 'elem_water',   full = 'Water',        short = 'Wa',     spot = 'element' },
            { key = 'elem_light',   full = 'Light',        short = 'L',      spot = 'element' },
            { key = 'elem_dark',    full = 'Dark',         short = 'D',      spot = 'element' },
            { key = 'str_nullify',  full = 'nullifies',    short = 'null',   spot = 'strength' },
            { key = 'str_absorb',   full = 'absorbs',      short = 'abs',    spot = 'strength' },
            { key = 'str_never',    full = 'never lands',  short = 'never',  spot = 'strength' },
            { key = 'str_rarely',   full = 'rarely lands', short = 'rarely', spot = 'strength' },
            { key = 'str_half',     full = 'half',         short = '1/2',    spot = 'strength' },
            { key = 'str_meva',     full = 'lands less',   short = 'meva',   spot = 'strength' },
            { key = 'elem_mdt',     full = 'Magic damage', short = 'MDT' },
        },
    },
    {
        name  = 'Weapons',
        words = {
            { key = 'weapon_hand_to_hand', full = 'Hand-to-hand', short = 'H2H', spot = 'weapon' },
            { key = 'weapon_slashing', full = 'Slashing', short = 'Slash', spot = 'weapon' },
            { key = 'weapon_piercing', full = 'Piercing', short = 'Pierce', spot = 'weapon' },
            { key = 'weapon_blunt', full = 'Blunt', short = 'Blunt', spot = 'weapon' },
        },
    },
    {
        name  = 'Monster',
        words = {
            { key = 'info_family', full = 'Family', short = 'Family', spot = 'info' },
            { key = 'info_charm', full = 'Charm', short = 'Charm', spot = 'info' },
            { key = 'info_vitals', full = 'HP and MP', short = 'HP/MP', spot = 'info' },
            { key = 'info_movement', full = 'Movement', short = 'Move', spot = 'info' },
            { key = 'info_pursuit', full = 'Pursuit', short = 'Pursuit', spot = 'info' },
            { key = 'info_spawn', full = 'Spawn', short = 'Spawn', spot = 'info' },
            { key = 'info_claim', full = 'Claim shield', short = 'Claim', spot = 'info' },
            { key = 'info_dangers', full = 'Dangers', short = 'Danger', spot = 'info' },
            { key = 'info_blue', full = 'Blue Magic', short = 'Blue', spot = 'info' },
            { key = 'info_fight', full = 'Fight rules', short = 'Fight', spot = 'info' },
            { key = 'info_traits', full = 'Traits', short = 'Traits', spot = 'info' },
            { key = 'info_crystal', full = 'Crystal', short = 'Crystal', spot = 'info' },
            { key = 'info_rewards', full = 'Rewards', short = 'Rewards', spot = 'info' },
        },
    },
    {
        name  = 'Drops and steal',
        words = {
            -- Each prints in parentheses.
            { key = 'drops_scripted', full = 'scripted loot conditions', short = 'scripted', spot = 'drop_note',
              label = '(scripted loot conditions)', before = '(', after = ')' },
            { key = 'drops_exp',      full = 'only drops if you get EXP', short = 'EXP only',  spot = 'drop_note',
              label = '(only drops if you get EXP)', before = '(', after = ')' },
            { key = 'steal_nothing',  full = 'nothing', short = 'none' },
            { key = 'drops_conditional', full = 'conditional', short = 'cond', spot = 'drop_note',
              label = '(conditional)', before = '(', after = ')' },
        },
    },
    {
        name  = 'Can\'t be gauged',
        words = {
            -- It follows the monster's name.
            { key = 'line_cant_gauge', full = 'can\'t be gauged. Widescan it first for its numbers.',
              short = 'can\'t be gauged, widescan it' },
        },
    },
    {
        name  = 'Jobs',
        words = {
            -- Jobs use their usual three-letter abbreviations.
            { key = 'job_war', full = 'WAR', short = 'WAR', spot = 'job', name = 'Warrior' },
            { key = 'job_mnk', full = 'MNK', short = 'MNK', spot = 'job', name = 'Monk' },
            { key = 'job_whm', full = 'WHM', short = 'WHM', spot = 'job', name = 'White Mage' },
            { key = 'job_blm', full = 'BLM', short = 'BLM', spot = 'job', name = 'Black Mage' },
            { key = 'job_rdm', full = 'RDM', short = 'RDM', spot = 'job', name = 'Red Mage' },
            { key = 'job_thf', full = 'THF', short = 'THF', spot = 'job', name = 'Thief' },
            { key = 'job_pld', full = 'PLD', short = 'PLD', spot = 'job', name = 'Paladin' },
            { key = 'job_drk', full = 'DRK', short = 'DRK', spot = 'job', name = 'Dark Knight' },
            { key = 'job_bst', full = 'BST', short = 'BST', spot = 'job', name = 'Beastmaster' },
            { key = 'job_brd', full = 'BRD', short = 'BRD', spot = 'job', name = 'Bard' },
            { key = 'job_rng', full = 'RNG', short = 'RNG', spot = 'job', name = 'Ranger' },
            { key = 'job_sam', full = 'SAM', short = 'SAM', spot = 'job', name = 'Samurai' },
            { key = 'job_nin', full = 'NIN', short = 'NIN', spot = 'job', name = 'Ninja' },
            { key = 'job_drg', full = 'DRG', short = 'DRG', spot = 'job', name = 'Dragoon' },
            { key = 'job_smn', full = 'SMN', short = 'SMN', spot = 'job', name = 'Summoner' },
            { key = 'job_blu', full = 'BLU', short = 'BLU', spot = 'job', name = 'Blue Mage' },
            { key = 'job_cor', full = 'COR', short = 'COR', spot = 'job', name = 'Corsair' },
            { key = 'job_pup', full = 'PUP', short = 'PUP', spot = 'job', name = 'Puppetmaster' },
            { key = 'job_dnc', full = 'DNC', short = 'DNC', spot = 'job', name = 'Dancer' },
            { key = 'job_sch', full = 'SCH', short = 'SCH', spot = 'job', name = 'Scholar' },
            { key = 'job_geo', full = 'GEO', short = 'GEO', spot = 'job', name = 'Geomancer' },
            { key = 'job_run', full = 'RUN', short = 'RUN', spot = 'job', name = 'Rune Fencer' },
        },
    },
};

-- Every word in the Abbreviations tab's order, and each one by its key.
wording.LIST, wording.BY_KEY = {}, {};
for _, group in ipairs(wording.GROUPS) do
    for _, word in ipairs(group.words) do
        wording.LIST[#wording.LIST + 1] = word;
        wording.BY_KEY[word.key] = word;
    end
end

-- Restore the default abbreviations.
function wording.reset(short)
    for _, entry in ipairs(wording.LIST) do
        short[entry.key] = entry.short;
    end
    return short;
end

-- Each element's key, by its name in core\elements.lua, like ELEMENT_KEYS.ice = 'elem_ice'.
wording.ELEMENT_KEYS = {};
for _, id in ipairs(elements.ORDER) do
    wording.ELEMENT_KEYS[id] = 'elem_' .. id;
end

--[[
    How a short form reads with what checkmate puts around it, like "A if Lv 30+" or "(EXP only)", for the command
    answers and the tips. The word after a count reads after one, like "+2 more", or just "+2" when it's empty.
]]
function wording.example(entry, text)
    if (entry.bare) then
        return '+2' .. ((text ~= '') and (' ' .. text) or '');
    end
    return (entry.before or '') .. text .. (entry.after or '');
end

return wording;
