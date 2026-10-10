-- Promyvion-Mea (zone 20).
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
danger[18] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[19] = { 'Brain Spike: Paralysis, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Promyvion Brume: Poison. Source targeting: area around the monster.', 'Murk: Slow, Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[20] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[21] = { notes = danger[20], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[22] = { kind = 'skill', id = 1229, name = 'Brain Spike', summary = 'Brain Spike: Paralysis, can crit', notes = danger[15], categories = { 'crit', 'debuff' }, effects = { 'Paralysis' }, details = danger[21] };
danger[23] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[24] = { notes = danger[23], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[25] = { kind = 'skill', id = 1231, name = 'Promyvion Brume', summary = 'Promyvion Brume: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[24] };
danger[26] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow, Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[27] = { danger[17], danger[18] };
danger[28] = { notes = danger[26], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[27] };
danger[29] = { kind = 'skill', id = 1232, name = 'Murk', summary = 'Murk: Slow, Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow', 'Weight' }, details = danger[28] };
danger[30] = { danger[22], danger[25], danger[29] };
danger[31] = { value = 'Brain Spike: Paralysis, can crit; Promyvion Brume: Poison; Murk: Slow, Weight', notes = danger[19], entries = danger[30], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Wanderer',
            ids    = { 1, 2, 5, 7, 8, 23, 24, 25, 34, 37, 40, 41, 42, 44, 47, 48, 50, 52, 55, 57, 96, 98, 100, 108,
                       111, 112, 113, 121, 122, 128, 129, 133, 134, 138, 143, 144, 148, 152, 156, 192, 193, 204,
                       207, 213, 225, 233, 235, 269, 270, 277, 281, 282 },
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
            spawn_levels = { [1] = { 24, 26 }, [2] = { 24, 26 }, [5] = { 24, 26 }, [7] = { 24, 26 },
                             [8] = { 24, 26 }, [23] = { 28, 30 }, [24] = { 28, 30 }, [25] = { 28, 30 },
                             [34] = { 34, 36 }, [37] = { 34, 36 }, [40] = { 28, 30 }, [41] = { 28, 30 },
                             [42] = { 28, 30 }, [44] = { 28, 30 }, [47] = { 28, 30 }, [48] = { 28, 30 },
                             [50] = { 28, 30 }, [52] = { 28, 30 }, [55] = { 28, 30 }, [57] = { 28, 30 },
                             [96] = { 34, 36 }, [98] = { 32, 34 }, [100] = { 32, 34 }, [108] = { 32, 34 },
                             [111] = { 32, 34 }, [112] = { 32, 34 }, [113] = { 32, 34 }, [121] = { 32, 34 },
                             [122] = { 32, 34 }, [128] = { 32, 34 }, [129] = { 32, 34 }, [133] = { 32, 34 },
                             [134] = { 32, 34 }, [138] = { 32, 34 }, [143] = { 32, 34 }, [144] = { 32, 34 },
                             [148] = { 32, 34 }, [152] = { 32, 34 }, [156] = { 32, 34 }, [192] = { 32, 34 },
                             [193] = { 32, 34 }, [204] = { 32, 34 }, [207] = { 32, 34 }, [213] = { 32, 34 },
                             [225] = { 28, 30 }, [233] = { 32, 34 }, [235] = { 32, 34 }, [269] = { 28, 30 },
                             [270] = { 28, 30 }, [277] = { 28, 30 }, [281] = { 24, 26 }, [282] = { 24, 26 } },
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
            ids    = { 3, 4, 6, 9, 10, 11, 13, 14, 15, 16, 26, 27, 31, 32, 35, 36, 38, 39, 43, 45, 51, 53, 54, 56,
                       59, 60, 61, 63, 64, 97, 101, 103, 104, 105, 106, 109, 110, 139, 140, 141, 142, 145, 146, 149,
                       150, 153, 155, 211, 214, 215, 216, 217, 218, 219, 220, 223, 226, 227, 266, 267, 268, 272,
                       273, 275, 278, 279, 280, 283 },
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
            spawn_levels = { [3] = { 25, 27 }, [4] = { 25, 27 }, [6] = { 25, 27 }, [9] = { 37, 38 },
                             [10] = { 37, 38 }, [11] = { 37, 38 }, [13] = { 37, 38 }, [14] = { 37, 38 },
                             [15] = { 37, 38 }, [16] = { 37, 38 }, [26] = { 29, 31 }, [27] = { 37, 38 },
                             [31] = { 37, 38 }, [32] = { 37, 38 }, [35] = { 37, 38 }, [36] = { 37, 38 },
                             [38] = { 37, 38 }, [39] = { 29, 31 }, [43] = { 29, 31 }, [45] = { 29, 31 },
                             [51] = { 29, 31 }, [53] = { 29, 31 }, [54] = { 29, 31 }, [56] = { 29, 31 },
                             [59] = { 29, 31 }, [60] = { 29, 31 }, [61] = { 29, 31 }, [63] = { 29, 31 },
                             [64] = { 29, 31 }, [97] = { 37, 38 }, [101] = { 33, 35 }, [103] = { 33, 35 },
                             [104] = { 33, 35 }, [105] = { 33, 35 }, [106] = { 33, 35 }, [109] = { 33, 35 },
                             [110] = { 33, 35 }, [139] = { 33, 35 }, [140] = { 33, 35 }, [141] = { 33, 35 },
                             [142] = { 33, 35 }, [145] = { 33, 35 }, [146] = { 33, 35 }, [149] = { 33, 35 },
                             [150] = { 33, 35 }, [153] = { 33, 35 }, [155] = { 33, 35 }, [211] = { 33, 35 },
                             [214] = { 33, 35 }, [215] = { 33, 35 }, [216] = { 33, 35 }, [217] = { 33, 35 },
                             [218] = { 33, 35 }, [219] = { 33, 35 }, [220] = { 33, 35 }, [223] = { 29, 31 },
                             [226] = { 29, 31 }, [227] = { 29, 31 }, [266] = { 29, 31 }, [267] = { 29, 31 },
                             [268] = { 29, 31 }, [272] = { 29, 31 }, [273] = { 29, 31 }, [275] = { 29, 31 },
                             [278] = { 29, 31 }, [279] = { 29, 31 }, [280] = { 29, 31 }, [283] = { 25, 27 } },
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
            ids    = { 12, 28, 29, 30, 33, 46, 49, 58, 62, 99, 107, 118, 126, 127, 136, 147, 151, 154, 196, 198,
                       205, 212, 222, 224, 228, 229, 231, 271, 284, 287, 291, 296, 302, 303, 306, 310, 316, 319,
                       323, 324, 325 },
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
            spawn_levels = { [12] = { 37, 38 }, [28] = { 37, 38 }, [29] = { 37, 38 }, [30] = { 37, 38 },
                             [33] = { 37, 38 }, [46] = { 31, 33 }, [49] = { 31, 33 }, [58] = { 31, 33 },
                             [62] = { 31, 33 }, [99] = { 34, 36 }, [107] = { 34, 36 }, [118] = { 34, 36 },
                             [126] = { 34, 36 }, [127] = { 34, 36 }, [136] = { 34, 36 }, [147] = { 34, 36 },
                             [151] = { 34, 36 }, [154] = { 34, 36 }, [196] = { 34, 36 }, [198] = { 34, 36 },
                             [205] = { 34, 36 }, [212] = { 34, 36 }, [222] = { 34, 36 }, [224] = { 31, 33 },
                             [228] = { 31, 33 }, [229] = { 31, 33 }, [231] = { 34, 36 }, [271] = { 31, 33 },
                             [284] = { 37, 38 }, [287] = { 37, 38 }, [291] = { 37, 38 }, [296] = { 37, 38 },
                             [302] = { 37, 38 }, [303] = { 37, 38 }, [306] = { 37, 38 }, [310] = { 37, 38 },
                             [316] = { 37, 38 }, [319] = { 37, 38 }, [323] = { 37, 38 }, [324] = { 37, 38 },
                             [325] = { 37, 38 } },
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
                family = { value = 'Seether / Empty', notes = { 'Source species: Seether (ID 286); family ID 113.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [31] = 857, [32] = 938, [33] = 1016, [34] = 1097, [35] = 1175, [36] = 1256, [37] = 1334, [38] = 1416 }, mp = { [31] = 826, [32] = 855, [33] = 884, [34] = 914, [35] = 943, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Vanity Strike: Stun, can crit; Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight; Lamentation: Dia', notes = { 'Vanity Strike: Stun, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight. Source targeting: cone.', 'Lamentation: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1253, name = 'Vanity Strike', summary = 'Vanity Strike: Stun, can crit', notes = danger[15], categories = { 'crit', 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } }, { kind = 'skill', id = 1254, name = 'Wanion', summary = 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'AGI down', 'Accuracy down', 'Addle', 'Attack down', 'Bio', 'Blindness', 'Burn', 'CHR down', 'Choke', 'DEX down', 'Defense down', 'Dia', 'Drown', 'Evasion down', 'Frost', 'INT down', 'MND down', 'Magic accuracy down', 'Magic attack down', 'Magic defense down', 'Paralysis', 'Poison', 'Rasp', 'STR down', 'Shock', 'Silence', 'Slow', 'VIT down', 'Weight' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: AGI down, Addle, Attack down, Bio, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Rasp, STR down, Shock, Slow, VIT down, Weight: Erase (one random eligible timed ailment), Panacea; Accuracy down: Erase (one random eligible timed ailment); Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } }, { effect = 'Addle', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Bio', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, danger[16], { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic accuracy down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[17], { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, danger[18] } } }, { kind = 'skill', id = 1258, name = 'Lamentation', summary = 'Lamentation: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { danger[16] } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Craver',
            ids    = { 17, 102, 221 },
            job    = 'war/rdm',
            levels = {
                [30] = { acc = 111, eva = 103, agi = 35, int = 29, mnd = 29, chr = 30, dex = 36, def = 122,
                         attack_skill = 89 },
                [31] = { acc = 115, eva = 108, agi = 38, int = 30, mnd = 30, chr = 31, dex = 38, def = 126,
                         attack_skill = 92 },
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31, dex = 38, def = 128,
                         attack_skill = 94 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35, dex = 43, def = 142,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35, dex = 43, def = 145,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36, dex = 43, def = 148,
                         attack_skill = 112 },
            },
            spawn_levels = { [17] = { 30, 32 }, [102] = { 36, 38 }, [221] = { 36, 38 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 50, item = 1722 },  -- indigo memosphere
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
                family = { value = 'Craver / Empty', notes = { 'Source species: Craver (ID 281); family ID 110.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [30] = 767, [31] = 857, [32] = 938, [36] = 1256, [37] = 1334, [38] = 1416 }, mp = { [30] = 797, [31] = 826, [32] = 855, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[31],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Memory Receptacle',
            ids    = { 19, 69, 76, 83, 90, 160, 169, 178, 240, 249, 258 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29, dex = 35, def = 175,
                         attack_skill = 89 },
            },
            no_swings = true,
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            info = {
                family = { value = 'Receptacle / Empty', notes = { 'Source species: Receptacle (ID 284); family ID 112.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 2300 }, mp = { [30] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[3],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Stray',
            ids    = { 20, 21, 22, 70, 71, 72, 73, 74, 77, 78, 79, 80, 81, 84, 85, 86, 87, 88, 91, 92, 93, 94, 95,
                       161, 162, 163, 164, 165, 166, 167, 170, 171, 172, 173, 174, 175, 176, 179, 180, 181, 182,
                       183, 184, 185, 241, 242, 243, 244, 245, 246, 247, 250, 251, 252, 253, 254, 255, 256, 259,
                       260, 261, 262, 263, 264, 265 },
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
            spawn_levels = { [20] = { 20, 21 }, [21] = { 20, 21 }, [22] = { 20, 21 }, [70] = { 23, 24 },
                             [71] = { 23, 24 }, [72] = { 23, 24 }, [73] = { 23, 24 }, [74] = { 23, 24 },
                             [77] = { 23, 24 }, [78] = { 23, 24 }, [79] = { 23, 24 }, [80] = { 23, 24 },
                             [81] = { 23, 24 }, [84] = { 23, 24 }, [85] = { 23, 24 }, [86] = { 23, 24 },
                             [87] = { 23, 24 }, [88] = { 23, 24 }, [91] = { 23, 24 }, [92] = { 23, 24 },
                             [93] = { 23, 24 }, [94] = { 23, 24 }, [95] = { 23, 24 }, [161] = { 26, 27 },
                             [162] = { 26, 27 }, [163] = { 26, 27 }, [164] = { 26, 27 }, [165] = { 26, 27 },
                             [166] = { 26, 27 }, [167] = { 26, 27 }, [170] = { 26, 27 }, [171] = { 26, 27 },
                             [172] = { 26, 27 }, [173] = { 26, 27 }, [174] = { 26, 27 }, [175] = { 26, 27 },
                             [176] = { 26, 27 }, [179] = { 26, 27 }, [180] = { 26, 27 }, [181] = { 26, 27 },
                             [182] = { 26, 27 }, [183] = { 26, 27 }, [184] = { 26, 27 }, [185] = { 26, 27 },
                             [241] = { 26, 27 }, [242] = { 26, 27 }, [243] = { 26, 27 }, [244] = { 26, 27 },
                             [245] = { 26, 27 }, [246] = { 26, 27 }, [247] = { 26, 27 }, [250] = { 26, 27 },
                             [251] = { 26, 27 }, [252] = { 26, 27 }, [253] = { 26, 27 }, [254] = { 26, 27 },
                             [255] = { 26, 27 }, [256] = { 26, 27 }, [259] = { 26, 27 }, [260] = { 26, 27 },
                             [261] = { 26, 27 }, [262] = { 26, 27 }, [263] = { 26, 27 }, [264] = { 26, 27 },
                             [265] = { 26, 27 } },
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
            name   = 'Craver',
            ids    = { 65, 66, 67, 157, 158, 237, 238, 331, 332, 333, 334, 335 },
            job    = 'war/rdm',
            levels = {
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31, dex = 38, def = 128,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 32, mnd = 32, chr = 33, dex = 39, def = 132,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 117, agi = 40, int = 32, mnd = 32, chr = 33, dex = 41, def = 135,
                         attack_skill = 100 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35, dex = 43, def = 142,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35, dex = 43, def = 145,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36, dex = 43, def = 148,
                         attack_skill = 112 },
                [39] = { acc = 143, eva = 133, agi = 45, int = 36, mnd = 36, chr = 38, dex = 46, def = 152,
                         attack_skill = 115 },
                [40] = { acc = 146, eva = 136, agi = 45, int = 36, mnd = 36, chr = 38, dex = 46, def = 155,
                         attack_skill = 118 },
            },
            spawn_levels = { [65] = { 32, 34 }, [66] = { 32, 34 }, [67] = { 32, 34 }, [157] = { 36, 38 },
                             [158] = { 36, 38 }, [237] = { 36, 38 }, [238] = { 36, 38 }, [331] = { 38, 40 },
                             [332] = { 38, 40 }, [333] = { 38, 40 }, [334] = { 38, 40 }, [335] = { 38, 40 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 50, item = 1722 },  -- indigo memosphere
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
                family = { value = 'Craver / Empty', notes = { 'Source species: Craver (ID 281); family ID 110.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [32] = 938, [33] = 1016, [34] = 1097, [36] = 1256, [37] = 1334, [38] = 1416, [39] = 1494, [40] = 1607 }, mp = { [32] = 855, [33] = 884, [34] = 914, [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062, [40] = 1092 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[31],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Weeper',
            ids    = { 114, 115, 116, 117, 119, 120, 123, 124, 125, 130, 131, 132, 135, 137, 186, 187, 188, 189,
                       190, 191, 194, 195, 197, 199, 200, 201, 202, 203, 206, 208, 209, 210, 230, 232, 234, 236,
                       285, 286, 289, 290, 292, 293, 294, 295, 299, 300, 301, 304, 305, 307, 308, 309, 312, 313,
                       314, 315, 317, 318, 321, 322, 326, 330 },
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
            spawn_levels = { [114] = { 33, 35 }, [115] = { 33, 35 }, [116] = { 33, 35 }, [117] = { 33, 35 },
                             [119] = { 33, 35 }, [120] = { 33, 35 }, [123] = { 33, 35 }, [124] = { 33, 35 },
                             [125] = { 33, 35 }, [130] = { 33, 35 }, [131] = { 33, 35 }, [132] = { 33, 35 },
                             [135] = { 33, 35 }, [137] = { 33, 35 }, [186] = { 33, 35 }, [187] = { 33, 35 },
                             [188] = { 33, 35 }, [189] = { 33, 35 }, [190] = { 33, 35 }, [191] = { 33, 35 },
                             [194] = { 33, 35 }, [195] = { 33, 35 }, [197] = { 33, 35 }, [199] = { 33, 35 },
                             [200] = { 33, 35 }, [201] = { 33, 35 }, [202] = { 33, 35 }, [203] = { 33, 35 },
                             [206] = { 33, 35 }, [208] = { 33, 35 }, [209] = { 33, 35 }, [210] = { 33, 35 },
                             [230] = { 33, 35 }, [232] = { 33, 35 }, [234] = { 33, 35 }, [236] = { 33, 35 },
                             [285] = { 37, 38 }, [286] = { 37, 38 }, [289] = { 37, 38 }, [290] = { 37, 38 },
                             [292] = { 37, 38 }, [293] = { 37, 38 }, [294] = { 37, 38 }, [295] = { 37, 38 },
                             [299] = { 37, 38 }, [300] = { 37, 38 }, [301] = { 37, 38 }, [304] = { 37, 38 },
                             [305] = { 37, 38 }, [307] = { 37, 38 }, [308] = { 37, 38 }, [309] = { 37, 38 },
                             [312] = { 37, 38 }, [313] = { 37, 38 }, [314] = { 37, 38 }, [315] = { 37, 38 },
                             [317] = { 37, 38 }, [318] = { 37, 38 }, [321] = { 37, 38 }, [322] = { 37, 38 },
                             [326] = { 37, 38 }, [330] = { 37, 38 } },
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
            ids    = { 288, 297, 311, 320, 328 },
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
            name   = 'Coveter',
            ids    = { 336 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36, dex = 43, def = 148,
                         attack_skill = 112 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 1000, item = 1757 },  -- remnant of a coveter
                { rate = 240, item = 1722 },  -- indigo memosphere
                { rate = 240, item = 1722 },  -- indigo memosphere
                { rate = 240, item = 1722 },  -- indigo memosphere
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Craver / Empty', notes = { 'Source species: Craver (ID 281); family ID 110.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [38] = 3000 }, mp = { [38] = 1032 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10; Regain 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Murk: Slow, Weight; Promyvion Brume: Poison', notes = { 'Murk: Slow, Weight. Source targeting: area around the monster.', 'Promyvion Brume: Poison. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[29], { kind = 'skill', id = 1276, name = 'Promyvion Brume', summary = 'Promyvion Brume: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[24] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
