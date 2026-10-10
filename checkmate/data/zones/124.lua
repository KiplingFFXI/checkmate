-- Yhoator Jungle (zone 124).
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
danger[20] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[21] = { notes = danger[20], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[22] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[23] = { danger[22] };
danger[24] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[25] = { danger[24] };
danger[26] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[27] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[28] = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[29] = { 'Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.' };
danger[30] = { 'Normal activation range: 13.5 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[31] = { notes = danger[30], unknown = {  }, activation_range = 13.5, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } } };
danger[32] = { kind = 'skill', id = 591, name = 'Bomb Toss', summary = 'Bomb Toss: fire damage', notes = danger[29], categories = { 'other' }, effects = {  }, details = danger[31] };
danger[33] = { danger[32] };
danger[34] = { value = 'Bomb Toss: fire damage', notes = danger[28], entries = danger[33], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[35] = { 'Final Sting: heavy damage. Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[36] = { 'Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.' };
danger[37] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[38] = { notes = danger[37], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[39] = { kind = 'skill', id = 336, name = 'Final Sting', summary = 'Final Sting: heavy damage', notes = danger[36], categories = { 'other' }, effects = {  }, details = danger[38] };
danger[40] = { danger[39] };
danger[41] = { value = 'Final Sting: heavy damage', notes = danger[35], entries = danger[40], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[42] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[43] = { notes = danger[42], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[44] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[43], level_ranges = { { 24, 71 } } };
danger[45] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[46] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[47] = { danger[46] };
danger[48] = { notes = danger[45], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[47] };
danger[49] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[48], level_ranges = { { 24, 255 } } };
danger[50] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[51] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[52] = { danger[51] };
danger[53] = { notes = danger[50], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[52] };
danger[54] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[53], level_ranges = { { 22, 255 } } };
danger[55] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[57] = { danger[56] };
danger[58] = { notes = danger[55], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[57] };
danger[59] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[58], level_ranges = { { 20, 255 } } };
danger[60] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { danger[61] };
danger[63] = { notes = danger[60], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[62] };
danger[64] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[63], level_ranges = { { 18, 255 } } };
danger[65] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[66] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[67] = { danger[66] };
danger[68] = { notes = danger[65], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[67] };
danger[69] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[68], level_ranges = { { 16, 255 } } };
danger[70] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[71] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[72] = { danger[71] };
danger[73] = { notes = danger[70], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[72] };
danger[74] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[73], level_ranges = { { 27, 255 } } };
danger[75] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[76] = { notes = danger[75], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[77] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[76], level_ranges = { { 12, 255 } } };
danger[78] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[76], level_ranges = { { 25, 255 } } };
danger[79] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[80] = { notes = danger[79], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[81] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[80], level_ranges = { { 4, 255 } } };
danger[82] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[83] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[84] = { danger[83] };
danger[85] = { notes = danger[82], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[84] };
danger[86] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[85], level_ranges = { { 7, 255 } } };
danger[87] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[88] = { notes = danger[87], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[89] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[88], level_ranges = { { 31, 55 } } };
danger[90] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[91] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[92] = { notes = danger[91], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[84] };
danger[93] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[94] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[95] = { notes = danger[94], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[96] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[43], level_ranges = { { 26, 50 } } };
danger[97] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[76], level_ranges = { { 10, 255 } } };
danger[98] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[76], level_ranges = { { 20, 255 } } };
danger[99] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[100] = { notes = danger[99], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[26] };
danger[101] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[100], level_ranges = { { 37, 255 } } };
danger[102] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 30, 55 } } };
danger[103] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[85], level_ranges = { { 20, 255 } } };
danger[104] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[105] = { notes = danger[104], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[10] };
danger[106] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[105], level_ranges = { { 43, 255 } } };
danger[107] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[108] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[109] = { danger[108] };
danger[110] = { notes = danger[107], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[109] };
danger[111] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[110], level_ranges = { { 41, 255 } } };
danger[112] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[113] = { notes = danger[112], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[23] };
danger[114] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[113], level_ranges = { { 35, 255 } } };
danger[115] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[116] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[117] = { danger[116] };
danger[118] = { notes = danger[115], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[117] };
danger[119] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[118], level_ranges = { { 37, 255 } } };
danger[120] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[121] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[122] = { danger[121] };
danger[123] = { notes = danger[120], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[122] };
danger[124] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[123], level_ranges = { { 39, 255 } } };
danger[125] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[126] = { notes = danger[125], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[25] };
danger[127] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[126], level_ranges = { { 31, 255 } } };
danger[128] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[129] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[130] = { danger[129] };
danger[131] = { notes = danger[128], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[130] };
danger[132] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[131], level_ranges = { { 33, 255 } } };
danger[133] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[76], level_ranges = { { 45, 255 } } };
danger[134] = { 'Stone Throw: Paralysis. Source targeting: single target.', 'Spinning Claw: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Claw Storm: Poison. Source targeting: single target.', 'Blank Gaze: dispel gaze. Attempts to remove one dispellable status effect when the target faces the monster. Source targeting: cone. Possible effects: Buff removal. Only effects allowed by the move\'s dispel checks can be removed.', 'Eye Scratch: Blindness. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[135] = { 'Normal activation range: 25 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[136] = { notes = danger[135], unknown = {  }, activation_range = 25.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[137] = { kind = 'skill', id = 289, name = 'Stone Throw', summary = 'Stone Throw: Paralysis', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[136] };
danger[138] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[139] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[140] = { notes = danger[139], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[141] = { kind = 'skill', id = 290, name = 'Spinning Claw', summary = 'Spinning Claw: can crit', notes = danger[138], categories = { 'crit' }, effects = {  }, details = danger[140] };
danger[142] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[143] = { notes = danger[142], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[144] = { kind = 'skill', id = 291, name = 'Claw Storm', summary = 'Claw Storm: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[143] };
danger[145] = { 'Attempts to remove one dispellable status effect when the target faces the monster. Source targeting: cone. Possible effects: Buff removal. Only effects allowed by the move\'s dispel checks can be removed.' };
danger[146] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[147] = { notes = danger[146], unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } } };
danger[148] = { kind = 'skill', id = 292, name = 'Blank Gaze Dispel', summary = 'Blank Gaze: dispel gaze', notes = danger[145], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[147] };
danger[149] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[150] = { notes = danger[149], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[151] = { kind = 'skill', id = 294, name = 'Eye Scratch', summary = 'Eye Scratch: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[150] };
danger[152] = { danger[137], danger[141], danger[144], danger[148], danger[151] };
danger[153] = { value = 'Stone Throw: Paralysis; Spinning Claw: can crit; Claw Storm: Poison; Blank Gaze: dispel gaze; Eye Scratch: Blindness', notes = danger[134], entries = danger[152], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[154] = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[155] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[156] = { notes = danger[155], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[157] = { kind = 'skill', id = 783, name = 'Words Of Bane', summary = 'Words Of Bane: Curse', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[156] };
danger[158] = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' };
danger[159] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[160] = { danger[83], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } };
danger[161] = { notes = danger[159], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[160] };
danger[162] = { kind = 'skill', id = 785, name = 'Light Of Penance', summary = 'Light Of Penance: Bind, Blindness', notes = danger[158], categories = { 'debuff' }, effects = { 'Bind', 'Blindness' }, details = danger[161] };
danger[163] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[164] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[165] = { danger[164] };
danger[166] = { notes = danger[163], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[165] };
danger[167] = { kind = 'skill', id = 786, name = 'Lateral Slash', summary = 'Lateral Slash: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[166] };
danger[168] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[169] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[170] = { danger[169] };
danger[171] = { notes = danger[168], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[170] };
danger[172] = { kind = 'skill', id = 787, name = 'Vertical Slash', summary = 'Vertical Slash: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[171] };
danger[173] = { danger[157], danger[162], danger[167], danger[172] };
danger[174] = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down', notes = danger[154], entries = danger[173], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[175] = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[176] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[95], level_ranges = { { 43, 64 } } };
danger[177] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[100], level_ranges = { { 45, 255 } } };
danger[178] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 41, 255 } } };
danger[179] = { danger[157], danger[162], danger[167], danger[172], danger[176], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[77], danger[78], danger[177], danger[81], danger[86], danger[178], danger[89] };
danger[180] = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = danger[175], entries = danger[179], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] };
danger[181] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[76], level_ranges = { { 50, 255 } } };
danger[182] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[76], level_ranges = { { 52, 255 } } };
danger[183] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[76], level_ranges = { { 54, 255 } } };
danger[184] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[185] = { notes = danger[184], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[186] = { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[185], level_ranges = { { 40, 255 } } };
danger[187] = { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[185], level_ranges = { { 40, 255 } } };
danger[188] = { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[185], level_ranges = { { 40, 255 } } };
danger[189] = { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[185], level_ranges = { { 40, 255 } } };
danger[190] = { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[185], level_ranges = { { 40, 255 } } };
danger[191] = { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[185], level_ranges = { { 40, 255 } } };
danger[192] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[193] = { notes = danger[192], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[194] = { kind = 'spell', id = 341, name = 'Jubaku Ichi', summary = 'Jubaku Ichi: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[193], level_ranges = { { 30, 64 } } };
danger[195] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[196] = { notes = danger[195], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[5] };
danger[197] = { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[196], level_ranges = { { 48, 255 } } };
danger[198] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[199] = { notes = danger[198], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[200] = { kind = 'spell', id = 348, name = 'Kurayami Ni', summary = 'Kurayami Ni: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[199], level_ranges = { { 44, 72 } } };
danger[201] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[202] = { notes = danger[201], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[203] = { 'Possible effects: Poison.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[204] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = danger[203], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[43], level_ranges = { { 24, 71 } } };
danger[205] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[206] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = danger[205], categories = { 'debuff' }, effects = { 'Burn' }, details = danger[48], level_ranges = { { 24, 255 } } };
danger[207] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = danger[205], categories = { 'debuff' }, effects = { 'Frost' }, details = danger[53], level_ranges = { { 22, 255 } } };
danger[208] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = danger[205], categories = { 'debuff' }, effects = { 'Choke' }, details = danger[58], level_ranges = { { 20, 255 } } };
danger[209] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = danger[205], categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[63], level_ranges = { { 18, 255 } } };
danger[210] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = danger[205], categories = { 'debuff' }, effects = { 'Shock' }, details = danger[68], level_ranges = { { 16, 255 } } };
danger[211] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = danger[205], categories = { 'debuff' }, effects = { 'Drown' }, details = danger[73], level_ranges = { { 27, 255 } } };
danger[212] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[205], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[76], level_ranges = { { 12, 255 } } };
danger[213] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[205], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[76], level_ranges = { { 25, 255 } } };
danger[214] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[215] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[205], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[80], level_ranges = { { 4, 255 } } };
danger[216] = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[217] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[216], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[85], level_ranges = { { 7, 255 } } };
danger[218] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = danger[214], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[88], level_ranges = { { 31, 55 } } };
danger[219] = { 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' };
danger[220] = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[221] = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down', notes = danger[220], entries = danger[173], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] };
danger[222] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 7 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[223] = { notes = danger[222], unknown = {  }, activation_range = 7.0, shape = 'front cone', cone_length = 7.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[10] };
danger[224] = { kind = 'skill', id = 771, name = 'Hydro Ball', summary = 'Hydro Ball: STR down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[223] };
danger[225] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[226] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[227] = { notes = danger[226], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[26] };
danger[228] = { kind = 'skill', id = 780, name = 'Spinning Fin', summary = 'Spinning Fin: Stun', notes = danger[225], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[227] };
danger[229] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[230] = { notes = danger[229], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[5] };
danger[231] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[230], level_ranges = { { 13, 255 } } };
danger[232] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[233] = { notes = danger[232], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[234] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[233], level_ranges = { { 4, 255 } } };
danger[235] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[236] = { notes = danger[235], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[237] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[236], level_ranges = { { 15, 255 } } };
danger[238] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[239] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[240] = { notes = danger[238], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[239] };
danger[241] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[240], level_ranges = { { 45, 255 } } };
danger[242] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[95], level_ranges = { { 46, 255 } } };
danger[243] = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[244] = { value = 'Bomb Toss: fire damage', notes = danger[243], entries = danger[33], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] };
danger[245] = { kind = 'spell', id = 350, name = 'Dokumori Ichi', summary = 'Dokumori Ichi: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[202], level_ranges = { { 27, 55 } } };
danger[246] = { danger[157], danger[162], danger[167], danger[172], danger[186], danger[187], danger[188], danger[189], danger[190], danger[191], danger[194], danger[197], danger[200], danger[245] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'White Lizard' } },
        [2] = {
            sight = { 'Goblin Bouncer', 'Goblin Digger', 'Goblin Hunter', 'Goblin Pathfinder', 'Goblin Poacher',
                      'Goblin Reaper', 'Goblin Robber', 'Goblin Shaman', 'Goblin Smithy', 'Goblin Trader' },
        },
        [3] = { sight = { 'Yhoator Wasp' } },
        [4] = { sound = { 'Worker Crawler' } },
        [5] = { sight = { 'Edacious Opo-opo', 'Young Opo-opo' } },
        [6] = {
            sight = { 'Bisque-heeled Sunberry', 'Bright-handed Kunberry', 'Tonberry Chopper', 'Tonberry Creeper',
                      'Tonberry Harasser', 'Tonberry Hexer', 'Tonberry Jinxer', 'Tonberry Shadower' },
        },
        [7] = {
            sight = { 'Bright-handed Kunberry', 'Tonberry Chopper', 'Tonberry Creeper', 'Tonberry Harasser',
                      'Tonberry Hexer', 'Tonberry Jinxer', 'Tonberry Shadower' },
        },
        [8] = {
            sight = { 'Bisque-heeled Sunberry', 'Tonberry Chopper', 'Tonberry Creeper', 'Tonberry Harasser',
                      'Tonberry Hexer', 'Tonberry Jinxer', 'Tonberry Shadower' },
        },
        [9] = {
            sight = { 'Goblin Bouncer', 'Goblin Hunter', 'Goblin Pathfinder', 'Goblin Poacher', 'Goblin Reaper',
                      'Goblin Robber', 'Goblin Shaman', 'Goblin Smithy', 'Goblin Trader' },
        },
        [10] = { sound = { 'Kappa Biwa', 'Kappa Bonze' } },
        [11] = { sound = { 'Kappa Biwa' }, true_sound = { 'Kappa Akuso' } },
        [12] = { sound = { 'Kappa Bonze' }, true_sound = { 'Kappa Akuso' } },
        [13] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin White Mage' },
        },
        [14] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior' },
        },
        [15] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [16] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [17] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [18] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [19] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [20] = {
            sight = { 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [21] = {
            sight = { 'Noctonberry Ninja', 'Noctonberry Summoner', 'Noctonberry Thief', 'Tonberry Creeper',
                      'Tonberry Decimator', 'Tonberry Hexer' },
        },
        [22] = {
            sight = { 'Noctonberry Black Mage', 'Noctonberry Ninja', 'Noctonberry Summoner', 'Tonberry Creeper',
                      'Tonberry Decimator', 'Tonberry Hexer' },
        },
        [23] = {
            sight = { 'Noctonberry Black Mage', 'Noctonberry Summoner', 'Noctonberry Thief', 'Tonberry Creeper',
                      'Tonberry Decimator', 'Tonberry Hexer' },
        },
        [24] = {
            sight = { 'Noctonberry Black Mage', 'Noctonberry Ninja', 'Noctonberry Thief', 'Tonberry Creeper',
                      'Tonberry Decimator', 'Tonberry Hexer' },
        },
        [25] = {
            sight = { 'Noctonberry Black Mage', 'Noctonberry Ninja', 'Noctonberry Summoner', 'Noctonberry Thief',
                      'Tonberry Creeper', 'Tonberry Decimator', 'Tonberry Hexer' },
        },
        [26] = {
            sight = { 'Noctonberry Black Mage', 'Noctonberry Ninja', 'Noctonberry Summoner', 'Noctonberry Thief',
                      'Tonberry Creeper', 'Tonberry Hexer' },
        },
        [27] = { sight = { 'Young Opo-opo' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Bisque-heeled Sunberry'] = { id = 71, name = 'Tonberry' },
        ['Bright-handed Kunberry'] = { id = 71, name = 'Tonberry' },
        ['Edacious Opo-opo'] = { id = 48, name = 'Opo Opo' },
        ['Goblin Bouncer'] = { id = 58, name = 'Goblin' },
        ['Goblin Digger'] = { id = 58, name = 'Goblin' },
        ['Goblin Hunter'] = { id = 58, name = 'Goblin' },
        ['Goblin Pathfinder'] = { id = 58, name = 'Goblin' },
        ['Goblin Poacher'] = { id = 58, name = 'Goblin' },
        ['Goblin Reaper'] = { id = 58, name = 'Goblin' },
        ['Goblin Robber'] = { id = 58, name = 'Goblin' },
        ['Goblin Shaman'] = { id = 58, name = 'Goblin' },
        ['Goblin Smithy'] = { id = 58, name = 'Goblin' },
        ['Goblin Trader'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Beastmaster'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Black Mage'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Dark Knight'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Ranger'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Red Mage'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Thief'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Warrior'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin White Mage'] = { id = 58, name = 'Goblin' },
        ['Kappa Akuso'] = { id = 68, name = 'Sahagin' },
        ['Kappa Biwa'] = { id = 68, name = 'Sahagin' },
        ['Kappa Bonze'] = { id = 68, name = 'Sahagin' },
        ['Noctonberry Black Mage'] = { id = 71, name = 'Tonberry' },
        ['Noctonberry Ninja'] = { id = 71, name = 'Tonberry' },
        ['Noctonberry Summoner'] = { id = 71, name = 'Tonberry' },
        ['Noctonberry Thief'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Chopper'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Creeper'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Decimator'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Harasser'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Hexer'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Jinxer'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Shadower'] = { id = 71, name = 'Tonberry' },
        ['White Lizard'] = { id = 126, name = 'Lizard' },
        ['Worker Crawler'] = { id = 186, name = 'Crawler' },
        ['Yhoator Wasp'] = { id = 181, name = 'Bee' },
        ['Young Opo-opo'] = { id = 48, name = 'Opo Opo' },
    },
    monsters = {
        {
            name   = 'Greater Pugil',
            ids    = { 1 },
            levels = {
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24, dex = 31, def = 118,
                         attack_skill = 89 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 27, dex = 33, def = 122,
                         attack_skill = 92 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 27, dex = 33, def = 124,
                         attack_skill = 94 },
                [33] = { acc = 119, eva = 112, agi = 36, int = 26, mnd = 26, chr = 27, dex = 34, def = 128,
                         attack_skill = 97 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 773, [31] = 872, [32] = 954, [33] = 1032 }, mp = { [30] = 0, [31] = 0, [32] = 0, [33] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Clipper',
            ids    = { 2 },
            job    = 'pld/pld',
            levels = {
                [30] = { acc = 106, eva = 95, agi = 19, int = 21, mnd = 31, chr = 31, dex = 26, def = 135,
                         attack_skill = 89 },
                [31] = { acc = 110, eva = 100, agi = 22, int = 23, mnd = 33, chr = 33, dex = 28, def = 140,
                         attack_skill = 92 },
                [32] = { acc = 113, eva = 102, agi = 22, int = 23, mnd = 33, chr = 33, dex = 28, def = 142,
                         attack_skill = 94 },
                [33] = { acc = 116, eva = 105, agi = 22, int = 24, mnd = 34, chr = 34, dex = 29, def = 145,
                         attack_skill = 97 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 150, item = 881 },  -- crab shell
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 4400 },  -- slice of land crab meat
            },
            steal  = { 936 },  -- chunk of rock salt
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 740, [31] = 835, [32] = 916, [33] = 993 }, mp = { [30] = 797, [31] = 826, [32] = 855, [33] = 884 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Bubble Shower: STR down; Big Scissors: can crit', notes = { 'Bubble Shower: STR down. Source targeting: area around the monster.', 'Big Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 442, name = 'Bubble Shower', summary = 'Bubble Shower: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[10] } }, { kind = 'skill', id = 444, name = 'Big Scissors', summary = 'Big Scissors: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[21] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vepar',
            ids    = { 3, 4 },
            levels = {
                [36] = { acc = 130, eva = 123, agi = 41, int = 28, mnd = 28, chr = 30, dex = 38, def = 138,
                         attack_skill = 106 },
                [37] = { acc = 133, eva = 125, agi = 41, int = 29, mnd = 29, chr = 30, dex = 38, def = 140,
                         attack_skill = 109 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [36] = 1275, [37] = 1353 }, mp = { [36] = 0, [37] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Makara',
            ids    = { 5 },
            levels = {
                [43] = { acc = 154, eva = 145, agi = 47, int = 33, mnd = 33, chr = 36, dex = 44, def = 160,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 150, agi = 50, int = 34, mnd = 34, chr = 36, dex = 47, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 38, dex = 47, def = 167,
                         attack_skill = 132 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [43] = 1885, [44] = 1968, [45] = 2046 }, mp = { [43] = 0, [44] = 0, [45] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Yhoator Mandragora',
            ids    = { 6, 7, 9, 11, 12, 13, 15, 16, 20, 21, 24, 25, 28, 31, 33, 38, 59 },
            job    = 'mnk/mnk',
            levels = {
                [35] = { acc = 129, eva = 116, agi = 27, int = 24, mnd = 32, chr = 30, dex = 42, def = 129,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 120, agi = 28, int = 27, mnd = 34, chr = 32, dex = 43, def = 133,
                         attack_skill = 106 },
                [37] = { acc = 136, eva = 123, agi = 29, int = 27, mnd = 34, chr = 32, dex = 45, def = 136,
                         attack_skill = 109 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 100, item = 4368 },  -- two-leaf mandragora bud
                { rate = 10, item = 17868 },  -- jug of humus
            },
            info = {
                family = { value = 'Mandragora / Plantoid', notes = { 'Source species: Mandragora (ID 350); family ID 146.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1297, [36] = 1381, [37] = 1460 }, mp = { [35] = 0, [36] = 0, [37] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Dream Flower: sleep; Wild Oats: VIT down; Leaf Dagger: Poison; Scream: mind down', notes = { 'Dream Flower: sleep. Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep. Random effects may not all happen on the same use.', 'Wild Oats: VIT down. Source targeting: single target.', 'Leaf Dagger: Poison. Random effects may not all happen on the same use. Source targeting: single target.', 'Scream: mind down. Attempts Mind Down on its targets. Source targeting: area around the monster. Possible effects: MND down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 301, name = 'Dream Flower', summary = 'Dream Flower: sleep', notes = { 'Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep. Random effects may not all happen on the same use.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 302, name = 'Wild Oats', summary = 'Wild Oats: VIT down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'VIT down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[23] } }, { kind = 'skill', id = 305, name = 'Leaf Dagger', summary = 'Leaf Dagger: Poison', notes = { 'Random effects may not all happen on the same use. Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 306, name = 'Scream', summary = 'Scream: mind down', notes = { 'Attempts Mind Down on its targets. Source targeting: area around the monster. Possible effects: MND down.' }, categories = { 'debuff' }, effects = { 'MND down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[25] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Wild Oats', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 603, name = 'Wild Oats', level = 4, min_skill = 0, skill_ids = { 302 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'White Lizard',
            ids    = { 8, 10, 18, 19, 27, 39, 40, 63, 64, 66, 74, 75 },
            levels = {
                [36] = { acc = 131, eva = 122, agi = 38, int = 28, mnd = 28, chr = 32, dex = 41, def = 137,
                         attack_skill = 106 },
                [37] = { acc = 134, eva = 124, agi = 38, int = 29, mnd = 29, chr = 32, dex = 41, def = 139,
                         attack_skill = 109 },
                [38] = { acc = 137, eva = 127, agi = 38, int = 29, mnd = 29, chr = 33, dex = 41, def = 142,
                         attack_skill = 112 },
                [39] = { acc = 141, eva = 131, agi = 40, int = 31, mnd = 31, chr = 35, dex = 43, def = 146,
                         attack_skill = 115 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 10, item = 852 },  -- lizard skin
                { rate = 10, item = 852 },  -- lizard skin
            },
            links  = 1,
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Ash Lizard (ID 306); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [36] = 1275, [37] = 1353, [38] = 1436, [39] = 1514 }, mp = { [36] = 0, [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Tail Blow: Stun; Brain Crush: Silence; Baleful Gaze: petrification gaze; Plague Breath: Poison; Infrasonics: Evasion down', notes = { 'Tail Blow: Stun. Source targeting: single target.', 'Brain Crush: Silence. Source targeting: single target.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'Plague Breath: Poison. Random effects may not all happen on the same use. Source targeting: cone.', 'Infrasonics: Evasion down. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 366, name = 'Tail Blow', summary = 'Tail Blow: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[26] } }, { kind = 'skill', id = 369, name = 'Brain Crush', summary = 'Brain Crush: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, { kind = 'skill', id = 370, name = 'Baleful Gaze Lizard', summary = 'Baleful Gaze: petrification gaze', notes = { 'Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 371, name = 'Plague Breath', summary = 'Plague Breath: Poison', notes = danger[27], categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 372, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 14, 17, 26, 29, 30, 32 },
            levels = {
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, dex = 41, def = 133,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, dex = 42, def = 137,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 125, agi = 41, int = 29, mnd = 29, chr = 32, dex = 43, def = 139,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 128, agi = 41, int = 29, mnd = 29, chr = 33, dex = 43, def = 142,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 132, agi = 43, int = 31, mnd = 31, chr = 35, dex = 45, def = 146,
                         attack_skill = 115 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Armored Goblin (ID 124); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1193, [36] = 1275, [37] = 1353, [38] = 1436, [39] = 1514 }, mp = { [35] = 0, [36] = 0, [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 22, 36, 122 },
            job    = 'bst/bst',
            levels = {
                [35] = { acc = 128, eva = 115, agi = 30, int = 30, mnd = 30, chr = 43, dex = 41, def = 123,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 118, agi = 31, int = 32, mnd = 32, chr = 44, dex = 42, def = 127,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 121, agi = 32, int = 32, mnd = 32, chr = 46, dex = 43, def = 129,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 124, agi = 32, int = 33, mnd = 33, chr = 46, dex = 43, def = 132,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 128, agi = 34, int = 35, mnd = 35, chr = 49, dex = 45, def = 136,
                         attack_skill = 115 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            drops  = {
                { rate = 50, item = 1708 },  -- handful of counterfeit gil
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1151, [36] = 1232, [37] = 1309, [38] = 1390, [39] = 1467 }, mp = { [35] = 0, [36] = 0, [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblins Bee jungle',
            ids    = { 23, 37, 90, 92, 96, 98, 123 },
            levels = {
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25, dex = 29, def = 111,
                         attack_skill = 83 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25, dex = 30, def = 114,
                         attack_skill = 86 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, dex = 31, def = 118,
                         attack_skill = 89 },
                [38] = { acc = 136, eva = 128, agi = 41, int = 29, mnd = 29, chr = 33, dex = 38, def = 143,
                         attack_skill = 112 },
                [39] = { acc = 140, eva = 132, agi = 43, int = 31, mnd = 31, chr = 35, dex = 40, def = 147,
                         attack_skill = 115 },
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35, dex = 40, def = 150,
                         attack_skill = 118 },
            },
            spawn_levels = { [23] = { 28, 30 }, [37] = { 28, 29 }, [90] = { 38, 39 }, [92] = { 38, 40 },
                             [96] = { 38, 40 }, [98] = { 38, 40 }, [123] = { 28, 30 } },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            links  = 3,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [28] = 209, [29] = 220, [30] = 231, [38] = 430, [39] = 454, [40] = 492 }, mp = { [28] = 0, [29] = 0, [30] = 0, [38] = 0, [39] = 0, [40] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[41],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Yhoator Wasp',
            ids    = { 34, 35, 41, 43, 46, 49, 50, 52, 53, 54, 55, 56, 57, 60, 61, 104, 105, 108, 111, 112, 113,
                       114, 115, 118, 119, 121, 124, 125, 126, 130, 131, 137, 138, 176, 177, 193, 194 },
            levels = {
                [37] = { acc = 133, eva = 125, agi = 41, int = 29, mnd = 29, chr = 32, dex = 38, def = 140,
                         attack_skill = 109 },
                [38] = { acc = 136, eva = 128, agi = 41, int = 29, mnd = 29, chr = 33, dex = 38, def = 143,
                         attack_skill = 112 },
                [39] = { acc = 140, eva = 132, agi = 43, int = 31, mnd = 31, chr = 35, dex = 40, def = 147,
                         attack_skill = 115 },
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35, dex = 40, def = 150,
                         attack_skill = 118 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            steal  = { 4370 },  -- pot of honey
            links  = 3,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [37] = 1353, [38] = 1436, [39] = 1514, [40] = 1641 }, mp = { [37] = 0, [38] = 0, [39] = 0, [40] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[41],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 42, 44, 45, 47, 48, 51, 62, 65, 67, 76 },
            job    = 'blm/blm',
            levels = {
                [35] = { acc = 128, eva = 108, agi = 39, int = 43, mnd = 30, chr = 32, dex = 41, def = 121,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 111, agi = 41, int = 44, mnd = 32, chr = 34, dex = 42, def = 124,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 114, agi = 41, int = 46, mnd = 32, chr = 34, dex = 43, def = 126,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 116, agi = 41, int = 46, mnd = 33, chr = 34, dex = 43, def = 130,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 120, agi = 43, int = 49, mnd = 35, chr = 37, dex = 45, def = 133,
                         attack_skill = 115 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1013, [36] = 1088, [37] = 1161, [38] = 1237, [39] = 1310 }, mp = { [35] = 943, [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[32], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[77], danger[78], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 20, 40 } } }, danger[81], danger[86], danger[89] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Anemone',
            ids    = { 58, 132, 165, 220, 227, 234, 249, 311, 396 },
            levels = {
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 39, chr = 47, dex = 62, def = 189,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47, dex = 62, def = 194,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 40, chr = 48, dex = 63, def = 200,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 40, chr = 48, dex = 64, def = 205,
                         attack_skill = 166 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 50, item = 4602 },  -- warm egg
                { rate = 10, item = 1446 },  -- lacquer tree log
            },
            steal  = { 920 },  -- malboro vine
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = { 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[92] }, { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[21] }, { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { danger[83], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[4], danger[93] } } }, { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = danger[27], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Bouncer',
            ids    = { 68, 69, 73, 77, 78, 81, 84 },
            levels = {
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, dex = 62, def = 188,
                         attack_skill = 151, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, dex = 62, def = 193,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, dex = 63, def = 198,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48, dex = 64, def = 203,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49, dex = 65, def = 209,
                         attack_skill = 171, resist = { virus = 20 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Hunter',
            ids    = { 70, 71, 72, 79, 80, 82, 83 },
            job    = 'rng/rng',
            levels = {
                [51] = { acc = 221, eva = 164, agi = 69, int = 47, mnd = 50, chr = 47, dex = 56, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 226, eva = 169, agi = 69, int = 47, mnd = 50, chr = 47, dex = 56, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 232, eva = 174, agi = 70, int = 48, mnd = 52, chr = 48, dex = 58, def = 188,
                         attack_skill = 161 },
                [54] = { acc = 237, eva = 179, agi = 71, int = 48, mnd = 52, chr = 48, dex = 58, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 242, eva = 184, agi = 73, int = 49, mnd = 52, chr = 49, dex = 59, def = 199,
                         attack_skill = 171 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            steal  = { 17336 },  -- crossbow bolt
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2346, [52] = 2423, [53] = 2501, [54] = 2579, [55] = 2657 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Worker Crawler',
            ids    = { 85, 86, 87, 142, 143, 146, 147, 149, 150, 152, 153, 155, 156, 158, 159, 161, 162, 164, 166,
                       167, 168, 169, 170, 174, 175, 179, 180, 183, 184, 185, 186, 187, 191, 192, 196, 199, 200,
                       202, 203, 204, 206, 207, 208, 215, 216, 217, 222, 223, 224, 228, 229, 230, 347, 348, 349,
                       366, 368, 370, 371, 372, 377, 384, 387, 392, 394, 410, 411, 412, 413 },
            levels = {
                [43] = { acc = 154, eva = 143, agi = 42, int = 33, mnd = 33, chr = 38, dex = 44, def = 148,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 147, agi = 44, int = 34, mnd = 34, chr = 39, dex = 47, def = 152,
                         attack_skill = 129 },
                [45] = { acc = 161, eva = 150, agi = 45, int = 36, mnd = 36, chr = 40, dex = 47, def = 155,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 154, agi = 46, int = 36, mnd = 36, chr = 40, dex = 48, def = 157,
                         attack_skill = 135 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
                { rate = 10, item = 4357 },  -- crawler egg
            },
            links  = 4,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Crawler (ID 437); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [43] = 1885, [44] = 1968, [45] = 2046, [46] = 2129 }, mp = { [43] = 0, [44] = 0, [45] = 0, [46] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sticky Thread: Slow; Poison Breath: poison', notes = { 'Sticky Thread: Slow. Source targeting: cone.', 'Poison Breath: poison. Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 344, name = 'Sticky Thread', summary = 'Sticky Thread: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = danger[5] } }, { kind = 'skill', id = 345, name = 'Poison Breath Crawler', summary = 'Poison Breath: poison', notes = { 'Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Robber',
            ids    = { 88, 94, 211, 214, 219, 232, 233, 352, 358, 364 },
            job    = 'thf/thf',
            levels = {
                [45] = { acc = 168, eva = 186, agi = 53, int = 47, mnd = 32, chr = 32, dex = 60, def = 156,
                         attack_skill = 132 },
                [46] = { acc = 171, eva = 191, agi = 56, int = 48, mnd = 34, chr = 34, dex = 61, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 175, eva = 194, agi = 56, int = 49, mnd = 35, chr = 35, dex = 62, def = 162,
                         attack_skill = 138 },
                [48] = { acc = 178, eva = 198, agi = 58, int = 50, mnd = 35, chr = 35, dex = 63, def = 165,
                         attack_skill = 141 },
                [49] = { acc = 182, eva = 201, agi = 59, int = 52, mnd = 35, chr = 35, dex = 64, def = 168,
                         attack_skill = 144 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1904, [46] = 1982, [47] = 2061, [48] = 2140, [49] = 2215 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Trader',
            ids    = { 89, 91, 95, 97 },
            job    = 'bst/bst',
            levels = {
                [45] = { acc = 164, eva = 147, agi = 39, int = 40, mnd = 40, chr = 55, dex = 52, def = 156,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 151, agi = 40, int = 40, mnd = 40, chr = 55, dex = 54, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 153, agi = 40, int = 41, mnd = 41, chr = 57, dex = 54, def = 162,
                         attack_skill = 138 },
                [48] = { acc = 175, eva = 156, agi = 40, int = 42, mnd = 42, chr = 57, dex = 56, def = 165,
                         attack_skill = 141 },
                [49] = { acc = 179, eva = 160, agi = 42, int = 42, mnd = 42, chr = 58, dex = 58, def = 168,
                         attack_skill = 144 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 1, item = 828 },  -- square of velvet cloth
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1986, [46] = 2068, [47] = 2149, [48] = 2231, [49] = 2308 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Master Coeurl',
            ids    = { 93, 99, 148, 151, 154, 157, 160, 163, 218, 225, 231, 351, 354, 355, 359, 360, 365 },
            levels = {
                [47] = { acc = 170, eva = 157, agi = 49, int = 40, mnd = 34, chr = 41, dex = 52, def = 172,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 40, mnd = 35, chr = 42, dex = 53, def = 175,
                         attack_skill = 141 },
                [49] = { acc = 178, eva = 165, agi = 52, int = 42, mnd = 36, chr = 42, dex = 56, def = 178,
                         attack_skill = 144 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 44, mnd = 38, chr = 45, dex = 57, def = 183,
                         attack_skill = 147 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 863 },  -- coeurl hide
                { rate = 50, item = 927 },  -- coeurl whisker
            },
            steal  = { 927 },  -- coeurl whisker
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Coeurl / Beast', notes = { 'Source species: Coeurl (ID 92); family ID 43.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 2212, [48] = 2295, [49] = 2373, [50] = 2521 }, mp = { [47] = 0, [48] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Blaster: paralysis; Chaotic Eye: silence gaze', notes = { 'Blaster: paralysis. Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.', 'Chaotic Eye: silence gaze. Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 652, name = 'Blaster', summary = 'Blaster: paralysis', notes = { 'Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 653, name = 'Chaotic Eye', summary = 'Chaotic Eye: silence gaze', notes = { 'Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Chaotic Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 582, name = 'Chaotic Eye', level = 32, min_skill = 68, skill_ids = { 653 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Woodland Sage',
            ids    = { 100 },
            nm     = true,
            job    = 'whm/war',
            levels = {
                [60] = { acc = 229, eva = 218, agi = 56, int = 51, mnd = 65, chr = 57, dex = 52, def = 285,
                         attack_skill = 196 },
                [61] = { acc = 234, eva = 223, agi = 59, int = 53, mnd = 67, chr = 59, dex = 55, def = 292,
                         attack_skill = 199 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 100, item = 17529 },  -- sunlight pole
                { rate = 240, group = {  -- one of
                    { 701, 4000 },  -- rosewood log
                    { 702, 3000 },  -- ebony log
                    { 700, 3000 },  -- mahogany log
                } },
                { rate = 240, group = {  -- one of
                    { 701, 4000 },  -- rosewood log
                    { 702, 3000 },  -- ebony log
                    { 700, 3000 },  -- mahogany log
                } },
                { rate = 150, group = {  -- one of
                    { 701, 4000 },  -- rosewood log
                    { 700, 3000 },  -- mahogany log
                    { 703, 3000 },  -- petrified log
                } },
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Treant / Plantoid', notes = { 'Source species: Treant (ID 366); family ID 152.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [60] = 7000, [61] = 7000 }, mp = { [60] = 1705, [61] = 1737 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 65; Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Drill Branch: Blindness; Pinecone Bomb: Sleep; Entangle: Bind', notes = { 'Drill Branch: Blindness. Source targeting: cone.', 'Pinecone Bomb: Sleep. Source targeting: area around the target.', 'Entangle: Bind. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 328, name = 'Drill Branch', summary = 'Drill Branch: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 329, name = 'Pinecone Bomb', summary = 'Pinecone Bomb: Sleep', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 332, name = 'Entangle', summary = 'Entangle: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[92] } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Pinecone Bomb', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 596, name = 'Pinecone Bomb', level = 36, min_skill = 80, skill_ids = { 329 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Big Jaw',
            ids    = { 101, 102, 326, 329, 330, 332, 362, 363 },
            levels = {
                [43] = { acc = 154, eva = 145, agi = 47, int = 33, mnd = 33, chr = 36, dex = 44, def = 160,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 150, agi = 50, int = 34, mnd = 34, chr = 36, dex = 47, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 38, dex = 47, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 38, dex = 48, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 38, dex = 49, def = 173,
                         attack_skill = 138 },
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
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [43] = 1885, [44] = 1968, [45] = 2046, [46] = 2129, [47] = 2212 }, mp = { [43] = 0, [44] = 0, [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 103, 328, 331 },
            job    = 'blm/rdm',
            levels = {
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52, dex = 55, def = 186,
                         attack_skill = 161 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52, dex = 56, def = 191,
                         attack_skill = 166 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52, dex = 56, def = 196,
                         attack_skill = 171 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Water Elemental (ID 267); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [53] = 2473, [54] = 2550, [55] = 2628 }, mp = { [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Water weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Poison II: Poison; Poisonga: area poison', notes = { 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[95], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[43], level_ranges = { { 24, 59 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[90] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 106, 109, 116, 127, 139, 195, 241, 242, 243, 381, 382, 383 },
            job    = 'drk/drk',
            levels = {
                [41] = { acc = 150, eva = 138, agi = 43, int = 44, mnd = 31, chr = 31, dex = 49, def = 146,
                         attack_skill = 121 },
                [42] = { acc = 153, eva = 140, agi = 43, int = 44, mnd = 31, chr = 31, dex = 49, def = 148,
                         attack_skill = 123 },
                [43] = { acc = 156, eva = 143, agi = 43, int = 44, mnd = 31, chr = 31, dex = 49, def = 151,
                         attack_skill = 126 },
                [44] = { acc = 161, eva = 148, agi = 46, int = 47, mnd = 32, chr = 32, dex = 52, def = 155,
                         attack_skill = 129 },
                [45] = { acc = 164, eva = 151, agi = 46, int = 47, mnd = 32, chr = 32, dex = 52, def = 158,
                         attack_skill = 132 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Armored Goblin (ID 124); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [41] = 1665, [42] = 1746, [43] = 1828, [44] = 1909, [45] = 1986 }, mp = { [41] = 1122, [42] = 1152, [43] = 1182, [44] = 1212, [45] = 1243 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Poison: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[32], { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[95], level_ranges = { { 6, 45 } } }, danger[96], danger[97], danger[98], danger[101], danger[102], danger[103], danger[106], danger[111], danger[114], danger[119], danger[124], danger[127], danger[132], danger[133] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Young Opo-opo',
            ids    = { 107, 110, 117, 120, 129, 133, 134, 135, 136, 140, 141, 144, 145, 171, 172, 181, 188, 197,
                       201, 205, 209, 210, 212, 213, 235, 236, 237, 239, 244, 246, 247, 250, 251, 252, 254, 255,
                       256, 258, 259, 260, 262, 263, 264, 266, 267, 271, 286, 287, 288, 291, 293, 295, 298, 299,
                       302, 304, 305, 309, 312, 313, 316, 317, 320, 322, 324, 397, 398, 401, 402 },
            levels = {
                [40] = { acc = 145, eva = 136, agi = 45, int = 26, mnd = 26, chr = 40, dex = 45, def = 149,
                         attack_skill = 118 },
                [41] = { acc = 150, eva = 141, agi = 49, int = 28, mnd = 28, chr = 42, dex = 49, def = 154,
                         attack_skill = 121 },
                [42] = { acc = 153, eva = 143, agi = 49, int = 28, mnd = 28, chr = 42, dex = 49, def = 156,
                         attack_skill = 123 },
                [43] = { acc = 156, eva = 146, agi = 49, int = 28, mnd = 28, chr = 43, dex = 49, def = 159,
                         attack_skill = 126 },
                [44] = { acc = 161, eva = 151, agi = 52, int = 28, mnd = 28, chr = 44, dex = 52, def = 163,
                         attack_skill = 129 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 17296 },  -- pebble
                { rate = 100, item = 4468 },  -- bunch of pamamas
                { rate = 50, item = 5187 },  -- elshimo coconut
                { rate = 10, item = 4597 },  -- wild melon
            },
            steal  = { 4468 },  -- bunch of pamamas
            links  = 5,
            info = {
                family = { value = 'Opo Opo / Beast', notes = { 'Source species: Opo Opo (ID 100); family ID 48.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [40] = 1641, [41] = 1719, [42] = 1802, [43] = 1885, [44] = 1968 }, mp = { [40] = 0, [41] = 0, [42] = 0, [43] = 0, [44] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[153],
                blue = { value = 'Blank Gaze, Magic Fruit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 592, name = 'Blank Gaze', level = 38, min_skill = 86, skill_ids = { 292 } }, { id = 593, name = 'Magic Fruit', level = 58, min_skill = 162, skill_ids = { 295 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Poacher',
            ids    = { 173, 178, 182, 189, 190, 198, 226, 350, 353, 357 },
            job    = 'rng/rng',
            levels = {
                [45] = { acc = 184, eva = 143, agi = 58, int = 40, mnd = 43, chr = 40, dex = 48, def = 156,
                         attack_skill = 132 },
                [46] = { acc = 187, eva = 145, agi = 59, int = 40, mnd = 42, chr = 40, dex = 48, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 191, eva = 149, agi = 60, int = 41, mnd = 45, chr = 41, dex = 50, def = 162,
                         attack_skill = 138 },
                [48] = { acc = 194, eva = 151, agi = 60, int = 42, mnd = 45, chr = 42, dex = 51, def = 165,
                         attack_skill = 141 },
                [49] = { acc = 197, eva = 155, agi = 62, int = 42, mnd = 45, chr = 42, dex = 51, def = 168,
                         attack_skill = 144 },
            },
            spawn_levels = { [182] = { 48, 48 }, [189] = { 45, 45 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            steal  = { 17336 },  -- crossbow bolt
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1843, [46] = 1920, [47] = 1997, [48] = 2074, [49] = 2148 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Creeper',
            ids    = { 238, 245, 248, 257, 261, 265, 269, 272, 284, 290, 292, 303, 306, 310, 315, 323, 325, 333,
                       335, 337, 339, 342, 343, 345, 346, 374, 378, 386, 388, 393, 395, 403 },
            job    = 'thf/thf',
            levels = {
                [45] = { acc = 167, eva = 187, agi = 55, int = 45, mnd = 30, chr = 32, dex = 58, def = 156,
                         attack_skill = 132 },
                [46] = { acc = 170, eva = 192, agi = 58, int = 46, mnd = 32, chr = 34, dex = 59, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 174, eva = 195, agi = 58, int = 46, mnd = 32, chr = 35, dex = 60, def = 162,
                         attack_skill = 138 },
                [48] = { acc = 177, eva = 199, agi = 61, int = 48, mnd = 33, chr = 35, dex = 60, def = 165,
                         attack_skill = 141 },
                [49] = { acc = 181, eva = 202, agi = 61, int = 50, mnd = 33, chr = 35, dex = 62, def = 168,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 4157 },  -- flask of poison potion
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1904, [46] = 1982, [47] = 2061, [48] = 2140, [49] = 2215 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Hexer',
            ids    = { 240, 253, 268, 285, 289, 294, 300, 301, 314, 318, 319, 321, 334, 336, 338, 341, 344, 367,
                       369, 373, 385, 389, 399, 400, 404 },
            job    = 'blm/blm',
            levels = {
                [45] = { acc = 163, eva = 140, agi = 52, int = 53, mnd = 38, chr = 43, dex = 50, def = 153,
                         attack_skill = 132 },
                [46] = { acc = 167, eva = 143, agi = 54, int = 53, mnd = 38, chr = 42, dex = 52, def = 156,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 146, agi = 54, int = 54, mnd = 38, chr = 45, dex = 52, def = 158,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 149, agi = 56, int = 55, mnd = 40, chr = 45, dex = 53, def = 161,
                         attack_skill = 141 },
                [49] = { acc = 178, eva = 153, agi = 58, int = 56, mnd = 40, chr = 45, dex = 56, def = 165,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 50, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 4157 },  -- flask of poison potion
                { rate = 50, item = 1486 },  -- rancor tank
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1781, [46] = 1856, [47] = 1932, [48] = 2008, [49] = 2081 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[180],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 270, 405 },
            job    = 'blm/rdm',
            levels = {
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52, dex = 55, def = 186,
                         attack_skill = 161 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52, dex = 56, def = 191,
                         attack_skill = 166 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52, dex = 56, def = 196,
                         attack_skill = 171 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Fire Elemental (ID 261); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [53] = 2473, [54] = 2550, [55] = 2628 }, mp = { [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fire weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[18] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberry Shadower',
            ids    = { 273, 278, 280, 282, 414, 418, 421, 422 },
            job    = 'thf/thf',
            levels = {
                [61] = { acc = 247, eva = 281, agi = 77, int = 63, mnd = 42, chr = 45, dex = 80, def = 230,
                         attack_skill = 199 },
                [62] = { acc = 252, eva = 286, agi = 77, int = 63, mnd = 42, chr = 45, dex = 80, def = 235,
                         attack_skill = 203 },
                [63] = { acc = 258, eva = 291, agi = 77, int = 63, mnd = 42, chr = 45, dex = 82, def = 240,
                         attack_skill = 207 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 748 },  -- gold beastcoin
                { rate = 50, item = 1145 },  -- tonberry board
            },
            steal  = { 1431 },  -- thiefs testimony
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3214, [62] = 3293, [63] = 3373 }, mp = { [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Jinxer',
            ids    = { 275, 281, 416, 417 },
            job    = 'blm/blm',
            levels = {
                [61] = { acc = 242, eva = 211, agi = 73, int = 73, mnd = 52, chr = 60, dex = 70, def = 225,
                         attack_skill = 199 },
                [62] = { acc = 247, eva = 216, agi = 73, int = 73, mnd = 52, chr = 60, dex = 70, def = 230,
                         attack_skill = 203 },
                [63] = { acc = 252, eva = 220, agi = 73, int = 75, mnd = 52, chr = 60, dex = 70, def = 235,
                         attack_skill = 207 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 100, item = 1429 },  -- black mages testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 1138 },  -- unlit lantern
                { rate = 50, item = 4803 },  -- scroll of thundaga ii
                { rate = 10, item = 4774 },  -- scroll of thunder iii
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3031, [62] = 3107, [63] = 3184 }, mp = { [61] = 1737, [62] = 1768, [63] = 1799 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[157], danger[162], danger[167], danger[172], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[76], level_ranges = { { 60, 255 } } }, danger[181], danger[182], danger[183], { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[76], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[76], level_ranges = { { 58, 255 } } }, danger[176], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[77], danger[78], danger[177], danger[81], danger[86], danger[178], { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[88], level_ranges = { { 56, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Chopper',
            ids    = { 276, 277, 279, 283, 415, 419, 420 },
            job    = 'nin/nin',
            levels = {
                [61] = { acc = 244, eva = 246, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 233,
                         attack_skill = 199 },
                [62] = { acc = 249, eva = 251, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 238,
                         attack_skill = 203 },
                [63] = { acc = 254, eva = 256, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 243,
                         attack_skill = 207 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            drops  = {
                { rate = 100, item = 1438 },  -- ninjas testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 1137 },  -- prelate key
                { rate = 10, item = 17303 },  -- manji shuriken
                { rate = 5, item = 4962 },  -- scroll of tonko ni
                { rate = 1, item = 4953 },  -- scroll of hojo ni
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3214, [62] = 3293, [63] = 3373 }, mp = { [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[157], danger[162], danger[167], danger[172], danger[186], danger[187], danger[188], danger[189], danger[190], danger[191], danger[194], danger[197], danger[200], { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[202], level_ranges = { { 56, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Harasser',
            ids    = { 296, 307, 375, 379, 390 },
            job    = 'smn/smn',
            levels = {
                [45] = { acc = 159, eva = 138, agi = 48, int = 48, mnd = 48, chr = 50, dex = 43, def = 153,
                         attack_skill = 132 },
                [46] = { acc = 163, eva = 140, agi = 48, int = 50, mnd = 50, chr = 52, dex = 44, def = 156,
                         attack_skill = 135 },
                [47] = { acc = 166, eva = 144, agi = 50, int = 50, mnd = 50, chr = 53, dex = 44, def = 158,
                         attack_skill = 138 },
                [48] = { acc = 169, eva = 146, agi = 51, int = 53, mnd = 53, chr = 55, dex = 45, def = 161,
                         attack_skill = 141 },
                [49] = { acc = 173, eva = 149, agi = 51, int = 53, mnd = 53, chr = 55, dex = 46, def = 165,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 4157 },  -- flask of poison potion
                { rate = 10, item = 4901 },  -- water spirit pact
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1720, [46] = 1794, [47] = 1868, [48] = 1942, [49] = 2014 }, mp = { [45] = 1263, [46] = 1293, [47] = 1323, [48] = 1354, [49] = 1385 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 297, 308, 376, 380, 391, 409 },
            job    = 'blm/rdm',
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34, dex = 37, def = 131,
                         attack_skill = 112 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37, dex = 40, def = 135,
                         attack_skill = 115 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37, dex = 40, def = 138,
                         attack_skill = 118 },
            },
            spawn_levels = { [297] = { 38, 39 }, [308] = { 38, 39 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Fire Elemental (ID 261); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [38] = 376, [39] = 398, [40] = 430 }, mp = { [38] = 1032, [39] = 1062, [40] = 1092 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Poisonga: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, entries = { danger[204], danger[206], danger[207], danger[208], danger[209], danger[210], danger[211], danger[212], danger[213], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = danger[214], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 20, 40 } } }, danger[215], danger[217], danger[218] }, coverage = 'partial', incomplete = true, reasons = danger[219], general_notes = danger[90] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Bisque-heeled Sunberry',
            ids    = { 340 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [57] = { acc = 225, eva = 259, agi = 72, int = 58, mnd = 38, chr = 41, dex = 75, def = 209,
                         attack_skill = 181 },
                [58] = { acc = 230, eva = 264, agi = 72, int = 59, mnd = 39, chr = 41, dex = 75, def = 214,
                         attack_skill = 186 },
                [59] = { acc = 237, eva = 270, agi = 75, int = 60, mnd = 39, chr = 42, dex = 78, def = 220,
                         attack_skill = 191 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 1487 },  -- rancor handle
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6000, [58] = 6000, [59] = 6000 }, mp = { [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 350-899; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[174],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Puroboros',
            ids    = { 356, 361 },
            levels = {
                [51] = { acc = 188, eva = 174, agi = 56, int = 39, mnd = 41, chr = 51, dex = 60, def = 189,
                         attack_skill = 151 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 39, mnd = 41, chr = 51, dex = 60, def = 194,
                         attack_skill = 156 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 40, mnd = 43, chr = 51, dex = 60, def = 200,
                         attack_skill = 161 },
                [54] = { acc = 204, eva = 190, agi = 58, int = 40, mnd = 43, chr = 52, dex = 62, def = 205,
                         attack_skill = 166 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fog; Respawn 5 minutes', notes = { 'Requires fog weather.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Self-Destruct: explosion', notes = { 'Self-Destruct: explosion. Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 509, name = 'Self-Destruct Bomb', summary = 'Self-Destruct: explosion', notes = { 'Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.' }, categories = { 'other' }, effects = {  }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bright-handed Kunberry',
            ids    = { 406 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [55] = { acc = 214, eva = 248, agi = 70, int = 56, mnd = 37, chr = 39, dex = 73, def = 199,
                         attack_skill = 171 },
                [56] = { acc = 220, eva = 253, agi = 70, int = 58, mnd = 38, chr = 41, dex = 74, def = 204,
                         attack_skill = 176 },
                [57] = { acc = 225, eva = 259, agi = 72, int = 58, mnd = 38, chr = 41, dex = 75, def = 209,
                         attack_skill = 181 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            magic_dmg = { all = -50 },
            weapon_guard = { physical = -50, ranged = -50 },
            drops  = {
                { rate = 240, item = 15468 },  -- resentment cape
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 5400, [56] = 5400, [57] = 5400 }, mp = { [55] = 0, [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 15', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[221],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberry Hexer',
            ids    = { 407 },
            job    = 'blm/blm',
            levels = {
                [45] = { acc = 163, eva = 140, agi = 52, int = 53, mnd = 38, chr = 43, dex = 50, def = 153,
                         attack_skill = 132 },
                [46] = { acc = 167, eva = 143, agi = 54, int = 53, mnd = 38, chr = 42, dex = 52, def = 156,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 146, agi = 54, int = 54, mnd = 38, chr = 45, dex = 52, def = 158,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 149, agi = 56, int = 55, mnd = 40, chr = 45, dex = 53, def = 161,
                         attack_skill = 141 },
                [49] = { acc = 178, eva = 153, agi = 58, int = 56, mnd = 40, chr = 45, dex = 56, def = 165,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 50, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 4157 },  -- flask of poison potion
                { rate = 50, item = 1486 },  -- rancor tank
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1781, [46] = 1856, [47] = 1932, [48] = 2008, [49] = 2081 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[180],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Harasser',
            ids    = { 408 },
            job    = 'smn/smn',
            levels = {
                [45] = { acc = 159, eva = 138, agi = 48, int = 48, mnd = 48, chr = 50, dex = 43, def = 153,
                         attack_skill = 132 },
                [46] = { acc = 163, eva = 140, agi = 48, int = 50, mnd = 50, chr = 52, dex = 44, def = 156,
                         attack_skill = 135 },
                [47] = { acc = 166, eva = 144, agi = 50, int = 50, mnd = 50, chr = 53, dex = 44, def = 158,
                         attack_skill = 138 },
                [48] = { acc = 169, eva = 146, agi = 51, int = 53, mnd = 53, chr = 55, dex = 45, def = 161,
                         attack_skill = 141 },
                [49] = { acc = 173, eva = 149, agi = 51, int = 53, mnd = 53, chr = 55, dex = 46, def = 165,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 4157 },  -- flask of poison potion
                { rate = 10, item = 4901 },  -- water spirit pact
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1720, [46] = 1794, [47] = 1868, [48] = 1942, [49] = 2014 }, mp = { [45] = 1263, [46] = 1293, [47] = 1323, [48] = 1354, [49] = 1385 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 423 },
            job    = 'thf/thf',
            levels = {
                [41] = { acc = 154, eva = 173, agi = 50, int = 44, mnd = 31, chr = 31, dex = 56, def = 144,
                         attack_skill = 121 },
                [42] = { acc = 157, eva = 176, agi = 50, int = 44, mnd = 31, chr = 31, dex = 56, def = 146,
                         attack_skill = 123 },
                [43] = { acc = 161, eva = 179, agi = 51, int = 44, mnd = 31, chr = 31, dex = 58, def = 149,
                         attack_skill = 126 },
                [44] = { acc = 164, eva = 183, agi = 53, int = 47, mnd = 32, chr = 32, dex = 59, def = 153,
                         attack_skill = 129 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            steal  = { 605, 749 },  -- pickaxe, mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [41] = 1592, [42] = 1671, [43] = 1750, [44] = 1829 }, mp = { [41] = 0, [42] = 0, [43] = 0, [44] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[34],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kappa Akuso',
            ids    = { 424 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [63] = { acc = 255, eva = 238, agi = 56, int = 45, mnd = 60, chr = 59, dex = 77, def = 251,
                         attack_skill = 207 },
            },
            ranks  = { ice = -2, wind = -1, earth = -1, thunder = -3, water = 4, paralyze = -2, bind = -2,
                       silence = -1, slow = -1, poison = 4, stun = -3, gravity = -1 },
            meva   = { water = 128 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 10,
            info = {
                family = { value = 'Sahagin / Beastmen', notes = { 'Source species: Blue Sahagin (ID 151); family ID 68.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 6220 }, mp = { [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Hydro Ball: STR down; Spinning Fin: Stun', notes = { 'Hydro Ball: STR down. Source targeting: cone.', 'Spinning Fin: Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { danger[224], danger[228] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Hydro Shot', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 631, name = 'Hydro Shot', level = 63, min_skill = 186, skill_ids = { 777 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Kappa Bonze',
            ids    = { 425 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [61] = { acc = 235, eva = 206, agi = 62, int = 55, mnd = 76, chr = 70, dex = 56, def = 232,
                         attack_skill = 199 },
            },
            ranks  = { ice = -2, wind = -1, earth = -1, thunder = -3, water = 4, paralyze = -2, bind = -2,
                       silence = -1, slow = -1, poison = 4, stun = -3, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound' },
            links  = 11,
            info = {
                family = { value = 'Sahagin / Beastmen', notes = { 'Source species: Yellow Sahagin (ID 152); family ID 68.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 5900 }, mp = { [61] = 5900 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Hydro Ball: STR down; Spinning Fin: Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Hydro Ball: STR down. Source targeting: cone.', 'Spinning Fin: Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[224], danger[228], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 60, 255 } } }, danger[231], danger[234], danger[237], danger[241] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Hydro Shot', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 631, name = 'Hydro Shot', level = 63, min_skill = 186, skill_ids = { 777 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Kappa Biwa',
            ids    = { 426 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [62] = { acc = 245, eva = 220, agi = 56, int = 60, mnd = 60, chr = 74, dex = 67, def = 237,
                         attack_skill = 203 },
            },
            ranks  = { ice = -2, wind = -1, earth = -1, thunder = -3, water = 4, paralyze = -2, bind = -2,
                       silence = -1, slow = -1, poison = 4, stun = -3, gravity = -1 },
            resist = { silence = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sound' },
            links  = 12,
            info = {
                family = { value = 'Sahagin / Beastmen', notes = { 'Source species: Yellow Sahagin (ID 152); family ID 68.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 5200 }, mp = { [62] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Hydro Ball: STR down; Spinning Fin: Stun; Foe Requiem V: Requiem; Horde Lullaby: Sleep; Carnage Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = { 'Hydro Ball: STR down. Source targeting: cone.', 'Spinning Fin: Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Foe Requiem V: Requiem.', 'Horde Lullaby: Sleep.', 'Carnage Elegy: Elegy.', 'Magic Finale: Buff removal.', 'Foe Lullaby: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[224], danger[228], { kind = 'spell', id = 372, name = 'Foe Requiem V', summary = 'Foe Requiem V: Requiem', notes = {  }, categories = { 'debuff' }, effects = { 'Requiem' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 57, 66 } } }, { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 422, name = 'Carnage Elegy', summary = 'Carnage Elegy: Elegy', notes = {  }, categories = { 'debuff' }, effects = { 'Elegy' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 59, 255 } } }, { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = {  }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[76], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 16, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Hydro Shot', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 631, name = 'Hydro Shot', level = 63, min_skill = 186, skill_ids = { 777 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Warrior',
            ids    = { 427 },
            nm     = true,
            levels = {
                [50] = { acc = 183, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45, dex = 60, def = 183,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, dex = 62, def = 188,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, dex = 62, def = 193,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, dex = 63, def = 198,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Goblin Rush: can crit during Mighty Strikes; Bomb Toss: fire damage', notes = { 'Goblin Rush: can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 590, name = 'Goblin Rush', summary = 'Goblin Rush: can crit during Mighty Strikes', notes = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' }, categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 6 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 6.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, danger[32] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin White Mage',
            ids    = { 428 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [50] = { acc = 176, eva = 150, agi = 48, int = 45, mnd = 63, chr = 54, dex = 47, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 181, eva = 155, agi = 51, int = 47, mnd = 65, chr = 56, dex = 47, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 186, eva = 160, agi = 51, int = 47, mnd = 65, chr = 56, dex = 47, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 192, eva = 164, agi = 51, int = 48, mnd = 67, chr = 57, dex = 49, def = 188,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 14,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2268, [51] = 2346, [52] = 2423, [53] = 2501 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Bomb Toss: fire damage; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[32], danger[231], danger[234], danger[237], danger[241] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Black Mage',
            ids    = { 429 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 183, eva = 154, agi = 57, int = 63, mnd = 45, chr = 50, dex = 60, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 160, agi = 60, int = 65, mnd = 47, chr = 50, dex = 62, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 165, agi = 60, int = 65, mnd = 47, chr = 50, dex = 62, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 169, agi = 60, int = 67, mnd = 48, chr = 52, dex = 63, def = 184,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 15,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Bomb Toss: fire damage; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[32], danger[181], danger[182], danger[176], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[77], danger[78], danger[177], danger[81], danger[86], danger[178], danger[89] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Red Mage',
            ids    = { 430 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [50] = { acc = 181, eva = 160, agi = 48, int = 54, mnd = 54, chr = 50, dex = 56, def = 171,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 165, agi = 51, int = 56, mnd = 56, chr = 50, dex = 56, def = 176,
                         attack_skill = 151 },
                [52] = { acc = 191, eva = 170, agi = 51, int = 56, mnd = 56, chr = 50, dex = 56, def = 181,
                         attack_skill = 156 },
                [53] = { acc = 197, eva = 175, agi = 51, int = 57, mnd = 57, chr = 52, dex = 58, def = 186,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 16,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2342, [51] = 2422, [52] = 2501, [53] = 2580 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Bomb Toss: fire damage; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[32], danger[231], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[233], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[236], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { danger[93] } }, level_ranges = { { 21, 255 } } }, danger[242], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[80], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[85], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[76], level_ranges = { { 32, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Thief',
            ids    = { 431 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [50] = { acc = 187, eva = 219, agi = 62, int = 54, mnd = 36, chr = 36, dex = 69, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 193, eva = 224, agi = 63, int = 56, mnd = 38, chr = 38, dex = 71, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 198, eva = 229, agi = 63, int = 56, mnd = 38, chr = 38, dex = 71, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 204, eva = 235, agi = 64, int = 57, mnd = 39, chr = 39, dex = 73, def = 188,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 17,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2342, [51] = 2422, [52] = 2501, [53] = 2580 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[244],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Dark Knight',
            ids    = { 432 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [50] = { acc = 183, eva = 168, agi = 53, int = 54, mnd = 36, chr = 36, dex = 60, def = 175,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 173, agi = 54, int = 56, mnd = 38, chr = 38, dex = 62, def = 181,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 178, agi = 54, int = 56, mnd = 38, chr = 38, dex = 62, def = 186,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 183, agi = 55, int = 57, mnd = 39, chr = 39, dex = 63, def = 191,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 18,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2448, [51] = 2530, [52] = 2612, [53] = 2694 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: HP drain; Bomb Toss: fire damage; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, danger[32], danger[242], danger[96], danger[97], danger[98], danger[101], danger[102], danger[103], danger[106], danger[111], danger[114], danger[119], danger[124], danger[127], danger[132], danger[133] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Ranger',
            ids    = { 433 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [50] = { acc = 216, eva = 159, agi = 66, int = 45, mnd = 50, chr = 45, dex = 56, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 221, eva = 164, agi = 69, int = 47, mnd = 50, chr = 47, dex = 56, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 226, eva = 169, agi = 69, int = 47, mnd = 50, chr = 47, dex = 56, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 232, eva = 174, agi = 70, int = 48, mnd = 52, chr = 48, dex = 58, def = 188,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 19,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2268, [51] = 2346, [52] = 2423, [53] = 2501 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[244],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Beastmaster',
            ids    = { 434 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [50] = { acc = 183, eva = 164, agi = 44, int = 45, mnd = 45, chr = 63, dex = 60, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 168, agi = 45, int = 47, mnd = 47, chr = 65, dex = 62, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 173, agi = 45, int = 47, mnd = 47, chr = 65, dex = 62, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 179, agi = 46, int = 48, mnd = 48, chr = 67, dex = 63, def = 188,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 20,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2448, [51] = 2530, [52] = 2612, [53] = 2694 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[244],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Goblins Bee jungle',
            ids    = { 435 },
            levels = {
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42, dex = 50, def = 176,
                         attack_skill = 141 },
                [49] = { acc = 176, eva = 167, agi = 56, int = 38, mnd = 38, chr = 42, dex = 52, def = 179,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45, dex = 54, def = 185,
                         attack_skill = 147 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [48] = 688, [49] = 711, [50] = 756 }, mp = { [48] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[41],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Noctonberry Black Mage',
            ids    = { 436 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 181, eva = 156, agi = 60, int = 60, mnd = 42, chr = 50, dex = 57, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 188, eva = 161, agi = 62, int = 63, mnd = 45, chr = 50, dex = 60, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 193, eva = 166, agi = 62, int = 63, mnd = 45, chr = 50, dex = 60, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 198, eva = 170, agi = 63, int = 64, mnd = 45, chr = 52, dex = 60, def = 184,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            links  = 21,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[157], danger[162], danger[167], danger[172], danger[181], danger[182], danger[176], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[77], danger[78], danger[177], danger[81], danger[86], danger[178], danger[89] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Noctonberry Thief',
            ids    = { 437 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [50] = { acc = 186, eva = 220, agi = 65, int = 51, mnd = 33, chr = 36, dex = 66, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 192, eva = 225, agi = 65, int = 54, mnd = 36, chr = 38, dex = 69, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 197, eva = 230, agi = 65, int = 54, mnd = 36, chr = 38, dex = 69, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 203, eva = 236, agi = 67, int = 54, mnd = 36, chr = 39, dex = 70, def = 188,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 22,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2342, [51] = 2422, [52] = 2501, [53] = 2580 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[221],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Noctonberry Ninja',
            ids    = { 438 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [50] = { acc = 184, eva = 185, agi = 65, int = 47, mnd = 33, chr = 41, dex = 62, def = 175,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 190, agi = 65, int = 48, mnd = 36, chr = 41, dex = 63, def = 181,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 195, agi = 65, int = 48, mnd = 36, chr = 41, dex = 63, def = 186,
                         attack_skill = 156 },
                [53] = { acc = 200, eva = 201, agi = 67, int = 49, mnd = 36, chr = 43, dex = 64, def = 191,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 23,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2342, [51] = 2422, [52] = 2501, [53] = 2580 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ichi: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ichi: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = danger[246], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Noctonberry Summoner',
            ids    = { 439 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [50] = { acc = 177, eva = 154, agi = 56, int = 56, mnd = 56, chr = 59, dex = 48, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 183, eva = 158, agi = 56, int = 57, mnd = 57, chr = 59, dex = 51, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 188, eva = 163, agi = 56, int = 57, mnd = 57, chr = 59, dex = 51, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 193, eva = 168, agi = 58, int = 58, mnd = 58, chr = 61, dex = 51, def = 184,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 24,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2118, [51] = 2193, [52] = 2267, [53] = 2342 }, mp = { [50] = 1435, [51] = 1466, [52] = 1497, [53] = 1528 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[221],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 440 },
            job    = 'blm/rdm',
            levels = {
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45, dex = 48, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45, dex = 49, def = 166,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Fire Elemental (ID 261); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [48] = 612, [49] = 634, [50] = 672 }, mp = { [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Freeze: Fire magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, entries = { { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = danger[205], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[76], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[205], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[95], level_ranges = { { 43, 64 } } }, danger[204], danger[206], danger[207], danger[208], danger[209], danger[210], danger[211], danger[212], danger[213], { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[100], level_ranges = { { 45, 255 } } }, danger[215], danger[217], { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[214], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[76], level_ranges = { { 41, 255 } } }, danger[218] }, coverage = 'partial', incomplete = true, reasons = danger[219], general_notes = danger[90] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberrys Avatar',
            ids    = { 441 },
            job    = 'blm/blm',
            levels = {
                [48] = { acc = 172, eva = 146, agi = 50, int = 57, mnd = 42, chr = 45, dex = 50, def = 156,
                         attack_skill = 141 },
                [49] = { acc = 176, eva = 150, agi = 52, int = 58, mnd = 42, chr = 45, dex = 52, def = 160,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 153, agi = 54, int = 63, mnd = 45, chr = 50, dex = 54, def = 164,
                         attack_skill = 147 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [48] = 2008, [49] = 2081, [50] = 2192 }, mp = { [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberry Creeper',
            ids    = { 442, 443, 446, 447 },
            job    = 'thf/thf',
            levels = {
                [50] = { acc = 186, eva = 220, agi = 65, int = 51, mnd = 33, chr = 36, dex = 66, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 192, eva = 225, agi = 65, int = 54, mnd = 36, chr = 38, dex = 69, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 197, eva = 230, agi = 65, int = 54, mnd = 36, chr = 38, dex = 69, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 203, eva = 236, agi = 67, int = 54, mnd = 36, chr = 39, dex = 70, def = 188,
                         attack_skill = 161 },
                [54] = { acc = 208, eva = 241, agi = 67, int = 55, mnd = 36, chr = 39, dex = 71, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 214, eva = 248, agi = 70, int = 56, mnd = 37, chr = 39, dex = 73, def = 199,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 25,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2342, [51] = 2422, [52] = 2501, [53] = 2580, [54] = 2659, [55] = 2739 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 0-5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Hexer',
            ids    = { 444, 445, 448, 449 },
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 181, eva = 156, agi = 60, int = 60, mnd = 42, chr = 50, dex = 57, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 188, eva = 161, agi = 62, int = 63, mnd = 45, chr = 50, dex = 60, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 193, eva = 166, agi = 62, int = 63, mnd = 45, chr = 50, dex = 60, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 198, eva = 170, agi = 63, int = 64, mnd = 45, chr = 52, dex = 60, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 204, eva = 176, agi = 64, int = 64, mnd = 45, chr = 52, dex = 62, def = 189,
                         attack_skill = 166 },
                [55] = { acc = 209, eva = 180, agi = 65, int = 67, mnd = 47, chr = 52, dex = 62, def = 194,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 25,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421, [54] = 2497, [55] = 2574 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[157], danger[162], danger[167], danger[172], danger[181], danger[182], danger[183], danger[176], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[77], danger[78], danger[177], danger[81], danger[86], danger[178], danger[89] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Decimator',
            ids    = { 450 },
            job    = 'nin/nin',
            levels = {
                [55] = { acc = 211, eva = 213, agi = 70, int = 50, mnd = 37, chr = 43, dex = 67, def = 202,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 26,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2739 }, mp = { [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ichi: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ichi: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = danger[246], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Edacious Opo-opo',
            ids    = { 451 },
            nm     = true,
            levels = {
                [55] = { acc = 210, eva = 198, agi = 65, int = 37, mnd = 37, chr = 56, dex = 65, def = 209,
                         attack_skill = 171 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 4468 },  -- bunch of pamamas
                { rate = 100, item = 14465 },  -- nanban kariginu
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 27,
            info = {
                family = { value = 'Opo Opo / Beast', notes = { 'Source species: Opo Opo (ID 100); family ID 48.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 5800 }, mp = { [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[153],
                blue = { value = 'Blank Gaze, Magic Fruit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 592, name = 'Blank Gaze', level = 38, min_skill = 86, skill_ids = { 292 } }, { id = 593, name = 'Magic Fruit', level = 58, min_skill = 162, skill_ids = { 295 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
