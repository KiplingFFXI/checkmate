-- Ship bound for Mhaura Pirates (zone 228).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Intimidate: Slow. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Aqua Ball: STR down. Source targeting: area around the target.', 'Screwdriver: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[3] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[4] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[5] = { danger[4] };
danger[6] = { notes = danger[3], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[5] };
danger[7] = { kind = 'skill', id = 449, name = 'Intimidate', summary = 'Intimidate: Slow', notes = danger[2], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[6] };
danger[8] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[9] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[10] = { danger[9] };
danger[11] = { notes = danger[8], unknown = {  }, activation_range = 12.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[10] };
danger[12] = { kind = 'skill', id = 450, name = 'Aqua Ball', summary = 'Aqua Ball: STR down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[11] };
danger[13] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[14] = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[16] = { kind = 'skill', id = 452, name = 'Screwdriver', summary = 'Screwdriver: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[15] };
danger[17] = { danger[7], danger[12], danger[16] };
danger[18] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[19] = { value = 'Intimidate: Slow; Aqua Ball: STR down; Screwdriver: can crit', notes = danger[1], entries = danger[17], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[20] = { 'Bubble Shower: STR down. Source targeting: area around the monster.', 'Big Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[21] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[22] = { notes = danger[21], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[10] };
danger[23] = { kind = 'skill', id = 442, name = 'Bubble Shower', summary = 'Bubble Shower: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[22] };
danger[24] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[25] = { notes = danger[24], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[26] = { kind = 'skill', id = 444, name = 'Big Scissors', summary = 'Big Scissors: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[27] = { danger[23], danger[26] };
danger[28] = { value = 'Bubble Shower: STR down; Big Scissors: can crit', notes = danger[20], entries = danger[27], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[29] = { 'Tentacle: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Jet: Blindness. Source targeting: cone.', 'Maelstrom: STR down. Source targeting: area around the monster.', 'Whirlwind: VIT down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[30] = { kind = 'skill', id = 456, name = 'Tentacle', summary = 'Tentacle: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[31] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[32] = { notes = danger[31], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[33] = { kind = 'skill', id = 458, name = 'Ink Jet', summary = 'Ink Jet: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[32] };
danger[34] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[35] = { notes = danger[34], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[10] };
danger[36] = { kind = 'skill', id = 462, name = 'Maelstrom', summary = 'Maelstrom: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[35] };
danger[37] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[38] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[39] = { danger[38] };
danger[40] = { notes = danger[37], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[39] };
danger[41] = { kind = 'skill', id = 463, name = 'Whirlwind', summary = 'Whirlwind: VIT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[40] };
danger[42] = { danger[30], danger[33], danger[36], danger[41] };
danger[43] = { value = 'Tentacle: can crit; Ink Jet: Blindness; Maelstrom: STR down; Whirlwind: VIT down', notes = danger[29], entries = danger[42], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[44] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[45] = { notes = danger[44], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[46] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[47] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[48] = { danger[47] };
danger[49] = { notes = danger[46], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[48] };
danger[50] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[49], level_ranges = { { 21, 255 } } };
danger[51] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[52] = { notes = danger[51], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[53] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[52], level_ranges = { { 24, 69 } } };
danger[54] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[55] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[56] = { danger[55] };
danger[57] = { notes = danger[54], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[56] };
danger[58] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[57], level_ranges = { { 22, 50 } } };
danger[59] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[60] = { notes = danger[59], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[61] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[60], level_ranges = { { 12, 255 } } };
danger[62] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[60], level_ranges = { { 25, 82 } } };
danger[63] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[60], level_ranges = { { 20, 255 } } };
danger[64] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[65] = { notes = danger[64], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[66] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[65], level_ranges = { { 4, 255 } } };
danger[67] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[68] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[69] = { danger[68] };
danger[70] = { notes = danger[67], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[69] };
danger[71] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[70], level_ranges = { { 7, 255 } } };
danger[72] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[73] = { kind = 'skill', id = 478, name = 'Hell Slash', summary = 'Hell Slash: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[74] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[75] = { notes = danger[74], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[5] };
danger[76] = { kind = 'skill', id = 479, name = 'Horror Cloud', summary = 'Horror Cloud: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[75] };
danger[77] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[78] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[79] = { notes = danger[78], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[80] = { kind = 'skill', id = 484, name = 'Black Cloud', summary = 'Black Cloud: Blindness', notes = danger[77], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[79] };
danger[81] = { 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.' };
danger[82] = { kind = 'skill', id = 485, name = 'Blood Saber', summary = 'Blood Saber: HP drain', notes = danger[81], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[45] };
danger[83] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[84] = { notes = danger[83], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[85] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[84], level_ranges = { { 31, 55 } } };
danger[86] = { danger[73], danger[76], danger[80], danger[82] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Sea Pugil',
            ids    = { 1 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11, dex = 15, def = 54,
                         attack_skill = 31 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13, dex = 16, def = 57,
                         attack_skill = 34 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13, dex = 16, def = 59,
                         attack_skill = 36 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 13, dex = 17, def = 63,
                         attack_skill = 39 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13, dex = 18, def = 66,
                         attack_skill = 42 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15, dex = 18, def = 69,
                         attack_skill = 45 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15, dex = 20, def = 73,
                         attack_skill = 48 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 15, dex = 20, def = 75,
                         attack_skill = 51 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17, dex = 20, def = 78,
                         attack_skill = 54 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17, dex = 22, def = 82,
                         attack_skill = 57 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17, dex = 22, def = 85,
                         attack_skill = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [10] = 179, [11] = 198, [12] = 218, [13] = 239, [14] = 261, [15] = 284, [16] = 308, [17] = 333, [18] = 359, [19] = 386, [20] = 414 }, mp = { [10] = 0, [11] = 0, [12] = 0, [13] = 0, [14] = 0, [15] = 0, [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ocean Crab',
            ids    = { 2 },
            job    = 'pld/pld',
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15, dex = 12, def = 57,
                         attack_skill = 31 },
                [11] = { acc = 42, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16, dex = 13, def = 61,
                         attack_skill = 34 },
                [12] = { acc = 45, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16, dex = 13, def = 63,
                         attack_skill = 36 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17, dex = 14, def = 66,
                         attack_skill = 39 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18, dex = 14, def = 70,
                         attack_skill = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            steal  = { 936 },  -- chunk of rock salt
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [10] = 169, [11] = 187, [12] = 206, [13] = 226, [14] = 247 }, mp = { [10] = 243, [11] = 269, [12] = 295, [13] = 321, [14] = 348 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ocean Pugil',
            ids    = { 3 },
            levels = {
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15, dex = 18, def = 69,
                         attack_skill = 45 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15, dex = 20, def = 73,
                         attack_skill = 48 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 15, dex = 20, def = 75,
                         attack_skill = 51 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17, dex = 20, def = 78,
                         attack_skill = 54 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17, dex = 22, def = 82,
                         attack_skill = 57 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [15] = 284, [16] = 308, [17] = 333, [18] = 359, [19] = 386 }, mp = { [15] = 0, [16] = 0, [17] = 0, [18] = 0, [19] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Pirate Pugil',
            ids    = { 4 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17, dex = 22, def = 85,
                         attack_skill = 60 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 19, dex = 24, def = 90,
                         attack_skill = 63 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19, dex = 24, def = 92,
                         attack_skill = 65 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [20] = 414, [21] = 443, [22] = 473 }, mp = { [20] = 0, [21] = 0, [22] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sea Monk',
            ids    = { 5 },
            levels = {
                [21] = { acc = 77, eva = 73, agi = 24, int = 18, mnd = 18, chr = 20, dex = 23, def = 90,
                         attack_skill = 63 },
                [22] = { acc = 80, eva = 75, agi = 24, int = 18, mnd = 18, chr = 20, dex = 23, def = 92,
                         attack_skill = 65 },
                [23] = { acc = 83, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20, dex = 23, def = 95,
                         attack_skill = 68 },
                [24] = { acc = 87, eva = 82, agi = 26, int = 19, mnd = 19, chr = 21, dex = 24, def = 99,
                         attack_skill = 71 },
                [25] = { acc = 90, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23, dex = 25, def = 102,
                         attack_skill = 74 },
                [26] = { acc = 94, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23, dex = 27, def = 105,
                         attack_skill = 77 },
                [27] = { acc = 97, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24, dex = 27, def = 108,
                         attack_skill = 80 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25, dex = 28, def = 111,
                         attack_skill = 83 },
                [29] = { acc = 104, eva = 98, agi = 30, int = 22, mnd = 22, chr = 25, dex = 29, def = 114,
                         attack_skill = 86 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 443, [22] = 473, [23] = 504, [24] = 536, [25] = 589, [26] = 623, [27] = 658, [28] = 698, [29] = 735 }, mp = { [21] = 0, [22] = 0, [23] = 0, [24] = 0, [25] = 0, [26] = 0, [27] = 0, [28] = 0, [29] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[43],
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sea Crab',
            ids    = { 6, 7 },
            job    = 'pld/pld',
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15, dex = 12, def = 57,
                         attack_skill = 31 },
                [11] = { acc = 42, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16, dex = 13, def = 61,
                         attack_skill = 34 },
                [12] = { acc = 45, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16, dex = 13, def = 63,
                         attack_skill = 36 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17, dex = 14, def = 66,
                         attack_skill = 39 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18, dex = 14, def = 70,
                         attack_skill = 42 },
                [15] = { acc = 55, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18, dex = 15, def = 73,
                         attack_skill = 45 },
                [16] = { acc = 59, eva = 53, agi = 13, int = 14, mnd = 20, chr = 20, dex = 16, def = 77,
                         attack_skill = 48 },
                [17] = { acc = 62, eva = 55, agi = 13, int = 14, mnd = 20, chr = 20, dex = 16, def = 79,
                         attack_skill = 51 },
                [18] = { acc = 65, eva = 59, agi = 14, int = 14, mnd = 20, chr = 20, dex = 17, def = 82,
                         attack_skill = 54 },
                [19] = { acc = 69, eva = 62, agi = 14, int = 15, mnd = 22, chr = 22, dex = 18, def = 86,
                         attack_skill = 57 },
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22, dex = 18, def = 89,
                         attack_skill = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            steal  = { 936 },  -- chunk of rock salt
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [10] = 169, [11] = 187, [12] = 206, [13] = 226, [14] = 247, [15] = 269, [16] = 292, [17] = 316, [18] = 341, [19] = 367, [20] = 394 }, mp = { [10] = 243, [11] = 269, [12] = 295, [13] = 321, [14] = 348, [15] = 375, [16] = 402, [17] = 429, [18] = 456, [19] = 484, [20] = 512 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[28],
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sea Pugil',
            ids    = { 8, 9 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11, dex = 15, def = 54,
                         attack_skill = 31 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13, dex = 16, def = 57,
                         attack_skill = 34 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13, dex = 16, def = 59,
                         attack_skill = 36 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 13, dex = 17, def = 63,
                         attack_skill = 39 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13, dex = 18, def = 66,
                         attack_skill = 42 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15, dex = 18, def = 69,
                         attack_skill = 45 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15, dex = 20, def = 73,
                         attack_skill = 48 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 15, dex = 20, def = 75,
                         attack_skill = 51 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17, dex = 20, def = 78,
                         attack_skill = 54 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17, dex = 22, def = 82,
                         attack_skill = 57 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17, dex = 22, def = 85,
                         attack_skill = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            steal  = { 864 },  -- handful of fish scales
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [10] = 179, [11] = 198, [12] = 218, [13] = 239, [14] = 261, [15] = 284, [16] = 308, [17] = 333, [18] = 359, [19] = 386, [20] = 414 }, mp = { [10] = 0, [11] = 0, [12] = 0, [13] = 0, [14] = 0, [15] = 0, [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sea Monk',
            ids    = { 10 },
            levels = {
                [21] = { acc = 77, eva = 73, agi = 24, int = 18, mnd = 18, chr = 20, dex = 23, def = 90,
                         attack_skill = 63 },
                [22] = { acc = 80, eva = 75, agi = 24, int = 18, mnd = 18, chr = 20, dex = 23, def = 92,
                         attack_skill = 65 },
                [23] = { acc = 83, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20, dex = 23, def = 95,
                         attack_skill = 68 },
                [24] = { acc = 87, eva = 82, agi = 26, int = 19, mnd = 19, chr = 21, dex = 24, def = 99,
                         attack_skill = 71 },
                [25] = { acc = 90, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23, dex = 25, def = 102,
                         attack_skill = 74 },
                [26] = { acc = 94, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23, dex = 27, def = 105,
                         attack_skill = 77 },
                [27] = { acc = 97, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24, dex = 27, def = 108,
                         attack_skill = 80 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25, dex = 28, def = 111,
                         attack_skill = 83 },
                [29] = { acc = 104, eva = 98, agi = 30, int = 22, mnd = 22, chr = 25, dex = 29, def = 114,
                         attack_skill = 86 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 443, [22] = 473, [23] = 504, [24] = 536, [25] = 589, [26] = 623, [27] = 658, [28] = 698, [29] = 735 }, mp = { [21] = 0, [22] = 0, [23] = 0, [24] = 0, [25] = 0, [26] = 0, [27] = 0, [28] = 0, [29] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[43],
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Phantom',
            ids    = { 11 },
            job    = 'war/blm',
            levels = {
                [22] = { acc = 81, eva = 75, agi = 24, int = 21, mnd = 17, chr = 23, dex = 24, def = 91,
                         attack_skill = 65 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 21, mnd = 17, chr = 23, dex = 24, def = 94,
                         attack_skill = 68 },
                [24] = { acc = 88, eva = 82, agi = 26, int = 22, mnd = 17, chr = 24, dex = 26, def = 98,
                         attack_skill = 71 },
                [25] = { acc = 91, eva = 85, agi = 26, int = 24, mnd = 20, chr = 25, dex = 26, def = 101,
                         attack_skill = 74 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4858 },  -- scroll of ice spikes
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 473, [23] = 504, [24] = 536, [25] = 579 }, mp = { [22] = 568, [23] = 596, [24] = 624, [25] = 653 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Gravity: Weight; Poison: Poison; Poisonga: area poison; Frost: Frost; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Gravity: Weight.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Frost: Frost.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 472, name = 'Grave Reel', summary = 'Grave Reel: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[45] }, { kind = 'skill', id = 473, name = 'Ectosmash', summary = 'Ectosmash: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 474, name = 'Fear Touch', summary = 'Fear Touch: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] }, { kind = 'skill', id = 475, name = 'Terror Touch', summary = 'Terror Touch: Attack down, can crit', notes = danger[13], categories = { 'crit', 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 476, name = 'Curse', summary = 'Curse: curse', notes = { 'Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } } }, { kind = 'skill', id = 477, name = 'Dark Sphere', summary = 'Dark Sphere: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, danger[50], { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } }, level_ranges = { { 3, 25 } } }, danger[53], danger[58], danger[61], danger[62], danger[63], danger[66], danger[71] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[72] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Crossbones',
            ids    = { 12, 13 },
            job    = 'blm/blm',
            levels = {
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26, dex = 31, def = 98,
                         attack_skill = 83 },
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26, dex = 33, def = 102,
                         attack_skill = 86 },
                [30] = { acc = 109, eva = 91, agi = 31, int = 36, mnd = 24, chr = 28, dex = 33, def = 105,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 95, agi = 33, int = 39, mnd = 27, chr = 30, dex = 36, def = 109,
                         attack_skill = 92 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 13095 },  -- sand charm
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [28] = 569, [29] = 602, [30] = 636, [31] = 717 }, mp = { [28] = 739, [29] = 768, [30] = 797, [31] = 826 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[73], danger[76], danger[80], danger[82], { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[52], level_ranges = { { 24, 71 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[57], level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 27, 255 } } }, danger[61], { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[60], level_ranges = { { 25, 255 } } }, { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[60], level_ranges = { { 20, 40 } } }, danger[66], danger[71], danger[85] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[72] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Crossbones',
            ids    = { 14, 15 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25, dex = 31, def = 111,
                         attack_skill = 83 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25, dex = 33, def = 114,
                         attack_skill = 86 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 21, chr = 26, dex = 33, def = 118,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28, dex = 36, def = 122,
                         attack_skill = 92 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 13095 },  -- sand charm
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [28] = 698, [29] = 735, [30] = 773, [31] = 872 }, mp = { [28] = 0, [29] = 0, [30] = 0, [31] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = danger[86], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ship Wight',
            ids    = { 16 },
            job    = 'blm/blm',
            levels = {
                [36] = { acc = 131, eva = 110, agi = 38, int = 44, mnd = 30, chr = 34, dex = 41, def = 125,
                         attack_skill = 106 },
                [37] = { acc = 134, eva = 113, agi = 38, int = 46, mnd = 30, chr = 34, dex = 41, def = 127,
                         attack_skill = 109 },
                [38] = { acc = 137, eva = 115, agi = 38, int = 46, mnd = 32, chr = 34, dex = 41, def = 130,
                         attack_skill = 112 },
                [39] = { acc = 141, eva = 119, agi = 40, int = 49, mnd = 33, chr = 37, dex = 43, def = 134,
                         attack_skill = 115 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            steal  = { 880 },  -- bone chip
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [36] = 1088, [37] = 1161, [38] = 1237, [39] = 1310 }, mp = { [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Gravity: Weight; Poisonga: area poison; Frost: Frost; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Gravity: Weight.', 'Poisonga: area poison. Possible effects: Poison.', 'Frost: Frost.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[73], danger[76], danger[80], danger[82], danger[50], danger[53], danger[58], danger[61], danger[62], danger[63], danger[66], danger[71], danger[85] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[72] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Silverhook',
            ids    = { 17 },
            nm     = true,
            job    = 'blm/war',
            levels = {
                [68] = { acc = 278, eva = 263, agi = 71, int = 73, mnd = 55, chr = 63, dex = 75, def = 274,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 74, mnd = 55, chr = 63, dex = 77, def = 280,
                         attack_skill = 229 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 75, mnd = 55, chr = 65, dex = 77, def = 285,
                         attack_skill = 233 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = 11, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 150, item = 18395 },  -- seawolf cudgel
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 9400, [69] = 9400, [70] = 9400 }, mp = { [68] = 1957, [69] = 1989, [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = danger[86], coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
