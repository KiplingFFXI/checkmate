-- Labyrinth of Onzozo (zone 213).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.' };
danger[3] = { 'Normal activation range: 13.5 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[4] = { notes = danger[3], unknown = {  }, activation_range = 13.5, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } } };
danger[5] = { kind = 'skill', id = 591, name = 'Bomb Toss', summary = 'Bomb Toss: fire damage', notes = danger[2], categories = { 'other' }, effects = {  }, details = danger[4] };
danger[6] = { danger[5] };
danger[7] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[8] = { value = 'Bomb Toss: fire damage', notes = danger[1], entries = danger[6], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[9] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[10] = { notes = danger[9], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[11] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[10], level_ranges = { { 46, 255 } } };
danger[12] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[13] = { notes = danger[12], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[14] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[16] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[17] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[18] = { notes = danger[16], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[17] };
danger[19] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[20] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[21] = { danger[20] };
danger[22] = { notes = danger[19], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[21] };
danger[23] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[24] = { danger[23] };
danger[25] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[26] = { danger[25] };
danger[27] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[28] = { danger[27] };
danger[29] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[30] = { danger[29] };
danger[31] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[32] = { 'Suction: Stun. Source targeting: single target.', 'Acid Mist: Attack down. Source targeting: area around the monster.', 'Sand Breath: Blindness. Source targeting: cone.', 'Drainkiss: HP drain. Source targeting: single target.', 'Tp Drainkiss: TP drain. Source targeting: single target.', 'Mp Drainkiss: MP drain. Source targeting: single target.', 'Brain Drain: INT down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[33] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[34] = { notes = danger[33], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[17] };
danger[35] = { kind = 'skill', id = 414, name = 'Suction', summary = 'Suction: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[34] };
danger[36] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[37] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[38] = { danger[37] };
danger[39] = { notes = danger[36], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[38] };
danger[40] = { kind = 'skill', id = 415, name = 'Acid Mist', summary = 'Acid Mist: Attack down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[39] };
danger[41] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[42] = { notes = danger[41], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[43] = { kind = 'skill', id = 416, name = 'Sand Breath', summary = 'Sand Breath: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[42] };
danger[44] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[45] = { notes = danger[44], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[46] = { kind = 'skill', id = 417, name = 'Drainkiss', summary = 'Drainkiss: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[45] };
danger[47] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[48] = { notes = danger[47], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[49] = { kind = 'skill', id = 420, name = 'Tp Drainkiss', summary = 'Tp Drainkiss: TP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[48] };
danger[50] = { kind = 'skill', id = 421, name = 'Mp Drainkiss', summary = 'Mp Drainkiss: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[48] };
danger[51] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[52] = { notes = danger[51], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[30] };
danger[53] = { kind = 'skill', id = 423, name = 'Brain Drain', summary = 'Brain Drain: INT down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[52] };
danger[54] = { danger[35], danger[40], danger[43], danger[46], danger[49], danger[50], danger[53] };
danger[55] = { value = 'Suction: Stun; Acid Mist: Attack down; Sand Breath: Blindness; Drainkiss: HP drain; Tp Drainkiss: TP drain; Mp Drainkiss: MP drain; Brain Drain: INT down', notes = danger[32], entries = danger[54], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[56] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[57] = { notes = danger[56], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[58] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[57], level_ranges = { { 15, 255 } } };
danger[59] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[15], level_ranges = { { 52, 255 } } };
danger[60] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { danger[61] };
danger[63] = { notes = danger[60], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[62] };
danger[64] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[63], level_ranges = { { 21, 255 } } };
danger[65] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[66] = { notes = danger[65], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[67] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[68] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[69] = { notes = danger[68], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[70] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[71] = { danger[70] };
danger[72] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[73] = { notes = danger[72], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[74] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[75] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[76] = { danger[75] };
danger[77] = { notes = danger[74], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[76] };
danger[78] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[79] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[80] = { danger[79] };
danger[81] = { notes = danger[78], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[80] };
danger[82] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[81], level_ranges = { { 13, 255 } } };
danger[83] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[84] = { notes = danger[83], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[85] = { 'Tentacle: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Jet: Blindness. Source targeting: cone.', 'Maelstrom: STR down. Source targeting: area around the monster.', 'Whirlwind: VIT down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[86] = { kind = 'skill', id = 456, name = 'Tentacle', summary = 'Tentacle: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = danger[69] };
danger[87] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[88] = { notes = danger[87], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[89] = { kind = 'skill', id = 458, name = 'Ink Jet', summary = 'Ink Jet: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[88] };
danger[90] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[91] = { notes = danger[90], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[24] };
danger[92] = { kind = 'skill', id = 462, name = 'Maelstrom', summary = 'Maelstrom: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[91] };
danger[93] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[94] = { notes = danger[93], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[28] };
danger[95] = { kind = 'skill', id = 463, name = 'Whirlwind', summary = 'Whirlwind: VIT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[94] };
danger[96] = { danger[86], danger[89], danger[92], danger[95] };
danger[97] = { value = 'Tentacle: can crit; Ink Jet: Blindness; Maelstrom: STR down; Whirlwind: VIT down', notes = danger[85], entries = danger[96], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[98] = { 'Blaster: paralysis. Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.', 'Chaotic Eye: silence gaze. Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[99] = { 'Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.' };
danger[100] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[101] = { notes = danger[100], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[102] = { kind = 'skill', id = 652, name = 'Blaster', summary = 'Blaster: paralysis', notes = danger[99], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[101] };
danger[103] = { 'Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.' };
danger[104] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[105] = { notes = danger[104], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[106] = { kind = 'skill', id = 653, name = 'Chaotic Eye', summary = 'Chaotic Eye: silence gaze', notes = danger[103], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[105] };
danger[107] = { danger[102], danger[106] };
danger[108] = { value = 'Blaster: paralysis; Chaotic Eye: silence gaze', notes = danger[98], entries = danger[107], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[109] = { 'Deadly Hold: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Tail Swing: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Tail Smash: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Heat Breath: fire breath. Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply. Source targeting: cone.', 'Riddle: Max MP down. Source targeting: area around the monster.', 'Great Sandstorm: Blindness. Source targeting: single target.', 'Great Whirlwind: Choke. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[110] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[111] = { notes = danger[110], unknown = {  }, activation_range = 8.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[112] = { kind = 'skill', id = 797, name = 'Deadly Hold', summary = 'Deadly Hold: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = danger[111] };
danger[113] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[114] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[115] = { notes = danger[114], unknown = {  }, activation_range = 8.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[21] };
danger[116] = { kind = 'skill', id = 798, name = 'Tail Swing', summary = 'Tail Swing: Bind', notes = danger[113], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[115] };
danger[117] = { kind = 'skill', id = 799, name = 'Tail Smash', summary = 'Tail Smash: Bind', notes = danger[113], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[115] };
danger[118] = { 'Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply. Source targeting: cone.' };
danger[119] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[120] = { notes = danger[119], unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[121] = { kind = 'skill', id = 800, name = 'Heat Breath', summary = 'Heat Breath: fire breath', notes = danger[118], categories = { 'other' }, effects = {  }, details = danger[120] };
danger[122] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Max MP down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[123] = { effect = 'Max MP down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[124] = { danger[123] };
danger[125] = { notes = danger[122], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[124] };
danger[126] = { kind = 'skill', id = 801, name = 'Riddle', summary = 'Riddle: Max MP down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Max MP down' }, details = danger[125] };
danger[127] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[128] = { notes = danger[127], unknown = {  }, activation_range = 17.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[129] = { kind = 'skill', id = 802, name = 'Great Sandstorm', summary = 'Great Sandstorm: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[128] };
danger[130] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[131] = { notes = danger[130], unknown = {  }, activation_range = 17.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[71] };
danger[132] = { kind = 'skill', id = 803, name = 'Great Whirlwind', summary = 'Great Whirlwind: Choke', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[131] };
danger[133] = { danger[112], danger[116], danger[117], danger[121], danger[126], danger[129], danger[132] };
danger[134] = { value = 'Deadly Hold: can crit; Tail Swing: Bind; Tail Smash: Bind; Heat Breath: fire breath; Riddle: Max MP down; Great Sandstorm: Blindness; Great Whirlwind: Choke', notes = danger[109], entries = danger[133], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[135] = { 'Whip Tongue: Stun, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Breath: STR down. Source targeting: cone.', 'Stinking Gas: vitality down. Attempts Vitality Down on its targets. Source targeting: area around the monster. Possible effects: VIT down.', 'Undead Mold: Disease. Source targeting: cone.', 'Call Of The Grave: INT down. Source targeting: area around the monster.', 'Abyss Blast: Blindness. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[136] = { kind = 'skill', id = 486, name = 'Whip Tongue', summary = 'Whip Tongue: Stun, can crit', notes = danger[67], categories = { 'crit', 'debuff' }, effects = { 'Stun' }, details = danger[34] };
danger[137] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[138] = { notes = danger[137], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[24] };
danger[139] = { kind = 'skill', id = 488, name = 'Acid Breath', summary = 'Acid Breath: STR down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[138] };
danger[140] = { 'Attempts Vitality Down on its targets. Source targeting: area around the monster. Possible effects: VIT down.' };
danger[141] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[142] = { notes = danger[141], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[28] };
danger[143] = { kind = 'skill', id = 489, name = 'Stinking Gas', summary = 'Stinking Gas: vitality down', notes = danger[140], categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[142] };
danger[144] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[145] = { notes = danger[144], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } };
danger[146] = { kind = 'skill', id = 490, name = 'Undead Mold', summary = 'Undead Mold: Disease', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = danger[145] };
danger[147] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[148] = { notes = danger[147], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[30] };
danger[149] = { kind = 'skill', id = 491, name = 'Call Of The Grave', summary = 'Call Of The Grave: INT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[148] };
danger[150] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[151] = { notes = danger[150], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[152] = { kind = 'skill', id = 492, name = 'Abyss Blast', summary = 'Abyss Blast: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[151] };
danger[153] = { danger[136], danger[139], danger[143], danger[146], danger[149], danger[152] };
danger[154] = { value = 'Whip Tongue: Stun, can crit; Acid Breath: STR down; Stinking Gas: vitality down; Undead Mold: Disease; Call Of The Grave: INT down; Abyss Blast: Blindness', notes = danger[135], entries = danger[153], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblin Trader', 'Mysticmaker Profblix', 'Soulstealer Skullnix' },
        },
        [2] = { sound = { 'Labyrinth Leech' } },
        [3] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Mysticmaker Profblix', 'Soulstealer Skullnix' },
        },
        [4] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblin Trader', 'Soulstealer Skullnix' },
        },
        [5] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblin Trader', 'Mysticmaker Profblix' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Goblin Alchemist'] = { id = 58, name = 'Goblin' },
        ['Goblin Bandit'] = { id = 58, name = 'Goblin' },
        ['Goblin Bouncer'] = { id = 58, name = 'Goblin' },
        ['Goblin Enchanter'] = { id = 58, name = 'Goblin' },
        ['Goblin Hunter'] = { id = 58, name = 'Goblin' },
        ['Goblin Mercenary'] = { id = 58, name = 'Goblin' },
        ['Goblin Miner'] = { id = 58, name = 'Goblin' },
        ['Goblin Poacher'] = { id = 58, name = 'Goblin' },
        ['Goblin Reaper'] = { id = 58, name = 'Goblin' },
        ['Goblin Robber'] = { id = 58, name = 'Goblin' },
        ['Goblin Shepherd'] = { id = 58, name = 'Goblin' },
        ['Goblin Trader'] = { id = 58, name = 'Goblin' },
        ['Labyrinth Leech'] = { id = 5, name = 'Leech' },
        ['Mysticmaker Profblix'] = { id = 58, name = 'Goblin' },
        ['Soulstealer Skullnix'] = { id = 58, name = 'Goblin' },
    },
    monsters = {
        {
            name   = 'Goblin Poacher',
            ids    = { 1, 12 },
            job    = 'rng/rng',
            levels = {
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
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            steal  = { 17336 },  -- crossbow bolt
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 1920, [47] = 1997, [48] = 2074, [49] = 2148 }, mp = { [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Robber',
            ids    = { 2, 15 },
            job    = 'thf/thf',
            levels = {
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
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 1982, [47] = 2061, [48] = 2140, [49] = 2215 }, mp = { [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 3, 16 },
            job    = 'drk/drk',
            levels = {
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
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Armored Goblin (ID 124); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 2068, [47] = 2149, [48] = 2231, [49] = 2308 }, mp = { [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[5], danger[11], { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[13], level_ranges = { { 26, 50 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[15], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[18], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[15], level_ranges = { { 30, 55 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[22], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[24] }, level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[26] }, level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[28] }, level_ranges = { { 35, 255 } } }, { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[30] }, level_ranges = { { 39, 255 } } }, { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 31, 255 } } }, { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[15], level_ranges = { { 45, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Labyrinth Leech',
            ids    = { 4, 5, 6, 8, 9 },
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 39, mnd = 36, chr = 40, dex = 47, def = 166,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 40, mnd = 36, chr = 40, dex = 48, def = 169,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 40, mnd = 37, chr = 41, dex = 49, def = 172,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 161, agi = 50, int = 40, mnd = 37, chr = 42, dex = 50, def = 175,
                         attack_skill = 141 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 240, item = 2014 },  -- vial of bird blood
                { rate = 150, item = 2014 },  -- vial of bird blood
                { rate = 150, item = 2014 },  -- vial of bird blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 2,
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2046, [46] = 2129, [47] = 2212, [48] = 2295 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[55],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 7, 49, 61, 85, 117, 124, 143, 194 },
            job    = 'blm/rdm',
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57, dex = 61, def = 222,
                         attack_skill = 196 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 227,
                         attack_skill = 199 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 232,
                         attack_skill = 203 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'gravity', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Air Elemental (ID 256); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3014, [61] = 3091, [62] = 3168 }, mp = { [60] = 1705, [61] = 1737, [62] = 1768 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Wind weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence: silence; Tornado: Ice magic evasion down; Gravity: Weight', notes = { 'Silence: silence. Possible effects: Silence.', 'Tornado: Ice magic evasion down.', 'Gravity: Weight.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[58], danger[59], danger[64] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[31] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Cockatrice',
            ids    = { 10, 11, 17, 18, 20, 21, 22, 23, 27, 28, 32, 33, 34, 35, 36, 38, 41, 45, 70, 72, 74, 76, 77,
                       83 },
            levels = {
                [50] = { acc = 178, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45, dex = 51, def = 186,
                         attack_skill = 147 },
                [51] = { acc = 185, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47, dex = 54, def = 191,
                         attack_skill = 151 },
                [52] = { acc = 190, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47, dex = 54, def = 196,
                         attack_skill = 156 },
                [53] = { acc = 195, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48, dex = 54, def = 201,
                         attack_skill = 161 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 100, item = 854 },  -- cockatrice skin
                { rate = 50, item = 1056 },  -- onzozo chest key
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Cockatrice / Bird', notes = { 'Source species: Cockatrice (ID 177); family ID 79.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688, [53] = 2772 }, mp = { [50] = 0, [51] = 0, [52] = 0, [53] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Poison Pick: Poison; Sound Vacuum Cockatrice: Silence; Sound Blast: INT down; Baleful Gaze: petrification gaze', notes = { 'Poison Pick: Poison. Source targeting: single target.', 'Sound Vacuum Cockatrice: Silence. Source targeting: cone.', 'Sound Blast: INT down. Source targeting: area around the monster.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 407, name = 'Poison Pick', summary = 'Poison Pick: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[66] }, { kind = 'skill', id = 408, name = 'Sound Vacuum Cockatrice', summary = 'Sound Vacuum Cockatrice: Silence', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, { kind = 'skill', id = 410, name = 'Sound Blast', summary = 'Sound Blast: INT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[30] } }, { kind = 'skill', id = 411, name = 'Baleful Gaze Cockatrice', summary = 'Baleful Gaze: petrification gaze', notes = { 'Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Sound Blast', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 572, name = 'Sound Blast', level = 32, min_skill = 68, skill_ids = { 410 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Trader',
            ids    = { 13 },
            job    = 'bst/bst',
            levels = {
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
                { rate = 1, item = 828 },  -- square of velvet cloth
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 2068, [47] = 2149, [48] = 2231, [49] = 2308 }, mp = { [46] = 0, [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblins Leech',
            ids    = { 14, 169, 175, 180 },
            levels = {
                [33] = { acc = 119, eva = 111, agi = 34, int = 28, mnd = 26, chr = 29, dex = 34, def = 127,
                         attack_skill = 97 },
                [34] = { acc = 123, eva = 115, agi = 36, int = 29, mnd = 26, chr = 29, dex = 36, def = 130,
                         attack_skill = 100 },
                [35] = { acc = 126, eva = 118, agi = 36, int = 30, mnd = 27, chr = 30, dex = 36, def = 133,
                         attack_skill = 103 },
                [49] = { acc = 176, eva = 165, agi = 52, int = 42, mnd = 38, chr = 42, dex = 52, def = 178,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 169, agi = 54, int = 44, mnd = 41, chr = 45, dex = 54, def = 183,
                         attack_skill = 147 },
            },
            spawn_levels = { [14] = { 33, 35 }, [169] = { 49, 50 }, [175] = { 49, 50 }, [180] = { 49, 50 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            links  = 2,
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [33] = 309, [34] = 334, [35] = 357, [49] = 711, [50] = 756 }, mp = { [33] = 0, [34] = 0, [35] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[55],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mushussu LO',
            ids    = { 19, 37, 50, 51, 64, 71, 73, 75, 78, 79, 80, 81, 82, 92, 93 },
            levels = {
                [51] = { acc = 185, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47, dex = 54, def = 189,
                         attack_skill = 151 },
                [52] = { acc = 190, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47, dex = 54, def = 194,
                         attack_skill = 156 },
                [53] = { acc = 195, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48, dex = 54, def = 200,
                         attack_skill = 161 },
                [54] = { acc = 200, eva = 190, agi = 58, int = 43, mnd = 43, chr = 48, dex = 55, def = 205,
                         attack_skill = 166 },
                [55] = { acc = 206, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49, dex = 56, def = 210,
                         attack_skill = 171 },
                [56] = { acc = 212, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50, dex = 58, def = 215,
                         attack_skill = 176 },
                [57] = { acc = 217, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50, dex = 58, def = 220,
                         attack_skill = 181 },
            },
            spawn_levels = { [19] = { 51, 54 }, [37] = { 52, 55 }, [50] = { 52, 55 }, [51] = { 52, 55 },
                             [64] = { 52, 55 }, [71] = { 51, 54 }, [73] = { 51, 54 }, [75] = { 51, 54 },
                             [78] = { 51, 54 }, [79] = { 51, 54 }, [80] = { 51, 54 }, [81] = { 51, 54 },
                             [82] = { 51, 54 }, [92] = { 54, 57 }, [93] = { 54, 57 } },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 1056 },  -- onzozo chest key
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939, [56] = 3022, [57] = 3106 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Numbing Breath: Paralysis; Cold Breath: Bind; Mandible Bite: can crit; Poison Sting: Poison; Death Scissors: can crit; Wild Rage: Poison; Earth Pounder: DEX down', notes = { 'Numbing Breath: Paralysis. Random effects may not all happen on the same use. Source targeting: cone.', 'Cold Breath: Bind. Source targeting: cone.', 'Mandible Bite: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Poison Sting: Poison. Source targeting: single target.', 'Death Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wild Rage: Poison. Source targeting: area around the monster.', 'Earth Pounder: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 348, name = 'Numbing Breath', summary = 'Numbing Breath: Paralysis', notes = { 'Random effects may not all happen on the same use. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 349, name = 'Cold Breath', summary = 'Cold Breath: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[21] } }, { kind = 'skill', id = 350, name = 'Mandible Bite', summary = 'Mandible Bite: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = danger[69] }, { kind = 'skill', id = 351, name = 'Poison Sting', summary = 'Poison Sting: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[66] }, { kind = 'skill', id = 353, name = 'Death Scissors', summary = 'Death Scissors: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 354, name = 'Wild Rage', summary = 'Wild Rage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 355, name = 'Earth Pounder', summary = 'Earth Pounder: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[26] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Miner',
            ids    = { 24, 39, 48, 54, 58, 62, 65, 86, 90, 103, 107, 130, 136, 137 },
            job    = 'thf/thf',
            levels = {
                [51] = { acc = 193, eva = 224, agi = 63, int = 56, mnd = 38, chr = 38, dex = 71, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 198, eva = 229, agi = 63, int = 56, mnd = 38, chr = 38, dex = 71, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 204, eva = 235, agi = 64, int = 57, mnd = 39, chr = 39, dex = 73, def = 188,
                         attack_skill = 161 },
                [54] = { acc = 209, eva = 240, agi = 65, int = 58, mnd = 39, chr = 39, dex = 73, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 216, eva = 246, agi = 67, int = 58, mnd = 39, chr = 39, dex = 76, def = 199,
                         attack_skill = 171 },
                [56] = { acc = 221, eva = 252, agi = 68, int = 61, mnd = 41, chr = 41, dex = 76, def = 204,
                         attack_skill = 176 },
                [57] = { acc = 227, eva = 257, agi = 69, int = 61, mnd = 41, chr = 41, dex = 78, def = 209,
                         attack_skill = 181 },
                [58] = { acc = 232, eva = 262, agi = 69, int = 61, mnd = 41, chr = 41, dex = 78, def = 214,
                         attack_skill = 186 },
            },
            spawn_levels = { [24] = { 51, 54 }, [39] = { 51, 54 }, [48] = { 52, 55 }, [54] = { 53, 56 },
                             [58] = { 53, 56 }, [62] = { 53, 56 }, [65] = { 53, 56 }, [86] = { 53, 56 },
                             [90] = { 53, 56 }, [103] = { 55, 58 }, [107] = { 55, 58 }, [130] = { 54, 57 },
                             [136] = { 55, 58 }, [137] = { 55, 58 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 100, item = 605 },  -- pickaxe
                { rate = 50, item = 17314 },  -- quake grenade
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 10, item = 737 },  -- chunk of gold ore
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2422, [52] = 2501, [53] = 2580, [54] = 2659, [55] = 2739, [56] = 2818, [57] = 2897, [58] = 2976 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 0-5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Bouncer',
            ids    = { 25, 40, 55, 59, 63, 69, 84, 89, 101, 112, 127, 134, 139 },
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
                [56] = { acc = 216, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50, dex = 67, def = 214,
                         attack_skill = 176, resist = { virus = 20 } },
                [57] = { acc = 222, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50, dex = 68, def = 219,
                         attack_skill = 181, resist = { virus = 20 } },
                [58] = { acc = 227, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52, dex = 68, def = 224,
                         attack_skill = 186, resist = { virus = 20 } },
            },
            spawn_levels = { [25] = { 51, 54 }, [40] = { 51, 54 }, [55] = { 53, 56 }, [59] = { 53, 56 },
                             [63] = { 53, 56 }, [69] = { 53, 56 }, [84] = { 53, 56 }, [89] = { 53, 56 },
                             [101] = { 55, 58 }, [112] = { 55, 58 }, [127] = { 54, 57 }, [134] = { 55, 58 },
                             [139] = { 55, 58 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939, [56] = 3022, [57] = 3106, [58] = 3189 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Hunter',
            ids    = { 26, 31, 43, 53, 57, 68, 87, 100, 111, 128, 129, 141, 142 },
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
                [56] = { acc = 248, eva = 190, agi = 74, int = 50, mnd = 55, chr = 50, dex = 61, def = 204,
                         attack_skill = 176 },
                [57] = { acc = 254, eva = 194, agi = 75, int = 50, mnd = 55, chr = 50, dex = 62, def = 209,
                         attack_skill = 181 },
                [58] = { acc = 259, eva = 199, agi = 75, int = 52, mnd = 55, chr = 52, dex = 62, def = 214,
                         attack_skill = 186 },
            },
            spawn_levels = { [26] = { 51, 54 }, [31] = { 51, 54 }, [43] = { 52, 55 }, [53] = { 53, 56 },
                             [57] = { 53, 56 }, [68] = { 53, 56 }, [87] = { 53, 56 }, [100] = { 55, 58 },
                             [111] = { 55, 58 }, [128] = { 56, 58 }, [129] = { 54, 57 }, [141] = { 54, 57 },
                             [142] = { 54, 57 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 1, item = 12444 },  -- raptor helm
                { rate = 1, item = 12700 },  -- raptor gloves
                { rate = 1, item = 12828 },  -- raptor trousers
                { rate = 1, item = 12956 },  -- raptor ledelsens
            },
            steal  = { 17336 },  -- crossbow bolt
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2346, [52] = 2423, [53] = 2501, [54] = 2579, [55] = 2657, [56] = 2734, [57] = 2812, [58] = 2890 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mysticmaker Profblix',
            ids    = { 29 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [50] = { acc = 183, eva = 154, agi = 57, int = 63, mnd = 45, chr = 50, dex = 60, def = 169,
                         attack_skill = 147 },
                [51] = { acc = 189, eva = 160, agi = 60, int = 65, mnd = 47, chr = 50, dex = 62, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 165, agi = 60, int = 65, mnd = 47, chr = 50, dex = 62, def = 178,
                         attack_skill = 156 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 510 },  -- goblin armor
                { rate = 1000, item = 511 },  -- goblin mask
                { rate = 150, item = 14724 },  -- moldavite earring
                { rate = 1000, group = {  -- one of
                    { 4774, 4500 },  -- scroll of thunder iii
                    { 4804, 2500 },  -- scroll of thundaga iii
                    { 4775, 2000 },  -- scroll of thunder iv
                    { 4820, 1000 },  -- scroll of burst
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 4500, [51] = 4500, [52] = 4500 }, mp = { [50] = 4500, [51] = 4500, [52] = 4500 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[5], { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[15], level_ranges = { { 50, 255 } } }, danger[59], { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[10], level_ranges = { { 43, 64 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[13], level_ranges = { { 24, 71 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[71] }, level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15], level_ranges = { { 12, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[15], level_ranges = { { 25, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[18], level_ranges = { { 45, 255 } } }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[73], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[22], level_ranges = { { 7, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[15], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 31, 55 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[31] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Goblin Enchanter',
            ids    = { 30, 42, 46, 52, 56, 60, 88, 104, 108, 135, 138, 140 },
            job    = 'rdm/rdm',
            levels = {
                [51] = { acc = 186, eva = 165, agi = 51, int = 56, mnd = 56, chr = 50, dex = 56, def = 176,
                         attack_skill = 151 },
                [52] = { acc = 191, eva = 170, agi = 51, int = 56, mnd = 56, chr = 50, dex = 56, def = 181,
                         attack_skill = 156 },
                [53] = { acc = 197, eva = 175, agi = 51, int = 57, mnd = 57, chr = 52, dex = 58, def = 186,
                         attack_skill = 161 },
                [54] = { acc = 202, eva = 180, agi = 52, int = 58, mnd = 58, chr = 52, dex = 58, def = 191,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 185, agi = 53, int = 58, mnd = 58, chr = 52, dex = 59, def = 197,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 191, agi = 54, int = 61, mnd = 61, chr = 55, dex = 61, def = 201,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 195, agi = 54, int = 61, mnd = 61, chr = 55, dex = 62, def = 206,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 201, agi = 56, int = 61, mnd = 61, chr = 55, dex = 62, def = 213,
                         attack_skill = 186 },
            },
            spawn_levels = { [30] = { 51, 54 }, [42] = { 52, 55 }, [46] = { 52, 55 }, [52] = { 53, 56 },
                             [56] = { 53, 56 }, [60] = { 53, 56 }, [88] = { 53, 56 }, [104] = { 55, 58 },
                             [108] = { 55, 58 }, [135] = { 54, 57 }, [138] = { 54, 57 }, [140] = { 54, 57 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 20 },
            drops  = {
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 10, item = 650 },  -- brass ingot
                { rate = 10, item = 744 },  -- silver ingot
                { rate = 5, item = 745 },  -- gold ingot
                { rate = 5, item = 746 },  -- platinum ingot
                { rate = 1, item = 12739 },  -- black mitts
                { rate = 1, item = 12867 },  -- white slacks
                { rate = 1, item = 12995 },  -- moccasins
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2422, [52] = 2501, [53] = 2580, [54] = 2659, [55] = 2739, [56] = 2818, [57] = 2897, [58] = 2976 }, mp = { [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[5], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[77], level_ranges = { { 55, 255 } } }, danger[82], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[84], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[57], level_ranges = { { 18, 255 } } }, danger[64], danger[11], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[73], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[22], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[15], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[15], level_ranges = { { 32, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flying Manta',
            ids    = { 44, 47, 66, 91, 94, 95, 96, 98, 99, 102, 105, 106, 109, 110, 132, 144 },
            levels = {
                [55] = { acc = 206, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49, dex = 56, def = 210,
                         attack_skill = 171 },
                [56] = { acc = 212, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50, dex = 58, def = 215,
                         attack_skill = 176 },
                [57] = { acc = 217, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50, dex = 58, def = 220,
                         attack_skill = 181 },
                [58] = { acc = 222, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52, dex = 59, def = 225,
                         attack_skill = 186 },
                [59] = { acc = 228, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53, dex = 60, def = 231,
                         attack_skill = 191 },
            },
            ph_for = { [66] = { 67 }, [96] = { 97 } },
            ph_rules = {
                [66] = {
                    [67] = { chance = 4, cooldown_min = 57600, cooldown_max = 57600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [96] = {
                    [97] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            drops  = {
                { rate = 150, item = 876 },  -- manta skin
                { rate = 100, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 10, item = 1056 },  -- onzozo chest key
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2939, [56] = 3022, [57] = 3106, [58] = 3189, [59] = 3273 }, mp = { [55] = 0, [56] = 0, [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[97],
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lord of Onzozo',
            ids    = { 67 },
            nm     = true,
            job    = 'war/blm',
            levels = {
                [74] = { acc = 307, eva = 295, agi = 77, int = 68, mnd = 60, chr = 66, dex = 73, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 300, agi = 77, int = 69, mnd = 60, chr = 67, dex = 74, def = 313,
                         attack_skill = 256 },
                [76] = { acc = 319, eva = 306, agi = 80, int = 70, mnd = 61, chr = 68, dex = 76, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 324, eva = 311, agi = 80, int = 71, mnd = 62, chr = 68, dex = 76, def = 323,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 10, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 4484 },  -- shall shell
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 50, item = 18852 },  -- octave club
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [74] = 13500, [75] = 13500, [76] = 13500, [77] = 13500 }, mp = { [74] = 13500, [75] = 13500, [76] = 13500, [77] = 13500 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10; Store TP 75', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                fight = { value = 'Rage 20 minutes; Draw-in', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'The draw-in mixin checks the current target at twice the monster\'s melee range or farther.' } },
                dangers = { value = 'Tentacle: can crit; Ink Jet: Blindness; Maelstrom: STR down; Whirlwind: VIT down; Flood: Thunder magic evasion down; Blindga: Blindness', notes = { 'Tentacle: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Jet: Blindness. Source targeting: cone.', 'Maelstrom: STR down. Source targeting: area around the monster.', 'Whirlwind: VIT down. Source targeting: area around the monster.', 'Flood: Thunder magic evasion down.', 'Blindga: Blindness.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[86], danger[89], danger[92], danger[95], { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[15], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 361, name = 'Blindga', summary = 'Blindga: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 16 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 16.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } }, level_ranges = { { 1, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Peg Powler',
            ids    = { 97 },
            nm     = true,
            levels = {
                [61] = { acc = 238, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55, dex = 63, def = 242,
                         attack_skill = 199 },
                [62] = { acc = 243, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55, dex = 63, def = 247,
                         attack_skill = 203 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 10, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 16728 },  -- schwarz axt
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 150, item = 792 },  -- pearl
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 10500, [62] = 10500 }, mp = { [61] = 0, [62] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[97],
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 113, 121, 145, 164, 166, 171, 177, 182, 195 },
            job    = 'blm/rdm',
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57, dex = 61, def = 222,
                         attack_skill = 196 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 227,
                         attack_skill = 199 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 232,
                         attack_skill = 203 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3014, [61] = 3091, [62] = 3168 }, mp = { [60] = 1705, [61] = 1737, [62] = 1768 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Water weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flood: Thunder magic evasion down; Poison II: Poison', notes = { 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[15], level_ranges = { { 58, 255 } } }, { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[10], level_ranges = { { 43, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[31] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Torama',
            ids    = { 114, 115, 116, 118, 122, 125, 147, 148, 149, 150, 151, 152, 153, 155, 156, 159, 160 },
            levels = {
                [70] = { acc = 289, eva = 274, agi = 73, int = 59, mnd = 51, chr = 61, dex = 77, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 296, eva = 279, agi = 75, int = 60, mnd = 52, chr = 63, dex = 80, def = 292,
                         attack_skill = 237 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 60, mnd = 52, chr = 63, dex = 80, def = 297,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 62, mnd = 54, chr = 64, dex = 80, def = 303,
                         attack_skill = 246 },
            },
            ph_for = { [153] = { 158 }, [156] = { 158 } },
            ph_rules = {
                [153] = {
                    [158] = { chance = 5, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [156] = {
                    [158] = { chance = 5, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 50, item = 927 },  -- coeurl whisker
                { rate = 100, item = 1591 },  -- high-quality coeurl hide
            },
            steal  = { 927 },  -- coeurl whisker
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Coeurl / Beast', notes = { 'Source species: Coeurl (ID 92); family ID 43.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4191, [71] = 4275, [72] = 4359, [73] = 4443 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[108],
                blue = { value = 'Chaotic Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 582, name = 'Chaotic Eye', level = 32, min_skill = 68, skill_ids = { 653 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Labyrinth Manticore',
            ids    = { 119, 123, 126, 157, 162, 185 },
            levels = {
                [71] = { acc = 292, eva = 278, agi = 72, int = 55, mnd = 55, chr = 55, dex = 72, def = 297,
                         attack_skill = 237 },
                [72] = { acc = 297, eva = 283, agi = 72, int = 55, mnd = 55, chr = 55, dex = 72, def = 302,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 58, mnd = 58, chr = 56, dex = 72, def = 309,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 58, mnd = 58, chr = 56, dex = 73, def = 314,
                         attack_skill = 251 },
            },
            ph_for = { [119] = { 120 }, [123] = { 120 } },
            ph_rules = {
                [119] = {
                    [120] = { chance = 10, cooldown_min = 21600, cooldown_max = 21600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [123] = {
                    [120] = { chance = 10, cooldown_min = 21600, cooldown_max = 21600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Manticore / Beast', notes = { 'Source species: Manticore (ID 98); family ID 46.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6412, [72] = 6538, [73] = 6664, [74] = 6790 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[134],
                blue = { value = 'Heat Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 591, name = 'Heat Breath', level = 71, min_skill = 225, skill_ids = { 800 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Narasimha',
            ids    = { 120 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 299, agi = 74, int = 58, mnd = 58, chr = 57, dex = 74, def = 319,
                         attack_skill = 256 },
                [76] = { acc = 319, eva = 304, agi = 76, int = 59, mnd = 59, chr = 57, dex = 76, def = 324,
                         attack_skill = 261 },
                [77] = { acc = 324, eva = 309, agi = 76, int = 60, mnd = 60, chr = 58, dex = 76, def = 329,
                         attack_skill = 266 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 1000, item = 1293 },  -- narasimha hide
                { rate = 150, item = 1293 },  -- narasimha hide
                { rate = 240, item = 1123 },  -- manticore fang
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 150, item = 1123 },  -- manticore fang
                { rate = 100, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1163 },  -- lock of manticore hair
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Manticore / Beast', notes = { 'Source species: Manticore (ID 98); family ID 46.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 31500, [76] = 31500, [77] = 31500 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 12000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 350 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[134],
                blue = { value = 'Heat Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 591, name = 'Heat Breath', level = 71, min_skill = 225, skill_ids = { 800 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hellion',
            ids    = { 131 },
            nm     = true,
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 49, chr = 63, dex = 70, def = 269,
                         attack_skill = 218 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            weapon_dmg = { slashing = 12.5, blunt = -12.5, hand_to_hand = -12.5 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 18041 },  -- a loutrance
                { rate = 240, item = 849 },  -- undead skin
                { rate = 150, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Doomed / Undead', notes = { 'Source species: Doomed (ID 398); family ID 170.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 15600 }, mp = { [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 12000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[154],
                blue = { value = 'Stinking Gas', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 537, name = 'Stinking Gas', level = 44, min_skill = 104, skill_ids = { 489 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tainted Flesh LoO',
            ids    = { 133, 146 },
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 47, mnd = 44, chr = 57, dex = 63, def = 238,
                         attack_skill = 196 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 49, mnd = 46, chr = 59, dex = 66, def = 244,
                         attack_skill = 199 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 46, chr = 59, dex = 66, def = 249,
                         attack_skill = 203 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 46, chr = 59, dex = 66, def = 254,
                         attack_skill = 207 },
            },
            ph_for = { [133] = { 131 } },
            ph_rules = {
                [133] = {
                    [131] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Doomed / Undead', notes = { 'Source species: Doomed (ID 398); family ID 170.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3356, [61] = 3440, [62] = 3523, [63] = 3607 }, mp = { [60] = 0, [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 270 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[154],
                blue = { value = 'Stinking Gas', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 537, name = 'Stinking Gas', level = 44, min_skill = 104, skill_ids = { 489 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Soulstealer Skullnix',
            ids    = { 154 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [69] = { acc = 292, eva = 324, agi = 82, int = 72, mnd = 48, chr = 48, dex = 92, def = 272,
                         attack_skill = 229 },
                [70] = { acc = 297, eva = 342, agi = 83, int = 73, mnd = 49, chr = 49, dex = 93, def = 277,
                         attack_skill = 233 },
                [71] = { acc = 303, eva = 348, agi = 84, int = 75, mnd = 51, chr = 51, dex = 95, def = 282,
                         attack_skill = 237 },
                [72] = { acc = 308, eva = 353, agi = 84, int = 75, mnd = 51, chr = 51, dex = 95, def = 287,
                         attack_skill = 241 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { gravity = 20 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 510 },  -- goblin armor
                { rate = 1000, item = 511 },  -- goblin mask
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 17982 },  -- kard
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 8000, [70] = 8000, [71] = 8000, [72] = 8000 }, mp = { [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 15', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Bomb Toss: fire damage', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = danger[6], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[7] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Ose',
            ids    = { 158 },
            nm     = true,
            job    = 'war/thf',
            levels = {
                [74] = { acc = 314, eva = 360, agi = 79, int = 69, mnd = 52, chr = 60, dex = 86, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 319, eva = 365, agi = 79, int = 69, mnd = 53, chr = 61, dex = 87, def = 313,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 371, agi = 81, int = 71, mnd = 53, chr = 62, dex = 89, def = 318,
                         attack_skill = 261 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 1283 },  -- ose whisker
                { rate = 240, item = 1591 },  -- high-quality coeurl hide
                { rate = 240, item = 4377 },  -- slice of coeurl meat
                { rate = 150, item = 13805 },  -- assault jerkin
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Coeurl / Beast', notes = { 'Source species: Coeurl (ID 92); family ID 43.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 9400, [75] = 9400, [76] = 9400 }, mp = { [74] = 0, [75] = 0, [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10; Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Normal attacks: Paralysis; Blaster: paralysis; Chaotic Eye: silence gaze', notes = { 'Normal attacks: Paralysis. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Blaster: paralysis. Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.', 'Chaotic Eye: silence gaze. Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Paralysis', notes = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, danger[102], danger[106] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Chaotic Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 582, name = 'Chaotic Eye', level = 32, min_skill = 68, skill_ids = { 653 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 161, 165, 172 },
            job    = 'whm/whm',
            levels = {
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70, dex = 60, def = 255,
                         attack_skill = 218 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71, dex = 60, def = 261,
                         attack_skill = 221 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71, dex = 61, def = 267,
                         attack_skill = 225 },
                [69] = { acc = 277, eva = 243, agi = 65, int = 60, mnd = 84, chr = 72, dex = 62, def = 272,
                         attack_skill = 229 },
            },
            ph_for = { [165] = { 154 } },
            ph_rules = {
                [165] = {
                    [154] = { chance = 5, cooldown_min = 7200, cooldown_max = 10800, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1428 },  -- white mages testimony
                { rate = 50, item = 4719 },  -- scroll of regen iii
                { rate = 10, item = 4613 },  -- scroll of cure v
                { rate = 10, item = 4618 },  -- scroll of curaga iv
                { rate = 50, item = 4741 },  -- scroll of shellra iv
                { rate = 50, item = 4750 },  -- scroll of reraise iii
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3512, [67] = 3590, [68] = 3667, [69] = 3745 }, mp = { [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[5], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[77], level_ranges = { { 60, 255 } } }, danger[82], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[84], level_ranges = { { 4, 255 } } }, danger[58], { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 45, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wyvern',
            ids    = { 163 },
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 63, mnd = 52, chr = 60, dex = 80, def = 301,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 66, mnd = 54, chr = 60, dex = 80, def = 307,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 66, mnd = 54, chr = 60, dex = 82, def = 312,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 67, mnd = 55, chr = 62, dex = 82, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4359, [73] = 4443, [74] = 4527, [75] = 4611 }, mp = { [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Dispelling Wind: Buff removal; Deadly Drive: can crit; Fang Rush: can crit; Dread Shriek: Paralysis; Tail Crush: Poison, can crit; Radiant Breath: silence and slow', notes = { 'Dispelling Wind: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Deadly Drive: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fang Rush: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dread Shriek: Paralysis. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Tail Crush: Poison, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Radiant Breath: silence and slow. Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 813, name = 'Dispelling Wind', summary = 'Dispelling Wind: Buff removal', notes = { 'Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 814, name = 'Deadly Drive', summary = 'Deadly Drive: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = danger[69] }, { kind = 'skill', id = 816, name = 'Fang Rush', summary = 'Fang Rush: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 817, name = 'Dread Shriek', summary = 'Dread Shriek: Paralysis', notes = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 818, name = 'Tail Crush', summary = 'Tail Crush: Poison, can crit', notes = danger[67], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[66] }, { kind = 'skill', id = 821, name = 'Radiant Breath', summary = 'Radiant Breath: silence and slow', notes = { 'Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.' }, categories = { 'debuff' }, effects = { 'Silence', 'Slow' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[79] } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Bandit',
            ids    = { 167, 173, 178 },
            job    = 'thf/thf',
            levels = {
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47, dex = 88, def = 255,
                         attack_skill = 218 },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48, dex = 90, def = 261,
                         attack_skill = 221 },
                [68] = { acc = 286, eva = 318, agi = 81, int = 71, mnd = 48, chr = 48, dex = 91, def = 267,
                         attack_skill = 225 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 72, mnd = 48, chr = 48, dex = 92, def = 272,
                         attack_skill = 229 },
            },
            ph_for = { [173] = { 154 } },
            ph_rules = {
                [173] = {
                    [154] = { chance = 5, cooldown_min = 7200, cooldown_max = 10800, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            steal  = { 1431 },  -- thiefs testimony
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3610, [67] = 3690, [68] = 3769, [69] = 3848 }, mp = { [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Shepherd',
            ids    = { 168, 174, 179 },
            job    = 'bst/bst',
            levels = {
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80, dex = 78, def = 255,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83, dex = 78, def = 261,
                         attack_skill = 221 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83, dex = 79, def = 267,
                         attack_skill = 225 },
                [69] = { acc = 286, eva = 262, agi = 59, int = 60, mnd = 60, chr = 84, dex = 80, def = 272,
                         attack_skill = 229 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 17088 },  -- ash staff
                { rate = 150, item = 859 },  -- ram skin
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 50, item = 17865 },  -- jug of singing herbal broth
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3760, [67] = 3842, [68] = 3924, [69] = 4006 }, mp = { [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 170, 176, 181, 184 },
            levels = {
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58, dex = 78, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59, dex = 78, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60, dex = 79, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, dex = 80, def = 282,
                         attack_skill = 229 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 1426 },  -- warriors testimony
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Armored Goblin (ID 124); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857, [67] = 3941, [68] = 4024, [69] = 4108 }, mp = { [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[8],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ubume',
            ids    = { 196 },
            nm     = true,
            job    = 'war/brd',
            levels = {
                [54] = { acc = 203, eva = 189, agi = 57, int = 50, mnd = 50, chr = 56, dex = 60, def = 212,
                         attack_skill = 166 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            weapon_dmg = { slashing = -25, piercing = 25, blunt = -25 },
            weapon_guard = { physical = -50 },
            immune = { 'dark_sleep', 'terror' },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Greater Bird / Bird', notes = { 'Source species: Roc (ID 190); family ID 84.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 5600 }, mp = { [54] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Blind Vortex: Blindness; Dread Dive: Stun; Horde Lullaby: Sleep', notes = { 'Blind Vortex: Blindness. Source targeting: single target.', 'Dread Dive: Stun. Source targeting: single target.', 'Horde Lullaby: Sleep. Scripted spell selection has separate conditions from the ordinary spell-list level limits.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 399, name = 'Blind Vortex', summary = 'Blind Vortex: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 401, name = 'Dread Dive', summary = 'Dread Dive: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[34] }, { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = { 'Scripted spell selection has separate conditions from the ordinary spell-list level limits.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Feather Barrier', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 574, name = 'Feather Barrier', level = 56, min_skill = 152, skill_ids = { 402 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Megapod Megalops',
            ids    = { 197 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 335, eva = 311, agi = 51, int = 55, mnd = 82, chr = 82, dex = 69, def = 392,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 9800 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Bubble Shower: STR down; Big Scissors: can crit', notes = { 'Bubble Shower: STR down. Source targeting: area around the monster.', 'Big Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 442, name = 'Bubble Shower', summary = 'Bubble Shower: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[24] } }, { kind = 'skill', id = 444, name = 'Big Scissors', summary = 'Big Scissors: can crit', notes = danger[67], categories = { 'crit' }, effects = {  }, details = danger[69] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Voso',
            ids    = { 198, 199, 200 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Coeurl / Beast', notes = { 'Source species: Coeurl (ID 92); family ID 43.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[108],
                blue = { value = 'Chaotic Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 582, name = 'Chaotic Eye', level = 32, min_skill = 68, skill_ids = { 653 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
