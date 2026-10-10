-- Promyvion-Holla (zone 16).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' };
danger[2] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[3] = { value = 'No listed threats', notes = danger[1], entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] };
danger[4] = { 'Vacuous Osculation: Plague, Poison. Source targeting: single target.', 'Auroral Drape: Blindness, Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[5] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna; Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[6] = { { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } };
danger[7] = { notes = danger[5], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[6] };
danger[8] = { kind = 'skill', id = 1218, name = 'Vacuous Osculation', summary = 'Vacuous Osculation: Plague, Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague', 'Poison' }, details = danger[7] };
danger[9] = { 'Normal activation range: 13.7 yalms. This is the move selection limit, not its affected area.', 'Area: 13.7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[10] = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } };
danger[11] = { notes = danger[9], unknown = {  }, activation_range = 13.7, shape = 'area around the monster', effect_radius = 13.7, shadows = { { mode = 'ignore' } }, removals = danger[10] };
danger[12] = { kind = 'skill', id = 1220, name = 'Auroral Drape', summary = 'Auroral Drape: Blindness, Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness', 'Silence' }, details = danger[11] };
danger[13] = { danger[8], danger[12] };
danger[14] = { value = 'Vacuous Osculation: Plague, Poison; Auroral Drape: Blindness, Silence', notes = danger[4], entries = danger[13], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] };
danger[15] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[16] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[17] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[18] = { 'Empty Cutter Thinker: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Negative Whirl: Slow. Source targeting: area around the monster.', 'Stygian Vapor: Plague. Source targeting: cone.', 'Spirit Absorption Thinker: HP drain. Source targeting: single target.', 'Binary Absorption: HP drain. Source targeting: single target.', 'Trinary Absorption: HP drain. Source targeting: single target.', 'Spirit Tap: Buff theft. Source targeting: single target.', 'Binary Tap: Buff theft. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[19] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[20] = { notes = danger[19], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[21] = { kind = 'skill', id = 1242, name = 'Empty Cutter Thinker', summary = 'Empty Cutter Thinker: can crit', notes = danger[15], categories = { 'crit' }, effects = {  }, details = danger[20] };
danger[22] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[23] = { danger[17] };
danger[24] = { notes = danger[22], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[23] };
danger[25] = { kind = 'skill', id = 1243, name = 'Negative Whirl', summary = 'Negative Whirl: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[24] };
danger[26] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 8 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[27] = { notes = danger[26], unknown = {  }, activation_range = 8.0, shape = 'front cone', cone_length = 8.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[28] = { kind = 'skill', id = 1244, name = 'Stygian Vapor', summary = 'Stygian Vapor: Plague', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = danger[27] };
danger[29] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[30] = { notes = danger[29], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[31] = { kind = 'skill', id = 1246, name = 'Spirit Absorption Thinker', summary = 'Spirit Absorption Thinker: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[30] };
danger[32] = { kind = 'skill', id = 1247, name = 'Binary Absorption', summary = 'Binary Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[30] };
danger[33] = { kind = 'skill', id = 1248, name = 'Trinary Absorption', summary = 'Trinary Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[30] };
danger[34] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[35] = { notes = danger[34], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[36] = { kind = 'skill', id = 1249, name = 'Spirit Tap', summary = 'Spirit Tap: Buff theft', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[35] };
danger[37] = { kind = 'skill', id = 1250, name = 'Binary Tap', summary = 'Binary Tap: Buff theft', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[35] };
danger[38] = { danger[21], danger[25], danger[28], danger[31], danger[32], danger[33], danger[36], danger[37] };
danger[39] = { value = 'Empty Cutter Thinker: can crit; Negative Whirl: Slow; Stygian Vapor: Plague; Spirit Absorption Thinker: HP drain; Binary Absorption: HP drain; Trinary Absorption: HP drain; Spirit Tap: Buff theft; Binary Tap: Buff theft', notes = danger[18], entries = danger[38], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { neither = { 'Memory Receptacle' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Memory Receptacle'] = { id = 112, name = 'Receptacle' },
    },
    monsters = {
        {
            name   = 'Wanderer',
            ids    = { 1, 2, 4, 5, 7, 8, 9, 15, 24, 33, 34, 35, 37, 38, 40, 41, 42, 43, 44, 46, 47, 57, 60, 61, 62,
                       63, 68, 69, 72, 73, 74, 75, 76, 77, 83, 84, 116, 117, 124, 127, 164, 167, 172, 181, 217, 218,
                       219, 220, 222, 224, 230, 233, 240 },
            job    = 'war/rdm',
            levels = {
                [24] = { acc = 90, eva = 82, agi = 26, int = 24, mnd = 24, chr = 25, dex = 31, def = 99,
                         attack_skill = 71 },
                [25] = { acc = 93, eva = 86, agi = 28, int = 25, mnd = 25, chr = 26, dex = 31, def = 103,
                         attack_skill = 74 },
                [26] = { acc = 97, eva = 89, agi = 29, int = 26, mnd = 26, chr = 26, dex = 33, def = 106,
                         attack_skill = 77 },
                [28] = { acc = 104, eva = 95, agi = 30, int = 27, mnd = 27, chr = 29, dex = 34, def = 112,
                         attack_skill = 83 },
                [29] = { acc = 108, eva = 98, agi = 31, int = 28, mnd = 28, chr = 29, dex = 36, def = 115,
                         attack_skill = 86 },
                [30] = { acc = 111, eva = 101, agi = 31, int = 29, mnd = 29, chr = 30, dex = 36, def = 118,
                         attack_skill = 89 },
                [32] = { acc = 118, eva = 108, agi = 34, int = 30, mnd = 30, chr = 31, dex = 38, def = 124,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33, dex = 39, def = 128,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33, dex = 41, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34, dex = 41, def = 134,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 121, agi = 37, int = 34, mnd = 34, chr = 35, dex = 43, def = 138,
                         attack_skill = 106 },
            },
            spawn_levels = { [1] = { 24, 26 }, [2] = { 24, 26 }, [4] = { 24, 26 }, [5] = { 24, 26 },
                             [7] = { 24, 26 }, [8] = { 24, 26 }, [9] = { 24, 26 }, [15] = { 34, 36 },
                             [24] = { 34, 36 }, [33] = { 28, 30 }, [34] = { 28, 30 }, [35] = { 28, 30 },
                             [37] = { 28, 30 }, [38] = { 28, 30 }, [40] = { 28, 30 }, [41] = { 28, 30 },
                             [42] = { 28, 30 }, [43] = { 28, 30 }, [44] = { 28, 30 }, [46] = { 28, 30 },
                             [47] = { 28, 30 }, [57] = { 28, 30 }, [60] = { 34, 36 }, [61] = { 34, 36 },
                             [62] = { 34, 36 }, [63] = { 34, 36 }, [68] = { 34, 36 }, [69] = { 34, 36 },
                             [72] = { 34, 36 }, [73] = { 34, 36 }, [74] = { 24, 26 }, [75] = { 24, 26 },
                             [76] = { 24, 26 }, [77] = { 28, 30 }, [83] = { 28, 30 }, [84] = { 28, 30 },
                             [116] = { 32, 34 }, [117] = { 32, 34 }, [124] = { 32, 34 }, [127] = { 32, 34 },
                             [164] = { 32, 34 }, [167] = { 32, 34 }, [172] = { 32, 34 }, [181] = { 34, 36 },
                             [217] = { 24, 26 }, [218] = { 24, 26 }, [219] = { 24, 26 }, [220] = { 24, 26 },
                             [222] = { 28, 30 }, [224] = { 28, 30 }, [230] = { 28, 30 }, [233] = { 32, 34 },
                             [240] = { 32, 34 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wanderer / Empty', notes = { 'Source species: Wanderer (ID 290); family ID 115.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [24] = 482, [25] = 525, [26] = 556, [28] = 622, [29] = 656, [30] = 690, [32] = 844, [33] = 914, [34] = 987, [35] = 1057, [36] = 1130 }, mp = { [24] = 317, [25] = 331, [26] = 345, [28] = 374, [29] = 389, [30] = 403, [32] = 432, [33] = 447, [34] = 462, [35] = 476, [36] = 491 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[3],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Weeper',
            ids    = { 3, 6, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 22, 23, 25, 36, 39, 48, 49, 50, 51, 53, 54, 55,
                       56, 58, 59, 64, 66, 70, 71, 78, 80, 221, 226, 227, 228, 229, 231, 232, 234, 235, 236, 237,
                       238, 239, 242, 243 },
            job    = 'war/rdm',
            levels = {
                [25] = { acc = 93, eva = 86, agi = 28, int = 25, mnd = 25, chr = 26, dex = 31, def = 103,
                         attack_skill = 74 },
                [26] = { acc = 97, eva = 89, agi = 29, int = 26, mnd = 26, chr = 26, dex = 33, def = 106,
                         attack_skill = 77 },
                [27] = { acc = 101, eva = 91, agi = 29, int = 27, mnd = 27, chr = 28, dex = 34, def = 108,
                         attack_skill = 80 },
                [29] = { acc = 108, eva = 98, agi = 31, int = 28, mnd = 28, chr = 29, dex = 36, def = 115,
                         attack_skill = 86 },
                [30] = { acc = 111, eva = 101, agi = 31, int = 29, mnd = 29, chr = 30, dex = 36, def = 118,
                         attack_skill = 89 },
                [31] = { acc = 115, eva = 106, agi = 34, int = 30, mnd = 30, chr = 31, dex = 38, def = 122,
                         attack_skill = 92 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33, dex = 39, def = 128,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33, dex = 41, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34, dex = 41, def = 134,
                         attack_skill = 103 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 35, mnd = 35, chr = 35, dex = 43, def = 140,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 127, agi = 39, int = 35, mnd = 35, chr = 36, dex = 43, def = 144,
                         attack_skill = 112 },
            },
            spawn_levels = { [3] = { 25, 27 }, [6] = { 25, 27 }, [10] = { 25, 27 }, [11] = { 25, 27 },
                             [12] = { 25, 27 }, [13] = { 37, 38 }, [14] = { 37, 38 }, [16] = { 37, 38 },
                             [17] = { 37, 38 }, [18] = { 37, 38 }, [19] = { 37, 38 }, [20] = { 37, 38 },
                             [22] = { 37, 38 }, [23] = { 37, 38 }, [25] = { 37, 38 }, [36] = { 29, 31 },
                             [39] = { 29, 31 }, [48] = { 29, 31 }, [49] = { 29, 31 }, [50] = { 29, 31 },
                             [51] = { 29, 31 }, [53] = { 29, 31 }, [54] = { 29, 31 }, [55] = { 29, 31 },
                             [56] = { 29, 31 }, [58] = { 29, 31 }, [59] = { 29, 31 }, [64] = { 37, 38 },
                             [66] = { 37, 38 }, [70] = { 37, 38 }, [71] = { 37, 38 }, [78] = { 29, 31 },
                             [80] = { 29, 31 }, [221] = { 25, 27 }, [226] = { 29, 31 }, [227] = { 29, 31 },
                             [228] = { 29, 31 }, [229] = { 29, 31 }, [231] = { 29, 31 }, [232] = { 33, 35 },
                             [234] = { 33, 35 }, [235] = { 33, 35 }, [236] = { 33, 35 }, [237] = { 33, 35 },
                             [238] = { 33, 35 }, [239] = { 33, 35 }, [242] = { 33, 35 }, [243] = { 33, 35 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Weeper / Empty', notes = { 'Source species: Weeper (ID 292); family ID 116.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [25] = 642, [26] = 679, [27] = 718, [29] = 801, [30] = 843, [31] = 942, [33] = 1117, [34] = 1206, [35] = 1292, [37] = 1467, [38] = 1557 }, mp = { [25] = 653, [26] = 681, [27] = 710, [29] = 768, [30] = 797, [31] = 826, [33] = 884, [34] = 914, [35] = 943, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[14],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Seether Prom',
            ids    = { 21, 26, 52, 65, 79, 81, 82, 85, 120, 126, 128, 129, 130, 163, 171, 174, 175, 177, 216, 223,
                       225, 245, 248, 252, 255, 256, 257, 259, 265, 268, 272, 273, 274, 277, 280, 284, 286 },
            job    = 'war/rdm',
            levels = {
                [31] = { acc = 115, eva = 106, agi = 35, int = 30, mnd = 30, chr = 31, dex = 38, def = 125,
                         attack_skill = 92 },
                [32] = { acc = 118, eva = 108, agi = 35, int = 30, mnd = 30, chr = 31, dex = 38, def = 127,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 32, mnd = 32, chr = 33, dex = 39, def = 131,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 115, agi = 37, int = 32, mnd = 32, chr = 33, dex = 41, def = 134,
                         attack_skill = 100 },
                [35] = { acc = 128, eva = 118, agi = 37, int = 32, mnd = 32, chr = 34, dex = 41, def = 137,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 122, agi = 39, int = 34, mnd = 34, chr = 35, dex = 43, def = 141,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35, dex = 43, def = 143,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
            },
            spawn_levels = { [21] = { 37, 38 }, [26] = { 37, 38 }, [52] = { 31, 33 }, [65] = { 37, 38 },
                             [79] = { 31, 33 }, [81] = { 31, 33 }, [82] = { 31, 33 }, [85] = { 31, 33 },
                             [120] = { 34, 36 }, [126] = { 34, 36 }, [128] = { 34, 36 }, [129] = { 34, 36 },
                             [130] = { 34, 36 }, [163] = { 34, 36 }, [171] = { 34, 36 }, [174] = { 34, 36 },
                             [175] = { 34, 36 }, [177] = { 34, 36 }, [216] = { 37, 38 }, [223] = { 31, 33 },
                             [225] = { 31, 33 }, [245] = { 37, 38 }, [248] = { 37, 38 }, [252] = { 37, 38 },
                             [255] = { 37, 38 }, [256] = { 37, 38 }, [257] = { 37, 38 }, [259] = { 37, 38 },
                             [265] = { 37, 38 }, [268] = { 37, 38 }, [272] = { 37, 38 }, [273] = { 37, 38 },
                             [274] = { 37, 38 }, [277] = { 37, 38 }, [280] = { 37, 38 }, [284] = { 37, 38 },
                             [286] = { 37, 38 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Seether / Empty', notes = { 'Source species: Seether (ID 286); family ID 113.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [31] = 857, [32] = 938, [33] = 1016, [34] = 1097, [35] = 1175, [36] = 1256, [37] = 1334, [38] = 1416 }, mp = { [31] = 826, [32] = 855, [33] = 884, [34] = 914, [35] = 943, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Vanity Strike: Stun, can crit; Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight; Lamentation: Dia', notes = { 'Vanity Strike: Stun, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight. Source targeting: cone.', 'Lamentation: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1253, name = 'Vanity Strike', summary = 'Vanity Strike: Stun, can crit', notes = danger[15], categories = { 'crit', 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } }, { kind = 'skill', id = 1254, name = 'Wanion', summary = 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'AGI down', 'Accuracy down', 'Addle', 'Attack down', 'Bio', 'Blindness', 'Burn', 'CHR down', 'Choke', 'DEX down', 'Defense down', 'Dia', 'Drown', 'Evasion down', 'Frost', 'INT down', 'MND down', 'Magic accuracy down', 'Magic attack down', 'Magic defense down', 'Paralysis', 'Poison', 'Rasp', 'STR down', 'Shock', 'Silence', 'Slow', 'VIT down', 'Weight' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: AGI down, Addle, Attack down, Bio, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Rasp, STR down, Shock, Slow, VIT down, Weight: Erase (one random eligible timed ailment), Panacea; Accuracy down: Erase (one random eligible timed ailment); Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } }, { effect = 'Addle', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Bio', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, danger[16], { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic accuracy down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[17], { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1258, name = 'Lamentation', summary = 'Lamentation: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { danger[16] } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Thinker',
            ids    = { 27, 67, 241 },
            job    = 'war/rdm',
            levels = {
                [30] = { acc = 111, eva = 102, agi = 33, int = 29, mnd = 29, chr = 30, dex = 36, def = 121,
                         attack_skill = 89 },
                [31] = { acc = 115, eva = 106, agi = 35, int = 30, mnd = 30, chr = 31, dex = 38, def = 125,
                         attack_skill = 92 },
                [32] = { acc = 118, eva = 108, agi = 35, int = 30, mnd = 30, chr = 31, dex = 38, def = 127,
                         attack_skill = 94 },
                [36] = { acc = 132, eva = 122, agi = 39, int = 34, mnd = 34, chr = 35, dex = 43, def = 141,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35, dex = 43, def = 143,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
                [39] = { acc = 143, eva = 132, agi = 42, int = 36, mnd = 36, chr = 38, dex = 46, def = 151,
                         attack_skill = 115 },
                [40] = { acc = 146, eva = 135, agi = 42, int = 36, mnd = 36, chr = 38, dex = 46, def = 154,
                         attack_skill = 118 },
            },
            spawn_levels = { [27] = { 30, 32 }, [67] = { 38, 40 }, [241] = { 36, 38 } },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 50, item = 1720 },  -- teal memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Thinker / Empty', notes = { 'Source species: Thinker (ID 288); family ID 114.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [30] = 767, [31] = 857, [32] = 938, [36] = 1256, [37] = 1334, [38] = 1416, [39] = 1494, [40] = 1607 }, mp = { [30] = 797, [31] = 826, [32] = 855, [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062, [40] = 1092 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[39],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Memory Receptacle',
            ids    = { 29, 89, 96, 103, 110, 136, 145, 154, 188, 197, 206 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29, dex = 35, def = 175,
                         attack_skill = 89 },
            },
            no_swings = true,
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            links  = 1,
            info = {
                family = { value = 'Receptacle / Empty', notes = { 'Source species: Receptacle (ID 284); family ID 112.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [30] = 2300 }, mp = { [30] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, general_notes = danger[2] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Stray',
            ids    = { 30, 31, 32, 90, 91, 92, 93, 94, 97, 98, 99, 100, 101, 104, 105, 106, 107, 108, 111, 112, 113,
                       114, 115, 137, 138, 139, 140, 141, 142, 143, 146, 147, 148, 149, 150, 151, 152, 155, 156,
                       157, 158, 159, 160, 161, 189, 190, 191, 192, 193, 194, 195, 198, 199, 200, 201, 202, 203,
                       204, 207, 208, 209, 210, 211, 212, 213 },
            nm     = true,
            levels = {
                [20] = { acc = 76, eva = 70, agi = 24, int = 18, mnd = 18, chr = 21, dex = 27, def = 86,
                         attack_skill = 60 },
                [21] = { acc = 81, eva = 74, agi = 27, int = 20, mnd = 20, chr = 23, dex = 30, def = 91,
                         attack_skill = 63 },
                [23] = { acc = 87, eva = 79, agi = 27, int = 20, mnd = 20, chr = 23, dex = 30, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 91, eva = 83, agi = 28, int = 21, mnd = 21, chr = 24, dex = 32, def = 99,
                         attack_skill = 71 },
                [26] = { acc = 98, eva = 90, agi = 31, int = 23, mnd = 23, chr = 26, dex = 35, def = 106,
                         attack_skill = 77 },
                [27] = { acc = 101, eva = 92, agi = 31, int = 24, mnd = 24, chr = 27, dex = 35, def = 109,
                         attack_skill = 80 },
            },
            spawn_levels = { [30] = { 20, 21 }, [31] = { 20, 21 }, [32] = { 20, 21 }, [90] = { 23, 24 },
                             [91] = { 23, 24 }, [92] = { 23, 24 }, [93] = { 23, 24 }, [94] = { 23, 24 },
                             [97] = { 23, 24 }, [98] = { 23, 24 }, [99] = { 23, 24 }, [100] = { 23, 24 },
                             [101] = { 23, 24 }, [104] = { 23, 24 }, [105] = { 23, 24 }, [106] = { 23, 24 },
                             [107] = { 23, 24 }, [108] = { 23, 24 }, [111] = { 23, 24 }, [112] = { 23, 24 },
                             [113] = { 23, 24 }, [114] = { 23, 24 }, [115] = { 23, 24 }, [137] = { 26, 27 },
                             [138] = { 26, 27 }, [139] = { 26, 27 }, [140] = { 26, 27 }, [141] = { 26, 27 },
                             [142] = { 26, 27 }, [143] = { 26, 27 }, [146] = { 26, 27 }, [147] = { 26, 27 },
                             [148] = { 26, 27 }, [149] = { 26, 27 }, [150] = { 26, 27 }, [151] = { 26, 27 },
                             [152] = { 26, 27 }, [155] = { 26, 27 }, [156] = { 26, 27 }, [157] = { 26, 27 },
                             [158] = { 26, 27 }, [159] = { 26, 27 }, [160] = { 26, 27 }, [161] = { 26, 27 },
                             [189] = { 26, 27 }, [190] = { 26, 27 }, [191] = { 26, 27 }, [192] = { 26, 27 },
                             [193] = { 26, 27 }, [194] = { 26, 27 }, [195] = { 26, 27 }, [198] = { 26, 27 },
                             [199] = { 26, 27 }, [200] = { 26, 27 }, [201] = { 26, 27 }, [202] = { 26, 27 },
                             [203] = { 26, 27 }, [204] = { 26, 27 }, [207] = { 26, 27 }, [208] = { 26, 27 },
                             [209] = { 26, 27 }, [210] = { 26, 27 }, [211] = { 26, 27 }, [212] = { 26, 27 },
                             [213] = { 26, 27 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wanderer / Empty', notes = { 'Source species: Wanderer (ID 290); family ID 115.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [20] = 372, [21] = 398, [23] = 453, [24] = 482, [26] = 560, [27] = 592 }, mp = { [20] = 261, [21] = 275, [23] = 303, [24] = 317, [26] = 345, [27] = 360 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[3],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Thinker',
            ids    = { 45, 86, 87, 133, 134, 185, 186, 276, 287, 288, 289, 290 },
            job    = 'war/rdm',
            levels = {
                [32] = { acc = 118, eva = 108, agi = 35, int = 30, mnd = 30, chr = 31, dex = 38, def = 127,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 32, mnd = 32, chr = 33, dex = 39, def = 131,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 115, agi = 37, int = 32, mnd = 32, chr = 33, dex = 41, def = 134,
                         attack_skill = 100 },
                [36] = { acc = 132, eva = 122, agi = 39, int = 34, mnd = 34, chr = 35, dex = 43, def = 141,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35, dex = 43, def = 143,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
                [39] = { acc = 143, eva = 132, agi = 42, int = 36, mnd = 36, chr = 38, dex = 46, def = 151,
                         attack_skill = 115 },
                [40] = { acc = 146, eva = 135, agi = 42, int = 36, mnd = 36, chr = 38, dex = 46, def = 154,
                         attack_skill = 118 },
            },
            spawn_levels = { [45] = { 32, 34 }, [86] = { 32, 34 }, [87] = { 32, 34 }, [133] = { 36, 38 },
                             [134] = { 36, 38 }, [185] = { 36, 38 }, [186] = { 36, 38 }, [276] = { 38, 40 },
                             [287] = { 38, 40 }, [288] = { 38, 40 }, [289] = { 38, 40 }, [290] = { 38, 40 } },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 50, item = 1720 },  -- teal memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Thinker / Empty', notes = { 'Source species: Thinker (ID 288); family ID 114.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [32] = 938, [33] = 1016, [34] = 1097, [36] = 1256, [37] = 1334, [38] = 1416, [39] = 1494, [40] = 1607 }, mp = { [32] = 855, [33] = 884, [34] = 914, [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062, [40] = 1092 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[39],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Weeper',
            ids    = { 118, 119, 121, 122, 123, 125, 131, 132, 162, 165, 166, 168, 169, 170, 173, 176, 178, 179,
                       180, 182, 183, 184, 214, 215, 244, 246, 247, 249, 250, 251, 253, 254, 258, 260, 263, 264,
                       266, 267, 269, 270, 271, 275, 279, 281, 282, 283 },
            job    = 'war/rdm',
            levels = {
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33, dex = 39, def = 128,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33, dex = 41, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34, dex = 41, def = 134,
                         attack_skill = 103 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 35, mnd = 35, chr = 35, dex = 43, def = 140,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 127, agi = 39, int = 35, mnd = 35, chr = 36, dex = 43, def = 144,
                         attack_skill = 112 },
            },
            spawn_levels = { [118] = { 33, 35 }, [119] = { 33, 35 }, [121] = { 33, 35 }, [122] = { 33, 35 },
                             [123] = { 33, 35 }, [125] = { 33, 35 }, [131] = { 33, 35 }, [132] = { 33, 35 },
                             [162] = { 33, 35 }, [165] = { 33, 35 }, [166] = { 33, 35 }, [168] = { 33, 35 },
                             [169] = { 33, 35 }, [170] = { 33, 35 }, [173] = { 33, 35 }, [176] = { 33, 35 },
                             [178] = { 33, 35 }, [179] = { 33, 35 }, [180] = { 33, 35 }, [182] = { 33, 35 },
                             [183] = { 33, 35 }, [184] = { 33, 35 }, [214] = { 37, 38 }, [215] = { 37, 38 },
                             [244] = { 37, 38 }, [246] = { 37, 38 }, [247] = { 37, 38 }, [249] = { 37, 38 },
                             [250] = { 37, 38 }, [251] = { 37, 38 }, [253] = { 37, 38 }, [254] = { 37, 38 },
                             [258] = { 37, 38 }, [260] = { 37, 38 }, [263] = { 37, 38 }, [264] = { 37, 38 },
                             [266] = { 37, 38 }, [267] = { 37, 38 }, [269] = { 37, 38 }, [270] = { 37, 38 },
                             [271] = { 37, 38 }, [275] = { 37, 38 }, [279] = { 37, 38 }, [281] = { 37, 38 },
                             [282] = { 37, 38 }, [283] = { 37, 38 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Weeper / Empty', notes = { 'Source species: Weeper (ID 292); family ID 116.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [33] = 1117, [34] = 1206, [35] = 1292, [37] = 1467, [38] = 1557 }, mp = { [33] = 884, [34] = 914, [35] = 943, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[14],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Wanderer',
            ids    = { 261, 262, 278, 285 },
            job    = 'war/rdm',
            levels = {
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33, dex = 41, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34, dex = 41, def = 134,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 121, agi = 37, int = 34, mnd = 34, chr = 35, dex = 43, def = 138,
                         attack_skill = 106 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wanderer / Empty', notes = { 'Source species: Wanderer (ID 290); family ID 115.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [34] = 987, [35] = 1057, [36] = 1130 }, mp = { [34] = 462, [35] = 476, [36] = 491 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[3],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Cerebrator',
            ids    = { 291 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 1000, item = 1756 },  -- remnant of a cerebrator
                { rate = 240, item = 1720 },  -- teal memosphere
                { rate = 240, item = 1720 },  -- teal memosphere
                { rate = 240, item = 1720 },  -- teal memosphere
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Thinker / Empty', notes = { 'Source species: Thinker (ID 288); family ID 114.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [38] = 3000 }, mp = { [38] = 1032 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10; Regain 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Negative Whirl: Slow; Stygian Vapor: Plague; Trinary Absorption: HP drain; Trinary Tap: Buff theft; Shadow Spread: Blindness, Curse, Sleep', notes = { 'Negative Whirl: Slow. Source targeting: area around the monster.', 'Stygian Vapor: Plague. Source targeting: cone.', 'Trinary Absorption: HP drain. Source targeting: single target.', 'Trinary Tap: Buff theft. Source targeting: single target.', 'Shadow Spread: Blindness, Curse, Sleep. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[25], danger[28], danger[33], { kind = 'skill', id = 1251, name = 'Trinary Tap', summary = 'Trinary Tap: Buff theft', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[35] }, { kind = 'skill', id = 1252, name = 'Shadow Spread', summary = 'Shadow Spread: Blindness, Curse, Sleep', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness', 'Curse', 'Sleep' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy; Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
