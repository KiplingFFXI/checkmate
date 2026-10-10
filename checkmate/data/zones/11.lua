-- Oldton Movalpolos (zone 11).
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
danger[14] = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[15] = { 'Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.' };
danger[16] = { 'Normal activation range: 13.5 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[17] = { notes = danger[16], unknown = {  }, activation_range = 13.5, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } } };
danger[18] = { kind = 'skill', id = 591, name = 'Bomb Toss', summary = 'Bomb Toss: fire damage', notes = danger[15], categories = { 'other' }, effects = {  }, details = danger[17] };
danger[19] = { danger[18] };
danger[20] = { value = 'Bomb Toss: fire damage', notes = danger[14], entries = danger[19], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[21] = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison: Poison.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[22] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[23] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[24] = { notes = danger[22], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[23] };
danger[25] = { kind = 'skill', id = 1081, name = 'Frypan', summary = 'Frypan: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[24] };
danger[26] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[27] = { notes = danger[26], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[28] = { kind = 'skill', id = 1082, name = 'Smokebomb', summary = 'Smokebomb: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[27] };
danger[29] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[30] = { notes = danger[29], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[31] = { kind = 'skill', id = 1086, name = 'Paralysis Shower', summary = 'Paralysis Shower: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[30] };
danger[32] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[33] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[34] = { danger[33] };
danger[35] = { notes = danger[32], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[34] };
danger[36] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[35], level_ranges = { { 13, 255 } } };
danger[37] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[38] = { notes = danger[37], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[39] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[38], level_ranges = { { 6, 255 } } };
danger[40] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[41] = { notes = danger[40], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[42] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[41], level_ranges = { { 18, 255 } } };
danger[43] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[44] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[45] = { danger[44] };
danger[46] = { notes = danger[43], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[45] };
danger[47] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[46], level_ranges = { { 21, 255 } } };
danger[48] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[49] = { notes = danger[48], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[50] = { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[49], level_ranges = { { 5, 45 } } };
danger[51] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[52] = { notes = danger[51], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[53] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[52], level_ranges = { { 25, 45 } } };
danger[54] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[55] = { notes = danger[54], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[56] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[55], level_ranges = { { 8, 255 } } };
danger[57] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[58] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[59] = { danger[58] };
danger[60] = { notes = danger[57], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[59] };
danger[61] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[60], level_ranges = { { 11, 255 } } };
danger[62] = { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[52], level_ranges = { { 32, 255 } } };
danger[63] = { danger[25], danger[28], danger[31], danger[36], danger[39], danger[42], danger[47], danger[50], danger[53], danger[56], danger[61], danger[62] };
danger[64] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[65] = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison: Poison; Sleep: sleep; Blind: Blindness; Bind: bind; Dispel: removes a buff', notes = danger[21], entries = danger[63], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] };
danger[66] = { 'Ultrasonics: Evasion down. Source targeting: area around the monster.', 'Blood Drain: HP drain. Source targeting: single target.', 'Subsonics: Defense down. Source targeting: area around the monster.', 'Marrow Drain: MP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[67] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[68] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[69] = { danger[68] };
danger[70] = { notes = danger[67], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[69] };
danger[71] = { kind = 'skill', id = 392, name = 'Ultrasonics', summary = 'Ultrasonics: Evasion down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[70] };
danger[72] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow behavior changes with script conditions; the following are possible rules.', 'Utsusemi and Blink do not absorb the damage step.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[73] = { { mode = 'ignore', per_hit = false }, { mode = 'absorb', per_hit = false, count = 1 } };
danger[74] = { notes = danger[72], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = danger[73] };
danger[75] = { kind = 'skill', id = 394, name = 'Blood Drain', summary = 'Blood Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[74] };
danger[76] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[77] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[78] = { danger[77] };
danger[79] = { notes = danger[76], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[78] };
danger[80] = { kind = 'skill', id = 1155, name = 'Subsonics', summary = 'Subsonics: Defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[79] };
danger[81] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[82] = { notes = danger[81], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[83] = { kind = 'skill', id = 1156, name = 'Marrow Drain', summary = 'Marrow Drain: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[82] };
danger[84] = { danger[71], danger[75], danger[80], danger[83] };
danger[85] = { value = 'Ultrasonics: Evasion down; Blood Drain: HP drain; Subsonics: Defense down; Marrow Drain: MP drain', notes = danger[66], entries = danger[84], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[86] = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[87] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[38], level_ranges = { { 4, 255 } } };
danger[88] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[41], level_ranges = { { 15, 255 } } };
danger[89] = { danger[25], danger[28], danger[31], danger[36], danger[87], danger[88] };
danger[90] = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Slow: slow; Paralyze: paralysis; Silence: silence', notes = danger[86], entries = danger[89], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] };
danger[91] = { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[49], level_ranges = { { 6, 45 } } };
danger[92] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[93] = { notes = danger[92], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[94] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[93], level_ranges = { { 26, 50 } } };
danger[95] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[52], level_ranges = { { 10, 255 } } };
danger[96] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[52], level_ranges = { { 20, 255 } } };
danger[97] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[52], level_ranges = { { 30, 55 } } };
danger[98] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[60], level_ranges = { { 20, 255 } } };
danger[99] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[100] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[101] = { danger[100] };
danger[102] = { notes = danger[99], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[101] };
danger[103] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[102], level_ranges = { { 35, 255 } } };
danger[104] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[105] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[106] = { danger[105] };
danger[107] = { notes = danger[104], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[106] };
danger[108] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[107], level_ranges = { { 31, 255 } } };
danger[109] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[110] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[111] = { danger[110] };
danger[112] = { notes = danger[109], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[111] };
danger[113] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[112], level_ranges = { { 33, 255 } } };
danger[114] = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[115] = { danger[25], danger[28], danger[31] };
danger[116] = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis', notes = danger[114], entries = danger[115], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[117] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[93], level_ranges = { { 24, 71 } } };
danger[118] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[119] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[120] = { danger[119] };
danger[121] = { notes = danger[118], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[120] };
danger[122] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[121], level_ranges = { { 24, 255 } } };
danger[123] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[124] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[125] = { danger[124] };
danger[126] = { notes = danger[123], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[125] };
danger[127] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[126], level_ranges = { { 22, 255 } } };
danger[128] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[129] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[130] = { danger[129] };
danger[131] = { notes = danger[128], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[130] };
danger[132] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[131], level_ranges = { { 20, 255 } } };
danger[133] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[134] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[135] = { danger[134] };
danger[136] = { notes = danger[133], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[135] };
danger[137] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[136], level_ranges = { { 18, 255 } } };
danger[138] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[139] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[140] = { danger[139] };
danger[141] = { notes = danger[138], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[140] };
danger[142] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[141], level_ranges = { { 16, 255 } } };
danger[143] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[144] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[145] = { danger[144] };
danger[146] = { notes = danger[143], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[145] };
danger[147] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[146], level_ranges = { { 27, 255 } } };
danger[148] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[52], level_ranges = { { 12, 255 } } };
danger[149] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[52], level_ranges = { { 25, 255 } } };
danger[150] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[55], level_ranges = { { 4, 255 } } };
danger[151] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[60], level_ranges = { { 7, 255 } } };
danger[152] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[153] = { notes = danger[152], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[154] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[153], level_ranges = { { 31, 55 } } };
danger[155] = { 'Heavy Blow: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Earth Shock: Stun. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[156] = { kind = 'skill', id = 357, name = 'Heavy Blow', summary = 'Heavy Blow: can crit', notes = danger[7], categories = { 'crit' }, effects = {  }, details = danger[9] };
danger[157] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[158] = { notes = danger[157], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[23] };
danger[159] = { kind = 'skill', id = 361, name = 'Earth Shock', summary = 'Earth Shock: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[158] };
danger[160] = { danger[156], danger[159] };
danger[161] = { value = 'Heavy Blow: can crit; Earth Shock: Stun', notes = danger[155], entries = danger[160], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] };
danger[162] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[163] = { notes = danger[162], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[23] };
danger[164] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[163], level_ranges = { { 37, 255 } } };
danger[165] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[52], level_ranges = { { 41, 255 } } };
danger[166] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[167] = { notes = danger[166], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[4] };
danger[168] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[167], level_ranges = { { 43, 255 } } };
danger[169] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[170] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[171] = { danger[170] };
danger[172] = { notes = danger[169], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[171] };
danger[173] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[172], level_ranges = { { 41, 255 } } };
danger[174] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[175] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[176] = { danger[175] };
danger[177] = { notes = danger[174], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[176] };
danger[178] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[177], level_ranges = { { 37, 255 } } };
danger[179] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[180] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[181] = { danger[180] };
danger[182] = { notes = danger[179], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[181] };
danger[183] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[182], level_ranges = { { 39, 255 } } };
danger[184] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[52], level_ranges = { { 45, 255 } } };
danger[185] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[49], level_ranges = { { 46, 255 } } };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Dark Bats', 'Stirge' } },
        [2] = {
            sight = { 'Bugallug', 'Bugbear Bondman', 'Bugbear Servingman', 'Bugbear Strongman', 'Goblin Craftsman',
                      'Goblin Doorman', 'Goblin Freelance', 'Goblin Gutterman', 'Goblin Hammerman',
                      'Goblin Leadman', 'Goblin Oilman', 'Goblin Shovelman', 'Goblin Tollman', 'Goblin Wolfman',
                      'Moblin Ashman', 'Moblin Chapman', 'Moblin Coalman', 'Moblin Gasman', 'Moblin Gurneyman',
                      'Moblin Pickman', 'Moblin Pikeman', 'Moblin Ragman', 'Moblin Repairman', 'Moblin Rodman',
                      'Moblin Witchman' },
        },
        [3] = {
            sight = { 'Bugallug', 'Bugbear Bondman', 'Bugbear Servingman', 'Bugbear Strongman', 'Goblin Craftsman',
                      'Goblin Doorman', 'Goblin Freelance', 'Goblin Gutterman', 'Goblin Hammerman',
                      'Goblin Leadman', 'Goblin Oilman', 'Goblin Shovelman', 'Goblin Tollman', 'Goblin Wolfman',
                      'Moblin Chapman', 'Moblin Coalman', 'Moblin Gasman', 'Moblin Gurneyman', 'Moblin Pickman',
                      'Moblin Pikeman', 'Moblin Ragman', 'Moblin Repairman', 'Moblin Rodman', 'Moblin Witchman' },
        },
        [4] = {
            sight = { 'Bugbear Bondman', 'Bugbear Servingman', 'Bugbear Strongman', 'Goblin Craftsman',
                      'Goblin Doorman', 'Goblin Freelance', 'Goblin Gutterman', 'Goblin Hammerman',
                      'Goblin Leadman', 'Goblin Oilman', 'Goblin Shovelman', 'Goblin Tollman', 'Goblin Wolfman',
                      'Moblin Ashman', 'Moblin Chapman', 'Moblin Coalman', 'Moblin Gasman', 'Moblin Gurneyman',
                      'Moblin Pickman', 'Moblin Pikeman', 'Moblin Ragman', 'Moblin Repairman', 'Moblin Rodman',
                      'Moblin Witchman' },
        },
        [5] = {
            sight = { 'Bugallug', 'Bugbear Bondman', 'Bugbear Servingman', 'Bugbear Strongman', 'Goblin Craftsman',
                      'Goblin Doorman', 'Goblin Freelance', 'Goblin Gutterman', 'Goblin Hammerman',
                      'Goblin Leadman', 'Goblin Oilman', 'Goblin Shovelman', 'Goblin Tollman', 'Moblin Ashman',
                      'Moblin Chapman', 'Moblin Coalman', 'Moblin Gasman', 'Moblin Gurneyman', 'Moblin Pickman',
                      'Moblin Pikeman', 'Moblin Ragman', 'Moblin Repairman', 'Moblin Rodman', 'Moblin Witchman' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Bugallug'] = { id = 56, name = 'Bugbear' },
        ['Bugbear Bondman'] = { id = 56, name = 'Bugbear' },
        ['Bugbear Servingman'] = { id = 56, name = 'Bugbear' },
        ['Bugbear Strongman'] = { id = 56, name = 'Bugbear' },
        ['Dark Bats'] = { id = 81, name = 'Flock Bat' },
        ['Goblin Craftsman'] = { id = 58, name = 'Goblin' },
        ['Goblin Doorman'] = { id = 58, name = 'Goblin' },
        ['Goblin Freelance'] = { id = 58, name = 'Goblin' },
        ['Goblin Gutterman'] = { id = 58, name = 'Goblin' },
        ['Goblin Hammerman'] = { id = 58, name = 'Goblin' },
        ['Goblin Leadman'] = { id = 58, name = 'Goblin' },
        ['Goblin Oilman'] = { id = 58, name = 'Goblin' },
        ['Goblin Shovelman'] = { id = 58, name = 'Goblin' },
        ['Goblin Tollman'] = { id = 58, name = 'Goblin' },
        ['Goblin Wolfman'] = { id = 58, name = 'Goblin' },
        ['Moblin Ashman'] = { id = 58, name = 'Goblin' },
        ['Moblin Chapman'] = { id = 58, name = 'Goblin' },
        ['Moblin Coalman'] = { id = 58, name = 'Goblin' },
        ['Moblin Gasman'] = { id = 58, name = 'Goblin' },
        ['Moblin Gurneyman'] = { id = 58, name = 'Goblin' },
        ['Moblin Pickman'] = { id = 58, name = 'Goblin' },
        ['Moblin Pikeman'] = { id = 58, name = 'Goblin' },
        ['Moblin Ragman'] = { id = 58, name = 'Goblin' },
        ['Moblin Repairman'] = { id = 58, name = 'Goblin' },
        ['Moblin Rodman'] = { id = 58, name = 'Goblin' },
        ['Moblin Witchman'] = { id = 58, name = 'Goblin' },
        ['Stirge'] = { id = 77, name = 'Bat' },
    },
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1 },
            job    = 'pld/pld',
            levels = {
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
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            steal  = { 936 },  -- chunk of rock salt
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 422, [22] = 451, [23] = 481, [24] = 512 }, mp = { [21] = 540, [22] = 568, [23] = 596, [24] = 624 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Blind Crab',
            ids    = { 2 },
            job    = 'pld/pld',
            levels = {
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
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            steal  = { 936 },  -- chunk of rock salt
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [21] = 422, [22] = 451, [23] = 481, [24] = 512 }, mp = { [21] = 540, [22] = 568, [23] = 596, [24] = 624 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Cutter',
            ids    = { 3 },
            job    = 'pld/pld',
            levels = {
                [25] = { acc = 91, eva = 81, agi = 19, int = 20, mnd = 30, chr = 30, dex = 26, def = 109,
                         attack_skill = 74 },
                [26] = { acc = 94, eva = 85, agi = 20, int = 21, mnd = 32, chr = 32, dex = 26, def = 112,
                         attack_skill = 77 },
                [27] = { acc = 97, eva = 87, agi = 20, int = 22, mnd = 33, chr = 33, dex = 27, def = 115,
                         attack_skill = 80 },
                [28] = { acc = 101, eva = 90, agi = 21, int = 22, mnd = 33, chr = 33, dex = 28, def = 118,
                         attack_skill = 83 },
                [29] = { acc = 104, eva = 93, agi = 21, int = 22, mnd = 34, chr = 34, dex = 28, def = 122,
                         attack_skill = 86 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [25] = 562, [26] = 595, [27] = 629, [28] = 667, [29] = 703 }, mp = { [25] = 653, [26] = 681, [27] = 710, [28] = 739, [29] = 768 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Ghost Crab',
            ids    = { 4 },
            job    = 'pld/pld',
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35, dex = 29, def = 137,
                         attack_skill = 89 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37, dex = 31, def = 142,
                         attack_skill = 92 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37, dex = 31, def = 144,
                         attack_skill = 94 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 740, [31] = 835, [32] = 916 }, mp = { [30] = 797, [31] = 826, [32] = 855 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Amoebic Nodule',
            ids    = { 5 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 37, int = 29, mnd = 32, chr = 32, dex = 39, def = 132,
                         attack_skill = 100 },
                [35] = { acc = 127, eva = 119, agi = 38, int = 29, mnd = 32, chr = 33, dex = 39, def = 135,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 123, agi = 40, int = 30, mnd = 33, chr = 34, dex = 42, def = 139,
                         attack_skill = 106 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [34] = 1115, [35] = 1193, [36] = 1275 }, mp = { [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Fluid Toss: can crit; Digest: HP drain', notes = { 'Fluid Toss: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Digest: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 432, name = 'Fluid Toss', summary = 'Fluid Toss: can crit', notes = danger[7], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 433, name = 'Digest', summary = 'Digest: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] },
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dark Bats',
            ids    = { 6, 12, 16, 28, 30, 47, 56, 75, 76, 78, 98, 123, 145, 181 },
            levels = {
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 31, dex = 37, def = 122,
                         attack_skill = 92 },
                [32] = { acc = 117, eva = 111, agi = 40, int = 26, mnd = 26, chr = 31, dex = 37, def = 124,
                         attack_skill = 94 },
                [33] = { acc = 121, eva = 114, agi = 40, int = 29, mnd = 29, chr = 32, dex = 38, def = 128,
                         attack_skill = 97 },
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32, dex = 39, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 33, dex = 39, def = 135,
                         attack_skill = 103 },
            },
            spawn_levels = { [6] = { 31, 33 }, [12] = { 31, 33 }, [16] = { 31, 33 }, [28] = { 31, 33 },
                             [30] = { 31, 33 }, [47] = { 31, 33 }, [56] = { 31, 33 }, [75] = { 32, 34 },
                             [76] = { 32, 34 }, [78] = { 32, 34 }, [98] = { 31, 33 }, [123] = { 32, 34 },
                             [145] = { 34, 35 }, [181] = { 34, 35 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 1,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [31] = 872, [32] = 954, [33] = 1032, [34] = 1115, [35] = 1193 }, mp = { [31] = 0, [32] = 0, [33] = 0, [34] = 0, [35] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sonic Boom: Attack down; Slipstream: Accuracy down', notes = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'Slipstream: Accuracy down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1157, name = 'Slipstream', summary = 'Slipstream: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] },
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Craftsman',
            ids    = { 7, 20, 31, 45, 70, 73, 93, 109, 114 },
            levels = {
                [33] = { acc = 123, eva = 114, agi = 40, int = 29, mnd = 29, chr = 32, dex = 42, def = 128,
                         attack_skill = 97, resist = { virus = 10 } },
                [34] = { acc = 126, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32, dex = 43, def = 131,
                         attack_skill = 100, resist = { virus = 10 } },
                [35] = { acc = 130, eva = 121, agi = 42, int = 29, mnd = 29, chr = 33, dex = 44, def = 135,
                         attack_skill = 103, resist = { virus = 15 } },
                [36] = { acc = 134, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34, dex = 46, def = 138,
                         attack_skill = 106, resist = { virus = 15 } },
            },
            spawn_levels = { [7] = { 33, 35 }, [20] = { 33, 35 }, [31] = { 33, 35 }, [45] = { 33, 35 },
                             [70] = { 33, 35 }, [73] = { 34, 36 }, [93] = { 34, 36 }, [109] = { 35, 36 },
                             [114] = { 35, 36 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 1032, [34] = 1115, [35] = 1193, [36] = 1275 }, mp = { [33] = 0, [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Gutterman',
            ids    = { 8, 17, 44, 66, 103, 117, 122 },
            job    = 'rng/rng',
            levels = {
                [33] = { acc = 143, eva = 107, agi = 47, int = 32, mnd = 35, chr = 32, dex = 39, def = 118,
                         attack_skill = 97 },
                [34] = { acc = 146, eva = 110, agi = 48, int = 32, mnd = 35, chr = 32, dex = 39, def = 121,
                         attack_skill = 100 },
                [35] = { acc = 150, eva = 114, agi = 50, int = 33, mnd = 35, chr = 33, dex = 40, def = 125,
                         attack_skill = 103 },
                [36] = { acc = 153, eva = 116, agi = 51, int = 34, mnd = 37, chr = 34, dex = 41, def = 128,
                         attack_skill = 106 },
            },
            spawn_levels = { [8] = { 33, 35 }, [17] = { 33, 35 }, [44] = { 33, 35 }, [66] = { 33, 35 },
                             [103] = { 34, 36 }, [117] = { 35, 36 }, [122] = { 35, 36 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 906, [34] = 983, [35] = 1057, [36] = 1134 }, mp = { [33] = 0, [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Pickman',
            ids    = { 9, 23, 60, 71, 90, 102, 111, 118 },
            job    = 'rdm/rdm',
            levels = {
                [33] = { acc = 121, eva = 107, agi = 34, int = 38, mnd = 38, chr = 35, dex = 39, def = 117,
                         attack_skill = 97 },
                [34] = { acc = 124, eva = 110, agi = 35, int = 39, mnd = 39, chr = 35, dex = 39, def = 120,
                         attack_skill = 100 },
                [35] = { acc = 128, eva = 113, agi = 36, int = 39, mnd = 39, chr = 35, dex = 40, def = 124,
                         attack_skill = 103 },
                [36] = { acc = 131, eva = 116, agi = 37, int = 42, mnd = 42, chr = 37, dex = 41, def = 127,
                         attack_skill = 106 },
            },
            spawn_levels = { [9] = { 33, 35 }, [23] = { 33, 35 }, [60] = { 33, 35 }, [71] = { 33, 35 },
                             [90] = { 34, 36 }, [102] = { 34, 36 }, [111] = { 35, 36 }, [118] = { 35, 36 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 15 },
            drops  = {
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 947, [34] = 1025, [35] = 1100, [36] = 1178 }, mp = { [33] = 884, [34] = 914, [35] = 943, [36] = 973 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[65],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Leadman',
            ids    = { 10, 33, 38, 52, 67, 94 },
            job    = 'bst/bst',
            levels = {
                [33] = { acc = 123, eva = 109, agi = 31, int = 32, mnd = 32, chr = 45, dex = 42, def = 118,
                         attack_skill = 97, resist = { slow = 10 } },
                [34] = { acc = 126, eva = 113, agi = 32, int = 32, mnd = 32, chr = 45, dex = 43, def = 121,
                         attack_skill = 100, resist = { slow = 10 } },
                [35] = { acc = 130, eva = 116, agi = 32, int = 33, mnd = 33, chr = 47, dex = 44, def = 125,
                         attack_skill = 103, resist = { slow = 15 } },
                [36] = { acc = 134, eva = 119, agi = 33, int = 34, mnd = 34, chr = 48, dex = 46, def = 128,
                         attack_skill = 106, resist = { slow = 15 } },
            },
            spawn_levels = { [10] = { 33, 35 }, [33] = { 33, 35 }, [38] = { 33, 35 }, [52] = { 33, 35 },
                             [67] = { 33, 35 }, [94] = { 34, 36 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1696 },  -- magicked steel ingot
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 993, [34] = 1074, [35] = 1151, [36] = 1232 }, mp = { [33] = 0, [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblins Bat',
            ids    = { 11, 34, 39, 53, 68, 95 },
            levels = {
                [28] = { acc = 103, eva = 97, agi = 35, int = 24, mnd = 24, chr = 28, dex = 33, def = 112,
                         attack_skill = 83 },
                [29] = { acc = 107, eva = 101, agi = 37, int = 25, mnd = 25, chr = 28, dex = 34, def = 115,
                         attack_skill = 86 },
                [30] = { acc = 110, eva = 104, agi = 37, int = 26, mnd = 26, chr = 29, dex = 35, def = 119,
                         attack_skill = 89 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            links  = 1,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [28] = 209, [29] = 220, [30] = 231 }, mp = { [28] = 0, [29] = 0, [30] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[85],
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Witchman',
            ids    = { 13, 15, 21, 32, 63, 74, 92, 116, 119 },
            job    = 'whm/whm',
            levels = {
                [33] = { acc = 118, eva = 101, agi = 34, int = 32, mnd = 45, chr = 38, dex = 33, def = 118,
                         attack_skill = 97 },
                [34] = { acc = 121, eva = 103, agi = 35, int = 32, mnd = 45, chr = 39, dex = 33, def = 121,
                         attack_skill = 100 },
                [35] = { acc = 125, eva = 107, agi = 36, int = 33, mnd = 47, chr = 39, dex = 34, def = 125,
                         attack_skill = 103 },
                [36] = { acc = 128, eva = 109, agi = 37, int = 34, mnd = 48, chr = 42, dex = 34, def = 128,
                         attack_skill = 106 },
            },
            spawn_levels = { [13] = { 33, 35 }, [15] = { 33, 35 }, [21] = { 33, 35 }, [32] = { 33, 35 },
                             [63] = { 33, 35 }, [74] = { 34, 36 }, [92] = { 34, 36 }, [116] = { 35, 36 },
                             [119] = { 35, 36 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1651 },  -- spool of moblin thread
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 1861 },  -- moblin sheepskin
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 906, [34] = 983, [35] = 1057, [36] = 1134 }, mp = { [33] = 884, [34] = 914, [35] = 943, [36] = 973 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[90],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Hammerman',
            ids    = { 14, 27, 40, 61, 69, 85, 110, 113 },
            job    = 'drk/drk',
            levels = {
                [33] = { acc = 123, eva = 112, agi = 37, int = 38, mnd = 26, chr = 26, dex = 42, def = 120,
                         attack_skill = 97 },
                [34] = { acc = 126, eva = 116, agi = 38, int = 39, mnd = 26, chr = 26, dex = 43, def = 123,
                         attack_skill = 100 },
                [35] = { acc = 130, eva = 119, agi = 38, int = 39, mnd = 26, chr = 26, dex = 44, def = 127,
                         attack_skill = 103 },
                [36] = { acc = 134, eva = 123, agi = 40, int = 42, mnd = 28, chr = 28, dex = 46, def = 131,
                         attack_skill = 106 },
            },
            spawn_levels = { [14] = { 33, 35 }, [27] = { 33, 35 }, [40] = { 33, 35 }, [61] = { 33, 35 },
                             [69] = { 33, 35 }, [85] = { 34, 36 }, [110] = { 35, 36 }, [113] = { 35, 36 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 10 },
            drops  = {
                { rate = 100, item = 1696 },  -- magicked steel ingot
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 993, [34] = 1074, [35] = 1151, [36] = 1232 }, mp = { [33] = 884, [34] = 914, [35] = 943, [36] = 973 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Poison: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Bind: bind; Absorb-Vit: VIT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Vit: VIT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[18], danger[91], danger[94], danger[95], danger[96], danger[97], danger[98], danger[103], danger[108], danger[113] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Ragman',
            ids    = { 18, 22, 35, 46, 58, 89, 100, 112, 121 },
            job    = 'thf/thf',
            levels = {
                [33] = { acc = 126, eva = 145, agi = 43, int = 38, mnd = 26, chr = 26, dex = 49, def = 118,
                         attack_skill = 97 },
                [34] = { acc = 129, eva = 149, agi = 44, int = 39, mnd = 26, chr = 26, dex = 49, def = 121,
                         attack_skill = 100 },
                [35] = { acc = 134, eva = 152, agi = 45, int = 39, mnd = 26, chr = 26, dex = 52, def = 125,
                         attack_skill = 103 },
                [36] = { acc = 137, eva = 156, agi = 46, int = 42, mnd = 28, chr = 28, dex = 52, def = 128,
                         attack_skill = 106 },
            },
            spawn_levels = { [18] = { 33, 35 }, [22] = { 33, 35 }, [35] = { 33, 35 }, [46] = { 33, 35 },
                             [58] = { 33, 35 }, [89] = { 34, 36 }, [100] = { 34, 36 }, [112] = { 35, 36 },
                             [121] = { 35, 36 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 947, [34] = 1025, [35] = 1100, [36] = 1178 }, mp = { [33] = 0, [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[116],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Chapman',
            ids    = { 19, 29, 42, 51, 65, 86, 91, 115, 120 },
            job    = 'blm/blm',
            levels = {
                [33] = { acc = 123, eva = 104, agi = 40, int = 45, mnd = 32, chr = 35, dex = 42, def = 115,
                         attack_skill = 97 },
                [34] = { acc = 126, eva = 107, agi = 42, int = 45, mnd = 32, chr = 35, dex = 43, def = 118,
                         attack_skill = 100 },
                [35] = { acc = 130, eva = 110, agi = 42, int = 47, mnd = 33, chr = 35, dex = 44, def = 122,
                         attack_skill = 103 },
                [36] = { acc = 134, eva = 113, agi = 45, int = 48, mnd = 34, chr = 37, dex = 46, def = 125,
                         attack_skill = 106 },
            },
            spawn_levels = { [19] = { 33, 35 }, [29] = { 33, 35 }, [42] = { 33, 35 }, [51] = { 33, 35 },
                             [65] = { 33, 35 }, [86] = { 34, 36 }, [91] = { 34, 36 }, [115] = { 35, 36 },
                             [120] = { 35, 36 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1651 },  -- spool of moblin thread
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 865, [34] = 940, [35] = 1013, [36] = 1088 }, mp = { [33] = 884, [34] = 914, [35] = 943, [36] = 973 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleepga: area sleep', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[25], danger[28], danger[31], danger[117], danger[122], danger[127], danger[132], danger[137], danger[142], danger[147], danger[148], danger[149], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[52], level_ranges = { { 20, 40 } } }, danger[150], danger[151], danger[154] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bugbear Servingman',
            ids    = { 24, 25, 26, 36, 48, 49, 64, 72, 87, 88, 101 },
            job    = 'mnk/mnk',
            levels = {
                [32] = { acc = 120, eva = 109, agi = 30, int = 25, mnd = 32, chr = 31, dex = 42, def = 144,
                         attack_skill = 94 },
                [33] = { acc = 124, eva = 113, agi = 33, int = 26, mnd = 35, chr = 32, dex = 45, def = 147,
                         attack_skill = 97 },
                [34] = { acc = 127, eva = 116, agi = 33, int = 26, mnd = 35, chr = 32, dex = 45, def = 151,
                         attack_skill = 100 },
                [35] = { acc = 131, eva = 120, agi = 34, int = 26, mnd = 35, chr = 33, dex = 47, def = 157,
                         attack_skill = 103 },
            },
            spawn_levels = { [48] = { 33, 35 }, [49] = { 33, 35 }, [64] = { 33, 35 }, [72] = { 33, 35 },
                             [87] = { 33, 35 }, [88] = { 33, 35 }, [101] = { 33, 35 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 10, item = 1654 },  -- igneous rock
            },
            steal  = { 1654 },  -- igneous rock
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [32] = 1127, [33] = 1214, [34] = 1306, [35] = 1426 }, mp = { [32] = 0, [33] = 0, [34] = 0, [35] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 37, 80, 125, 180, 183 },
            job    = 'blm/rdm',
            levels = {
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45, dex = 48, def = 155,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45, dex = 49, def = 158,
                         attack_skill = 135 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47, dex = 50, def = 161,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47, dex = 50, def = 164,
                         attack_skill = 141 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47, dex = 51, def = 167,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1813, [46] = 1889, [47] = 1966, [48] = 2043, [49] = 2116, [50] = 2241 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Earth weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Slow: slow; Rasp: Rasp', notes = { 'Slow: slow. Possible effects: Slow.', 'Rasp: Rasp.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[35], level_ranges = { { 13, 74 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[136], level_ranges = { { 18, 50 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[64] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Bugbear Servingman',
            ids    = { 41, 43 },
            job    = 'mnk/mnk',
            levels = {
                [32] = { acc = 120, eva = 109, agi = 30, int = 25, mnd = 32, chr = 31, dex = 42, def = 144,
                         attack_skill = 94 },
                [33] = { acc = 124, eva = 113, agi = 33, int = 26, mnd = 35, chr = 32, dex = 45, def = 147,
                         attack_skill = 97 },
                [34] = { acc = 127, eva = 116, agi = 33, int = 26, mnd = 35, chr = 32, dex = 45, def = 151,
                         attack_skill = 100 },
                [35] = { acc = 131, eva = 120, agi = 34, int = 26, mnd = 35, chr = 33, dex = 47, def = 157,
                         attack_skill = 103 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 10, item = 1654 },  -- igneous rock
            },
            steal  = { 1654 },  -- igneous rock
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [32] = 1127, [33] = 1214, [34] = 1306, [35] = 1426 }, mp = { [32] = 0, [33] = 0, [34] = 0, [35] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Stirge',
            ids    = { 54, 55, 57, 79, 81, 82, 96, 104, 124, 169, 170 },
            levels = {
                [33] = { acc = 121, eva = 114, agi = 40, int = 29, mnd = 29, chr = 32, dex = 38, def = 128,
                         attack_skill = 97 },
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32, dex = 39, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 33, dex = 39, def = 135,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34, dex = 42, def = 138,
                         attack_skill = 106 },
            },
            spawn_levels = { [54] = { 33, 35 }, [55] = { 33, 35 }, [57] = { 33, 35 }, [79] = { 33, 35 },
                             [81] = { 33, 35 }, [82] = { 33, 35 }, [96] = { 33, 35 }, [104] = { 33, 35 },
                             [124] = { 33, 35 }, [169] = { 34, 36 }, [170] = { 34, 36 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 1,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 1032, [34] = 1115, [35] = 1193, [36] = 1275 }, mp = { [33] = 0, [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[85],
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ancient Bomb',
            ids    = { 59, 62, 84, 97, 99, 126, 146, 171 },
            levels = {
                [40] = { acc = 146, eva = 136, agi = 44, int = 30, mnd = 32, chr = 40, dex = 47, def = 152,
                         attack_skill = 118 },
                [45] = { acc = 164, eva = 152, agi = 49, int = 35, mnd = 37, chr = 45, dex = 52, def = 168,
                         attack_skill = 132 },
            },
            spawn_levels = { [59] = { 40, 40 }, [62] = { 40, 40 }, [84] = { 40, 40 }, [97] = { 40, 40 },
                             [99] = { 40, 40 }, [126] = { 40, 40 }, [146] = { 45, 45 }, [171] = { 45, 45 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 1669 },  -- pinch of hoary bomb ash
                { rate = 150, item = 1669 },  -- pinch of hoary bomb ash
                { rate = 150, item = 1669 },  -- pinch of hoary bomb ash
                { rate = 100, item = 1669 },  -- pinch of hoary bomb ash
                { rate = 50, item = 1062 },  -- oldton chest key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [40] = 1641, [45] = 2046 }, mp = { [40] = 0, [45] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Self-Destruct: explosion; Heat Wave: Burn', notes = { 'Self-Destruct: explosion. Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.', 'Heat Wave: Burn. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 509, name = 'Self-Destruct Bomb', summary = 'Self-Destruct: explosion', notes = { 'Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.' }, categories = { 'other' }, effects = {  }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 512, name = 'Heat Wave', summary = 'Heat Wave: Burn', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[120] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[12] },
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 77, 83, 179, 182 },
            job    = 'blm/rdm',
            levels = {
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45, dex = 48, def = 155,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45, dex = 49, def = 158,
                         attack_skill = 135 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47, dex = 50, def = 161,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47, dex = 50, def = 164,
                         attack_skill = 141 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47, dex = 51, def = 167,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 50, item = 1062 },  -- oldton chest key
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Thunder Elemental (ID 265); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1813, [46] = 1889, [47] = 1966, [48] = 2043, [49] = 2116, [50] = 2241 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Thunder weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Shock: Shock; Stun: stun', notes = { 'Shock: Shock.', 'Stun: stun. Possible effects: Stun.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[141], level_ranges = { { 16, 50 } } }, danger[164] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[64] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Moblin Rodman',
            ids    = { 105, 106, 107, 108 },
            levels = {
                [41] = { acc = 152, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39, dex = 52, def = 155,
                         attack_skill = 121 },
                [42] = { acc = 155, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39, dex = 52, def = 157,
                         attack_skill = 123 },
                [43] = { acc = 158, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39, dex = 52, def = 160,
                         attack_skill = 126 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [41] = 1719, [42] = 1802, [43] = 1885 }, mp = { [41] = 0, [42] = 0, [43] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[116],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bugbear Bondman noroam',
            ids    = { 127, 128, 149, 150, 153, 154 },
            job    = 'mnk/mnk',
            levels = {
                [43] = { acc = 159, eva = 146, agi = 40, int = 32, mnd = 42, chr = 39, dex = 55, def = 188,
                         attack_skill = 126 },
                [44] = { acc = 163, eva = 149, agi = 41, int = 33, mnd = 45, chr = 40, dex = 57, def = 192,
                         attack_skill = 129 },
                [45] = { acc = 166, eva = 153, agi = 42, int = 33, mnd = 45, chr = 42, dex = 57, def = 196,
                         attack_skill = 132 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 10, item = 1654 },  -- igneous rock
            },
            steal  = { 1654 },  -- igneous rock
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [43] = 2205, [44] = 2297, [45] = 2384 }, mp = { [43] = 0, [44] = 0, [45] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Tollman',
            ids    = { 129, 159 },
            job    = 'bst/bst',
            levels = {
                [42] = { acc = 155, eva = 138, agi = 38, int = 39, mnd = 39, chr = 54, dex = 52, def = 147,
                         attack_skill = 123 },
                [43] = { acc = 158, eva = 141, agi = 38, int = 39, mnd = 39, chr = 56, dex = 52, def = 150,
                         attack_skill = 126 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            drops  = {
                { rate = 100, item = 1696 },  -- magicked steel ingot
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1746, [43] = 1828 }, mp = { [42] = 0, [43] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblins Bat',
            ids    = { 130, 160 },
            levels = {
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34, dex = 42, def = 140,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36, dex = 42, def = 144,
                         attack_skill = 112 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            links  = 1,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [37] = 405, [38] = 430 }, mp = { [37] = 0, [38] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[85],
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bugbear Bondman',
            ids    = { 131, 141, 142, 143, 144 },
            job    = 'mnk/mnk',
            levels = {
                [42] = { acc = 156, eva = 143, agi = 40, int = 32, mnd = 42, chr = 39, dex = 55, def = 183,
                         attack_skill = 123 },
                [43] = { acc = 159, eva = 146, agi = 40, int = 32, mnd = 42, chr = 39, dex = 55, def = 188,
                         attack_skill = 126 },
                [44] = { acc = 163, eva = 149, agi = 41, int = 33, mnd = 45, chr = 40, dex = 57, def = 192,
                         attack_skill = 129 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 10, item = 1654 },  -- igneous rock
            },
            steal  = { 1654 },  -- igneous rock
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 2112, [43] = 2205, [44] = 2297 }, mp = { [42] = 0, [43] = 0, [44] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Gasman',
            ids    = { 132, 162, 166, 172 },
            job    = 'whm/whm',
            levels = {
                [42] = { acc = 149, eva = 127, agi = 42, int = 39, mnd = 54, chr = 47, dex = 40, def = 147,
                         attack_skill = 123 },
                [43] = { acc = 152, eva = 130, agi = 42, int = 39, mnd = 56, chr = 47, dex = 40, def = 150,
                         attack_skill = 126 },
                [44] = { acc = 155, eva = 132, agi = 43, int = 40, mnd = 57, chr = 49, dex = 41, def = 154,
                         attack_skill = 129 },
            },
            spawn_levels = { [132] = { 42, 43 }, [162] = { 43, 44 }, [166] = { 43, 44 }, [172] = { 43, 44 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1614, [43] = 1691, [44] = 1769 }, mp = { [42] = 1152, [43] = 1182, [44] = 1212 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[90],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Coalman',
            ids    = { 133, 163, 167, 173 },
            job    = 'blm/blm',
            levels = {
                [42] = { acc = 155, eva = 131, agi = 50, int = 54, mnd = 39, chr = 42, dex = 52, def = 143,
                         attack_skill = 123 },
                [43] = { acc = 158, eva = 134, agi = 50, int = 56, mnd = 39, chr = 42, dex = 52, def = 146,
                         attack_skill = 126 },
                [44] = { acc = 162, eva = 137, agi = 52, int = 57, mnd = 40, chr = 45, dex = 54, def = 149,
                         attack_skill = 129 },
            },
            spawn_levels = { [133] = { 42, 43 }, [163] = { 43, 44 }, [167] = { 43, 44 }, [173] = { 43, 44 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1556, [43] = 1632, [44] = 1708 }, mp = { [42] = 1152, [43] = 1182, [44] = 1212 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[25], danger[28], danger[31], { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[49], level_ranges = { { 43, 64 } } }, danger[117], danger[122], danger[127], danger[132], danger[137], danger[142], danger[147], danger[148], danger[149], danger[150], danger[151], danger[165], danger[154] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Repairman',
            ids    = { 134, 148, 157, 175 },
            job    = 'thf/thf',
            levels = {
                [42] = { acc = 158, eva = 177, agi = 53, int = 47, mnd = 32, chr = 32, dex = 59, def = 147,
                         attack_skill = 123 },
                [43] = { acc = 162, eva = 180, agi = 53, int = 47, mnd = 32, chr = 32, dex = 61, def = 150,
                         attack_skill = 126 },
                [44] = { acc = 166, eva = 184, agi = 55, int = 49, mnd = 33, chr = 33, dex = 62, def = 154,
                         attack_skill = 129 },
            },
            spawn_levels = { [134] = { 42, 43 }, [148] = { 42, 43 }, [157] = { 42, 43 }, [175] = { 43, 44 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1671, [43] = 1750, [44] = 1829 }, mp = { [42] = 0, [43] = 0, [44] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[116],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Doorman',
            ids    = { 135, 138, 147, 177 },
            levels = {
                [42] = { acc = 155, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39, dex = 52, def = 157,
                         attack_skill = 123 },
                [43] = { acc = 158, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39, dex = 52, def = 160,
                         attack_skill = 126 },
                [44] = { acc = 162, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40, dex = 54, def = 164,
                         attack_skill = 129 },
            },
            spawn_levels = { [135] = { 42, 43 }, [138] = { 42, 43 }, [147] = { 42, 43 }, [177] = { 43, 44 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 50, item = 1062 },  -- oldton chest key
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1802, [43] = 1885, [44] = 1968 }, mp = { [42] = 0, [43] = 0, [44] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Oilman',
            ids    = { 136, 140, 152, 176 },
            job    = 'drk/drk',
            levels = {
                [42] = { acc = 155, eva = 141, agi = 45, int = 47, mnd = 32, chr = 32, dex = 52, def = 149,
                         attack_skill = 123 },
                [43] = { acc = 158, eva = 144, agi = 45, int = 47, mnd = 32, chr = 32, dex = 52, def = 152,
                         attack_skill = 126 },
                [44] = { acc = 162, eva = 149, agi = 48, int = 49, mnd = 33, chr = 33, dex = 54, def = 156,
                         attack_skill = 129 },
            },
            spawn_levels = { [136] = { 42, 43 }, [140] = { 42, 43 }, [152] = { 42, 43 }, [176] = { 43, 44 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            drops  = {
                { rate = 100, item = 1696 },  -- magicked steel ingot
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1746, [43] = 1828, [44] = 1909 }, mp = { [42] = 1152, [43] = 1182, [44] = 1212 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Bomb Toss: fire damage; Poison: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[18], danger[91], danger[94], danger[95], danger[96], danger[164], danger[97], danger[98], danger[168], danger[173], danger[103], danger[178], danger[183], danger[108], danger[113] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Pikeman',
            ids    = { 137, 139, 164, 168, 174 },
            job    = 'rdm/rdm',
            levels = {
                [42] = { acc = 152, eva = 135, agi = 42, int = 47, mnd = 47, chr = 42, dex = 47, def = 145,
                         attack_skill = 123 },
                [43] = { acc = 155, eva = 138, agi = 42, int = 47, mnd = 47, chr = 42, dex = 47, def = 148,
                         attack_skill = 126 },
                [44] = { acc = 160, eva = 141, agi = 43, int = 49, mnd = 49, chr = 45, dex = 50, def = 151,
                         attack_skill = 129 },
            },
            spawn_levels = { [137] = { 42, 43 }, [139] = { 42, 43 }, [164] = { 43, 44 }, [168] = { 43, 44 },
                             [174] = { 43, 44 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 15 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1671, [43] = 1750, [44] = 1829 }, mp = { [42] = 1152, [43] = 1182, [44] = 1212 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[65],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bugbear Strongman',
            ids    = { 151, 155 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [50] = { acc = 185, eva = 170, agi = 47, int = 36, mnd = 50, chr = 45, dex = 65, def = 216,
                         attack_skill = 147 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 15369 },  -- aikido koshita
                { rate = 100, item = 14334 },  -- shinimusha haidate
                { rate = 50, item = 1624 },  -- bugbear mask
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 5566 }, mp = { [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Shovelman',
            ids    = { 156, 158 },
            job    = 'rng/rng',
            levels = {
                [42] = { acc = 174, eva = 134, agi = 57, int = 39, mnd = 42, chr = 39, dex = 47, def = 147,
                         attack_skill = 123 },
                [43] = { acc = 177, eva = 138, agi = 59, int = 39, mnd = 42, chr = 39, dex = 47, def = 150,
                         attack_skill = 126 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1614, [43] = 1691 }, mp = { [42] = 0, [43] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Freelance',
            ids    = { 161, 165 },
            levels = {
                [46] = { acc = 169, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42, dex = 57, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 172, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43, dex = 57, def = 173,
                         attack_skill = 138 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 1858 },  -- moblumin ingot
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 2129, [47] = 2212 }, mp = { [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[20],
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Ashman',
            ids    = { 178 },
            job    = 'rdm/rdm',
            levels = {
                [45] = { acc = 163, eva = 144, agi = 45, int = 49, mnd = 49, chr = 45, dex = 50, def = 156,
                         attack_skill = 132 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 15 },
            drops  = {
                { rate = 50, item = 1062 },  -- oldton chest key
                { rate = 150, item = 1729 },  -- moblin hotrok
                { rate = 100, item = 1858 },  -- moblumin ingot
                { rate = 50, item = 1632 },  -- moblin mail
                { rate = 10, item = 1625 },  -- moblin helm
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1904 }, mp = { [45] = 1243 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[65],
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bugallug',
            ids    = { 184 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [45] = { acc = 166, eva = 153, agi = 42, int = 33, mnd = 45, chr = 42, dex = 57, def = 196,
                         attack_skill = 132 },
                [46] = { acc = 171, eva = 156, agi = 43, int = 34, mnd = 45, chr = 42, dex = 60, def = 200,
                         attack_skill = 135 },
                [47] = { acc = 174, eva = 159, agi = 43, int = 35, mnd = 47, chr = 43, dex = 60, def = 204,
                         attack_skill = 138 },
                [48] = { acc = 178, eva = 163, agi = 44, int = 35, mnd = 47, chr = 44, dex = 62, def = 207,
                         attack_skill = 141 },
                [49] = { acc = 181, eva = 167, agi = 46, int = 35, mnd = 47, chr = 44, dex = 62, def = 212,
                         attack_skill = 144 },
                [50] = { acc = 185, eva = 170, agi = 47, int = 36, mnd = 50, chr = 45, dex = 65, def = 216,
                         attack_skill = 147 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            immune = { 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 6666, [46] = 6666, [47] = 6666, [48] = 6666, [49] = 6666, [50] = 6666 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Gurneyman',
            ids    = { 185, 186 },
            job    = 'rdm/whm',
            levels = {
                [46] = { acc = 165, eva = 148, agi = 46, int = 48, mnd = 53, chr = 47, dex = 48, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 151, agi = 46, int = 49, mnd = 55, chr = 49, dex = 49, def = 161,
                         attack_skill = 138 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 15 },
            drops  = {
                { rate = 50, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            steal  = { 751 },  -- platinum beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 1966, [47] = 2044 }, mp = { [46] = 1273, [47] = 1303 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = danger[115], coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[12] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Goblin Wolfman',
            ids    = { 187 },
            nm     = true,
            job    = 'drk/war',
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 50, mnd = 38, chr = 39, dex = 60, def = 185,
                         attack_skill = 147 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 11, stun = -2, gravity = -2 },
            resist = { paralyze = 15, virus = 15 },
            drops  = {
                { rate = 150, item = 15506 },  -- parade gorget
                { rate = 50, item = 507 },  -- goblin mail
                { rate = 10, item = 508 },  -- goblin helm
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 7600 }, mp = { [50] = 1395 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Bottle Of Goblin Drink to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: HP drain; Bomb Toss: fire damage; Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Drain: HP drain; Aspir: MP drain; Stun: stun; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, danger[18], danger[25], danger[28], danger[31], danger[95], danger[96], { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[163], level_ranges = { { 20, 255 } } }, danger[168], danger[173], danger[103], danger[178], danger[183], danger[108], danger[113], danger[184] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[64] },
                blue = { value = 'Bomb Toss, Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } }, { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Goblin Preceptor',
            ids    = { 188 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [45] = { acc = 163, eva = 144, agi = 45, int = 49, mnd = 49, chr = 45, dex = 50, def = 156,
                         attack_skill = 132 },
                [46] = { acc = 166, eva = 148, agi = 46, int = 51, mnd = 51, chr = 45, dex = 51, def = 159,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 151, agi = 46, int = 52, mnd = 52, chr = 47, dex = 52, def = 161,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 153, agi = 47, int = 52, mnd = 52, chr = 47, dex = 53, def = 165,
                         attack_skill = 141 },
                [49] = { acc = 176, eva = 157, agi = 48, int = 53, mnd = 53, chr = 47, dex = 53, def = 168,
                         attack_skill = 144 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 15 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Goblin (ID 126); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1904, [46] = 1982, [47] = 2061, [48] = 2140, [49] = 2215 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Bomb Toss: fire damage; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison: Poison; Poison II: Poison; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Bomb Toss: fire damage. Fire damage that ignores shadows. This entry is the thrown bomb, not the separate suicide move. Source targeting: area around the target.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison: Poison.', 'Poison II: Poison.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[18], danger[36], danger[39], danger[42], danger[47], danger[50], danger[185], danger[53], danger[56], danger[61], { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[52], level_ranges = { { 46, 255 } } }, danger[62] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Bomb Toss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 626, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 591 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Grimoire Guru Grimogek',
            ids    = { 189 },
            job    = 'blm/blm',
            levels = {
                [80] = { acc = 346, eva = 304, agi = 87, int = 96, mnd = 69, chr = 75, dex = 91, def = 322,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 4485 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[25], danger[28], danger[31], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[52], level_ranges = { { 60, 255 } } }, { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[52], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[52], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[52], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[52], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[52], level_ranges = { { 58, 255 } } }, { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[93], level_ranges = { { 72, 255 } } }, danger[122], danger[127], danger[132], danger[137], danger[142], danger[147], danger[148], danger[149], { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[163], level_ranges = { { 45, 255 } } }, danger[150], danger[151], danger[165], { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[153], level_ranges = { { 56, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dread Dealing Dredodak',
            ids    = { 190 },
            job    = 'drk/drk',
            levels = {
                [80] = { acc = 346, eva = 326, agi = 80, int = 82, mnd = 55, chr = 55, dex = 91, def = 333,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 4913 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[25], danger[28], danger[31], danger[185], danger[95], danger[96], danger[164], danger[98], { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[52], level_ranges = { { 56, 255 } } }, danger[168], danger[173], danger[103], danger[178], danger[183], danger[108], danger[113], danger[184] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[64] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bugbear Porterman',
            ids    = { 191, 192, 193, 194 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [45] = { acc = 166, eva = 153, agi = 42, int = 33, mnd = 45, chr = 42, dex = 57, def = 196,
                         attack_skill = 132 },
                [46] = { acc = 171, eva = 156, agi = 43, int = 34, mnd = 45, chr = 42, dex = 60, def = 200,
                         attack_skill = 135 },
                [47] = { acc = 174, eva = 159, agi = 43, int = 35, mnd = 47, chr = 43, dex = 60, def = 204,
                         attack_skill = 138 },
                [48] = { acc = 178, eva = 163, agi = 44, int = 35, mnd = 47, chr = 44, dex = 62, def = 207,
                         attack_skill = 141 },
                [49] = { acc = 181, eva = 167, agi = 46, int = 35, mnd = 47, chr = 44, dex = 62, def = 212,
                         attack_skill = 144 },
                [50] = { acc = 185, eva = 170, agi = 47, int = 36, mnd = 50, chr = 45, dex = 65, def = 216,
                         attack_skill = 147 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Bugbear / Beastmen', notes = { 'Source species: Bugbear (ID 118); family ID 56.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2384, [46] = 2478, [47] = 2570, [48] = 2664, [49] = 2751, [50] = 2922 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0, [49] = 0, [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[161],
                blue = { value = 'Flying Hip Press', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 629, name = 'Flying Hip Press', level = 58, min_skill = 162, skill_ids = { 360 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
