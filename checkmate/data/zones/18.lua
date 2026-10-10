-- Promyvion-Dem (zone 18).
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
danger[15] = { 'Spirit Absorption Gorger: HP drain. Source targeting: single target.', 'Stygian Flatus: Paralysis. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[16] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[17] = { notes = danger[16], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[18] = { kind = 'skill', id = 744, name = 'Spirit Absorption Gorger', summary = 'Spirit Absorption Gorger: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[17] };
danger[19] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[20] = { notes = danger[19], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[21] = { kind = 'skill', id = 750, name = 'Stygian Flatus', summary = 'Stygian Flatus: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[20] };
danger[22] = { danger[18], danger[21] };
danger[23] = { value = 'Spirit Absorption Gorger: HP drain; Stygian Flatus: Paralysis', notes = danger[15], entries = danger[22], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] };
danger[24] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Wanderer',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 13, 15, 16, 18, 19, 20, 23, 33, 36, 38, 40, 44, 45, 49, 50,
                       53, 55, 58, 60, 67, 68, 70, 71, 72, 73, 109, 111, 113, 116, 118, 156, 159, 161, 162, 167,
                       180, 189, 193, 197, 199, 202, 203, 204, 205, 245, 246, 247, 248, 252, 261, 312, 318, 321,
                       322 },
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
            spawn_levels = { [1] = { 24, 26 }, [2] = { 24, 26 }, [3] = { 24, 26 }, [4] = { 24, 26 },
                             [5] = { 24, 26 }, [6] = { 24, 26 }, [7] = { 24, 26 }, [9] = { 24, 26 },
                             [10] = { 24, 26 }, [12] = { 24, 26 }, [13] = { 24, 26 }, [15] = { 24, 26 },
                             [16] = { 24, 26 }, [18] = { 24, 26 }, [19] = { 24, 26 }, [20] = { 24, 26 },
                             [23] = { 24, 26 }, [33] = { 28, 30 }, [36] = { 28, 30 }, [38] = { 28, 30 },
                             [40] = { 28, 30 }, [44] = { 28, 30 }, [45] = { 28, 30 }, [49] = { 28, 30 },
                             [50] = { 28, 30 }, [53] = { 28, 30 }, [55] = { 28, 30 }, [58] = { 28, 30 },
                             [60] = { 28, 30 }, [67] = { 28, 30 }, [68] = { 28, 30 }, [70] = { 28, 30 },
                             [71] = { 28, 30 }, [72] = { 28, 30 }, [73] = { 28, 30 }, [109] = { 32, 34 },
                             [111] = { 32, 34 }, [113] = { 32, 34 }, [116] = { 32, 34 }, [118] = { 32, 34 },
                             [156] = { 32, 34 }, [159] = { 32, 34 }, [161] = { 32, 34 }, [162] = { 32, 34 },
                             [167] = { 32, 34 }, [180] = { 32, 34 }, [189] = { 24, 26 }, [193] = { 28, 30 },
                             [197] = { 28, 30 }, [199] = { 28, 30 }, [202] = { 28, 30 }, [203] = { 28, 30 },
                             [204] = { 28, 30 }, [205] = { 28, 30 }, [245] = { 28, 30 }, [246] = { 28, 30 },
                             [247] = { 28, 30 }, [248] = { 28, 30 }, [252] = { 32, 34 }, [261] = { 32, 34 },
                             [312] = { 32, 34 }, [318] = { 34, 36 }, [321] = { 34, 36 }, [322] = { 34, 36 } },
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
            ids    = { 8, 11, 14, 17, 21, 22, 25, 26, 32, 34, 35, 37, 39, 41, 42, 43, 46, 47, 48, 51, 57, 59, 61,
                       62, 63, 64, 66, 74, 190, 192, 194, 196, 200, 201, 249, 250, 251, 253, 254, 255, 256, 257,
                       258, 259, 260, 307, 308, 310, 313, 314, 316, 317, 319 },
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
            spawn_levels = { [8] = { 25, 27 }, [11] = { 25, 27 }, [14] = { 25, 27 }, [17] = { 25, 27 },
                             [21] = { 25, 27 }, [22] = { 25, 27 }, [25] = { 25, 27 }, [26] = { 25, 27 },
                             [32] = { 29, 31 }, [34] = { 29, 31 }, [35] = { 29, 31 }, [37] = { 29, 31 },
                             [39] = { 29, 31 }, [41] = { 29, 31 }, [42] = { 29, 31 }, [43] = { 29, 31 },
                             [46] = { 29, 31 }, [47] = { 29, 31 }, [48] = { 29, 31 }, [51] = { 29, 31 },
                             [57] = { 29, 31 }, [59] = { 29, 31 }, [61] = { 29, 31 }, [62] = { 29, 31 },
                             [63] = { 29, 31 }, [64] = { 29, 31 }, [66] = { 29, 31 }, [74] = { 29, 31 },
                             [190] = { 25, 27 }, [192] = { 29, 31 }, [194] = { 29, 31 }, [196] = { 29, 31 },
                             [200] = { 29, 31 }, [201] = { 29, 31 }, [249] = { 29, 31 }, [250] = { 33, 35 },
                             [251] = { 33, 35 }, [253] = { 33, 35 }, [254] = { 33, 35 }, [255] = { 33, 35 },
                             [256] = { 33, 35 }, [257] = { 33, 35 }, [258] = { 33, 35 }, [259] = { 33, 35 },
                             [260] = { 33, 35 }, [307] = { 33, 35 }, [308] = { 33, 35 }, [310] = { 33, 35 },
                             [313] = { 33, 35 }, [314] = { 33, 35 }, [316] = { 33, 35 }, [317] = { 33, 35 },
                             [319] = { 37, 38 } },
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
            name   = 'Gorger',
            ids    = { 24, 198, 305, 306 },
            job    = 'war/rdm',
            levels = {
                [30] = { acc = 111, eva = 103, agi = 35, int = 29, mnd = 29, chr = 30, dex = 36, def = 121,
                         attack_skill = 89 },
                [31] = { acc = 115, eva = 108, agi = 38, int = 30, mnd = 30, chr = 31, dex = 38, def = 125,
                         attack_skill = 92 },
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31, dex = 38, def = 127,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 32, mnd = 32, chr = 33, dex = 39, def = 131,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 117, agi = 40, int = 32, mnd = 32, chr = 33, dex = 41, def = 134,
                         attack_skill = 100 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35, dex = 43, def = 141,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35, dex = 43, def = 143,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
            },
            spawn_levels = { [24] = { 30, 32 }, [198] = { 32, 34 }, [305] = { 36, 38 }, [306] = { 36, 38 } },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 50, item = 1721 },  -- beryl memosphere
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
                family = { value = 'Gorger / Empty', notes = { 'Source species: Gorger (ID 283); family ID 111.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [30] = 767, [31] = 857, [32] = 938, [33] = 1016, [34] = 1097, [36] = 1256, [37] = 1334, [38] = 1416 }, mp = { [30] = 797, [31] = 826, [32] = 855, [33] = 884, [34] = 914, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Memory Receptacle',
            ids    = { 28, 82, 89, 96, 103, 129, 138, 147, 208, 217, 226 },
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
            ids    = { 29, 30, 31, 83, 84, 85, 86, 87, 90, 91, 92, 93, 94, 97, 98, 99, 100, 101, 104, 105, 106, 107,
                       108, 130, 131, 132, 133, 134, 135, 136, 139, 140, 141, 142, 143, 144, 145, 148, 149, 150,
                       151, 152, 153, 154, 209, 210, 211, 212, 213, 214, 215, 218, 219, 220, 221, 222, 223, 224,
                       227, 228, 229, 230, 231, 232, 233 },
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
            spawn_levels = { [29] = { 20, 21 }, [30] = { 20, 21 }, [31] = { 21, 21 }, [83] = { 23, 24 },
                             [84] = { 23, 24 }, [85] = { 23, 24 }, [86] = { 23, 24 }, [87] = { 23, 24 },
                             [90] = { 23, 24 }, [91] = { 23, 24 }, [92] = { 23, 24 }, [93] = { 23, 24 },
                             [94] = { 23, 24 }, [97] = { 23, 24 }, [98] = { 23, 24 }, [99] = { 23, 24 },
                             [100] = { 23, 24 }, [101] = { 23, 24 }, [104] = { 23, 24 }, [105] = { 23, 24 },
                             [106] = { 23, 24 }, [107] = { 23, 24 }, [108] = { 23, 24 }, [130] = { 26, 27 },
                             [131] = { 26, 27 }, [132] = { 26, 27 }, [133] = { 26, 27 }, [134] = { 26, 27 },
                             [135] = { 26, 27 }, [136] = { 26, 27 }, [139] = { 26, 27 }, [140] = { 26, 27 },
                             [141] = { 26, 27 }, [142] = { 26, 27 }, [143] = { 26, 27 }, [144] = { 26, 27 },
                             [145] = { 26, 27 }, [148] = { 26, 27 }, [149] = { 26, 27 }, [150] = { 26, 27 },
                             [151] = { 26, 27 }, [152] = { 26, 27 }, [153] = { 26, 27 }, [154] = { 26, 27 },
                             [209] = { 26, 27 }, [210] = { 26, 27 }, [211] = { 26, 27 }, [212] = { 26, 27 },
                             [213] = { 26, 27 }, [214] = { 26, 27 }, [215] = { 26, 27 }, [218] = { 26, 27 },
                             [219] = { 26, 27 }, [220] = { 26, 27 }, [221] = { 26, 27 }, [222] = { 26, 27 },
                             [223] = { 26, 27 }, [224] = { 26, 27 }, [227] = { 26, 27 }, [228] = { 26, 27 },
                             [229] = { 26, 27 }, [230] = { 26, 27 }, [231] = { 26, 27 }, [232] = { 26, 27 },
                             [233] = { 26, 27 } },
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
            name   = 'Seether Prom',
            ids    = { 52, 54, 56, 65, 69, 75, 120, 124, 170, 173, 178, 183, 184, 195, 234, 235, 236, 237, 242, 243,
                       263, 266, 267, 270, 273, 274, 278, 279, 287, 292, 293, 309, 311, 315, 320 },
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
            spawn_levels = { [52] = { 31, 33 }, [54] = { 31, 33 }, [56] = { 31, 33 }, [65] = { 31, 33 },
                             [69] = { 31, 33 }, [75] = { 31, 33 }, [120] = { 34, 36 }, [124] = { 34, 36 },
                             [170] = { 34, 36 }, [173] = { 34, 36 }, [178] = { 34, 36 }, [183] = { 34, 36 },
                             [184] = { 34, 36 }, [195] = { 34, 36 }, [234] = { 37, 38 }, [235] = { 37, 38 },
                             [236] = { 37, 38 }, [237] = { 37, 38 }, [242] = { 37, 38 }, [243] = { 37, 38 },
                             [263] = { 37, 38 }, [266] = { 37, 38 }, [267] = { 37, 38 }, [270] = { 37, 38 },
                             [273] = { 37, 38 }, [274] = { 37, 38 }, [278] = { 37, 38 }, [279] = { 37, 38 },
                             [287] = { 37, 38 }, [292] = { 37, 38 }, [293] = { 37, 38 }, [309] = { 34, 36 },
                             [311] = { 34, 36 }, [315] = { 34, 36 }, [320] = { 37, 38 } },
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
                family = { value = 'Seether / Empty', notes = { 'Source species: Seether (ID 286); family ID 113.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [31] = 857, [32] = 938, [33] = 1016, [34] = 1097, [35] = 1175, [36] = 1256, [37] = 1334, [38] = 1416 }, mp = { [31] = 826, [32] = 855, [33] = 884, [34] = 914, [35] = 943, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Vanity Strike: Stun, can crit; Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight; Lamentation: Dia', notes = { 'Vanity Strike: Stun, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight. Source targeting: cone.', 'Lamentation: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1253, name = 'Vanity Strike', summary = 'Vanity Strike: Stun, can crit', notes = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' }, categories = { 'crit', 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } }, { kind = 'skill', id = 1254, name = 'Wanion', summary = 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'AGI down', 'Accuracy down', 'Addle', 'Attack down', 'Bio', 'Blindness', 'Burn', 'CHR down', 'Choke', 'DEX down', 'Defense down', 'Dia', 'Drown', 'Evasion down', 'Frost', 'INT down', 'MND down', 'Magic accuracy down', 'Magic attack down', 'Magic defense down', 'Paralysis', 'Poison', 'Rasp', 'STR down', 'Shock', 'Silence', 'Slow', 'VIT down', 'Weight' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: AGI down, Addle, Attack down, Bio, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Rasp, STR down, Shock, Slow, VIT down, Weight: Erase (one random eligible timed ailment), Panacea; Accuracy down: Erase (one random eligible timed ailment); Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } }, { effect = 'Addle', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Bio', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, danger[24], { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic accuracy down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1258, name = 'Lamentation', summary = 'Lamentation: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { danger[24] } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[2] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Gorger',
            ids    = { 76, 77, 78, 79, 80, 126, 127, 187, 188, 296, 297, 298, 299, 300, 301, 302, 303, 304 },
            job    = 'war/rdm',
            levels = {
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31, dex = 38, def = 127,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 32, mnd = 32, chr = 33, dex = 39, def = 131,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 117, agi = 40, int = 32, mnd = 32, chr = 33, dex = 41, def = 134,
                         attack_skill = 100 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35, dex = 43, def = 141,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35, dex = 43, def = 143,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
                [39] = { acc = 143, eva = 133, agi = 45, int = 36, mnd = 36, chr = 38, dex = 46, def = 151,
                         attack_skill = 115 },
                [40] = { acc = 146, eva = 136, agi = 45, int = 36, mnd = 36, chr = 38, dex = 46, def = 154,
                         attack_skill = 118 },
            },
            spawn_levels = { [76] = { 32, 34 }, [77] = { 32, 34 }, [78] = { 32, 34 }, [79] = { 32, 34 },
                             [80] = { 32, 34 }, [126] = { 36, 38 }, [127] = { 36, 38 }, [187] = { 36, 38 },
                             [188] = { 36, 38 }, [296] = { 38, 40 }, [297] = { 38, 40 }, [298] = { 38, 40 },
                             [299] = { 38, 40 }, [300] = { 38, 40 }, [301] = { 38, 40 }, [302] = { 38, 40 },
                             [303] = { 38, 40 }, [304] = { 38, 40 } },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 50, item = 1721 },  -- beryl memosphere
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
                family = { value = 'Gorger / Empty', notes = { 'Source species: Gorger (ID 283); family ID 111.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [32] = 938, [33] = 1016, [34] = 1097, [36] = 1256, [37] = 1334, [38] = 1416, [39] = 1494, [40] = 1607 }, mp = { [32] = 855, [33] = 884, [34] = 914, [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062, [40] = 1092 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Weeper',
            ids    = { 110, 112, 114, 115, 117, 119, 121, 122, 123, 125, 155, 157, 158, 160, 163, 164, 165, 166,
                       168, 169, 171, 172, 174, 175, 176, 177, 179, 181, 182, 185, 186, 238, 240, 241, 264, 265,
                       268, 269, 271, 276, 280, 281, 282, 283, 285, 286, 288, 289, 290, 291 },
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
            spawn_levels = { [110] = { 33, 35 }, [112] = { 33, 35 }, [114] = { 33, 35 }, [115] = { 33, 35 },
                             [117] = { 33, 35 }, [119] = { 33, 35 }, [121] = { 33, 35 }, [122] = { 33, 35 },
                             [123] = { 33, 35 }, [125] = { 33, 35 }, [155] = { 33, 35 }, [157] = { 33, 35 },
                             [158] = { 33, 35 }, [160] = { 33, 35 }, [163] = { 33, 35 }, [164] = { 33, 35 },
                             [165] = { 33, 35 }, [166] = { 33, 35 }, [168] = { 33, 35 }, [169] = { 33, 35 },
                             [171] = { 33, 35 }, [172] = { 33, 35 }, [174] = { 33, 35 }, [175] = { 33, 35 },
                             [176] = { 33, 35 }, [177] = { 33, 35 }, [179] = { 33, 35 }, [181] = { 33, 35 },
                             [182] = { 33, 35 }, [185] = { 33, 35 }, [186] = { 33, 35 }, [238] = { 37, 38 },
                             [240] = { 37, 38 }, [241] = { 37, 38 }, [264] = { 37, 38 }, [265] = { 37, 38 },
                             [268] = { 37, 38 }, [269] = { 37, 38 }, [271] = { 37, 38 }, [276] = { 37, 38 },
                             [280] = { 37, 38 }, [281] = { 37, 38 }, [282] = { 37, 38 }, [283] = { 37, 38 },
                             [285] = { 37, 38 }, [286] = { 37, 38 }, [288] = { 37, 38 }, [289] = { 37, 38 },
                             [290] = { 37, 38 }, [291] = { 37, 38 } },
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
            ids    = { 239, 262, 272, 275, 277, 284, 294, 295 },
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
            name   = 'Satiator',
            ids    = { 323 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36, dex = 43, def = 147,
                         attack_skill = 112 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 1000, item = 1758 },  -- remnant of a satiator
                { rate = 240, item = 1721 },  -- beryl memosphere
                { rate = 240, item = 1721 },  -- beryl memosphere
                { rate = 240, item = 1721 },  -- beryl memosphere
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Gorger / Empty', notes = { 'Source species: Gorger (ID 283); family ID 111.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [38] = 3000 }, mp = { [38] = 1032 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10; Regain 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
