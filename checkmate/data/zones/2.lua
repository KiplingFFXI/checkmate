-- Carpenters Landing (zone 2).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Bubble Shower: STR down. Source targeting: area around the monster.', 'Big Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[3] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[4] = { danger[3] };
danger[5] = { notes = danger[2], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[4] };
danger[6] = { kind = 'skill', id = 442, name = 'Bubble Shower', summary = 'Bubble Shower: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[5] };
danger[7] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[8] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[9] = { notes = danger[8], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[10] = { kind = 'skill', id = 444, name = 'Big Scissors', summary = 'Big Scissors: can crit', notes = danger[7], categories = { 'crit' }, effects = {  }, details = danger[9] };
danger[11] = { danger[6], danger[10] };
danger[12] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[13] = { value = 'Bubble Shower: STR down; Big Scissors: can crit', notes = danger[1], entries = danger[11], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[14] = { 'Intimidate: Slow. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Aqua Ball: STR down. Source targeting: area around the target.', 'Screwdriver: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[15] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[16] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[17] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[18] = { danger[17] };
danger[19] = { notes = danger[16], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[18] };
danger[20] = { kind = 'skill', id = 449, name = 'Intimidate', summary = 'Intimidate: Slow', notes = danger[15], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[19] };
danger[21] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[22] = { notes = danger[21], unknown = {  }, activation_range = 12.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[4] };
danger[23] = { kind = 'skill', id = 450, name = 'Aqua Ball', summary = 'Aqua Ball: STR down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[22] };
danger[24] = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[25] = { notes = danger[24], unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[26] = { kind = 'skill', id = 452, name = 'Screwdriver', summary = 'Screwdriver: can crit', notes = danger[7], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[27] = { danger[20], danger[23], danger[26] };
danger[28] = { value = 'Intimidate: Slow; Aqua Ball: STR down; Screwdriver: can crit', notes = danger[14], entries = danger[27], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[29] = { 'Soporific: sleep. Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep.', 'Palsy Pollen: Paralysis. Source targeting: cone.', 'Gloeosuccus: Slow. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[30] = { 'Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep.' };
danger[31] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[32] = { notes = danger[31], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } } };
danger[33] = { kind = 'skill', id = 434, name = 'Soporific', summary = 'Soporific: sleep', notes = danger[30], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[32] };
danger[34] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[35] = { notes = danger[34], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[36] = { kind = 'skill', id = 435, name = 'Palsy Pollen', summary = 'Palsy Pollen: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[35] };
danger[37] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[38] = { notes = danger[37], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[18] };
danger[39] = { kind = 'skill', id = 436, name = 'Gloeosuccus', summary = 'Gloeosuccus: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[38] };
danger[40] = { danger[33], danger[36], danger[39] };
danger[41] = { value = 'Soporific: sleep; Palsy Pollen: Paralysis; Gloeosuccus: Slow', notes = danger[29], entries = danger[40], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[42] = { 'Hi-Freq Field: Evasion down. Source targeting: cone.', 'Spoil: STR down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[43] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[44] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[45] = { danger[44] };
danger[46] = { notes = danger[43], unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[45] };
danger[47] = { kind = 'skill', id = 339, name = 'Hi-Freq Field', summary = 'Hi-Freq Field: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[46] };
danger[48] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[49] = { notes = danger[48], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[4] };
danger[50] = { kind = 'skill', id = 343, name = 'Spoil', summary = 'Spoil: STR down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[49] };
danger[51] = { danger[47], danger[50] };
danger[52] = { value = 'Hi-Freq Field: Evasion down; Spoil: STR down', notes = danger[42], entries = danger[51], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[53] = { 'Frogkick: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Spore: paralysis. Attempts Paralysis on its target. Source targeting: single target. Possible effects: Paralysis.', 'Queasyshroom: Poison, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Numbshroom: Paralysis, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Shakeshroom: Disease, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Silence Gas: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Dark Spore: Blindness. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[54] = { kind = 'skill', id = 308, name = 'Frogkick', summary = 'Frogkick: can crit', notes = danger[7], categories = { 'crit' }, effects = {  }, details = danger[9] };
danger[55] = { 'Attempts Paralysis on its target. Source targeting: single target. Possible effects: Paralysis.' };
danger[56] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[57] = { notes = danger[56], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[58] = { kind = 'skill', id = 309, name = 'Spore', summary = 'Spore: paralysis', notes = danger[55], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[57] };
danger[59] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[60] = { 'Normal activation range: 14.7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { notes = danger[60], unknown = {  }, activation_range = 14.7, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[62] = { kind = 'skill', id = 310, name = 'Queasyshroom', summary = 'Queasyshroom: Poison, can crit', notes = danger[59], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[61] };
danger[63] = { 'Normal activation range: 14.7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[64] = { notes = danger[63], unknown = {  }, activation_range = 14.7, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[65] = { kind = 'skill', id = 311, name = 'Numbshroom', summary = 'Numbshroom: Paralysis, can crit', notes = danger[7], categories = { 'crit', 'debuff' }, effects = { 'Paralysis' }, details = danger[64] };
danger[66] = { 'Normal activation range: 14.7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[67] = { notes = danger[66], unknown = {  }, activation_range = 14.7, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } };
danger[68] = { kind = 'skill', id = 312, name = 'Shakeshroom', summary = 'Shakeshroom: Disease, can crit', notes = danger[7], categories = { 'crit', 'debuff' }, effects = { 'Disease' }, details = danger[67] };
danger[69] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[70] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[71] = { notes = danger[70], unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[72] = { kind = 'skill', id = 314, name = 'Silence Gas', summary = 'Silence Gas: Silence', notes = danger[69], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[71] };
danger[73] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[74] = { notes = danger[73], unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[75] = { kind = 'skill', id = 315, name = 'Dark Spore', summary = 'Dark Spore: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[74] };
danger[76] = { danger[54], danger[58], danger[62], danger[65], danger[68], danger[72], danger[75] };
danger[77] = { value = 'Frogkick: can crit; Spore: paralysis; Queasyshroom: Poison, can crit; Numbshroom: Paralysis, can crit; Shakeshroom: Disease, can crit; Silence Gas: Silence; Dark Spore: Blindness', notes = danger[53], entries = danger[76], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[78] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[79] = { danger[78] };
danger[80] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[81] = { notes = danger[80], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[82] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[83] = { danger[82] };
danger[84] = { 'Final Sting: heavy damage. Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[85] = { 'Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.' };
danger[86] = { kind = 'skill', id = 336, name = 'Final Sting', summary = 'Final Sting: heavy damage', notes = danger[85], categories = { 'other' }, effects = {  }, details = danger[81] };
danger[87] = { danger[86] };
danger[88] = { value = 'Final Sting: heavy damage', notes = danger[84], entries = danger[87], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[89] = { 'Self-Destruct: explosion. Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.', 'Heat Wave: Burn. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[90] = { 'Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.' };
danger[91] = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[92] = { notes = danger[91], unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[93] = { kind = 'skill', id = 509, name = 'Self-Destruct Bomb', summary = 'Self-Destruct: explosion', notes = danger[90], categories = { 'other' }, effects = {  }, details = danger[92] };
danger[94] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[95] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[96] = { danger[95] };
danger[97] = { notes = danger[94], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[96] };
danger[98] = { kind = 'skill', id = 512, name = 'Heat Wave', summary = 'Heat Wave: Burn', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[97] };
danger[99] = { danger[93], danger[98] };
danger[100] = { value = 'Self-Destruct: explosion; Heat Wave: Burn', notes = danger[89], entries = danger[99], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[101] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[102] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[103] = { danger[102] };
danger[104] = { notes = danger[101], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[103] };
danger[105] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[106] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[107] = { notes = danger[105], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[106] };
danger[108] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[109] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[110] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[111] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[112] = { notes = danger[111], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[106] };
danger[113] = { kind = 'skill', id = 605, name = 'Aerial Wheel', summary = 'Aerial Wheel: Stun', notes = danger[110], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[112] };
danger[114] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[115] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[116] = { danger[115] };
danger[117] = { notes = danger[114], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[116] };
danger[118] = { kind = 'skill', id = 607, name = 'Slam Dunk', summary = 'Slam Dunk: Bind', notes = danger[110], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[117] };
danger[119] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[120] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[121] = { danger[120] };
danger[122] = { notes = danger[119], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = danger[121] };
danger[123] = { kind = 'skill', id = 609, name = 'Battle Dance', summary = 'Battle Dance: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[122] };
danger[124] = { danger[113], danger[118], danger[123] };
danger[125] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down', notes = danger[109], entries = danger[124], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[126] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[127] = { notes = danger[126], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[128] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[129] = { notes = danger[128], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[130] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[131] = { notes = danger[130], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[116] };
danger[132] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[133] = { notes = danger[132], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[134] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[135] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[136] = { danger[135] };
danger[137] = { notes = danger[134], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[136] };
danger[138] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[133], level_ranges = { { 24, 71 } } };
danger[139] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[140] = { notes = danger[139], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[96] };
danger[141] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[140], level_ranges = { { 24, 255 } } };
danger[142] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[143] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[144] = { danger[143] };
danger[145] = { notes = danger[142], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[144] };
danger[146] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[145], level_ranges = { { 22, 255 } } };
danger[147] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[148] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[149] = { danger[148] };
danger[150] = { notes = danger[147], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[149] };
danger[151] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[150], level_ranges = { { 20, 255 } } };
danger[152] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[153] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[154] = { danger[153] };
danger[155] = { notes = danger[152], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[154] };
danger[156] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[155], level_ranges = { { 18, 255 } } };
danger[157] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[104], level_ranges = { { 16, 255 } } };
danger[158] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[129], level_ranges = { { 12, 255 } } };
danger[159] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[129], level_ranges = { { 25, 255 } } };
danger[160] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[161] = { notes = danger[160], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[162] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[161], level_ranges = { { 4, 255 } } };
danger[163] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[131], level_ranges = { { 7, 255 } } };
danger[164] = { kind = 'skill', id = 478, name = 'Hell Slash', summary = 'Hell Slash: can crit', notes = danger[7], categories = { 'crit' }, effects = {  }, details = danger[9] };
danger[165] = { kind = 'skill', id = 479, name = 'Horror Cloud', summary = 'Horror Cloud: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[38] };
danger[166] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[167] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[168] = { notes = danger[167], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[169] = { kind = 'skill', id = 484, name = 'Black Cloud', summary = 'Black Cloud: Blindness', notes = danger[166], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[168] };
danger[170] = { 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.' };
danger[171] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[172] = { notes = danger[171], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[173] = { kind = 'skill', id = 485, name = 'Blood Saber', summary = 'Blood Saber: HP drain', notes = danger[170], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[172] };
danger[174] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[175] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[176] = { danger[175] };
danger[177] = { notes = danger[174], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[176] };
danger[178] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[177], level_ranges = { { 21, 255 } } };
danger[179] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[133], level_ranges = { { 24, 69 } } };
danger[180] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[145], level_ranges = { { 22, 50 } } };
danger[181] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[129], level_ranges = { { 25, 82 } } };
danger[182] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[129], level_ranges = { { 20, 255 } } };
danger[183] = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[184] = { danger[164], danger[165], danger[169], danger[173] };
danger[185] = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain', notes = danger[183], entries = danger[184], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[186] = { 'Roar: paralysis. Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[187] = { 'Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.' };
danger[188] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[189] = { notes = danger[188], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[190] = { kind = 'skill', id = 270, name = 'Roar', summary = 'Roar: paralysis', notes = danger[187], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[189] };
danger[191] = { danger[190] };
danger[192] = { value = 'Roar: paralysis', notes = danger[186], entries = danger[191], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[193] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[194] = { notes = danger[193], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[195] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[196] = { notes = danger[195], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[197] = { kind = 'skill', id = 783, name = 'Words Of Bane', summary = 'Words Of Bane: Curse', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[196] };
danger[198] = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' };
danger[199] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[200] = { danger[115], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } };
danger[201] = { notes = danger[199], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[200] };
danger[202] = { kind = 'skill', id = 785, name = 'Light Of Penance', summary = 'Light Of Penance: Bind, Blindness', notes = danger[198], categories = { 'debuff' }, effects = { 'Bind', 'Blindness' }, details = danger[201] };
danger[203] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[204] = { notes = danger[203], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[79] };
danger[205] = { kind = 'skill', id = 786, name = 'Lateral Slash', summary = 'Lateral Slash: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[204] };
danger[206] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[207] = { notes = danger[206], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[83] };
danger[208] = { kind = 'skill', id = 787, name = 'Vertical Slash', summary = 'Vertical Slash: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[207] };
danger[209] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[210] = { notes = danger[209], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[211] = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[212] = { danger[197], danger[202], danger[205], danger[208] };
danger[213] = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down', notes = danger[211], entries = danger[212], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[12] };
danger[214] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[129], level_ranges = { { 60, 255 } } };
danger[215] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[129], level_ranges = { { 50, 255 } } };
danger[216] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[129], level_ranges = { { 52, 255 } } };
danger[217] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[129], level_ranges = { { 54, 255 } } };
danger[218] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[129], level_ranges = { { 56, 255 } } };
danger[219] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[129], level_ranges = { { 58, 255 } } };
danger[220] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[137], level_ranges = { { 27, 255 } } };
danger[221] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[107], level_ranges = { { 45, 255 } } };
danger[222] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[129], level_ranges = { { 41, 255 } } };
danger[223] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[194], level_ranges = { { 56, 255 } } };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Beady Beetle', 'Diving Beetle', 'Hercules Beetle', 'Stag Beetle' } },
        [2] = { sound = { 'Marsh Funguar', 'Poison Funguar' } },
        [3] = { sound = { 'Bulldog Bats', 'Specter Bat' } },
        [4] = { sight = { 'Digger Wasp', 'Spider Wasp' } },
        [5] = {
            sight = { 'Bullheaded Grosvez', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Grunt',
                      'Orcish Neckchopper', 'Orcish Serjeant', 'Orcish Stonechucker' },
        },
        [6] = { sight = { 'Cryptonberry Assassin' } },
        [7] = { sight = { 'Cryptonberry Assassin', 'Cryptonberry Executor' } },
        [8] = {
            sight = { 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Grunt', 'Orcish Neckchopper',
                      'Orcish Serjeant', 'Orcish Stonechucker' },
        },
        [9] = { sight = { 'Beady Beetle', 'Diving Beetle', 'Stag Beetle' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Beady Beetle'] = { id = 182, name = 'Beetle' },
        ['Bulldog Bats'] = { id = 81, name = 'Flock Bat' },
        ['Bullheaded Grosvez'] = { id = 63, name = 'Orc' },
        ['Cryptonberry Assassin'] = { id = 71, name = 'Tonberry' },
        ['Cryptonberry Executor'] = { id = 71, name = 'Tonberry' },
        ['Digger Wasp'] = { id = 181, name = 'Bee' },
        ['Diving Beetle'] = { id = 182, name = 'Beetle' },
        ['Hercules Beetle'] = { id = 182, name = 'Beetle' },
        ['Marsh Funguar'] = { id = 143, name = 'Funguar' },
        ['Orcish Cursemaker'] = { id = 63, name = 'Orc' },
        ['Orcish Fighter'] = { id = 63, name = 'Orc' },
        ['Orcish Grunt'] = { id = 63, name = 'Orc' },
        ['Orcish Neckchopper'] = { id = 63, name = 'Orc' },
        ['Orcish Serjeant'] = { id = 63, name = 'Orc' },
        ['Orcish Stonechucker'] = { id = 63, name = 'Orc' },
        ['Poison Funguar'] = { id = 143, name = 'Funguar' },
        ['Specter Bat'] = { id = 77, name = 'Bat' },
        ['Spider Wasp'] = { id = 181, name = 'Bee' },
        ['Stag Beetle'] = { id = 182, name = 'Beetle' },
    },
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1 },
            job    = 'pld/pld',
            levels = {
                [16] = { acc = 60, eva = 54, agi = 14, int = 15, mnd = 23, chr = 23, dex = 18, def = 79,
                         attack_skill = 48 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 15, mnd = 23, chr = 23, dex = 18, def = 81,
                         attack_skill = 51 },
                [18] = { acc = 67, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23, dex = 20, def = 84,
                         attack_skill = 54 },
                [19] = { acc = 70, eva = 62, agi = 15, int = 16, mnd = 25, chr = 25, dex = 21, def = 89,
                         attack_skill = 57 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            steal  = { 936 },  -- chunk of rock salt
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [16] = 292, [17] = 316, [18] = 341, [19] = 367 }, mp = { [16] = 402, [17] = 429, [18] = 456, [19] = 484 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[13],
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Triangle Crab',
            ids    = { 2 },
            job    = 'pld/pld',
            levels = {
                [15] = { acc = 56, eva = 50, agi = 13, int = 13, mnd = 20, chr = 20, dex = 17, def = 75,
                         attack_skill = 45 },
                [16] = { acc = 60, eva = 54, agi = 14, int = 15, mnd = 23, chr = 23, dex = 18, def = 79,
                         attack_skill = 48 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 15, mnd = 23, chr = 23, dex = 18, def = 81,
                         attack_skill = 51 },
                [18] = { acc = 67, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23, dex = 20, def = 84,
                         attack_skill = 54 },
                [19] = { acc = 70, eva = 62, agi = 15, int = 16, mnd = 25, chr = 25, dex = 21, def = 89,
                         attack_skill = 57 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [15] = 269, [16] = 292, [17] = 316, [18] = 341, [19] = 367 }, mp = { [15] = 375, [16] = 402, [17] = 429, [18] = 456, [19] = 484 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[13],
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Clipper',
            ids    = { 3 },
            job    = 'pld/pld',
            levels = {
                [20] = { acc = 73, eva = 65, agi = 15, int = 16, mnd = 25, chr = 25, dex = 21, def = 92,
                         attack_skill = 60 },
                [21] = { acc = 77, eva = 70, agi = 18, int = 19, mnd = 28, chr = 28, dex = 23, def = 96,
                         attack_skill = 63 },
                [22] = { acc = 80, eva = 72, agi = 18, int = 19, mnd = 28, chr = 28, dex = 23, def = 98,
                         attack_skill = 65 },
                [23] = { acc = 83, eva = 75, agi = 18, int = 19, mnd = 28, chr = 28, dex = 23, def = 102,
                         attack_skill = 68 },
                [24] = { acc = 87, eva = 78, agi = 18, int = 20, mnd = 30, chr = 30, dex = 24, def = 105,
                         attack_skill = 71 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            steal  = { 936 },  -- chunk of rock salt
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [20] = 394, [21] = 422, [22] = 451, [23] = 481, [24] = 512 }, mp = { [20] = 512, [21] = 540, [22] = 568, [23] = 596, [24] = 624 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[13],
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 4 },
            levels = {
                [29] = { acc = 107, eva = 101, agi = 37, int = 25, mnd = 25, chr = 27, dex = 34, def = 116,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 104, agi = 37, int = 26, mnd = 26, chr = 27, dex = 35, def = 120,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 30, dex = 37, def = 123,
                         attack_skill = 92 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 735, [30] = 773, [31] = 872 }, mp = { [29] = 0, [30] = 0, [31] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fishtrap',
            ids    = { 5 },
            levels = {
                [26] = { acc = 97, eva = 91, agi = 32, int = 23, mnd = 23, chr = 26, dex = 32, def = 106,
                         attack_skill = 77 },
                [27] = { acc = 100, eva = 93, agi = 33, int = 24, mnd = 24, chr = 27, dex = 33, def = 110,
                         attack_skill = 80 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 100, item = 1727 },  -- piece of garhada teak lumber
                { rate = 10, item = 1617 },  -- flytrap leaf
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [26] = 623, [27] = 658 }, mp = { [26] = 0, [27] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[41],
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Beady Beetle',
            ids    = { 6, 7, 26, 27, 28, 29, 35, 43, 44, 45, 46, 47, 48 },
            job    = 'pld/pld',
            levels = {
                [15] = { acc = 57, eva = 50, agi = 13, int = 13, mnd = 20, chr = 20, dex = 19, def = 76,
                         attack_skill = 45 },
                [16] = { acc = 61, eva = 54, agi = 14, int = 14, mnd = 22, chr = 22, dex = 20, def = 79,
                         attack_skill = 48 },
                [17] = { acc = 64, eva = 56, agi = 14, int = 14, mnd = 22, chr = 22, dex = 20, def = 82,
                         attack_skill = 51 },
                [18] = { acc = 68, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23, dex = 22, def = 85,
                         attack_skill = 54 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 1,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [15] = 269, [16] = 292, [17] = 316, [18] = 341 }, mp = { [15] = 375, [16] = 402, [17] = 429, [18] = 456 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[52],
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Poison Funguar',
            ids    = { 8, 9, 10, 11, 12, 41, 42 },
            levels = {
                [16] = { acc = 62, eva = 58, agi = 23, int = 14, mnd = 15, chr = 18, dex = 23, def = 75,
                         attack_skill = 48 },
                [17] = { acc = 65, eva = 60, agi = 23, int = 16, mnd = 17, chr = 18, dex = 23, def = 77,
                         attack_skill = 51 },
                [18] = { acc = 68, eva = 63, agi = 23, int = 17, mnd = 17, chr = 20, dex = 23, def = 80,
                         attack_skill = 54 },
                [19] = { acc = 72, eva = 67, agi = 25, int = 17, mnd = 18, chr = 21, dex = 25, def = 84,
                         attack_skill = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 50, item = 4373 },  -- woozyshroom
            },
            steal  = { 4374 },  -- sleepshroom
            links  = 2,
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [16] = 308, [17] = 333, [18] = 359, [19] = 386 }, mp = { [16] = 0, [17] = 0, [18] = 0, [19] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[77],
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Specter Bat',
            ids    = { 13, 14 },
            levels = {
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17, dex = 20, def = 70,
                         attack_skill = 45 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 18, dex = 23, def = 74,
                         attack_skill = 48 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 18, dex = 23, def = 76,
                         attack_skill = 51 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20, dex = 23, def = 80,
                         attack_skill = 54 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 21, dex = 25, def = 83,
                         attack_skill = 57 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 21, dex = 25, def = 86,
                         attack_skill = 60 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [15] = 284, [16] = 308, [17] = 333, [18] = 359, [19] = 386, [20] = 414 }, mp = { [15] = 0, [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-06:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-06:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Ultrasonics: Evasion down; Blood Drain: HP drain; Subsonics: Defense down; Marrow Drain: MP drain', notes = { 'Ultrasonics: Evasion down. Source targeting: area around the monster.', 'Blood Drain: HP drain. Source targeting: single target.', 'Subsonics: Defense down. Source targeting: area around the monster.', 'Marrow Drain: MP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 392, name = 'Ultrasonics', summary = 'Ultrasonics: Evasion down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[45] } }, { kind = 'skill', id = 394, name = 'Blood Drain', summary = 'Blood Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow behavior changes with script conditions; the following are possible rules.', 'Utsusemi and Blink do not absorb the damage step.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false }, { mode = 'absorb', per_hit = false, count = 1 } } } }, { kind = 'skill', id = 1155, name = 'Subsonics', summary = 'Subsonics: Defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[79] } }, { kind = 'skill', id = 1156, name = 'Marrow Drain', summary = 'Marrow Drain: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[81] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] },
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bulldog Bats',
            ids    = { 15, 16 },
            levels = {
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17, dex = 20, def = 70,
                         attack_skill = 45 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 18, dex = 23, def = 74,
                         attack_skill = 48 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 18, dex = 23, def = 76,
                         attack_skill = 51 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20, dex = 23, def = 80,
                         attack_skill = 54 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 21, dex = 25, def = 83,
                         attack_skill = 57 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 21, dex = 25, def = 86,
                         attack_skill = 60 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 150, item = 891 },  -- bat fang
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [15] = 284, [16] = 308, [17] = 333, [18] = 359, [19] = 386, [20] = 414 }, mp = { [15] = 0, [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-06:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-06:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sonic Boom: Attack down; Slipstream: Accuracy down', notes = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'Slipstream: Accuracy down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1157, name = 'Slipstream', summary = 'Slipstream: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = danger[83] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] },
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Digger Wasp',
            ids    = { 17, 18, 19, 20, 21, 22, 23 },
            levels = {
                [14] = { acc = 55, eva = 52, agi = 22, int = 14, mnd = 14, chr = 16, dex = 20, def = 67,
                         attack_skill = 42 },
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17, dex = 20, def = 70,
                         attack_skill = 45 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 18, dex = 23, def = 75,
                         attack_skill = 48 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 18, dex = 23, def = 77,
                         attack_skill = 51 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            steal  = { 4370 },  -- pot of honey
            links  = 4,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [14] = 261, [15] = 284, [16] = 308, [17] = 333 }, mp = { [14] = 0, [15] = 0, [16] = 0, [17] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[88],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Glide Bomb',
            ids    = { 24 },
            levels = {
                [20] = { acc = 76, eva = 70, agi = 25, int = 17, mnd = 18, chr = 23, dex = 27, def = 87,
                         attack_skill = 60 },
                [21] = { acc = 81, eva = 75, agi = 28, int = 19, mnd = 20, chr = 25, dex = 30, def = 91,
                         attack_skill = 63 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            steal  = { 928, 17316 },  -- pinch of bomb ash, bomb arm
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [20] = 414, [21] = 443 }, mp = { [20] = 0, [21] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fog; Respawn 5 minutes', notes = { 'Requires fog weather.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[100],
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 25, 90, 107, 188, 198, 269 },
            job    = 'blm/rdm',
            levels = {
                [24] = { acc = 89, eva = 80, agi = 28, int = 33, mnd = 26, chr = 27, dex = 29, def = 88,
                         attack_skill = 71 },
                [25] = { acc = 92, eva = 82, agi = 29, int = 34, mnd = 27, chr = 27, dex = 29, def = 92,
                         attack_skill = 74 },
                [26] = { acc = 96, eva = 86, agi = 30, int = 35, mnd = 28, chr = 27, dex = 30, def = 95,
                         attack_skill = 77 },
                [29] = { acc = 106, eva = 95, agi = 32, int = 38, mnd = 30, chr = 30, dex = 33, def = 104,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 98, agi = 33, int = 39, mnd = 31, chr = 32, dex = 34, def = 107,
                         attack_skill = 89 },
                [31] = { acc = 113, eva = 102, agi = 35, int = 41, mnd = 33, chr = 32, dex = 35, def = 111,
                         attack_skill = 92 },
                [36] = { acc = 131, eva = 117, agi = 39, int = 46, mnd = 37, chr = 37, dex = 40, def = 126,
                         attack_skill = 106 },
                [37] = { acc = 134, eva = 120, agi = 39, int = 47, mnd = 37, chr = 37, dex = 40, def = 129,
                         attack_skill = 109 },
                [38] = { acc = 137, eva = 123, agi = 40, int = 47, mnd = 38, chr = 37, dex = 40, def = 132,
                         attack_skill = 112 },
            },
            spawn_levels = { [25] = { 24, 26 }, [90] = { 29, 31 }, [107] = { 29, 31 }, [188] = { 29, 31 },
                             [198] = { 29, 31 }, [269] = { 36, 38 } },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Thunder Elemental (ID 265); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [24] = 435, [25] = 479, [26] = 509, [29] = 608, [30] = 642, [31] = 731, [36] = 1105, [37] = 1178, [38] = 1255 }, mp = { [24] = 624, [25] = 653, [26] = 681, [29] = 768, [30] = 797, [31] = 826, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Thunder weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Shock: Shock; Stun: stun', notes = { 'Shock: Shock.', 'Stun: stun. Possible effects: Stun.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[104], level_ranges = { { 16, 50 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[107], level_ranges = { { 37, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[108] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Flytrap',
            ids    = { 30, 31, 36, 37 },
            levels = {
                [18] = { acc = 68, eva = 63, agi = 23, int = 17, mnd = 17, chr = 20, dex = 23, def = 80,
                         attack_skill = 54 },
                [19] = { acc = 72, eva = 67, agi = 25, int = 18, mnd = 18, chr = 21, dex = 25, def = 84,
                         attack_skill = 57 },
                [20] = { acc = 75, eva = 70, agi = 25, int = 18, mnd = 18, chr = 21, dex = 25, def = 87,
                         attack_skill = 60 },
                [21] = { acc = 80, eva = 75, agi = 28, int = 20, mnd = 20, chr = 23, dex = 28, def = 91,
                         attack_skill = 63 },
                [22] = { acc = 83, eva = 77, agi = 28, int = 20, mnd = 20, chr = 23, dex = 28, def = 93,
                         attack_skill = 65 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [18] = 359, [19] = 386, [20] = 414, [21] = 443, [22] = 473 }, mp = { [18] = 0, [19] = 0, [20] = 0, [21] = 0, [22] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[41],
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Grunt',
            ids    = { 32, 38, 49 },
            job    = 'drg/war',
            levels = {
                [16] = { acc = 62, eva = 58, agi = 21, int = 12, mnd = 16, chr = 23, dex = 23, def = 76,
                         attack_skill = 48 },
                [17] = { acc = 66, eva = 61, agi = 21, int = 15, mnd = 17, chr = 23, dex = 24, def = 78,
                         attack_skill = 51 },
                [18] = { acc = 69, eva = 64, agi = 21, int = 15, mnd = 19, chr = 24, dex = 24, def = 81,
                         attack_skill = 54 },
                [19] = { acc = 73, eva = 68, agi = 23, int = 15, mnd = 19, chr = 26, dex = 26, def = 85,
                         attack_skill = 57 },
                [20] = { acc = 76, eva = 71, agi = 23, int = 15, mnd = 19, chr = 26, dex = 26, def = 88,
                         attack_skill = 60 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [16] = 323, [17] = 349, [18] = 376, [19] = 405, [20] = 434 }, mp = { [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[125],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Stonechucker',
            ids    = { 33, 39, 50 },
            job    = 'rng/war',
            levels = {
                [16] = { acc = 72, eva = 59, agi = 25, int = 14, mnd = 17, chr = 20, dex = 23, def = 75,
                         attack_skill = 48, resist = { virus = 10 } },
                [17] = { acc = 76, eva = 62, agi = 26, int = 16, mnd = 18, chr = 20, dex = 24, def = 77,
                         attack_skill = 51, resist = { virus = 10 } },
                [18] = { acc = 79, eva = 65, agi = 26, int = 17, mnd = 19, chr = 22, dex = 24, def = 80,
                         attack_skill = 54, resist = { virus = 10 } },
                [19] = { acc = 83, eva = 69, agi = 28, int = 17, mnd = 20, chr = 23, dex = 26, def = 84,
                         attack_skill = 57, resist = { virus = 10 } },
                [20] = { acc = 86, eva = 72, agi = 28, int = 17, mnd = 20, chr = 23, dex = 26, def = 87,
                         attack_skill = 60, resist = { poison = 10, virus = 10 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [16] = 269, [17] = 292, [18] = 317, [19] = 342, [20] = 368 }, mp = { [16] = 0, [17] = 0, [18] = 0, [19] = 0, [20] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[125],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Neckchopper',
            ids    = { 34, 40, 51 },
            job    = 'drk/war',
            levels = {
                [16] = { acc = 63, eva = 57, agi = 21, int = 17, mnd = 14, chr = 18, dex = 25, def = 76,
                         attack_skill = 48, resist = { virus = 10 } },
                [17] = { acc = 67, eva = 59, agi = 21, int = 19, mnd = 15, chr = 18, dex = 26, def = 78,
                         attack_skill = 51, resist = { virus = 10 } },
                [18] = { acc = 70, eva = 62, agi = 21, int = 19, mnd = 16, chr = 19, dex = 26, def = 81,
                         attack_skill = 54, resist = { virus = 10 } },
                [19] = { acc = 74, eva = 66, agi = 23, int = 20, mnd = 16, chr = 20, dex = 28, def = 85,
                         attack_skill = 57, resist = { virus = 10 } },
                [20] = { acc = 77, eva = 69, agi = 23, int = 20, mnd = 16, chr = 20, dex = 28, def = 88,
                         attack_skill = 60, resist = { paralyze = 10, virus = 10 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [16] = 306, [17] = 331, [18] = 358, [19] = 385, [20] = 413 }, mp = { [16] = 402, [17] = 429, [18] = 456, [19] = 484, [20] = 512 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison: Poison; Drain: HP drain; Aspir: MP drain; Bind: bind', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[113], danger[118], danger[123], { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[127], level_ranges = { { 6, 45 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[129], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[129], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[131], level_ranges = { { 20, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[108] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Land Pugil',
            ids    = { 52, 54, 56, 57 },
            levels = {
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 17, dex = 23, def = 77,
                         attack_skill = 51 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20, dex = 23, def = 80,
                         attack_skill = 54 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 20, dex = 25, def = 84,
                         attack_skill = 57 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [17] = 333, [18] = 359, [19] = 386 }, mp = { [17] = 0, [18] = 0, [19] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[28],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 53, 55, 113, 115, 117, 191, 224, 275, 277, 279 },
            job    = 'blm/rdm',
            levels = {
                [24] = { acc = 89, eva = 80, agi = 28, int = 33, mnd = 26, chr = 27, dex = 29, def = 88,
                         attack_skill = 71 },
                [25] = { acc = 92, eva = 82, agi = 29, int = 34, mnd = 27, chr = 27, dex = 29, def = 92,
                         attack_skill = 74 },
                [26] = { acc = 96, eva = 86, agi = 30, int = 35, mnd = 28, chr = 27, dex = 30, def = 95,
                         attack_skill = 77 },
                [29] = { acc = 106, eva = 95, agi = 32, int = 38, mnd = 30, chr = 30, dex = 33, def = 104,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 98, agi = 33, int = 39, mnd = 31, chr = 32, dex = 34, def = 107,
                         attack_skill = 89 },
                [31] = { acc = 113, eva = 102, agi = 35, int = 41, mnd = 33, chr = 32, dex = 35, def = 111,
                         attack_skill = 92 },
                [36] = { acc = 131, eva = 117, agi = 39, int = 46, mnd = 37, chr = 37, dex = 40, def = 126,
                         attack_skill = 106 },
                [37] = { acc = 134, eva = 120, agi = 39, int = 47, mnd = 37, chr = 37, dex = 40, def = 129,
                         attack_skill = 109 },
                [38] = { acc = 137, eva = 123, agi = 40, int = 47, mnd = 38, chr = 37, dex = 40, def = 132,
                         attack_skill = 112 },
            },
            spawn_levels = { [53] = { 24, 26 }, [55] = { 24, 26 }, [113] = { 29, 31 }, [115] = { 29, 31 },
                             [117] = { 29, 31 }, [191] = { 29, 31 }, [224] = { 29, 31 }, [275] = { 36, 38 },
                             [277] = { 36, 38 }, [279] = { 36, 38 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [24] = 435, [25] = 479, [26] = 509, [29] = 608, [30] = 642, [31] = 731, [36] = 1105, [37] = 1178, [38] = 1255 }, mp = { [24] = 624, [25] = 653, [26] = 681, [29] = 768, [30] = 797, [31] = 826, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Water weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Poison: Poison; Poisonga: area poison; Drown: Drown', notes = { 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drown: Drown.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[127], level_ranges = { { 3, 42 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[133], level_ranges = { { 24, 59 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[137], level_ranges = { { 27, 50 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[108] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Stag Beetle',
            ids    = { 58, 59, 67, 75, 76, 77, 82, 85, 93, 94, 104, 108, 118, 119, 120, 123, 124, 125, 126, 130,
                       133, 134, 135, 141, 150, 151, 155, 157, 158, 160, 163, 169, 170, 171, 177, 181, 192, 193,
                       194, 199, 200, 201, 202, 215, 218 },
            job    = 'pld/pld',
            levels = {
                [20] = { acc = 74, eva = 65, agi = 15, int = 15, mnd = 24, chr = 24, dex = 23, def = 92,
                         attack_skill = 60 },
                [21] = { acc = 78, eva = 70, agi = 18, int = 18, mnd = 27, chr = 27, dex = 25, def = 96,
                         attack_skill = 63 },
                [22] = { acc = 81, eva = 72, agi = 18, int = 18, mnd = 27, chr = 27, dex = 25, def = 98,
                         attack_skill = 65 },
                [23] = { acc = 84, eva = 75, agi = 18, int = 18, mnd = 27, chr = 27, dex = 25, def = 102,
                         attack_skill = 68 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 1,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [20] = 394, [21] = 422, [22] = 451, [23] = 481 }, mp = { [20] = 512, [21] = 540, [22] = 568, [23] = 596 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[52],
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Battrap',
            ids    = { 60, 61, 62, 63, 69, 70, 78, 79, 83, 84, 87, 88, 97, 98, 109, 110, 195, 196, 197, 205, 206,
                       207, 208, 209, 210, 211, 216, 217 },
            levels = {
                [23] = { acc = 86, eva = 80, agi = 28, int = 20, mnd = 20, chr = 23, dex = 28, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 90, eva = 84, agi = 30, int = 21, mnd = 21, chr = 24, dex = 30, def = 100,
                         attack_skill = 71 },
                [25] = { acc = 93, eva = 87, agi = 30, int = 23, mnd = 23, chr = 26, dex = 30, def = 103,
                         attack_skill = 74 },
                [26] = { acc = 97, eva = 91, agi = 32, int = 23, mnd = 23, chr = 26, dex = 32, def = 106,
                         attack_skill = 77 },
                [27] = { acc = 100, eva = 93, agi = 33, int = 24, mnd = 24, chr = 27, dex = 33, def = 110,
                         attack_skill = 80 },
            },
            spawn_levels = { [63] = { 23, 26 }, [69] = { 24, 27 }, [83] = { 23, 26 }, [84] = { 23, 26 },
                             [97] = { 23, 26 }, [98] = { 24, 27 }, [109] = { 24, 27 }, [110] = { 23, 25 },
                             [195] = { 24, 27 }, [197] = { 24, 26 }, [205] = { 24, 27 }, [206] = { 25, 26 },
                             [207] = { 25, 26 }, [209] = { 23, 26 }, [210] = { 24, 27 }, [211] = { 23, 26 },
                             [216] = { 24, 26 }, [217] = { 24, 27 } },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [23] = 504, [24] = 536, [25] = 589, [26] = 623, [27] = 658 }, mp = { [23] = 0, [24] = 0, [25] = 0, [26] = 0, [27] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[41],
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 64, 71, 80, 99 },
            levels = {
                [21] = { acc = 81, eva = 75, agi = 28, int = 17, mnd = 19, chr = 25, dex = 31, def = 91,
                         attack_skill = 63 },
                [22] = { acc = 84, eva = 77, agi = 28, int = 17, mnd = 19, chr = 25, dex = 31, def = 93,
                         attack_skill = 65 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 17, mnd = 19, chr = 25, dex = 31, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 17, mnd = 19, chr = 26, dex = 33, def = 100,
                         attack_skill = 71 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 20, mnd = 22, chr = 28, dex = 33, def = 103,
                         attack_skill = 74 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 465, [22] = 496, [23] = 529, [24] = 562, [25] = 618 }, mp = { [21] = 0, [22] = 0, [23] = 0, [24] = 0, [25] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[125],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 65, 72, 100 },
            job    = 'blm/war',
            levels = {
                [21] = { acc = 81, eva = 75, agi = 28, int = 25, mnd = 21, chr = 26, dex = 31, def = 90,
                         attack_skill = 63 },
                [22] = { acc = 84, eva = 77, agi = 28, int = 25, mnd = 21, chr = 26, dex = 31, def = 92,
                         attack_skill = 65 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 26, mnd = 21, chr = 26, dex = 31, def = 95,
                         attack_skill = 68 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 26, mnd = 21, chr = 28, dex = 33, def = 98,
                         attack_skill = 71 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 29, mnd = 24, chr = 29, dex = 33, def = 102,
                         attack_skill = 74 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 371, [22] = 398, [23] = 427, [24] = 456, [25] = 508 }, mp = { [21] = 540, [22] = 568, [23] = 596, [24] = 624, [25] = 653 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[113], danger[118], danger[123], danger[138], danger[141], danger[146], danger[151], danger[156], danger[157], danger[158], danger[159], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[129], level_ranges = { { 20, 40 } } }, danger[162], danger[163] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[108] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Serjeant',
            ids    = { 66, 73, 81 },
            job    = 'pld/war',
            levels = {
                [21] = { acc = 80, eva = 72, agi = 22, int = 16, mnd = 24, chr = 28, dex = 28, def = 94,
                         attack_skill = 63 },
                [22] = { acc = 83, eva = 74, agi = 22, int = 16, mnd = 24, chr = 28, dex = 28, def = 96,
                         attack_skill = 65 },
                [23] = { acc = 86, eva = 77, agi = 22, int = 16, mnd = 24, chr = 28, dex = 28, def = 99,
                         attack_skill = 68 },
                [24] = { acc = 89, eva = 80, agi = 23, int = 16, mnd = 25, chr = 30, dex = 29, def = 103,
                         attack_skill = 71 },
                [25] = { acc = 93, eva = 83, agi = 23, int = 18, mnd = 27, chr = 31, dex = 30, def = 106,
                         attack_skill = 74 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 10, virus = 10 },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 443, [22] = 473, [23] = 505, [24] = 537, [25] = 592 }, mp = { [21] = 540, [22] = 568, [23] = 596, [24] = 624, [25] = 653 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[125],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ghoul blm',
            ids    = { 68, 86, 95, 186, 203 },
            job    = 'blm/blm',
            levels = {
                [21] = { acc = 81, eva = 68, agi = 28, int = 32, mnd = 22, chr = 25, dex = 30, def = 79,
                         attack_skill = 63 },
                [22] = { acc = 84, eva = 70, agi = 28, int = 32, mnd = 22, chr = 25, dex = 30, def = 81,
                         attack_skill = 65 },
                [23] = { acc = 87, eva = 73, agi = 28, int = 34, mnd = 22, chr = 25, dex = 30, def = 84,
                         attack_skill = 68 },
                [24] = { acc = 91, eva = 76, agi = 30, int = 35, mnd = 22, chr = 27, dex = 32, def = 87,
                         attack_skill = 71 },
                [25] = { acc = 94, eva = 79, agi = 30, int = 36, mnd = 25, chr = 27, dex = 32, def = 91,
                         attack_skill = 74 },
                [26] = { acc = 98, eva = 82, agi = 32, int = 36, mnd = 25, chr = 27, dex = 35, def = 94,
                         attack_skill = 77 },
                [27] = { acc = 101, eva = 85, agi = 33, int = 39, mnd = 25, chr = 30, dex = 35, def = 97,
                         attack_skill = 80 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 354, [22] = 380, [23] = 407, [24] = 435, [25] = 474, [26] = 504, [27] = 535 }, mp = { [21] = 540, [22] = 568, [23] = 596, [24] = 624, [25] = 653, [26] = 681, [27] = 710 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Gravity: Weight; Poison: Poison; Poisonga: area poison; Frost: Frost; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Gravity: Weight.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Frost: Frost.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[164], danger[165], danger[169], danger[173], danger[178], { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[127], level_ranges = { { 3, 25 } } }, danger[179], danger[180], danger[158], danger[181], danger[182], danger[162], danger[163] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[108] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ghoul war',
            ids    = { 74, 89, 101, 187, 212 },
            levels = {
                [21] = { acc = 81, eva = 75, agi = 28, int = 20, mnd = 19, chr = 23, dex = 30, def = 91,
                         attack_skill = 63 },
                [22] = { acc = 84, eva = 77, agi = 28, int = 20, mnd = 19, chr = 23, dex = 30, def = 93,
                         attack_skill = 65 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 20, mnd = 19, chr = 23, dex = 30, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 21, mnd = 19, chr = 24, dex = 32, def = 100,
                         attack_skill = 71 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 23, mnd = 22, chr = 26, dex = 32, def = 103,
                         attack_skill = 74 },
                [26] = { acc = 98, eva = 91, agi = 32, int = 23, mnd = 22, chr = 26, dex = 35, def = 106,
                         attack_skill = 77 },
                [27] = { acc = 101, eva = 93, agi = 33, int = 24, mnd = 22, chr = 27, dex = 35, def = 110,
                         attack_skill = 80 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 443, [22] = 473, [23] = 504, [24] = 536, [25] = 589, [26] = 623, [27] = 658 }, mp = { [21] = 0, [22] = 0, [23] = 0, [24] = 0, [25] = 0, [26] = 0, [27] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[185],
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Marsh Funguar',
            ids    = { 91, 92, 105, 106, 127, 132, 136, 137, 138, 139, 140, 142, 143, 144, 145, 146, 156, 161, 162,
                       164, 165, 166, 167, 168, 172, 173, 174, 175, 176, 219, 220, 221 },
            levels = {
                [21] = { acc = 80, eva = 75, agi = 28, int = 19, mnd = 20, chr = 23, dex = 28, def = 91,
                         attack_skill = 63 },
                [22] = { acc = 83, eva = 77, agi = 28, int = 19, mnd = 20, chr = 23, dex = 28, def = 93,
                         attack_skill = 65 },
                [23] = { acc = 86, eva = 80, agi = 28, int = 19, mnd = 20, chr = 23, dex = 28, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 90, eva = 84, agi = 30, int = 19, mnd = 21, chr = 24, dex = 30, def = 100,
                         attack_skill = 71 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 100, item = 4373 },  -- woozyshroom
            },
            steal  = { 4374 },  -- sleepshroom
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 443, [22] = 473, [23] = 504, [24] = 536 }, mp = { [21] = 0, [22] = 0, [23] = 0, [24] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[77],
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Will-o-the-Wisp',
            ids    = { 96, 204 },
            levels = {
                [25] = { acc = 94, eva = 87, agi = 30, int = 22, mnd = 23, chr = 28, dex = 32, def = 103,
                         attack_skill = 74 },
                [26] = { acc = 98, eva = 91, agi = 32, int = 22, mnd = 23, chr = 29, dex = 35, def = 106,
                         attack_skill = 77 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [25] = 589, [26] = 623 }, mp = { [25] = 0, [26] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fog; Respawn 5 minutes', notes = { 'Requires fog weather.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[100],
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Forest Tiger',
            ids    = { 102, 103, 178, 179, 180, 182, 183, 184, 213, 214 },
            levels = {
                [22] = { acc = 84, eva = 77, agi = 28, int = 17, mnd = 20, chr = 23, dex = 30, def = 93,
                         attack_skill = 65 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 17, mnd = 20, chr = 23, dex = 30, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 17, mnd = 21, chr = 24, dex = 32, def = 100,
                         attack_skill = 71 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 20, mnd = 23, chr = 26, dex = 32, def = 103,
                         attack_skill = 74 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            steal  = { 4372 },  -- slice of giant sheep meat
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Tiger / Beast', notes = { 'Source species: Tiger (ID 114); family ID 53.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 473, [23] = 504, [24] = 536, [25] = 589 }, mp = { [22] = 0, [23] = 0, [24] = 0, [25] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 68', notes = { 'Source base speed is 68; the ordinary monster default is 40. Animation speed is 68.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[192],
                blue = { value = 'Claw Cyclone', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 587, name = 'Claw Cyclone', level = 20, min_skill = 32, skill_ids = { 273 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fosse Pugil',
            ids    = { 111, 112, 114, 116, 189, 190, 222, 223 },
            levels = {
                [22] = { acc = 83, eva = 78, agi = 30, int = 20, mnd = 20, chr = 22, dex = 28, def = 93,
                         attack_skill = 65 },
                [23] = { acc = 86, eva = 81, agi = 30, int = 20, mnd = 20, chr = 22, dex = 28, def = 96,
                         attack_skill = 68 },
                [24] = { acc = 90, eva = 85, agi = 32, int = 21, mnd = 21, chr = 22, dex = 30, def = 100,
                         attack_skill = 71 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 473, [23] = 504, [24] = 536 }, mp = { [22] = 0, [23] = 0, [24] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[28],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Spider Wasp',
            ids    = { 121, 122, 128, 129, 131, 147, 148, 149, 152, 153, 154, 159 },
            levels = {
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 21, dex = 25, def = 84,
                         attack_skill = 57 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 21, dex = 25, def = 87,
                         attack_skill = 60 },
                [21] = { acc = 80, eva = 76, agi = 30, int = 20, mnd = 20, chr = 23, dex = 28, def = 91,
                         attack_skill = 63 },
                [22] = { acc = 83, eva = 78, agi = 30, int = 20, mnd = 20, chr = 23, dex = 28, def = 93,
                         attack_skill = 65 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            steal  = { 4370 },  -- pot of honey
            links  = 4,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [19] = 386, [20] = 414, [21] = 443, [22] = 473 }, mp = { [19] = 0, [20] = 0, [21] = 0, [22] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[88],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Diving Beetle',
            ids    = { 225, 226, 232, 237, 238, 239, 253, 254, 260, 261, 262, 270, 280, 281, 282, 283, 285, 286,
                       290, 291, 292, 293, 294, 295 },
            job    = 'pld/pld',
            levels = {
                [27] = { acc = 98, eva = 87, agi = 20, int = 20, mnd = 31, chr = 31, dex = 29, def = 116,
                         attack_skill = 80 },
                [28] = { acc = 102, eva = 90, agi = 21, int = 21, mnd = 32, chr = 32, dex = 30, def = 119,
                         attack_skill = 83 },
                [29] = { acc = 105, eva = 93, agi = 21, int = 21, mnd = 33, chr = 33, dex = 31, def = 123,
                         attack_skill = 86 },
                [30] = { acc = 108, eva = 96, agi = 21, int = 21, mnd = 33, chr = 33, dex = 31, def = 138,
                         attack_skill = 89 },
            },
            spawn_levels = { [285] = { 28, 29 } },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 50, item = 894 },  -- beetle jaw
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 1,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [27] = 629, [28] = 667, [29] = 703, [30] = 740 }, mp = { [27] = 710, [28] = 739, [29] = 768, [30] = 797 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[52],
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Birdtrap',
            ids    = { 227, 228, 229, 230, 233, 234, 235, 242, 243, 244, 245, 246, 255, 256, 257, 258, 263, 264,
                       265, 267, 271, 272 },
            levels = {
                [29] = { acc = 107, eva = 100, agi = 34, int = 25, mnd = 25, chr = 28, dex = 34, def = 116,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29, dex = 35, def = 120,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 107, agi = 37, int = 26, mnd = 26, chr = 31, dex = 37, def = 123,
                         attack_skill = 92 },
                [32] = { acc = 117, eva = 109, agi = 37, int = 26, mnd = 26, chr = 31, dex = 37, def = 125,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 29, mnd = 29, chr = 32, dex = 38, def = 129,
                         attack_skill = 97 },
            },
            ph_for = { [267] = { 268 } },
            ph_rules = {
                [267] = {
                    [268] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 735, [30] = 773, [31] = 872, [32] = 954, [33] = 1032 }, mp = { [29] = 0, [30] = 0, [31] = 0, [32] = 0, [33] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[41],
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sabertooth Tiger',
            ids    = { 231, 236, 248, 249, 259, 266 },
            levels = {
                [29] = { acc = 108, eva = 100, agi = 34, int = 22, mnd = 25, chr = 28, dex = 37, def = 116,
                         attack_skill = 86 },
                [30] = { acc = 111, eva = 103, agi = 35, int = 22, mnd = 26, chr = 29, dex = 37, def = 120,
                         attack_skill = 89 },
                [31] = { acc = 116, eva = 107, agi = 37, int = 22, mnd = 26, chr = 31, dex = 40, def = 123,
                         attack_skill = 92 },
                [32] = { acc = 119, eva = 109, agi = 37, int = 22, mnd = 26, chr = 31, dex = 40, def = 125,
                         attack_skill = 94 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 240, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            steal  = { 4372 },  -- slice of giant sheep meat
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Tiger / Beast', notes = { 'Source species: Tiger (ID 114); family ID 53.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 735, [30] = 773, [31] = 872, [32] = 954 }, mp = { [29] = 0, [30] = 0, [31] = 0, [32] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 68', notes = { 'Source base speed is 68; the ordinary monster default is 40. Animation speed is 68.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[192],
                blue = { value = 'Claw Cyclone', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 587, name = 'Claw Cyclone', level = 20, min_skill = 32, skill_ids = { 273 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wight blm',
            ids    = { 240 },
            job    = 'blm/blm',
            levels = {
                [29] = { acc = 108, eva = 91, agi = 34, int = 40, mnd = 27, chr = 30, dex = 37, def = 103,
                         attack_skill = 86 },
                [30] = { acc = 111, eva = 93, agi = 35, int = 41, mnd = 27, chr = 32, dex = 37, def = 107,
                         attack_skill = 89 },
                [31] = { acc = 116, eva = 97, agi = 37, int = 43, mnd = 30, chr = 32, dex = 40, def = 110,
                         attack_skill = 92 },
                [32] = { acc = 119, eva = 99, agi = 37, int = 43, mnd = 30, chr = 32, dex = 40, def = 112,
                         attack_skill = 94 },
                [33] = { acc = 122, eva = 103, agi = 38, int = 45, mnd = 30, chr = 35, dex = 40, def = 116,
                         attack_skill = 97 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 4824 },  -- scroll of gravity
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 602, [30] = 636, [31] = 717, [32] = 792, [33] = 865 }, mp = { [29] = 768, [30] = 797, [31] = 826, [32] = 855, [33] = 884 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Gravity: Weight; Poisonga: area poison; Frost: Frost; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Gravity: Weight.', 'Poisonga: area poison. Possible effects: Poison.', 'Frost: Frost.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[164], danger[165], danger[169], danger[173], danger[178], danger[179], danger[180], danger[158], danger[181], danger[182], danger[162], danger[163], { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[194], level_ranges = { { 31, 55 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[108] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Spunkie CL',
            ids    = { 241 },
            levels = {
                [32] = { acc = 119, eva = 109, agi = 37, int = 25, mnd = 26, chr = 34, dex = 40, def = 125,
                         attack_skill = 94 },
                [33] = { acc = 122, eva = 113, agi = 38, int = 27, mnd = 29, chr = 34, dex = 40, def = 129,
                         attack_skill = 97 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [32] = 954, [33] = 1032 }, mp = { [32] = 0, [33] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fog; Respawn 5 minutes', notes = { 'Requires fog weather.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[100],
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wendigo war',
            ids    = { 247 },
            levels = {
                [28] = { acc = 104, eva = 96, agi = 33, int = 24, mnd = 23, chr = 28, dex = 35, def = 113,
                         attack_skill = 83 },
                [29] = { acc = 108, eva = 100, agi = 34, int = 25, mnd = 24, chr = 28, dex = 37, def = 116,
                         attack_skill = 86 },
                [30] = { acc = 111, eva = 103, agi = 35, int = 26, mnd = 24, chr = 29, dex = 37, def = 120,
                         attack_skill = 89 },
                [31] = { acc = 116, eva = 107, agi = 37, int = 26, mnd = 25, chr = 31, dex = 40, def = 123,
                         attack_skill = 92 },
                [32] = { acc = 119, eva = 109, agi = 37, int = 26, mnd = 25, chr = 31, dex = 40, def = 125,
                         attack_skill = 94 },
                [33] = { acc = 122, eva = 113, agi = 38, int = 29, mnd = 27, chr = 32, dex = 40, def = 129,
                         attack_skill = 97 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [28] = 698, [29] = 735, [30] = 773, [31] = 872, [32] = 954, [33] = 1032 }, mp = { [28] = 0, [29] = 0, [30] = 0, [31] = 0, [32] = 0, [33] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[185],
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Shrieker',
            ids    = { 250, 251, 252, 284, 287, 288, 289, 296, 297, 298, 299, 300 },
            levels = {
                [28] = { acc = 103, eva = 96, agi = 33, int = 23, mnd = 24, chr = 28, dex = 33, def = 113,
                         attack_skill = 83 },
                [29] = { acc = 107, eva = 100, agi = 34, int = 24, mnd = 25, chr = 28, dex = 34, def = 116,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 103, agi = 35, int = 24, mnd = 26, chr = 29, dex = 35, def = 120,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 107, agi = 37, int = 25, mnd = 26, chr = 31, dex = 37, def = 123,
                         attack_skill = 92 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 100, item = 4373 },  -- woozyshroom
            },
            steal  = { 4374 },  -- sleepshroom
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [28] = 698, [29] = 735, [30] = 773, [31] = 872 }, mp = { [28] = 0, [29] = 0, [30] = 0, [31] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[77],
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orctrap',
            ids    = { 268 },
            nm     = true,
            levels = {
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34, dex = 42, def = 141,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36, dex = 42, def = 144,
                         attack_skill = 112 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 150, item = 1617 },  -- flytrap leaf
                { rate = 100, item = 17792 },  -- nikkariaoe
                { rate = 50, item = 15291 },  -- hojutsu belt
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [37] = 3000, [38] = 3000 }, mp = { [37] = 0, [38] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 180 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[41],
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Spinous Pugil',
            ids    = { 273, 274, 276, 278 },
            levels = {
                [29] = { acc = 107, eva = 101, agi = 37, int = 25, mnd = 25, chr = 27, dex = 34, def = 116,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 104, agi = 37, int = 26, mnd = 26, chr = 27, dex = 35, def = 120,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 30, dex = 37, def = 123,
                         attack_skill = 92 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 735, [30] = 773, [31] = 872 }, mp = { [29] = 0, [30] = 0, [31] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[28],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Overgrown Ivy',
            ids    = { 301 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 38, chr = 45, dex = 60, def = 185,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 39, chr = 47, dex = 62, def = 189,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47, dex = 62, def = 194,
                         attack_skill = 156 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 4500, [51] = 4500, [52] = 4500 }, mp = { [50] = 0, [51] = 0, [52] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 120 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = { 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[116] } }, { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[9] }, { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { danger[115], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[17], danger[175] } }, forced = true }, { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = danger[69], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] },
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cryptonberry Executor',
            ids    = { 302 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [68] = { acc = 281, eva = 285, agi = 85, int = 62, mnd = 45, chr = 53, dex = 81, def = 270,
                         attack_skill = 225 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 5000 }, mp = { [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regain 100; Dual Wield 30', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[197], danger[202], danger[205], danger[208], { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[210], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[210], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[210], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[210], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[210], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[210], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } }, level_ranges = { { 65, 255 } } }, { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[18] }, level_ranges = { { 48, 255 } } }, { kind = 'spell', id = 348, name = 'Kurayami Ni', summary = 'Kurayami Ni: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } }, level_ranges = { { 44, 72 } } }, { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } }, level_ranges = { { 56, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[108] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cryptonberry Assassin',
            ids    = { 303 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [65] = { acc = 269, eva = 303, agi = 80, int = 65, mnd = 43, chr = 46, dex = 84, def = 251,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            resist = { gravity = 15 },
            immune = { 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 4500 }, mp = { [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 260 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[213],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Cryptonberry Assassin',
            ids    = { 304 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [65] = { acc = 263, eva = 230, agi = 75, int = 77, mnd = 55, chr = 62, dex = 72, def = 246,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            immune = { 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 4500 }, mp = { [65] = 1862 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 300', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[197], danger[202], danger[205], danger[208], danger[214], danger[215], danger[216], danger[217], danger[218], danger[219], danger[138], danger[141], danger[146], danger[151], danger[156], danger[157], danger[220], danger[158], danger[159], danger[221], danger[162], danger[163], danger[222], danger[223] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[108] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Cryptonberry Assassin',
            ids    = { 305 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [65] = { acc = 258, eva = 227, agi = 69, int = 70, mnd = 70, chr = 73, dex = 62, def = 246,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            resist = { slow = 20 },
            immune = { 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 4500 }, mp = { [65] = 1902 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[213],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 306 },
            job    = 'blm/rdm',
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57, dex = 61, def = 222,
                         attack_skill = 196 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 227,
                         attack_skill = 199 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 232,
                         attack_skill = 203 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 74, mnd = 59, chr = 60, dex = 64, def = 237,
                         attack_skill = 207 },
                [64] = { acc = 255, eva = 233, agi = 64, int = 75, mnd = 60, chr = 62, dex = 66, def = 243,
                         attack_skill = 210 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Fire Elemental (ID 261); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [60] = 904, [61] = 927, [62] = 950, [63] = 973, [64] = 996 }, mp = { [60] = 1705, [61] = 1737, [62] = 1768, [63] = 1799, [64] = 1831 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[214], danger[215], danger[216], danger[217], danger[218], danger[219], { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[127], level_ranges = { { 43, 64 } } }, danger[138], danger[141], danger[146], danger[151], danger[156], danger[157], danger[220], danger[158], danger[159], danger[221], danger[162], danger[163], danger[222], danger[223] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[108] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberrys Avatar',
            ids    = { 307 },
            job    = 'blm/blm',
            levels = {
                [60] = { acc = 234, eva = 202, agi = 63, int = 74, mnd = 53, chr = 57, dex = 63, def = 214,
                         attack_skill = 196 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [60] = 2955 }, mp = { [60] = 1705 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, general_notes = danger[12] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Para',
            ids    = { 308, 309, 310, 311, 312 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 38, mnd = 41, chr = 45, dex = 54, def = 185,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 39, mnd = 41, chr = 47, dex = 56, def = 189,
                         attack_skill = 151 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            magic_dmg = { all = -40 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2800, [51] = 2800 }, mp = { [50] = 0, [51] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[77],
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bullheaded Grosvez',
            ids    = { 313 },
            job    = 'mnk/mnk',
            levels = {
                [45] = { acc = 166, eva = 150, agi = 37, int = 28, mnd = 43, chr = 45, dex = 57, def = 165,
                         attack_skill = 132 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 5313 }, mp = { [45] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Shoulder Tackle: Stun; Slam Dunk: Bind', notes = { 'Shoulder Tackle: Stun. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 2, name = 'Shoulder Tackle', summary = 'Shoulder Tackle: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 2 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 2 } }, removals = danger[106] }, forced = true }, { kind = 'skill', id = 607, name = 'Slam Dunk', summary = 'Slam Dunk: Bind', notes = danger[110], categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[116] }, forced = true } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[12] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Mycophile',
            ids    = { 314 },
            nm     = true,
            job    = 'drk/war',
            levels = {
                [35] = { acc = 127, eva = 118, agi = 36, int = 35, mnd = 27, chr = 28, dex = 39, def = 137,
                         attack_skill = 103 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            immune = { 'silence' },
            drops  = {
                { rate = 150, item = 14884 },  -- mycophile cuffs
            },
            steal  = { 4374 },  -- sleepshroom
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 2500 }, mp = { [35] = 943 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Frogkick: can crit; Spore: paralysis; Queasyshroom: Poison, can crit; Numbshroom: Paralysis, can crit; Shakeshroom: Disease, can crit; Silence Gas: Silence; Dark Spore: Blindness; Poison: Poison; Blind: Blindness; Virus: Plague; Paralyga: Paralysis', notes = { 'Frogkick: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Spore: paralysis. Attempts Paralysis on its target. Source targeting: single target. Possible effects: Paralysis.', 'Queasyshroom: Poison, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Numbshroom: Paralysis, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Shakeshroom: Disease, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Silence Gas: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Dark Spore: Blindness. Source targeting: cone.', 'Poison: Poison.', 'Blind: Blindness.', 'Virus: Plague.', 'Paralyga: Paralysis.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[54], danger[58], danger[62], danger[65], danger[68], danger[72], danger[75], { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[127], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[161], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 256, name = 'Virus', summary = 'Virus: Plague', notes = {  }, categories = { 'debuff' }, effects = { 'Plague' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } }, level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 356, name = 'Paralyga', summary = 'Paralyga: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 16 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 16.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } }, level_ranges = { { 1, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[108] },
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hercules Beetle',
            ids    = { 315 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [34] = { acc = 126, eva = 113, agi = 33, int = 37, mnd = 24, chr = 24, dex = 42, def = 126,
                         attack_skill = 100 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 894 },  -- beetle jaw
                { rate = 100, item = 15422 },  -- black hose
                { rate = 240, item = 846 },  -- insect wing
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [34] = 2238 }, mp = { [34] = 914 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[52],
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcfeltrap',
            ids    = { 316, 317, 318 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[41],
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
