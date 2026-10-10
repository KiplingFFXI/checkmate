-- Eastern Altepa Desert (zone 114).
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
danger[29] = { 'Sickle Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Spray: Poison. Source targeting: cone.', 'Spider Web: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[30] = { kind = 'skill', id = 810, name = 'Sickle Slash', summary = 'Sickle Slash: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[31] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[32] = { notes = danger[31], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[33] = { kind = 'skill', id = 811, name = 'Acid Spray', summary = 'Acid Spray: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[32] };
danger[34] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[35] = { notes = danger[34], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[5] };
danger[36] = { kind = 'skill', id = 812, name = 'Spider Web', summary = 'Spider Web: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[35] };
danger[37] = { danger[30], danger[33], danger[36] };
danger[38] = { value = 'Sickle Slash: can crit; Acid Spray: Poison; Spider Web: Slow', notes = danger[29], entries = danger[37], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[39] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[40] = { 'Normal activation range: 13.5 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[41] = { notes = danger[40], unknown = {  }, activation_range = 13.5, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[42] = { kind = 'skill', id = 789, name = 'Spikeball', summary = 'Spikeball: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[41] };
danger[43] = { kind = 'skill', id = 790, name = 'Shoulder Slam', summary = 'Shoulder Slam: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[44] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[45] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[46] = { danger[45] };
danger[47] = { notes = danger[44], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[46] };
danger[48] = { kind = 'skill', id = 791, name = 'Magnetite Cloud', summary = 'Magnetite Cloud: Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[47] };
danger[49] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[50] = { notes = danger[49], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[51] = { kind = 'skill', id = 792, name = 'Sandstorm', summary = 'Sandstorm: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[50] };
danger[52] = { 'Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.' };
danger[53] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[54] = { notes = danger[53], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = true } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[55] = { kind = 'skill', id = 795, name = 'Sand Trap', summary = 'Sand Trap: petrification', notes = danger[52], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[54] };
danger[56] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[57] = { notes = danger[56], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[58] = { kind = 'skill', id = 796, name = 'Jamming Wave', summary = 'Jamming Wave: Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[57] };
danger[59] = { danger[42], danger[43], danger[48], danger[51], danger[55], danger[58] };
danger[60] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence', notes = danger[39], entries = danger[59], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[61] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[62] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[63] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[64] = { danger[63] };
danger[65] = { notes = danger[62], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[64] };
danger[66] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[67] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[68] = { danger[67] };
danger[69] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[70] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[71] = { danger[70] };
danger[72] = { notes = danger[69], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[71] };
danger[73] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[72], level_ranges = { { 18, 255 } } };
danger[74] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[75] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[76] = { danger[75] };
danger[77] = { notes = danger[74], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[76] };
danger[78] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[77], level_ranges = { { 7, 255 } } };
danger[79] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' };
danger[80] = { value = 'No listed threats', notes = danger[79], entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[81] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[82] = { notes = danger[81], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[5] };
danger[83] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[84] = { notes = danger[83], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[85] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[84], level_ranges = { { 24, 71 } } };
danger[86] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[65], level_ranges = { { 24, 255 } } };
danger[87] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[88] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[89] = { danger[88] };
danger[90] = { notes = danger[87], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[89] };
danger[91] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[90], level_ranges = { { 22, 255 } } };
danger[92] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[93] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[94] = { danger[93] };
danger[95] = { notes = danger[92], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[94] };
danger[96] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[95], level_ranges = { { 20, 255 } } };
danger[97] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[98] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[99] = { danger[98] };
danger[100] = { notes = danger[97], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[99] };
danger[101] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[100], level_ranges = { { 16, 255 } } };
danger[102] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[103] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[104] = { danger[103] };
danger[105] = { notes = danger[102], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[104] };
danger[106] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[105], level_ranges = { { 27, 255 } } };
danger[107] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[108] = { notes = danger[107], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[109] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[108], level_ranges = { { 12, 255 } } };
danger[110] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[108], level_ranges = { { 25, 255 } } };
danger[111] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[112] = { notes = danger[111], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[113] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[112], level_ranges = { { 4, 255 } } };
danger[114] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[115] = { notes = danger[114], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[116] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[115], level_ranges = { { 31, 55 } } };
danger[117] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[118] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[119] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[120] = { notes = danger[118], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[119] };
danger[121] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[120], level_ranges = { { 37, 255 } } };
danger[122] = { danger[42], danger[43], danger[48], danger[51], danger[55], danger[58], danger[121] };
danger[123] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flash: Flash', notes = danger[117], entries = danger[122], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] };
danger[124] = { kind = 'skill', id = 478, name = 'Hell Slash', summary = 'Hell Slash: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] };
danger[125] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[126] = { notes = danger[125], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[5] };
danger[127] = { kind = 'skill', id = 479, name = 'Horror Cloud', summary = 'Horror Cloud: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[126] };
danger[128] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[129] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[130] = { notes = danger[129], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[131] = { kind = 'skill', id = 484, name = 'Black Cloud', summary = 'Black Cloud: Blindness', notes = danger[128], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[130] };
danger[132] = { 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.' };
danger[133] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[134] = { notes = danger[133], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[135] = { kind = 'skill', id = 485, name = 'Blood Saber', summary = 'Blood Saber: HP drain', notes = danger[132], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[134] };
danger[136] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[137] = { notes = danger[136], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[46] };
danger[138] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[137], level_ranges = { { 21, 255 } } };
danger[139] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[140] = { notes = danger[139], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[141] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[140], level_ranges = { { 43, 64 } } };
danger[142] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[143] = { notes = danger[142], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[61] };
danger[144] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[143], level_ranges = { { 45, 255 } } };
danger[145] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 41, 255 } } };
danger[146] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[147] = { danger[42], danger[43], danger[48], danger[51], danger[55], danger[58], danger[141], danger[85], danger[86], danger[91], danger[96], danger[73], danger[101], danger[106], danger[109], danger[110], danger[144], danger[113], danger[78], danger[145], danger[116] };
danger[148] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = danger[146], entries = danger[147], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] };
danger[149] = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[150] = { 'Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.' };
danger[151] = { 'Normal activation range: 13.5 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[152] = { notes = danger[151], unknown = {  }, activation_range = 13.5, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } } };
danger[153] = { kind = 'skill', id = 591, name = 'Bomb Toss', summary = 'Bomb Toss: fire damage', notes = danger[150], categories = { 'other' }, effects = {  }, details = danger[152] };
danger[154] = { danger[153] };
danger[155] = { value = 'Bomb Toss: fire damage', notes = danger[149], entries = danger[154], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[156] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[157] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence', notes = danger[156], entries = danger[59], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] };
danger[158] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[140], level_ranges = { { 46, 255 } } };
danger[159] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[84], level_ranges = { { 26, 50 } } };
danger[160] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[108], level_ranges = { { 10, 255 } } };
danger[161] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[108], level_ranges = { { 20, 255 } } };
danger[162] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[143], level_ranges = { { 37, 255 } } };
danger[163] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 30, 55 } } };
danger[164] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[77], level_ranges = { { 20, 255 } } };
danger[165] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[166] = { notes = danger[165], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[10] };
danger[167] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[166], level_ranges = { { 43, 255 } } };
danger[168] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[169] = { notes = danger[168], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[68] };
danger[170] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[169], level_ranges = { { 41, 255 } } };
danger[171] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[172] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[173] = { danger[172] };
danger[174] = { notes = danger[171], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[173] };
danger[175] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[174], level_ranges = { { 35, 255 } } };
danger[176] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[177] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[178] = { danger[177] };
danger[179] = { notes = danger[176], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[178] };
danger[180] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[179], level_ranges = { { 37, 255 } } };
danger[181] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[182] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[183] = { danger[182] };
danger[184] = { notes = danger[181], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[183] };
danger[185] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[184], level_ranges = { { 39, 255 } } };
danger[186] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[187] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[188] = { danger[187] };
danger[189] = { notes = danger[186], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[188] };
danger[190] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[189], level_ranges = { { 31, 255 } } };
danger[191] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[192] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[193] = { danger[192] };
danger[194] = { notes = danger[191], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[193] };
danger[195] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[194], level_ranges = { { 33, 255 } } };
danger[196] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[108], level_ranges = { { 45, 255 } } };
danger[197] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[198] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[199] = { notes = danger[198], unknown = {  }, activation_range = 8.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[76] };
danger[200] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' };
danger[201] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flash: Flash', notes = danger[200], entries = danger[122], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[66] };
danger[202] = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' };
danger[203] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[82], level_ranges = { { 13, 255 } } };
danger[204] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[205] = { notes = danger[204], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[206] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[207] = { notes = danger[206], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[208] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[108], level_ranges = { { 50, 255 } } };
danger[209] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[108], level_ranges = { { 52, 255 } } };
danger[210] = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[211] = { value = 'Bomb Toss: fire damage', notes = danger[210], entries = danger[154], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] };
danger[212] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[213] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[108], level_ranges = { { 54, 255 } } };
danger[214] = { danger[42], danger[43], danger[48], danger[51], danger[55], danger[58], danger[208], danger[209], danger[213], danger[141], danger[85], danger[86], danger[91], danger[96], danger[73], danger[101], danger[106], danger[109], danger[110], danger[144], danger[113], danger[78], danger[145], danger[116] };
danger[215] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = danger[212], entries = danger[214], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Dune Widow', 'Giant Spider', 'Tsuchigumo' } },
        [2] = { sight = { 'Desert Dhalmel' } },
        [3] = { sight = { 'Sand Beetle' } },
        [4] = {
            sound = { 'Antican Auxiliarius', 'Antican Centurio', 'Antican Decurio', 'Antican Faber',
                      'Antican Funditor', 'Antican Sagittarius', 'Antican Speculator', 'Antican Veles',
                      'Centurio XII-I', 'Decurio I-III' },
        },
        [5] = { sound = { 'Flesh Eater' } },
        [6] = { sight = { 'Goblin Digger', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber', 'Goblin Trader' } },
        [7] = {
            sound = { 'Antican Auxiliarius', 'Antican Centurio', 'Antican Decurio', 'Antican Faber',
                      'Antican Funditor', 'Antican Sagittarius', 'Antican Speculator', 'Antican Veles',
                      'Decurio I-III' },
        },
        [8] = { sound = { 'Giant Spider', 'Tsuchigumo' } },
        [9] = { sight = { 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber', 'Goblin Trader' } },
        [10] = {
            sound = { 'Antican Auxiliarius', 'Antican Centurio', 'Antican Decurio', 'Antican Faber',
                      'Antican Funditor', 'Antican Sagittarius', 'Antican Speculator', 'Antican Veles',
                      'Centurio XII-I' },
        },
        [11] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin White Mage' },
        },
        [12] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior' },
        },
        [13] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [14] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [15] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [16] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [17] = {
            sight = { 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [18] = {
            sight = { 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [19] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [20] = {
            sound = { 'Centurio XIII-V', 'Contantican Paladin', 'Contantican Ranger', 'Contantican Warrior',
                      'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [21] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Ranger', 'Contantican Warrior',
                      'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [22] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Warrior',
                      'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [23] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [24] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [25] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV',
                      'Hastatus XIII-XCVI', 'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Triarius XIII-LIX' },
        },
        [26] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV',
                      'Hastatus XIII-XCVI', 'Hastatus XIII-XXV', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [27] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV',
                      'Hastatus XIII-XCVI', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [28] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [29] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV',
                      'Hastatus XIII-XCVI', 'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI' },
        },
        [30] = {
            sound = { 'Centurio XIII-V', 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger',
                      'Contantican Warrior', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
        [31] = {
            sound = { 'Contantican Black Mage', 'Contantican Paladin', 'Contantican Ranger', 'Contantican Warrior',
                      'Decurio XIII-LV', 'Hastatus XIII-CXXVIII', 'Hastatus XIII-LXXV', 'Hastatus XIII-XCVI',
                      'Hastatus XIII-XXV', 'Princeps XIII-LXXXIX', 'Sagittarius XIII-XXVI', 'Triarius XIII-LIX' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Antican Auxiliarius'] = { id = 55, name = 'Antica' },
        ['Antican Centurio'] = { id = 55, name = 'Antica' },
        ['Antican Decurio'] = { id = 55, name = 'Antica' },
        ['Antican Faber'] = { id = 55, name = 'Antica' },
        ['Antican Funditor'] = { id = 55, name = 'Antica' },
        ['Antican Sagittarius'] = { id = 55, name = 'Antica' },
        ['Antican Speculator'] = { id = 55, name = 'Antica' },
        ['Antican Veles'] = { id = 55, name = 'Antica' },
        ['Centurio XII-I'] = { id = 55, name = 'Antica' },
        ['Centurio XIII-V'] = { id = 55, name = 'Antica' },
        ['Contantican Black Mage'] = { id = 55, name = 'Antica' },
        ['Contantican Paladin'] = { id = 55, name = 'Antica' },
        ['Contantican Ranger'] = { id = 55, name = 'Antica' },
        ['Contantican Warrior'] = { id = 55, name = 'Antica' },
        ['Decurio I-III'] = { id = 55, name = 'Antica' },
        ['Decurio XIII-LV'] = { id = 55, name = 'Antica' },
        ['Desert Dhalmel'] = { id = 44, name = 'Dhalmel' },
        ['Dune Widow'] = { id = 195, name = 'Spider' },
        ['Flesh Eater'] = { id = 10, name = 'Worm' },
        ['Giant Spider'] = { id = 195, name = 'Spider' },
        ['Goblin Digger'] = { id = 58, name = 'Goblin' },
        ['Goblin Poacher'] = { id = 58, name = 'Goblin' },
        ['Goblin Reaper'] = { id = 58, name = 'Goblin' },
        ['Goblin Robber'] = { id = 58, name = 'Goblin' },
        ['Goblin Trader'] = { id = 58, name = 'Goblin' },
        ['Hastatus XIII-CXXVIII'] = { id = 55, name = 'Antica' },
        ['Hastatus XIII-LXXV'] = { id = 55, name = 'Antica' },
        ['Hastatus XIII-XCVI'] = { id = 55, name = 'Antica' },
        ['Hastatus XIII-XXV'] = { id = 55, name = 'Antica' },
        ['Hobgoblin Beastmaster'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Black Mage'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Dark Knight'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Ranger'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Red Mage'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Thief'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin Warrior'] = { id = 58, name = 'Goblin' },
        ['Hobgoblin White Mage'] = { id = 58, name = 'Goblin' },
        ['Princeps XIII-LXXXIX'] = { id = 55, name = 'Antica' },
        ['Sagittarius XIII-XXVI'] = { id = 55, name = 'Antica' },
        ['Sand Beetle'] = { id = 182, name = 'Beetle' },
        ['Triarius XIII-LIX'] = { id = 55, name = 'Antica' },
        ['Tsuchigumo'] = { id = 195, name = 'Spider' },
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
            name   = 'Cutter',
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 740, [31] = 835, [32] = 916, [33] = 993 }, mp = { [30] = 797, [31] = 826, [32] = 855, [33] = 884 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Ironshell',
            ids    = { 3 },
            job    = 'pld/pld',
            levels = {
                [36] = { acc = 127, eva = 115, agi = 25, int = 27, mnd = 38, chr = 38, dex = 32, def = 156,
                         attack_skill = 106 },
                [37] = { acc = 130, eva = 117, agi = 25, int = 27, mnd = 38, chr = 38, dex = 32, def = 159,
                         attack_skill = 109 },
                [38] = { acc = 133, eva = 121, agi = 26, int = 27, mnd = 38, chr = 38, dex = 33, def = 162,
                         attack_skill = 112 },
                [39] = { acc = 137, eva = 124, agi = 26, int = 28, mnd = 40, chr = 40, dex = 35, def = 167,
                         attack_skill = 115 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [36] = 1232, [37] = 1309, [38] = 1390, [39] = 1467 }, mp = { [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Makara',
            ids    = { 4 },
            levels = {
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24, dex = 30, def = 114,
                         attack_skill = 86 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24, dex = 31, def = 118,
                         attack_skill = 89 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 735, [30] = 773 }, mp = { [29] = 0, [30] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Bigclaw',
            ids    = { 5 },
            job    = 'pld/pld',
            levels = {
                [48] = { acc = 168, eva = 152, agi = 33, int = 35, mnd = 50, chr = 50, dex = 42, def = 196,
                         attack_skill = 141 },
                [49] = { acc = 171, eva = 155, agi = 33, int = 35, mnd = 52, chr = 52, dex = 42, def = 200,
                         attack_skill = 144 },
                [50] = { acc = 175, eva = 158, agi = 33, int = 36, mnd = 54, chr = 54, dex = 45, def = 218,
                         attack_skill = 147 },
                [51] = { acc = 181, eva = 164, agi = 36, int = 38, mnd = 56, chr = 56, dex = 47, def = 223,
                         attack_skill = 151 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [48] = 2231, [49] = 2308, [50] = 2448, [51] = 2530 }, mp = { [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Giant Spider',
            ids    = { 6, 7, 8, 10, 11, 14, 19, 24, 27, 35, 36, 40, 41, 42, 46, 47, 51, 52, 56, 57, 60, 61, 64, 65,
                       71, 72, 77, 78, 82, 83, 86, 91, 96, 102, 109, 115, 121, 122, 128, 138, 165, 173, 227, 235,
                       237, 246, 253, 260, 268, 276, 283 },
            levels = {
                [30] = { acc = 110, eva = 101, agi = 31, int = 25, mnd = 25, chr = 22, dex = 35, def = 117,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 27, mnd = 27, chr = 24, dex = 37, def = 121,
                         attack_skill = 92 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 27, mnd = 27, chr = 24, dex = 37, def = 123,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 28, mnd = 28, chr = 25, dex = 38, def = 127,
                         attack_skill = 97 },
                [34] = { acc = 125, eva = 115, agi = 36, int = 29, mnd = 29, chr = 25, dex = 40, def = 130,
                         attack_skill = 100 },
            },
            ph_for = { [235] = { 236 } },
            ph_rules = {
                [235] = {
                    [236] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 10, item = 838 },  -- spider web
            },
            steal  = { 838 },  -- spider web
            links  = 1,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 773, [31] = 872, [32] = 954, [33] = 1032, [34] = 1115 }, mp = { [30] = 0, [31] = 0, [32] = 0, [33] = 0, [34] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[38],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Desert Dhalmel',
            ids    = { 9, 13, 38, 44, 49, 54, 58, 75, 80, 85, 88, 89, 93, 94, 99, 100, 105, 106, 114, 118, 119, 185,
                       193, 203, 264, 272, 280, 287, 292, 299, 307, 314, 341, 347, 351 },
            levels = {
                [39] = { acc = 140, eva = 130, agi = 38, int = 31, mnd = 31, chr = 35, dex = 40, def = 147,
                         attack_skill = 115 },
                [40] = { acc = 143, eva = 133, agi = 38, int = 31, mnd = 31, chr = 35, dex = 40, def = 150,
                         attack_skill = 118 },
                [41] = { acc = 148, eva = 138, agi = 42, int = 33, mnd = 33, chr = 37, dex = 44, def = 155,
                         attack_skill = 121 },
                [42] = { acc = 151, eva = 140, agi = 42, int = 33, mnd = 33, chr = 37, dex = 44, def = 157,
                         attack_skill = 123 },
                [43] = { acc = 154, eva = 143, agi = 42, int = 33, mnd = 33, chr = 38, dex = 44, def = 160,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 147, agi = 44, int = 34, mnd = 34, chr = 39, dex = 47, def = 164,
                         attack_skill = 129 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 100, item = 857 },  -- dhalmel hide
                { rate = 50, item = 857 },  -- dhalmel hide
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 50, item = 857 },  -- dhalmel hide
                { rate = 100, item = 893 },  -- giant femur
                { rate = 50, item = 938 },  -- sprig of papaka grass
            },
            links  = 2,
            info = {
                family = { value = 'Dhalmel / Beast', notes = { 'Source species: Dhalmel (ID 95); family ID 44.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [39] = 1514, [40] = 1641, [41] = 1719, [42] = 1802, [43] = 1885, [44] = 1968 }, mp = { [39] = 0, [40] = 0, [41] = 0, [42] = 0, [43] = 0, [44] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sonic Wave: Defense down; Stomping: can crit; Cold Stare: Silence', notes = { 'Sonic Wave: Defense down. Source targeting: cone.', 'Stomping: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Cold Stare: Silence. Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 280, name = 'Sonic Wave', summary = 'Sonic Wave: Defense down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 281, name = 'Stomping', summary = 'Stomping: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] }, { kind = 'skill', id = 284, name = 'Cold Stare', summary = 'Cold Stare: Silence', notes = { 'Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Healing Breeze', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 581, name = 'Healing Breeze', level = 16, min_skill = 20, skill_ids = { 287 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sand Beetle',
            ids    = { 12, 15, 16, 20, 21, 25, 28, 31, 32, 37, 43, 48, 53, 62, 66, 73, 74, 79, 84, 87, 92, 97, 98,
                       103, 104, 110, 111, 116, 117, 123, 124, 129, 130, 139, 146, 147, 153, 163, 166, 167, 174,
                       175, 181, 182, 191, 192, 198, 199, 208, 215, 219, 220, 228, 229, 238, 239, 247, 248, 254,
                       255, 261, 269, 277, 284, 285 },
            job    = 'pld/pld',
            levels = {
                [36] = { acc = 128, eva = 115, agi = 25, int = 25, mnd = 36, chr = 36, dex = 35, def = 157,
                         attack_skill = 106 },
                [37] = { acc = 131, eva = 117, agi = 25, int = 25, mnd = 36, chr = 36, dex = 35, def = 160,
                         attack_skill = 109 },
                [38] = { acc = 135, eva = 121, agi = 26, int = 26, mnd = 37, chr = 37, dex = 36, def = 163,
                         attack_skill = 112 },
                [39] = { acc = 139, eva = 124, agi = 26, int = 26, mnd = 38, chr = 38, dex = 38, def = 168,
                         attack_skill = 115 },
                [40] = { acc = 142, eva = 127, agi = 27, int = 27, mnd = 38, chr = 38, dex = 38, def = 171,
                         attack_skill = 118 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 100, item = 889 },  -- beetle shell
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 3,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [36] = 1232, [37] = 1309, [38] = 1390, [39] = 1467, [40] = 1588 }, mp = { [36] = 973, [37] = 1002, [38] = 1032, [39] = 1062, [40] = 1092 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hi-Freq Field: Evasion down; Spoil: STR down', notes = { 'Hi-Freq Field: Evasion down. Source targeting: cone.', 'Spoil: STR down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 339, name = 'Hi-Freq Field', summary = 'Hi-Freq Field: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 343, name = 'Spoil', summary = 'Spoil: STR down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[10] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Auxiliarius',
            ids    = { 17, 18, 22, 23, 26, 29, 33, 34 },
            levels = {
                [35] = { acc = 128, eva = 118, agi = 36, int = 27, mnd = 23, chr = 30, dex = 41, def = 133,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 122, agi = 38, int = 28, mnd = 23, chr = 32, dex = 42, def = 137,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 124, agi = 38, int = 29, mnd = 25, chr = 32, dex = 43, def = 139,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 127, agi = 38, int = 29, mnd = 25, chr = 33, dex = 43, def = 142,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 131, agi = 40, int = 31, mnd = 26, chr = 35, dex = 45, def = 146,
                         attack_skill = 115 },
            },
            spawn_levels = { [17] = { 35, 38 }, [18] = { 35, 38 }, [22] = { 35, 38 }, [23] = { 35, 38 },
                             [26] = { 36, 39 }, [29] = { 35, 38 }, [33] = { 37, 38 }, [34] = { 36, 39 } },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 10, item = 640 },  -- chunk of copper ore
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1193, [36] = 1275, [37] = 1353, [38] = 1436, [39] = 1514 }, mp = { [35] = 0, [36] = 0, [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Diatryma',
            ids    = { 30, 59, 197, 207, 267, 275, 353 },
            levels = {
                [47] = { acc = 170, eva = 159, agi = 52, int = 40, mnd = 40, chr = 44, dex = 52, def = 180,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 162, agi = 53, int = 40, mnd = 40, chr = 45, dex = 53, def = 183,
                         attack_skill = 141 },
                [49] = { acc = 178, eva = 167, agi = 56, int = 42, mnd = 42, chr = 46, dex = 56, def = 186,
                         attack_skill = 144 },
                [50] = { acc = 181, eva = 170, agi = 57, int = 44, mnd = 44, chr = 48, dex = 57, def = 191,
                         attack_skill = 147 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            weapon_dmg = { slashing = -25, piercing = 25, blunt = -25 },
            drops  = {
                { rate = 150, item = 5209 },  -- slice of diatryma meat
                { rate = 100, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Greater Bird / Bird', notes = { 'Source species: Roc (ID 190); family ID 84.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 2212, [48] = 2295, [49] = 2373, [50] = 2521 }, mp = { [47] = 0, [48] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Blind Vortex: Blindness; Dread Dive: Stun', notes = { 'Blind Vortex: Blindness. Source targeting: single target.', 'Dread Dive: Stun. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 399, name = 'Blind Vortex', summary = 'Blind Vortex: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 401, name = 'Dread Dive', summary = 'Dread Dive: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[61] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Feather Barrier', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 574, name = 'Feather Barrier', level = 56, min_skill = 152, skill_ids = { 402 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 39, 45, 50, 55, 63, 90 },
            job    = 'blm/rdm',
            levels = {
                [47] = { acc = 168, eva = 151, agi = 47, int = 55, mnd = 43, chr = 45, dex = 48, def = 160,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45, dex = 48, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45, dex = 49, def = 166,
                         attack_skill = 144 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 1966, [48] = 2043, [49] = 2116 }, mp = { [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fire weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Burn: Burn', notes = { 'Burn: Burn.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[65], level_ranges = { { 24, 50 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[66] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Antican Funditor',
            ids    = { 67, 131, 136, 149, 168, 230, 278 },
            job    = 'rng/rng',
            levels = {
                [35] = { acc = 148, eva = 110, agi = 43, int = 30, mnd = 28, chr = 30, dex = 37, def = 123,
                         attack_skill = 103 },
                [36] = { acc = 152, eva = 113, agi = 44, int = 32, mnd = 29, chr = 32, dex = 38, def = 127,
                         attack_skill = 106 },
                [37] = { acc = 155, eva = 117, agi = 46, int = 32, mnd = 30, chr = 32, dex = 39, def = 129,
                         attack_skill = 109 },
                [38] = { acc = 158, eva = 119, agi = 46, int = 33, mnd = 30, chr = 33, dex = 39, def = 132,
                         attack_skill = 112 },
                [39] = { acc = 163, eva = 123, agi = 49, int = 35, mnd = 32, chr = 35, dex = 42, def = 136,
                         attack_skill = 115 },
            },
            spawn_levels = { [67] = { 36, 39 }, [131] = { 35, 38 }, [136] = { 35, 38 }, [149] = { 35, 38 },
                             [168] = { 36, 39 }, [230] = { 35, 38 }, [278] = { 36, 39 } },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 10 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 10, item = 640 },  -- chunk of copper ore
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 10, item = 640 },  -- chunk of copper ore
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1057, [36] = 1134, [37] = 1208, [38] = 1285, [39] = 1359 }, mp = { [35] = 0, [36] = 0, [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flesh Eater EAD',
            ids    = { 68, 69, 126, 134, 142, 143, 151, 157, 169, 177, 186, 194, 204, 231, 240, 241, 249, 250, 258,
                       265, 266, 273, 274, 281, 288, 355, 357, 359 },
            job    = 'blm/rdm',
            levels = {
                [37] = { acc = 132, eva = 119, agi = 37, int = 46, mnd = 33, chr = 32, dex = 37, def = 127,
                         attack_skill = 109 },
                [38] = { acc = 135, eva = 121, agi = 37, int = 46, mnd = 34, chr = 33, dex = 37, def = 130,
                         attack_skill = 112 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 48, mnd = 35, chr = 35, dex = 40, def = 134,
                         attack_skill = 115 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 48, mnd = 35, chr = 35, dex = 40, def = 137,
                         attack_skill = 118 },
                [41] = { acc = 147, eva = 133, agi = 42, int = 52, mnd = 39, chr = 38, dex = 43, def = 141,
                         attack_skill = 121 },
                [42] = { acc = 150, eva = 135, agi = 42, int = 52, mnd = 39, chr = 38, dex = 43, def = 143,
                         attack_skill = 123 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            steal  = { 17296 },  -- pebble
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 5,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [37] = 1178, [38] = 1255, [39] = 1328, [40] = 1436, [41] = 1509, [42] = 1586 }, mp = { [37] = 1002, [38] = 1032, [39] = 1062, [40] = 1092, [41] = 1122, [42] = 1152 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '18:00-06:00; Respawn 5 minutes', notes = { 'Source spawn window: 18:00-06:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Full-Force Blow: can crit; Gastric Bomb: Attack down; Sandspin: Accuracy down; Tremors: DEX down; Mp Absorption: MP drain; Sound Vacuum Worm: Silence; Rasp: Rasp; Bind: bind', notes = { 'Full-Force Blow: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Gastric Bomb: Attack down. Source targeting: single target.', 'Sandspin: Accuracy down. Source targeting: area around the monster.', 'Tremors: DEX down. Source targeting: area around the monster.', 'Mp Absorption: MP drain. Source targeting: single target.', 'Sound Vacuum Worm: Silence. Source targeting: single target.', 'Rasp: Rasp.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 424, name = 'Full-Force Blow', summary = 'Full-Force Blow: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] }, { kind = 'skill', id = 425, name = 'Gastric Bomb', summary = 'Gastric Bomb: Attack down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 426, name = 'Sandspin', summary = 'Sandspin: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } } } } }, { kind = 'skill', id = 427, name = 'Tremors', summary = 'Tremors: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[68] } }, { kind = 'skill', id = 428, name = 'Mp Absorption', summary = 'Mp Absorption: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 429, name = 'Sound Vacuum Worm', summary = 'Sound Vacuum Worm: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, danger[73], danger[78] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] },
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sabotender',
            ids    = { 70, 76, 81, 127, 144, 152, 172, 180, 189, 234, 244, 251, 259, 282, 301, 327 },
            job    = 'mnk/mnk',
            levels = {
                [42] = { acc = 151, eva = 141, agi = 36, int = 29, mnd = 38, chr = 40, dex = 45, def = 151,
                         attack_skill = 123 },
                [43] = { acc = 155, eva = 144, agi = 36, int = 29, mnd = 38, chr = 41, dex = 46, def = 155,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 147, agi = 37, int = 29, mnd = 40, chr = 42, dex = 47, def = 158,
                         attack_skill = 129 },
                [45] = { acc = 162, eva = 151, agi = 39, int = 30, mnd = 41, chr = 43, dex = 48, def = 162,
                         attack_skill = 132 },
                [46] = { acc = 166, eva = 155, agi = 40, int = 32, mnd = 40, chr = 44, dex = 50, def = 165,
                         attack_skill = 135 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 4509 },  -- flask of distilled water
                { rate = 240, item = 1817 },  -- cactus arm
                { rate = 100, item = 916 },  -- cactuar needle
                { rate = 100, item = 1663 },  -- arnica root
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1920, [43] = 2005, [44] = 2089, [45] = 2168, [46] = 2253 }, mp = { [42] = 0, [43] = 0, [44] = 0, [45] = 0, [46] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[80],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 95, 101, 107, 120, 145, 245, 252 },
            job    = 'blm/rdm',
            levels = {
                [47] = { acc = 168, eva = 151, agi = 47, int = 55, mnd = 43, chr = 45, dex = 48, def = 160,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45, dex = 48, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45, dex = 49, def = 166,
                         attack_skill = 144 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Earth Elemental (ID 260); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 1966, [48] = 2043, [49] = 2116 }, mp = { [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Earth weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Slow: slow; Rasp: Rasp', notes = { 'Slow: slow. Possible effects: Slow.', 'Rasp: Rasp.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[82], level_ranges = { { 13, 74 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[72], level_ranges = { { 18, 50 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[66] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Antican Faber',
            ids    = { 112, 113, 135, 148, 154 },
            job    = 'blm/blm',
            levels = {
                [35] = { acc = 128, eva = 107, agi = 36, int = 43, mnd = 26, chr = 32, dex = 41, def = 121,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 110, agi = 38, int = 44, mnd = 27, chr = 34, dex = 42, def = 124,
                         attack_skill = 106 },
                [37] = { acc = 135, eva = 113, agi = 38, int = 46, mnd = 28, chr = 34, dex = 43, def = 126,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 115, agi = 38, int = 46, mnd = 29, chr = 34, dex = 43, def = 130,
                         attack_skill = 112 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 10, item = 640 },  -- chunk of copper ore
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 10, item = 640 },  -- chunk of copper ore
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1013, [36] = 1088, [37] = 1161, [38] = 1237 }, mp = { [35] = 943, [36] = 973, [37] = 1002, [38] = 1032 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[42], danger[43], danger[48], danger[51], danger[55], danger[58], danger[85], danger[86], danger[91], danger[96], danger[73], danger[101], danger[106], danger[109], danger[110], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 20, 40 } } }, danger[113], danger[78], danger[116] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Decurio',
            ids    = { 125, 132, 133, 137, 140, 141, 150, 155, 156, 184, 256, 257, 262, 263, 270, 271, 279, 286 },
            job    = 'pld/pld',
            levels = {
                [44] = { acc = 157, eva = 141, agi = 32, int = 32, mnd = 41, chr = 47, dex = 44, def = 180,
                         attack_skill = 129 },
                [45] = { acc = 160, eva = 144, agi = 32, int = 32, mnd = 42, chr = 47, dex = 45, def = 184,
                         attack_skill = 132 },
                [46] = { acc = 164, eva = 148, agi = 34, int = 34, mnd = 43, chr = 48, dex = 46, def = 187,
                         attack_skill = 135 },
                [47] = { acc = 167, eva = 150, agi = 35, int = 35, mnd = 43, chr = 49, dex = 46, def = 190,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 35, int = 35, mnd = 44, chr = 50, dex = 48, def = 193,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 156, agi = 35, int = 35, mnd = 47, chr = 52, dex = 48, def = 197,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1909, [45] = 1986, [46] = 2068, [47] = 2149, [48] = 2231, [49] = 2308 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[123],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Veles',
            ids    = { 158, 159, 160 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 35, chr = 45, dex = 60, def = 183,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 188,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 1540 },  -- dhalmel leather missive
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688 }, mp = { [50] = 0, [51] = 0, [52] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Centurio',
            ids    = { 161, 162, 164 },
            job    = 'pld/pld',
            levels = {
                [50] = { acc = 178, eva = 160, agi = 36, int = 36, mnd = 48, chr = 54, dex = 51, def = 215,
                         attack_skill = 147 },
                [51] = { acc = 184, eva = 165, agi = 38, int = 38, mnd = 50, chr = 56, dex = 53, def = 220,
                         attack_skill = 151 },
                [52] = { acc = 189, eva = 170, agi = 38, int = 38, mnd = 50, chr = 56, dex = 53, def = 225,
                         attack_skill = 156 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 1540 },  -- dhalmel leather missive
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2448, [51] = 2530, [52] = 2612 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[123],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lost Soul war',
            ids    = { 170, 178, 179, 195, 196, 205, 225, 232, 242, 300, 315, 325, 342, 348 },
            levels = {
                [44] = { acc = 160, eva = 148, agi = 47, int = 34, mnd = 31, chr = 39, dex = 50, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 163, eva = 151, agi = 47, int = 36, mnd = 34, chr = 40, dex = 50, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 167, eva = 155, agi = 48, int = 36, mnd = 34, chr = 40, dex = 52, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 157, agi = 49, int = 37, mnd = 34, chr = 41, dex = 52, def = 173,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 37, mnd = 35, chr = 42, dex = 53, def = 176,
                         attack_skill = 141 },
            },
            spawn_levels = { [179] = { 45, 47 }, [195] = { 45, 47 }, [205] = { 45, 47 }, [325] = { 45, 47 },
                             [348] = { 47, 47 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1968, [45] = 2046, [46] = 2129, [47] = 2212, [48] = 2295 }, mp = { [44] = 0, [45] = 0, [46] = 0, [47] = 0, [48] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[124], danger[127], danger[131], danger[135] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lost Soul blm',
            ids    = { 171, 187, 188, 206, 226, 233, 243, 308, 316, 317, 326, 352 },
            job    = 'blm/blm',
            levels = {
                [44] = { acc = 160, eva = 134, agi = 47, int = 54, mnd = 36, chr = 43, dex = 50, def = 150,
                         attack_skill = 129 },
                [45] = { acc = 163, eva = 137, agi = 47, int = 55, mnd = 38, chr = 43, dex = 50, def = 154,
                         attack_skill = 132 },
                [46] = { acc = 167, eva = 140, agi = 48, int = 55, mnd = 38, chr = 42, dex = 52, def = 157,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 143, agi = 49, int = 57, mnd = 38, chr = 45, dex = 52, def = 159,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 146, agi = 50, int = 57, mnd = 40, chr = 45, dex = 53, def = 162,
                         attack_skill = 141 },
            },
            spawn_levels = { [171] = { 45, 47 }, [187] = { 45, 47 }, [188] = { 45, 48 }, [226] = { 45, 47 },
                             [233] = { 45, 47 }, [243] = { 45, 47 }, [316] = { 45, 47 }, [352] = { 45, 47 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1708, [45] = 1781, [46] = 1856, [47] = 1932, [48] = 2008 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Gravity: Weight; Poison II: Poison; Poisonga: area poison; Frost: Frost; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Gravity: Weight.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Frost: Frost.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[124], danger[127], danger[131], danger[135], danger[138], danger[141], { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[84], level_ranges = { { 24, 69 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[90], level_ranges = { { 22, 50 } } }, danger[109], { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[108], level_ranges = { { 25, 82 } } }, danger[144], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 20, 255 } } }, danger[113], danger[78], danger[145], danger[116] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Sagittarius',
            ids    = { 176, 200, 201, 211, 218, 222 },
            job    = 'rng/rng',
            levels = {
                [44] = { acc = 181, eva = 138, agi = 54, int = 39, mnd = 37, chr = 39, dex = 48, def = 153,
                         attack_skill = 129 },
                [45] = { acc = 184, eva = 141, agi = 55, int = 40, mnd = 38, chr = 40, dex = 48, def = 156,
                         attack_skill = 132 },
                [46] = { acc = 187, eva = 143, agi = 55, int = 40, mnd = 37, chr = 40, dex = 48, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 191, eva = 147, agi = 57, int = 41, mnd = 39, chr = 41, dex = 50, def = 162,
                         attack_skill = 138 },
                [48] = { acc = 194, eva = 149, agi = 57, int = 42, mnd = 39, chr = 42, dex = 51, def = 165,
                         attack_skill = 141 },
                [49] = { acc = 197, eva = 153, agi = 58, int = 42, mnd = 40, chr = 42, dex = 51, def = 168,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 50, item = 17320 },  -- iron arrow
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1769, [45] = 1843, [46] = 1920, [47] = 1997, [48] = 2074, [49] = 2148 }, mp = { [44] = 0, [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Speculator',
            ids    = { 183, 209, 210, 216, 217, 221 },
            job    = 'blm/blm',
            levels = {
                [44] = { acc = 161, eva = 134, agi = 47, int = 54, mnd = 33, chr = 43, dex = 52, def = 148,
                         attack_skill = 129 },
                [45] = { acc = 164, eva = 137, agi = 47, int = 55, mnd = 35, chr = 43, dex = 52, def = 153,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 140, agi = 48, int = 55, mnd = 35, chr = 42, dex = 54, def = 156,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 143, agi = 49, int = 57, mnd = 35, chr = 45, dex = 54, def = 158,
                         attack_skill = 138 },
                [48] = { acc = 175, eva = 146, agi = 50, int = 57, mnd = 36, chr = 45, dex = 56, def = 161,
                         attack_skill = 141 },
                [49] = { acc = 179, eva = 150, agi = 52, int = 58, mnd = 37, chr = 45, dex = 58, def = 165,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1426 },  -- warriors testimony
                { rate = 50, item = 1118 },  -- antican pauldron
                { rate = 10, item = 645 },  -- chunk of darksteel ore
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1708, [45] = 1781, [46] = 1856, [47] = 1932, [48] = 2008, [49] = 2081 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[148],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Robber',
            ids    = { 202, 223, 320, 321, 328, 331, 332, 335, 340, 349 },
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
            links  = 6,
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
                dangers = danger[155],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Centurio XII-I',
            ids    = { 212 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [56] = { acc = 248, eva = 188, agi = 70, int = 50, mnd = 48, chr = 50, dex = 61, def = 204,
                         attack_skill = 176 },
                [57] = { acc = 254, eva = 192, agi = 71, int = 50, mnd = 49, chr = 50, dex = 62, def = 209,
                         attack_skill = 181 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            magic_dmg = { all = -50 },
            weapon_guard = { physical = -50, ranged = -50 },
            drops  = {
                { rate = 240, item = 14806 },  -- intruder earring
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 5000, [57] = 5000 }, mp = { [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[157],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Antican Decurio',
            ids    = { 213 },
            job    = 'pld/pld',
            levels = {
                [44] = { acc = 157, eva = 141, agi = 32, int = 32, mnd = 41, chr = 47, dex = 44, def = 180,
                         attack_skill = 129 },
                [45] = { acc = 160, eva = 144, agi = 32, int = 32, mnd = 42, chr = 47, dex = 45, def = 184,
                         attack_skill = 132 },
                [46] = { acc = 164, eva = 148, agi = 34, int = 34, mnd = 43, chr = 48, dex = 46, def = 187,
                         attack_skill = 135 },
                [47] = { acc = 167, eva = 150, agi = 35, int = 35, mnd = 43, chr = 49, dex = 46, def = 190,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 35, int = 35, mnd = 44, chr = 50, dex = 48, def = 193,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 156, agi = 35, int = 35, mnd = 47, chr = 52, dex = 48, def = 197,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1909, [45] = 1986, [46] = 2068, [47] = 2149, [48] = 2231, [49] = 2308 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[123],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Speculator',
            ids    = { 214 },
            job    = 'blm/blm',
            levels = {
                [44] = { acc = 161, eva = 134, agi = 47, int = 54, mnd = 33, chr = 43, dex = 52, def = 148,
                         attack_skill = 129 },
                [45] = { acc = 164, eva = 137, agi = 47, int = 55, mnd = 35, chr = 43, dex = 52, def = 153,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 140, agi = 48, int = 55, mnd = 35, chr = 42, dex = 54, def = 156,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 143, agi = 49, int = 57, mnd = 35, chr = 45, dex = 54, def = 158,
                         attack_skill = 138 },
                [48] = { acc = 175, eva = 146, agi = 50, int = 57, mnd = 36, chr = 45, dex = 56, def = 161,
                         attack_skill = 141 },
                [49] = { acc = 179, eva = 150, agi = 52, int = 58, mnd = 37, chr = 45, dex = 58, def = 165,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1708, [45] = 1781, [46] = 1856, [47] = 1932, [48] = 2008, [49] = 2081 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[148],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Poacher',
            ids    = { 224, 324, 329, 330, 333, 336, 337, 345, 350 },
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
            links  = 6,
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
                dangers = danger[155],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dune Widow',
            ids    = { 236 },
            nm     = true,
            levels = {
                [45] = { acc = 164, eva = 151, agi = 47, int = 39, mnd = 39, chr = 35, dex = 52, def = 166,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 155, agi = 48, int = 40, mnd = 40, chr = 35, dex = 54, def = 169,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 157, agi = 49, int = 40, mnd = 40, chr = 35, dex = 54, def = 172,
                         attack_skill = 138 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            immune = { 'dark_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 838 },  -- spider web
                { rate = 1000, item = 838 },  -- spider web
                { rate = 1000, item = 838 },  -- spider web
                { rate = 50, item = 13137 },  -- spider torque
            },
            steal  = { 838 },  -- spider web
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 4300, [46] = 4300, [47] = 4300 }, mp = { [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[38],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 289, 304, 312, 313, 334, 346 },
            job    = 'drk/drk',
            levels = {
                [45] = { acc = 164, eva = 151, agi = 46, int = 47, mnd = 32, chr = 32, dex = 52, def = 158,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 154, agi = 46, int = 48, mnd = 34, chr = 34, dex = 54, def = 162,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 157, agi = 48, int = 49, mnd = 35, chr = 35, dex = 54, def = 164,
                         attack_skill = 138 },
                [48] = { acc = 175, eva = 160, agi = 48, int = 50, mnd = 35, chr = 35, dex = 56, def = 168,
                         attack_skill = 141 },
                [49] = { acc = 179, eva = 163, agi = 49, int = 52, mnd = 35, chr = 35, dex = 58, def = 172,
                         attack_skill = 144 },
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
            links  = 6,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Armored Goblin (ID 124); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1986, [46] = 2068, [47] = 2149, [48] = 2231, [49] = 2308 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Poison: Poison; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison: Poison.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[153], { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[140], level_ranges = { { 6, 45 } } }, danger[158], danger[159], danger[160], danger[161], danger[162], danger[163], danger[164], danger[167], danger[170], danger[175], danger[180], danger[185], danger[190], danger[195], danger[196] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[66] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Trader',
            ids    = { 290, 295, 297, 305, 322, 338 },
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
            links  = 6,
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
                dangers = danger[155],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblins Spider',
            ids    = { 291, 296, 298, 306, 323, 339 },
            levels = {
                [38] = { acc = 138, eva = 127, agi = 38, int = 32, mnd = 32, chr = 29, dex = 43, def = 142,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 131, agi = 40, int = 34, mnd = 34, chr = 30, dex = 45, def = 146,
                         attack_skill = 115 },
                [40] = { acc = 145, eva = 134, agi = 40, int = 34, mnd = 34, chr = 30, dex = 45, def = 149,
                         attack_skill = 118 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            links  = 1,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [38] = 430, [39] = 454, [40] = 492 }, mp = { [38] = 0, [39] = 0, [40] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[38],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lesser Manticore',
            ids    = { 293, 294, 302, 303, 309, 310, 318, 319, 343, 344 },
            levels = {
                [47] = { acc = 167, eva = 156, agi = 46, int = 37, mnd = 37, chr = 35, dex = 46, def = 176,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 160, agi = 48, int = 37, mnd = 37, chr = 36, dex = 48, def = 179,
                         attack_skill = 141 },
                [49] = { acc = 175, eva = 164, agi = 50, int = 38, mnd = 38, chr = 37, dex = 50, def = 182,
                         attack_skill = 144 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Manticore / Beast', notes = { 'Source species: Manticore (ID 98); family ID 46.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 3318, [48] = 3442, [49] = 3559 }, mp = { [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Deadly Hold: can crit; Tail Swing: Bind; Tail Smash: Bind; Heat Breath: fire breath; Riddle: Max MP down; Great Sandstorm: Blindness; Great Whirlwind: Choke', notes = { 'Deadly Hold: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Tail Swing: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Tail Smash: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Heat Breath: fire breath. Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply. Source targeting: cone.', 'Riddle: Max MP down. Source targeting: area around the monster.', 'Great Sandstorm: Blindness. Source targeting: single target.', 'Great Whirlwind: Choke. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 797, name = 'Deadly Hold', summary = 'Deadly Hold: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 8.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 798, name = 'Tail Swing', summary = 'Tail Swing: Bind', notes = danger[197], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[199] }, { kind = 'skill', id = 799, name = 'Tail Smash', summary = 'Tail Smash: Bind', notes = danger[197], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[199] }, { kind = 'skill', id = 800, name = 'Heat Breath', summary = 'Heat Breath: fire breath', notes = { 'Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply. Source targeting: cone.' }, categories = { 'other' }, effects = {  }, details = { notes = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 801, name = 'Riddle', summary = 'Riddle: Max MP down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Max MP down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Max MP down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Max MP down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 802, name = 'Great Sandstorm', summary = 'Great Sandstorm: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 17.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 803, name = 'Great Whirlwind', summary = 'Great Whirlwind: Choke', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 17.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[94] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Heat Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 591, name = 'Heat Breath', level = 71, min_skill = 225, skill_ids = { 800 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Doom Scorpion',
            ids    = { 354, 356, 358, 360, 361 },
            levels = {
                [44] = { acc = 157, eva = 148, agi = 47, int = 34, mnd = 34, chr = 39, dex = 44, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 160, eva = 151, agi = 47, int = 36, mnd = 36, chr = 40, dex = 45, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 164, eva = 155, agi = 48, int = 36, mnd = 36, chr = 40, dex = 46, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 167, eva = 157, agi = 49, int = 37, mnd = 37, chr = 41, dex = 46, def = 173,
                         attack_skill = 138 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 150, item = 896 },  -- scorpion shell
                { rate = 100, item = 1209 },  -- vial of desert venom
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1968, [45] = 2046, [46] = 2129, [47] = 2212 }, mp = { [44] = 0, [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Numbing Breath: Paralysis; Cold Breath: Bind; Mandible Bite: can crit; Poison Sting: Poison; Death Scissors: can crit; Wild Rage: Poison; Earth Pounder: DEX down', notes = { 'Numbing Breath: Paralysis. Random effects may not all happen on the same use. Source targeting: cone.', 'Cold Breath: Bind. Source targeting: cone.', 'Mandible Bite: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Poison Sting: Poison. Source targeting: single target.', 'Death Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wild Rage: Poison. Source targeting: area around the monster.', 'Earth Pounder: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 348, name = 'Numbing Breath', summary = 'Numbing Breath: Paralysis', notes = { 'Random effects may not all happen on the same use. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 349, name = 'Cold Breath', summary = 'Cold Breath: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[76] } }, { kind = 'skill', id = 350, name = 'Mandible Bite', summary = 'Mandible Bite: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[25] }, { kind = 'skill', id = 351, name = 'Poison Sting', summary = 'Poison Sting: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 353, name = 'Death Scissors', summary = 'Death Scissors: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[15] }, { kind = 'skill', id = 354, name = 'Wild Rage', summary = 'Wild Rage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 355, name = 'Earth Pounder', summary = 'Earth Pounder: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[68] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 362 },
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
            },
            steal  = { 605, 749 },  -- pickaxe, mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
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
                dangers = danger[155],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Decurio I-III',
            ids    = { 363 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [47] = { acc = 167, eva = 150, agi = 35, int = 35, mnd = 43, chr = 49, dex = 46, def = 190,
                         attack_skill = 138 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            aggro  = true,
            detects = { 'sound' },
            links  = 10,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 4000 }, mp = { [47] = 4000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[201],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Tsuchigumo',
            ids    = { 364, 365 },
            nm     = true,
            levels = {
                [42] = { acc = 153, eva = 141, agi = 44, int = 36, mnd = 36, chr = 32, dex = 49, def = 156,
                         attack_skill = 123 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 2800 }, mp = { [42] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: Poison; Sickle Slash: can crit; Acid Spray: Poison; Spider Web: Slow', notes = { 'Normal attacks: Poison. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Sickle Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Spray: Poison. Source targeting: cone.', 'Spider Web: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Poison', notes = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, danger[30], danger[33], danger[36] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hobgoblin Warrior',
            ids    = { 366 },
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
            links  = 11,
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
                dangers = { value = 'Goblin Rush: can crit during Mighty Strikes; Bomb Toss: fire damage', notes = { 'Goblin Rush: can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 590, name = 'Goblin Rush', summary = 'Goblin Rush: can crit during Mighty Strikes', notes = danger[202], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 6 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 6.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, danger[153] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin White Mage',
            ids    = { 367 },
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
            links  = 12,
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
                dangers = { value = 'Bomb Toss: fire damage; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[153], danger[203], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[205], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[207], level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[120], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[66] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Black Mage',
            ids    = { 368 },
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
            links  = 13,
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
                dangers = { value = 'Bomb Toss: fire damage; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[153], danger[208], danger[209], danger[141], danger[85], danger[86], danger[91], danger[96], danger[73], danger[101], danger[106], danger[109], danger[110], danger[144], danger[113], danger[78], danger[145], danger[116] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[66] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Red Mage',
            ids    = { 369 },
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
            links  = 14,
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
                dangers = { value = 'Bomb Toss: fire damage; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[153], danger[203], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[205], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[207], level_ranges = { { 18, 255 } } }, danger[138], danger[158], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[112], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[77], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[108], level_ranges = { { 32, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[66] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Thief',
            ids    = { 370 },
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
            links  = 15,
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
                dangers = danger[211],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Dark Knight',
            ids    = { 371 },
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
            links  = 16,
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
                dangers = { value = 'Normal attacks: HP drain; Bomb Toss: fire damage; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, danger[153], danger[158], danger[159], danger[160], danger[161], danger[162], danger[163], danger[164], danger[167], danger[170], danger[175], danger[180], danger[185], danger[190], danger[195], danger[196] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[66] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Ranger',
            ids    = { 372 },
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
            links  = 17,
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
                dangers = danger[211],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hobgoblin Beastmaster',
            ids    = { 373 },
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
            links  = 18,
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
                dangers = danger[211],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Goblins Spider',
            ids    = { 374 },
            levels = {
                [48] = { acc = 175, eva = 161, agi = 50, int = 40, mnd = 40, chr = 36, dex = 56, def = 175,
                         attack_skill = 141 },
                [49] = { acc = 179, eva = 165, agi = 52, int = 42, mnd = 42, chr = 37, dex = 58, def = 178,
                         attack_skill = 144 },
                [50] = { acc = 183, eva = 169, agi = 54, int = 44, mnd = 44, chr = 39, dex = 60, def = 183,
                         attack_skill = 147 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [48] = 688, [49] = 711, [50] = 756 }, mp = { [48] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[38],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Contantican Warrior',
            ids    = { 375 },
            nm     = true,
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 35, chr = 45, dex = 60, def = 183,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 188,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 37, chr = 48, dex = 63, def = 198,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 15 },
            aggro  = true,
            detects = { 'sound' },
            links  = 19,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Spikeball: Poison, can crit during Mighty Strikes; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification, can crit during Mighty Strikes; Jamming Wave: Silence', notes = { 'Spikeball: Poison, can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification, can crit during Mighty Strikes. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification. Requires Mighty Strikes to be active, with the move still usable.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 789, name = 'Spikeball', summary = 'Spikeball: Poison, can crit during Mighty Strikes', notes = danger[202], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[41] }, danger[43], danger[48], danger[51], { kind = 'skill', id = 795, name = 'Sand Trap', summary = 'Sand Trap: petrification, can crit during Mighty Strikes', notes = { 'Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification. Requires Mighty Strikes to be active, with the move still usable.' }, categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[54] }, danger[58] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Contantican Black Mage',
            ids    = { 376 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 183, eva = 153, agi = 54, int = 63, mnd = 39, chr = 50, dex = 60, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 158, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 163, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 167, agi = 57, int = 67, mnd = 42, chr = 52, dex = 63, def = 184,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            links  = 20,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[42], danger[43], danger[48], danger[51], danger[55], danger[58], danger[208], danger[209], danger[141], danger[85], danger[86], danger[91], danger[96], danger[73], danger[101], danger[106], danger[109], danger[110], danger[144], danger[113], danger[78], danger[145], danger[116] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[66] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Contantican Paladin',
            ids    = { 377 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [50] = { acc = 178, eva = 160, agi = 36, int = 36, mnd = 48, chr = 54, dex = 51, def = 215,
                         attack_skill = 147 },
                [51] = { acc = 184, eva = 165, agi = 38, int = 38, mnd = 50, chr = 56, dex = 53, def = 220,
                         attack_skill = 151 },
                [52] = { acc = 189, eva = 170, agi = 38, int = 38, mnd = 50, chr = 56, dex = 53, def = 225,
                         attack_skill = 156 },
                [53] = { acc = 195, eva = 175, agi = 39, int = 39, mnd = 51, chr = 57, dex = 54, def = 231,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            aggro  = true,
            detects = { 'sound' },
            links  = 21,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2448, [51] = 2530, [52] = 2612, [53] = 2694 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[201],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Contantican Ranger',
            ids    = { 378 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [50] = { acc = 216, eva = 157, agi = 63, int = 45, mnd = 44, chr = 45, dex = 56, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 221, eva = 162, agi = 65, int = 47, mnd = 44, chr = 47, dex = 56, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 226, eva = 167, agi = 65, int = 47, mnd = 44, chr = 47, dex = 56, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 232, eva = 172, agi = 67, int = 48, mnd = 46, chr = 48, dex = 58, def = 188,
                         attack_skill = 161 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            aggro  = true,
            detects = { 'sound' },
            links  = 22,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2268, [51] = 2346, [52] = 2423, [53] = 2501 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[157],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Cactrot Rapido',
            ids    = { 379 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 329, agi = 87, int = 57, mnd = 57, chr = 74, dex = 78, def = 339,
                         attack_skill = 281 },
                [81] = { acc = 347, eva = 335, agi = 90, int = 60, mnd = 60, chr = 76, dex = 81, def = 344,
                         attack_skill = 287 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun' },
            drops  = {
                { rate = 150, item = 13401 },  -- arete del sol
                { rate = 240, item = 1236 },  -- bag of cactus stems
                { rate = 50, item = 17165 },  -- arco de velocidad
                { rate = 50, item = 916 },  -- cactuar needle
                { rate = 240, item = 1236 },  -- bag of cactus stems
                { rate = 240, item = 1592 },  -- cactuar root
                { rate = 240, item = 1817 },  -- cactus arm
                { rate = 150, item = 1817 },  -- cactus arm
                { rate = 100, item = 1817 },  -- cactus arm
            },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 9800, [81] = 9800 }, mp = { [80] = 0, [81] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 180', notes = { 'Source base speed is 180; the ordinary monster default is 40. Animation speed is 180.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 180 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[80],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hastatus XIII-LXXV',
            ids    = { 380 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 35, chr = 45, dex = 60, def = 183,
                         attack_skill = 147, resist = { virus = 15 } },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 188,
                         attack_skill = 151, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 37, chr = 48, dex = 63, def = 198,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 37, chr = 48, dex = 64, def = 203,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 37, chr = 49, dex = 65, def = 209,
                         attack_skill = 171, resist = { virus = 20 } },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 23,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hastatus XIII-XCVI',
            ids    = { 381 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 35, chr = 45, dex = 60, def = 183,
                         attack_skill = 147, resist = { virus = 15 } },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 188,
                         attack_skill = 151, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 37, chr = 48, dex = 63, def = 198,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 37, chr = 48, dex = 64, def = 203,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 37, chr = 49, dex = 65, def = 209,
                         attack_skill = 171, resist = { virus = 20 } },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 24,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sagittarius XIII-XXVI',
            ids    = { 382 },
            job    = 'rng/rng',
            levels = {
                [50] = { acc = 216, eva = 157, agi = 63, int = 45, mnd = 44, chr = 45, dex = 56, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 221, eva = 162, agi = 65, int = 47, mnd = 44, chr = 47, dex = 56, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 226, eva = 167, agi = 65, int = 47, mnd = 44, chr = 47, dex = 56, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 232, eva = 172, agi = 67, int = 48, mnd = 46, chr = 48, dex = 58, def = 188,
                         attack_skill = 161 },
                [54] = { acc = 237, eva = 177, agi = 67, int = 48, mnd = 46, chr = 48, dex = 58, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 242, eva = 182, agi = 69, int = 49, mnd = 46, chr = 49, dex = 59, def = 199,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 25,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2268, [51] = 2346, [52] = 2423, [53] = 2501, [54] = 2579, [55] = 2657 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Princeps XIII-LXXXIX',
            ids    = { 383 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [50] = { acc = 216, eva = 157, agi = 63, int = 45, mnd = 44, chr = 45, dex = 56, def = 173,
                         attack_skill = 147 },
                [51] = { acc = 221, eva = 162, agi = 65, int = 47, mnd = 44, chr = 47, dex = 56, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 226, eva = 167, agi = 65, int = 47, mnd = 44, chr = 47, dex = 56, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 232, eva = 172, agi = 67, int = 48, mnd = 46, chr = 48, dex = 58, def = 188,
                         attack_skill = 161 },
                [54] = { acc = 237, eva = 177, agi = 67, int = 48, mnd = 46, chr = 48, dex = 58, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 242, eva = 182, agi = 69, int = 49, mnd = 46, chr = 49, dex = 59, def = 199,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 26,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2268, [51] = 2346, [52] = 2423, [53] = 2501, [54] = 2579, [55] = 2657 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hastatus XIII-XXV',
            ids    = { 384 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 35, chr = 45, dex = 60, def = 183,
                         attack_skill = 147, resist = { virus = 15 } },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 188,
                         attack_skill = 151, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 37, chr = 48, dex = 63, def = 198,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 37, chr = 48, dex = 64, def = 203,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 37, chr = 49, dex = 65, def = 209,
                         attack_skill = 171, resist = { virus = 20 } },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 27,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hastatus XIII-CXXVIII',
            ids    = { 385 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 35, chr = 45, dex = 60, def = 183,
                         attack_skill = 147, resist = { virus = 15 } },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 188,
                         attack_skill = 151, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 37, chr = 48, dex = 63, def = 198,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 37, chr = 48, dex = 64, def = 203,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 37, chr = 49, dex = 65, def = 209,
                         attack_skill = 171, resist = { virus = 20 } },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 28,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Triarius XIII-LIX',
            ids    = { 386 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 183, eva = 153, agi = 54, int = 63, mnd = 39, chr = 50, dex = 60, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 158, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 163, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 167, agi = 57, int = 67, mnd = 42, chr = 52, dex = 63, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 173, agi = 58, int = 67, mnd = 42, chr = 52, dex = 64, def = 189,
                         attack_skill = 166 },
                [55] = { acc = 210, eva = 177, agi = 58, int = 69, mnd = 43, chr = 52, dex = 65, def = 194,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 29,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421, [54] = 2497, [55] = 2574 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[215],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Decurio XIII-LV',
            ids    = { 387 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 183, eva = 153, agi = 54, int = 63, mnd = 39, chr = 50, dex = 60, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 158, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 163, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 167, agi = 57, int = 67, mnd = 42, chr = 52, dex = 63, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 173, agi = 58, int = 67, mnd = 42, chr = 52, dex = 64, def = 189,
                         attack_skill = 166 },
                [55] = { acc = 210, eva = 177, agi = 58, int = 69, mnd = 43, chr = 52, dex = 65, def = 194,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 30,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421, [54] = 2497, [55] = 2574 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[215],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Centurio XIII-V',
            ids    = { 388 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [55] = { acc = 206, eva = 185, agi = 39, int = 39, mnd = 52, chr = 58, dex = 56, def = 242,
                         attack_skill = 171 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 31,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2858 }, mp = { [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[123],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cactrot Veloz',
            ids    = { 422, 423, 424 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 180', notes = { 'Source base speed is 180; the ordinary monster default is 40. Animation speed is 180.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 180', notes = { 'Base attack delay 180 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[80],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
