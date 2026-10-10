-- Uleguerand Range (zone 5).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Foot Kick: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Snow Cloud: Paralysis. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[3] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[4] = { notes = danger[3], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[5] = { kind = 'skill', id = 257, name = 'Foot Kick', summary = 'Foot Kick: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[6] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[7] = { notes = danger[6], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[8] = { kind = 'skill', id = 661, name = 'Snow Cloud', summary = 'Snow Cloud: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[7] };
danger[9] = { danger[5], danger[8] };
danger[10] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[11] = { value = 'Foot Kick: can crit; Snow Cloud: Paralysis', notes = danger[1], entries = danger[9], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[12] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[13] = { notes = danger[12], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[14] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[16] = { 'Cold Wave: Frost. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[17] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[18] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[19] = { danger[18] };
danger[20] = { notes = danger[17], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[19] };
danger[21] = { kind = 'skill', id = 528, name = 'Cold Wave', summary = 'Cold Wave: Frost', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[20] };
danger[22] = { danger[21] };
danger[23] = { value = 'Cold Wave: Frost', notes = danger[16], entries = danger[22], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[24] = { 'Rampant Gnaw: Paralysis. Source targeting: single target.', 'Lowing: Plague. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[25] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[26] = { notes = danger[25], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[27] = { kind = 'skill', id = 493, name = 'Rampant Gnaw', summary = 'Rampant Gnaw: Paralysis', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[26] };
danger[28] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[29] = { notes = danger[28], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[30] = { kind = 'skill', id = 497, name = 'Lowing', summary = 'Lowing: Plague', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = danger[29] };
danger[31] = { danger[27], danger[30] };
danger[32] = { value = 'Rampant Gnaw: Paralysis; Lowing: Plague', notes = danger[24], entries = danger[31], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[33] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[34] = { notes = danger[33], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[35] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[34], level_ranges = { { 50, 255 } } };
danger[36] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[37] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[38] = { danger[37] };
danger[39] = { notes = danger[36], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[38] };
danger[40] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[39], level_ranges = { { 7, 255 } } };
danger[41] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[42] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[43] = { danger[42] };
danger[44] = { 'Full-Force Blow: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Gastric Bomb: Attack down. Source targeting: single target.', 'Sandspin: Accuracy down. Source targeting: area around the monster.', 'Tremors: DEX down. Source targeting: area around the monster.', 'Mp Absorption: MP drain. Source targeting: single target.', 'Sound Vacuum Worm: Silence. Source targeting: single target.', 'Quake: Wind magic evasion down.', 'Rasp: Rasp.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[45] = { kind = 'skill', id = 424, name = 'Full-Force Blow', summary = 'Full-Force Blow: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[46] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[47] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[48] = { danger[47] };
danger[49] = { notes = danger[46], unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[48] };
danger[50] = { kind = 'skill', id = 425, name = 'Gastric Bomb', summary = 'Gastric Bomb: Attack down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[49] };
danger[51] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[52] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[53] = { danger[52] };
danger[54] = { notes = danger[51], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[53] };
danger[55] = { kind = 'skill', id = 426, name = 'Sandspin', summary = 'Sandspin: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[54] };
danger[56] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[57] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[58] = { danger[57] };
danger[59] = { notes = danger[56], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[58] };
danger[60] = { kind = 'skill', id = 427, name = 'Tremors', summary = 'Tremors: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[59] };
danger[61] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[62] = { notes = danger[61], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[63] = { kind = 'skill', id = 428, name = 'Mp Absorption', summary = 'Mp Absorption: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[62] };
danger[64] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[65] = { notes = danger[64], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[66] = { kind = 'skill', id = 429, name = 'Sound Vacuum Worm', summary = 'Sound Vacuum Worm: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[65] };
danger[67] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[34], level_ranges = { { 54, 255 } } };
danger[68] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[69] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[70] = { danger[69] };
danger[71] = { notes = danger[68], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[70] };
danger[72] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[71], level_ranges = { { 18, 255 } } };
danger[73] = { danger[45], danger[50], danger[55], danger[60], danger[63], danger[66], danger[67], danger[72], danger[40] };
danger[74] = { value = 'Full-Force Blow: can crit; Gastric Bomb: Attack down; Sandspin: Accuracy down; Tremors: DEX down; Mp Absorption: MP drain; Sound Vacuum Worm: Silence; Quake: Wind magic evasion down; Rasp: Rasp; Bind: bind', notes = danger[44], entries = danger[73], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] };
danger[75] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[76] = { danger[75] };
danger[77] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[78] = { 'Triclip: DEX down. Source targeting: single target.', 'Back Swish: can crit. This move can crit. Its current critical chance is not known. Source targeting: cone.', 'Mow: Poison, can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Frightful Roar: defense down. Attempts Defense Down on its targets. Source targeting: area around the monster. Possible effects: Defense down.', 'Mortal Ray: Doom gaze. Attempts Doom when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Doom. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[79] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[80] = { notes = danger[79], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[58] };
danger[81] = { kind = 'skill', id = 498, name = 'Triclip', summary = 'Triclip: DEX down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[80] };
danger[82] = { 'This move can crit. Its current critical chance is not known. Source targeting: cone.' };
danger[83] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[84] = { notes = danger[83], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[85] = { kind = 'skill', id = 499, name = 'Back Swish', summary = 'Back Swish: can crit', notes = danger[82], categories = { 'crit' }, effects = {  }, details = danger[84] };
danger[86] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[87] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[88] = { notes = danger[87], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[89] = { kind = 'skill', id = 500, name = 'Mow', summary = 'Mow: Poison, can crit', notes = danger[86], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[88] };
danger[90] = { 'Attempts Defense Down on its targets. Source targeting: area around the monster. Possible effects: Defense down.' };
danger[91] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[92] = { notes = danger[91], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[43] };
danger[93] = { kind = 'skill', id = 501, name = 'Frightful Roar', summary = 'Frightful Roar: defense down', notes = danger[90], categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[92] };
danger[94] = { 'Attempts Doom when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Doom. The gaze effect requires the target to face the monster.' };
danger[95] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Doom: Cursna (can fail), Holy Water (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Doom removal is a chance, not a guarantee.' };
danger[96] = { { effect = 'Doom', options = { 'Cursna (can fail)', 'Holy Water (can fail)' } } };
danger[97] = { notes = danger[95], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[96] };
danger[98] = { kind = 'skill', id = 502, name = 'Mortal Ray', summary = 'Mortal Ray: Doom gaze', notes = danger[94], categories = { 'debuff' }, effects = { 'Doom' }, details = danger[97] };
danger[99] = { danger[81], danger[85], danger[89], danger[93], danger[98] };
danger[100] = { value = 'Triclip: DEX down; Back Swish: can crit; Mow: Poison, can crit; Frightful Roar: defense down; Mortal Ray: Doom gaze', notes = danger[78], entries = danger[99], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[101] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[102] = { notes = danger[101], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[103] = { kind = 'skill', id = 472, name = 'Grave Reel', summary = 'Grave Reel: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[102] };
danger[104] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[105] = { notes = danger[104], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[106] = { kind = 'skill', id = 473, name = 'Ectosmash', summary = 'Ectosmash: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[105] };
danger[107] = { kind = 'skill', id = 474, name = 'Fear Touch', summary = 'Fear Touch: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[108] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[109] = { notes = danger[108], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[48] };
danger[110] = { kind = 'skill', id = 475, name = 'Terror Touch', summary = 'Terror Touch: Attack down, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Attack down' }, details = danger[109] };
danger[111] = { 'Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.' };
danger[112] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[113] = { notes = danger[112], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[114] = { kind = 'skill', id = 476, name = 'Curse', summary = 'Curse: curse', notes = danger[111], categories = { 'debuff' }, effects = { 'Curse' }, details = danger[113] };
danger[115] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[116] = { notes = danger[115], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[117] = { kind = 'skill', id = 477, name = 'Dark Sphere', summary = 'Dark Sphere: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[116] };
danger[118] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[119] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[120] = { danger[119] };
danger[121] = { notes = danger[118], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[120] };
danger[122] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[121], level_ranges = { { 21, 255 } } };
danger[123] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[124] = { notes = danger[123], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[125] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[124], level_ranges = { { 70, 255 } } };
danger[126] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[34], level_ranges = { { 12, 255 } } };
danger[127] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[34], level_ranges = { { 25, 82 } } };
danger[128] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[129] = { notes = danger[128], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[77] };
danger[130] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[129], level_ranges = { { 45, 255 } } };
danger[131] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[34], level_ranges = { { 20, 255 } } };
danger[132] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[133] = { notes = danger[132], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[134] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[133], level_ranges = { { 4, 255 } } };
danger[135] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[34], level_ranges = { { 41, 255 } } };
danger[136] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[137] = { notes = danger[136], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[138] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[137], level_ranges = { { 56, 255 } } };
danger[139] = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'Slipstream: Accuracy down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[140] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[141] = { notes = danger[140], unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[48] };
danger[142] = { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[141] };
danger[143] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[144] = { notes = danger[143], unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = danger[53] };
danger[145] = { kind = 'skill', id = 1157, name = 'Slipstream', summary = 'Slipstream: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[144] };
danger[146] = { danger[142], danger[145] };
danger[147] = { value = 'Sonic Boom: Attack down; Slipstream: Accuracy down', notes = danger[139], entries = danger[146], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[148] = { kind = 'skill', id = 478, name = 'Hell Slash', summary = 'Hell Slash: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[149] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[150] = { notes = danger[149], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[76] };
danger[151] = { kind = 'skill', id = 479, name = 'Horror Cloud', summary = 'Horror Cloud: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[150] };
danger[152] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[153] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[154] = { notes = danger[153], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[155] = { kind = 'skill', id = 484, name = 'Black Cloud', summary = 'Black Cloud: Blindness', notes = danger[152], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[154] };
danger[156] = { 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.' };
danger[157] = { kind = 'skill', id = 485, name = 'Blood Saber', summary = 'Blood Saber: HP drain', notes = danger[156], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[102] };
danger[158] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[159] = { notes = danger[158], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[160] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[159], level_ranges = { { 46, 255 } } };
danger[161] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[34], level_ranges = { { 10, 255 } } };
danger[162] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[34], level_ranges = { { 20, 255 } } };
danger[163] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[129], level_ranges = { { 37, 255 } } };
danger[164] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[39], level_ranges = { { 20, 255 } } };
danger[165] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[34], level_ranges = { { 56, 255 } } };
danger[166] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[167] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[168] = { danger[167] };
danger[169] = { notes = danger[166], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[168] };
danger[170] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[169], level_ranges = { { 43, 255 } } };
danger[171] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[172] = { notes = danger[171], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[58] };
danger[173] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[172], level_ranges = { { 41, 255 } } };
danger[174] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[175] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[176] = { danger[175] };
danger[177] = { notes = danger[174], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[176] };
danger[178] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[177], level_ranges = { { 35, 255 } } };
danger[179] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[180] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[181] = { danger[180] };
danger[182] = { notes = danger[179], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[181] };
danger[183] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[182], level_ranges = { { 37, 255 } } };
danger[184] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[185] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[186] = { danger[185] };
danger[187] = { notes = danger[184], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[186] };
danger[188] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[187], level_ranges = { { 39, 255 } } };
danger[189] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[190] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[191] = { danger[190] };
danger[192] = { notes = danger[189], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[191] };
danger[193] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[192], level_ranges = { { 31, 255 } } };
danger[194] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[195] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[196] = { danger[195] };
danger[197] = { notes = danger[194], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[196] };
danger[198] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[197], level_ranges = { { 33, 255 } } };
danger[199] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[34], level_ranges = { { 45, 255 } } };
danger[200] = { 'Blindeye: Blindness. Source targeting: single target.', 'Hypnosis: Sleep. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Mind Break: Max MP down. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Binding Wave: Bind. Source targeting: area around the monster.', 'Level 5 Petrify: Petrification. Source targeting: area around the monster.', 'Drain: HP drain.', 'Bind: bind. Possible effects: Bind.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[201] = { kind = 'skill', id = 548, name = 'Blindeye', summary = 'Blindeye: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[15] };
danger[202] = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' };
danger[203] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[204] = { notes = danger[203], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[205] = { kind = 'skill', id = 550, name = 'Hypnosis', summary = 'Hypnosis: Sleep', notes = danger[202], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[204] };
danger[206] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[207] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Max MP down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[208] = { effect = 'Max MP down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[209] = { danger[208] };
danger[210] = { notes = danger[207], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[209] };
danger[211] = { kind = 'skill', id = 551, name = 'Mind Break', summary = 'Mind Break: Max MP down', notes = danger[206], categories = { 'debuff' }, effects = { 'Max MP down' }, details = danger[210] };
danger[212] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[213] = { notes = danger[212], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[38] };
danger[214] = { kind = 'skill', id = 552, name = 'Binding Wave', summary = 'Binding Wave: Bind', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[213] };
danger[215] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[216] = { notes = danger[215], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[217] = { kind = 'skill', id = 557, name = 'Level 5 Petrify', summary = 'Level 5 Petrify: Petrification', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[216] };
danger[218] = { danger[201], danger[205], danger[211], danger[214], danger[217], danger[126], danger[40], danger[138] };
danger[219] = { value = 'Blindeye: Blindness; Hypnosis: Sleep; Mind Break: Max MP down; Binding Wave: Bind; Level 5 Petrify: Petrification; Drain: HP drain; Bind: bind; Sleepga II: area sleep', notes = danger[200], entries = danger[218], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] };
danger[220] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[221] = { notes = danger[220], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[222] = { kind = 'skill', id = 559, name = 'Soul Drain', summary = 'Soul Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[221] };
danger[223] = { 'Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.' };
danger[224] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[225] = { notes = danger[224], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[226] = { kind = 'skill', id = 560, name = 'Hecatomb Wave', summary = 'Hecatomb Wave: blindness', notes = danger[223], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[225] };
danger[227] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[228] = { notes = danger[227], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[76] };
danger[229] = { kind = 'skill', id = 563, name = 'Demonic Howl', summary = 'Demonic Howl: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[228] };
danger[230] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[34], level_ranges = { { 60, 255 } } };
danger[231] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[34], level_ranges = { { 52, 255 } } };
danger[232] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[34], level_ranges = { { 56, 255 } } };
danger[233] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[34], level_ranges = { { 58, 255 } } };
danger[234] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[124], level_ranges = { { 72, 255 } } };
danger[235] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[236] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[237] = { danger[236] };
danger[238] = { notes = danger[235], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[237] };
danger[239] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[238], level_ranges = { { 24, 255 } } };
danger[240] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[241] = { notes = danger[240], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[19] };
danger[242] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[241], level_ranges = { { 22, 255 } } };
danger[243] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[244] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[245] = { danger[244] };
danger[246] = { notes = danger[243], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[245] };
danger[247] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[246], level_ranges = { { 20, 255 } } };
danger[248] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[249] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[250] = { danger[249] };
danger[251] = { notes = danger[248], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[250] };
danger[252] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[251], level_ranges = { { 16, 255 } } };
danger[253] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[254] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[255] = { danger[254] };
danger[256] = { notes = danger[253], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[255] };
danger[257] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[256], level_ranges = { { 27, 255 } } };
danger[258] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[34], level_ranges = { { 25, 255 } } };
danger[259] = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[260] = { danger[222], danger[226], danger[229] };
danger[261] = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow', notes = danger[259], entries = danger[260], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[262] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[263] = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'Condemnation: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[264] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[265] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[266] = { notes = danger[265], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[77] };
danger[267] = { kind = 'skill', id = 1148, name = 'Condemnation', summary = 'Condemnation: Stun', notes = danger[264], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[266] };
danger[268] = { danger[222], danger[226], danger[229], danger[267] };
danger[269] = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow; Condemnation: Stun', notes = danger[263], entries = danger[268], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[270] = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[271] = { notes = danger[270], unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[272] = { 'Yawn: Sleep. Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[273] = { 'Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: area around the monster.' };
danger[274] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[275] = { notes = danger[274], unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'ignore' } } };
danger[276] = { kind = 'skill', id = 1713, name = 'Yawn', summary = 'Yawn: Sleep', notes = danger[273], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[275] };
danger[277] = { danger[276] };
danger[278] = { value = 'Yawn: Sleep', notes = danger[272], entries = danger[277], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Uleguerand Tiger' } },
        [2] = { sound = { 'Esbat', 'Nightmare Bats', 'Succubus Bats' } },
        [3] = { sound = { 'Glacier Eater', 'Mountain Worm' } },
        [4] = {
            sight = { 'Dread Demon', 'Gore Demon', 'Judicator Demon', 'Kindred Black Mage', 'Kindred Dark Knight',
                      'Kindred Summoner', 'Kindred Warrior', 'Stygian Demon' },
            true_sight = { 'Brontotaur', 'Molech', 'Tyrannotaur' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Brontotaur'] = { id = 94, name = 'Taurus' },
        ['Dread Demon'] = { id = 88, name = 'Demon' },
        ['Esbat'] = { id = 77, name = 'Bat' },
        ['Glacier Eater'] = { id = 10, name = 'Worm' },
        ['Gore Demon'] = { id = 88, name = 'Demon' },
        ['Judicator Demon'] = { id = 88, name = 'Demon' },
        ['Kindred Black Mage'] = { id = 88, name = 'Demon' },
        ['Kindred Dark Knight'] = { id = 88, name = 'Demon' },
        ['Kindred Summoner'] = { id = 88, name = 'Demon' },
        ['Kindred Warrior'] = { id = 88, name = 'Demon' },
        ['Molech'] = { id = 94, name = 'Taurus' },
        ['Mountain Worm'] = { id = 10, name = 'Worm' },
        ['Nightmare Bats'] = { id = 81, name = 'Flock Bat' },
        ['Stygian Demon'] = { id = 88, name = 'Demon' },
        ['Succubus Bats'] = { id = 81, name = 'Flock Bat' },
        ['Tyrannotaur'] = { id = 94, name = 'Taurus' },
        ['Uleguerand Tiger'] = { id = 53, name = 'Tiger' },
    },
    monsters = {
        {
            name   = 'Variable Hare',
            ids    = { 1, 2, 3, 8, 9, 10, 15, 16, 17, 31, 32, 33, 34, 35, 36, 37, 39, 48, 49, 50, 339, 343, 348,
                       349, 362, 363, 364, 365, 366, 367, 368, 369, 371, 372 },
            levels = {
                [58] = { acc = 225, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52, dex = 65, def = 225,
                         attack_skill = 186 },
                [59] = { acc = 231, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53, dex = 67, def = 231,
                         attack_skill = 191 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 47, chr = 53, dex = 67, def = 236,
                         attack_skill = 196 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55, dex = 70, def = 242,
                         attack_skill = 199 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 4382 },  -- frost turnip
            },
            steal  = { 4382 },  -- frost turnip
            info = {
                family = { value = 'Rabbit / Beast', notes = { 'Source species: Rabbit (ID 106); family ID 50.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [58] = 3189, [59] = 3273, [60] = 3356, [61] = 3440 }, mp = { [58] = 0, [59] = 0, [60] = 0, [61] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +10%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[11],
                blue = { value = 'Foot Kick, Wild Carrot', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 577, name = 'Foot Kick', level = 1, min_skill = 0, skill_ids = { 257 } }, { id = 578, name = 'Wild Carrot', level = 30, min_skill = 62, skill_ids = { 323 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Uleguerand Tiger',
            ids    = { 4, 5, 6, 11, 12, 13, 18, 19, 20, 340, 341, 344, 345, 346 },
            levels = {
                [61] = { acc = 242, eva = 227, agi = 66, int = 42, mnd = 49, chr = 55, dex = 70, def = 242,
                         attack_skill = 199 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 42, mnd = 49, chr = 55, dex = 70, def = 247,
                         attack_skill = 203 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 42, mnd = 49, chr = 55, dex = 70, def = 252,
                         attack_skill = 207 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
                { rate = 50, item = 1725 },  -- snow lily
            },
            steal  = { 4358 },  -- slice of hare meat
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Tiger / Beast', notes = { 'Source species: Tiger (ID 114); family ID 53.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3440, [62] = 3523, [63] = 3607 }, mp = { [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 68', notes = { 'Source base speed is 68; the ordinary monster default is 40. Animation speed is 68.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Roar: paralysis', notes = { 'Roar: paralysis. Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 270, name = 'Roar', summary = 'Roar: paralysis', notes = { 'Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[13] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Claw Cyclone', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 587, name = 'Claw Cyclone', level = 20, min_skill = 32, skill_ids = { 273 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cwn Annwn',
            ids    = { 7, 14, 21, 30, 342, 347, 361 },
            levels = {
                [59] = { acc = 229, eva = 216, agi = 63, int = 47, mnd = 44, chr = 57, dex = 63, def = 224,
                         attack_skill = 191 },
                [60] = { acc = 234, eva = 221, agi = 63, int = 47, mnd = 44, chr = 57, dex = 63, def = 229,
                         attack_skill = 196 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 49, mnd = 46, chr = 59, dex = 66, def = 235,
                         attack_skill = 199 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 46, chr = 59, dex = 66, def = 240,
                         attack_skill = 203 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 46, chr = 59, dex = 66, def = 245,
                         attack_skill = 207 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 46, chr = 60, dex = 68, def = 250,
                         attack_skill = 210 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = 12.5 },
            undead = true,
            drops  = {
                { rate = 50, item = 858 },  -- wolf hide
                { rate = 100, item = 1725 },  -- snow lily
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Hound / Undead', notes = { 'Source species: Hound (ID 409); family ID 174.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [59] = 3273, [60] = 3356, [61] = 3440, [62] = 3523, [63] = 3607, [64] = 3690 }, mp = { [59] = 0, [60] = 0, [61] = 0, [62] = 0, [63] = 0, [64] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Howling: Paralysis; Poison Breath Hound: Poison; Rot Gas: Disease; Dirty Claw: can crit; Shadow Claw: Blindness', notes = { 'Howling: Paralysis. Source targeting: area around the monster.', 'Poison Breath Hound: Poison. Source targeting: cone.', 'Rot Gas: Disease. Source targeting: area around the monster.', 'Dirty Claw: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Shadow Claw: Blindness. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 465, name = 'Howling', summary = 'Howling: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[13] }, { kind = 'skill', id = 466, name = 'Poison Breath Hound', summary = 'Poison Breath Hound: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 467, name = 'Rot Gas', summary = 'Rot Gas: Disease', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } } }, { kind = 'skill', id = 468, name = 'Dirty Claw', summary = 'Dirty Claw: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] }, { kind = 'skill', id = 469, name = 'Shadow Claw', summary = 'Shadow Claw: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[15] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Poison Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 536, name = 'Poison Breath', level = 22, min_skill = 38, skill_ids = { 466 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Snoll',
            ids    = { 22, 23, 24, 25, 38, 41, 43, 44, 45, 46, 351, 352, 353, 373, 374 },
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 44, mnd = 47, chr = 57, dex = 67, def = 236,
                         attack_skill = 196 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 46, mnd = 49, chr = 59, dex = 70, def = 242,
                         attack_skill = 199 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 46, mnd = 49, chr = 59, dex = 70, def = 247,
                         attack_skill = 203 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 46, mnd = 49, chr = 59, dex = 70, def = 252,
                         attack_skill = 207 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3356, [61] = 3440, [62] = 3523, [63] = 3607 }, mp = { [60] = 0, [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Buffalo',
            ids    = { 26, 27, 28, 29, 354, 355, 356, 357, 358, 359 },
            job    = 'pld/pld',
            levels = {
                [62] = { acc = 239, eva = 221, agi = 45, int = 45, mnd = 66, chr = 66, dex = 55, def = 336,
                         attack_skill = 203 },
                [63] = { acc = 244, eva = 226, agi = 45, int = 45, mnd = 66, chr = 66, dex = 55, def = 343,
                         attack_skill = 207 },
                [64] = { acc = 250, eva = 232, agi = 46, int = 46, mnd = 68, chr = 68, dex = 56, def = 349,
                         attack_skill = 210 },
                [65] = { acc = 256, eva = 237, agi = 46, int = 46, mnd = 68, chr = 68, dex = 58, def = 356,
                         attack_skill = 214 },
            },
            ph_for = { [359] = { 360 } },
            ph_rules = {
                [359] = {
                    [360] = { chance = 5, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 5152 },  -- slice of buffalo meat
                { rate = 10, item = 1628 },  -- buffalo hide
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Buffalo / Beast', notes = { 'Source species: Buffalo (ID 88); family ID 40.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3432, [63] = 3514, [64] = 3596, [65] = 3678 }, mp = { [62] = 889, [63] = 904, [64] = 920, [65] = 936 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[32],
                blue = { value = 'Lowing', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 588, name = 'Lowing', level = 71, min_skill = 225, skill_ids = { 497 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 40, 47, 82, 115, 154, 158, 199, 201, 224, 279, 280, 281, 286, 296, 299, 350, 370 },
            job    = 'blm/rdm',
            levels = {
                [64] = { acc = 255, eva = 233, agi = 64, int = 75, mnd = 60, chr = 62, dex = 66, def = 243,
                         attack_skill = 210 },
                [65] = { acc = 260, eva = 238, agi = 65, int = 76, mnd = 61, chr = 62, dex = 66, def = 249,
                         attack_skill = 214 },
                [66] = { acc = 265, eva = 244, agi = 66, int = 77, mnd = 62, chr = 62, dex = 67, def = 253,
                         attack_skill = 218 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65, dex = 69, def = 258,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65, dex = 69, def = 263,
                         attack_skill = 225 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67, dex = 72, def = 279,
                         attack_skill = 237 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67, dex = 72, def = 284,
                         attack_skill = 241 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72, dex = 77, def = 304,
                         attack_skill = 261 },
                [77] = { acc = 324, eva = 299, agi = 75, int = 89, mnd = 71, chr = 72, dex = 77, def = 310,
                         attack_skill = 266 },
                [82] = { acc = 354, eva = 326, agi = 80, int = 94, mnd = 76, chr = 77, dex = 82, def = 336,
                         attack_skill = 293 },
                [83] = { acc = 360, eva = 331, agi = 80, int = 95, mnd = 76, chr = 77, dex = 82, def = 341,
                         attack_skill = 299 },
                [84] = { acc = 367, eva = 336, agi = 82, int = 96, mnd = 77, chr = 80, dex = 85, def = 346,
                         attack_skill = 305 },
            },
            spawn_levels = { [40] = { 64, 65 }, [47] = { 64, 65 }, [82] = { 71, 72 }, [115] = { 71, 72 },
                             [154] = { 76, 77 }, [158] = { 76, 77 }, [199] = { 82, 84 }, [201] = { 82, 84 },
                             [224] = { 82, 84 }, [279] = { 82, 84 }, [280] = { 82, 84 }, [281] = { 82, 84 },
                             [286] = { 82, 84 }, [296] = { 82, 84 }, [299] = { 82, 84 }, [350] = { 66, 68 },
                             [370] = { 66, 68 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Ice Elemental (ID 263); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [64] = 3323, [65] = 3400, [66] = 3477, [67] = 3555, [68] = 3632, [71] = 3864, [72] = 3942, [76] = 4253, [77] = 4331, [82] = 4719, [83] = 4797, [84] = 4875 }, mp = { [64] = 1831, [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957, [71] = 2053, [72] = 2085, [76] = 2213, [77] = 2245, [82] = 2406, [83] = 2439, [84] = 2471 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Ice weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Paralyze: paralysis; Freeze: Fire magic evasion down; Bind: bind', notes = { 'Paralyze: paralysis. Possible effects: Paralysis.', 'Freeze: Fire magic evasion down.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } }, level_ranges = { { 4, 255 } } }, danger[35], danger[40] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[41] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Esbat',
            ids    = { 51, 54, 375, 377, 379 },
            levels = {
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53, dex = 63, def = 230,
                         attack_skill = 191 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53, dex = 63, def = 235,
                         attack_skill = 196 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55, dex = 66, def = 240,
                         attack_skill = 199 },
            },
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
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [59] = 3273, [60] = 3356, [61] = 3440 }, mp = { [59] = 0, [60] = 0, [61] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Ultrasonics: Evasion down; Blood Drain: HP drain; Subsonics: Defense down; Marrow Drain: MP drain', notes = { 'Ultrasonics: Evasion down. Source targeting: area around the monster.', 'Blood Drain: HP drain. Source targeting: single target.', 'Subsonics: Defense down. Source targeting: area around the monster.', 'Marrow Drain: MP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 392, name = 'Ultrasonics', summary = 'Ultrasonics: Evasion down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 394, name = 'Blood Drain', summary = 'Blood Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow behavior changes with script conditions; the following are possible rules.', 'Utsusemi and Blink do not absorb the damage step.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false }, { mode = 'absorb', per_hit = false, count = 1 } } } }, { kind = 'skill', id = 1155, name = 'Subsonics', summary = 'Subsonics: Defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[43] } }, { kind = 'skill', id = 1156, name = 'Marrow Drain', summary = 'Marrow Drain: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Glacier Eater',
            ids    = { 52, 53, 55, 56, 376, 378, 380, 381 },
            job    = 'blm/rdm',
            levels = {
                [58] = { acc = 222, eva = 202, agi = 58, int = 72, mnd = 55, chr = 53, dex = 59, def = 211,
                         attack_skill = 186 },
                [59] = { acc = 228, eva = 208, agi = 60, int = 74, mnd = 56, chr = 54, dex = 61, def = 216,
                         attack_skill = 191 },
                [60] = { acc = 233, eva = 213, agi = 60, int = 74, mnd = 56, chr = 54, dex = 61, def = 221,
                         attack_skill = 196 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 77, mnd = 59, chr = 57, dex = 64, def = 226,
                         attack_skill = 199 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 77, mnd = 59, chr = 57, dex = 64, def = 231,
                         attack_skill = 203 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 1885 },  -- chunk of zincite
                { rate = 150, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            steal  = { 17296 },  -- pebble
            links  = 3,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [58] = 2859, [59] = 2937, [60] = 3014, [61] = 3091, [62] = 3168 }, mp = { [58] = 1643, [59] = 1674, [60] = 1705, [61] = 1737, [62] = 1768 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[74],
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nival Raptor',
            ids    = { 57, 58, 61, 62, 63, 67, 68, 69, 70, 71, 83, 84, 85, 86, 89, 90, 91, 92, 93, 101, 102, 104,
                       107 },
            levels = {
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
            },
            ranks  = { fire = -3, earth = -2, thunder = -2, water = -2, light = -2, dark = -2, slow = -2,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Raptor / Lizard', notes = { 'Source species: Nival Raptor (ID 497); family ID 129.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Frost Breath: Paralysis; Chomp Rush: Slow; Scythe Tail: Stun', notes = { 'Frost Breath: Paralysis. Source targeting: cone.', 'Chomp Rush: Slow. Source targeting: single target.', 'Scythe Tail: Stun. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 377, name = 'Frost Breath', summary = 'Frost Breath: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 379, name = 'Chomp Rush', summary = 'Chomp Rush: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[76] } }, { kind = 'skill', id = 380, name = 'Scythe Tail', summary = 'Scythe Tail: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[77] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Frost Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 608, name = 'Frost Breath', level = 66, min_skill = 201, skill_ids = { 377 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Polar Hare',
            ids    = { 59, 60, 64, 65, 66, 72, 73, 75, 76, 77, 78, 79, 80, 87, 88 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58, dex = 72, def = 263,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58, dex = 75, def = 267,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59, dex = 75, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60, dex = 75, def = 278,
                         attack_skill = 225 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 4382 },  -- frost turnip
            },
            steal  = { 4382 },  -- frost turnip
            info = {
                family = { value = 'Rabbit / Beast', notes = { 'Source species: Alabaster Rabbit (ID 103); family ID 50.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774, [66] = 3857, [67] = 3941, [68] = 4024 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +10%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[11],
                blue = { value = 'Foot Kick, Wild Carrot', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 577, name = 'Foot Kick', level = 1, min_skill = 0, skill_ids = { 257 } }, { id = 578, name = 'Wild Carrot', level = 30, min_skill = 62, skill_ids = { 323 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Morozko',
            ids    = { 81, 110, 111, 112, 124, 127 },
            levels = {
                [67] = { acc = 273, eva = 258, agi = 71, int = 49, mnd = 53, chr = 63, dex = 75, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 50, mnd = 53, chr = 64, dex = 75, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 51, mnd = 54, chr = 65, dex = 77, def = 283,
                         attack_skill = 229 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 51, mnd = 55, chr = 65, dex = 77, def = 289,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [67] = 0, [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Giant Buffalo',
            ids    = { 94, 95, 96, 97, 98, 99, 100 },
            job    = 'pld/pld',
            levels = {
                [68] = { acc = 271, eva = 252, agi = 48, int = 48, mnd = 71, chr = 71, dex = 60, def = 374,
                         attack_skill = 225 },
                [69] = { acc = 276, eva = 257, agi = 48, int = 48, mnd = 72, chr = 72, dex = 60, def = 381,
                         attack_skill = 229 },
                [70] = { acc = 281, eva = 262, agi = 49, int = 49, mnd = 73, chr = 73, dex = 61, def = 403,
                         attack_skill = 233 },
                [71] = { acc = 287, eva = 267, agi = 51, int = 51, mnd = 75, chr = 75, dex = 63, def = 409,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 5152 },  -- slice of buffalo meat
                { rate = 50, item = 1628 },  -- buffalo hide
                { rate = 10, item = 1615 },  -- buffalo horn
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Buffalo / Beast', notes = { 'Source species: Buffalo (ID 88); family ID 40.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 3924, [69] = 4006, [70] = 4088, [71] = 4170 }, mp = { [68] = 983, [69] = 999, [70] = 1015, [71] = 1031 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[32],
                blue = { value = 'Lowing', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 588, name = 'Lowing', level = 71, min_skill = 225, skill_ids = { 497 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Brontotaur',
            ids    = { 103, 105, 106, 108, 109 },
            job    = 'mnk/mnk',
            levels = {
                [68] = { acc = 281, eva = 260, agi = 50, int = 45, mnd = 69, chr = 64, dex = 81, def = 276,
                         attack_skill = 225 },
                [69] = { acc = 287, eva = 265, agi = 51, int = 45, mnd = 70, chr = 65, dex = 82, def = 281,
                         attack_skill = 229 },
                [70] = { acc = 292, eva = 270, agi = 51, int = 45, mnd = 71, chr = 65, dex = 83, def = 286,
                         attack_skill = 233 },
                [71] = { acc = 298, eva = 275, agi = 52, int = 48, mnd = 72, chr = 68, dex = 84, def = 292,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1620 },  -- taurus horn
                { rate = 50, item = 1621 },  -- taurus wing
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Taurus / Demon', notes = { 'Source species: Taurus (ID 217); family ID 94.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4247, [69] = 4332, [70] = 4477, [71] = 4562 }, mp = { [68] = 0, [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[100],
                blue = { value = 'Frightful Roar', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 561, name = 'Frightful Roar', level = 50, min_skill = 122, skill_ids = { 501 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Snow Maiden',
            ids    = { 113 },
            nm     = true,
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 52, mnd = 55, chr = 68, dex = 80, def = 293,
                         attack_skill = 237 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68, dex = 80, def = 298,
                         attack_skill = 241 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 240, item = 17306 },  -- snoll arm
                { rate = 150, item = 15507 },  -- purgatory collar
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 13500, [72] = 13500 }, mp = { [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Father Frost',
            ids    = { 114 },
            nm     = true,
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69, dex = 82, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 55, mnd = 58, chr = 70, dex = 82, def = 315,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 240, item = 17306 },  -- snoll arm
                { rate = 150, item = 15507 },  -- purgatory collar
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 14000, [75] = 14000 }, mp = { [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Phasma',
            ids    = { 116 },
            job    = 'war/blm',
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 67, mnd = 51, chr = 65, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 67, mnd = 52, chr = 66, dex = 71, def = 276,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 69, mnd = 53, chr = 67, dex = 72, def = 281,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 69, mnd = 53, chr = 67, dex = 73, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 71, mnd = 55, chr = 69, dex = 75, def = 291,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 71, mnd = 55, chr = 69, dex = 75, def = 296,
                         attack_skill = 241 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 4788 },  -- scroll of blizzaga ii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3795, [68] = 3876, [69] = 3957, [70] = 4038, [71] = 4120, [72] = 4202 }, mp = { [67] = 1926, [68] = 1957, [69] = 1989, [70] = 2021, [71] = 2053, [72] = 2085 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga: area poison; Poisonga II: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga: area poison. Possible effects: Poison.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[103], danger[106], danger[107], danger[110], danger[114], danger[117], danger[35], danger[67], danger[122], { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[124], level_ranges = { { 24, 69 } } }, danger[125], danger[126], danger[127], danger[130], danger[131], danger[134], danger[40], danger[135], danger[138] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Succubus Bats',
            ids    = { 117, 118, 119, 120, 123, 126 },
            levels = {
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58, dex = 68, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58, dex = 70, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
            },
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
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774, [66] = 3857, [67] = 3941, [68] = 4024 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[147],
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Doom Soldier',
            ids    = { 121, 122, 125 },
            job    = 'drk/drk',
            levels = {
                [66] = { acc = 269, eva = 249, agi = 62, int = 70, mnd = 44, chr = 47, dex = 75, def = 261,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 255, agi = 65, int = 71, mnd = 44, chr = 48, dex = 75, def = 266,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 260, agi = 65, int = 71, mnd = 45, chr = 48, dex = 75, def = 271,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 265, agi = 65, int = 72, mnd = 45, chr = 48, dex = 77, def = 277,
                         attack_skill = 229 },
                [70] = { acc = 289, eva = 271, agi = 67, int = 73, mnd = 45, chr = 49, dex = 77, def = 282,
                         attack_skill = 233 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3760, [67] = 3842, [68] = 3924, [69] = 4006, [70] = 4088 }, mp = { [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989, [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[148], danger[151], danger[155], danger[157], danger[160], danger[161], danger[162], danger[163], danger[164], danger[165], danger[170], danger[173], danger[178], danger[183], danger[188], danger[193], danger[198], danger[199] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fachan',
            ids    = { 128, 129, 130, 131, 132, 133, 134 },
            job    = 'war/blm',
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 72, mnd = 56, chr = 66, dex = 80, def = 303,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 73, mnd = 56, chr = 66, dex = 82, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 74, mnd = 57, chr = 67, dex = 82, def = 313,
                         attack_skill = 256 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 50, item = 935 },  -- ahriman wing
            },
            steal  = { 921 },  -- bottle of ahriman tears
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Ahriman / Demon', notes = { 'Source species: Ahriman (ID 195); family ID 87.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4284, [74] = 4365, [75] = 4447 }, mp = { [73] = 2117, [74] = 2149, [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[219],
                blue = { value = 'Eyes On Me', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 557, name = 'Eyes On Me', level = 61, min_skill = 176, skill_ids = { 549 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dread Demon UR',
            ids    = { 135, 140 },
            job    = 'blm/war',
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 85, mnd = 55, chr = 73, dex = 82, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 86, mnd = 55, chr = 75, dex = 85, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 87, mnd = 56, chr = 75, dex = 85, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 50, item = 4754 },  -- scroll of fire iii
                { rate = 50, item = 4783 },  -- scroll of firaga ii
                { rate = 10, item = 4784 },  -- scroll of firaga iii
                { rate = 10, item = 4755 },  -- scroll of fire iv
                { rate = 5, item = 4812 },  -- scroll of flare
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4265, [76] = 4344, [77] = 4423 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[222], danger[226], danger[229], danger[230], danger[35], danger[231], danger[67], danger[232], danger[233], danger[234], danger[239], danger[242], danger[247], danger[72], danger[252], danger[257], danger[126], danger[258], danger[130], danger[134], danger[40], danger[135], danger[138] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Judicator Demon UR',
            ids    = { 136, 143 },
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 317, eva = 297, agi = 70, int = 82, mnd = 44, chr = 57, dex = 82, def = 308,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 302, agi = 72, int = 85, mnd = 45, chr = 59, dex = 85, def = 314,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 307, agi = 72, int = 85, mnd = 46, chr = 59, dex = 85, def = 319,
                         attack_skill = 266 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 50, item = 4875 },  -- scroll of absorb-dex
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4500, [76] = 4583, [77] = 4665 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[222], danger[226], danger[229], danger[160], danger[161], danger[162], danger[163], danger[164], danger[165], danger[170], danger[173], danger[178], danger[183], danger[188], danger[193], danger[198], danger[199] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tyrannotaur',
            ids    = { 137, 138, 141, 142, 146, 147, 151, 152 },
            job    = 'mnk/mnk',
            levels = {
                [72] = { acc = 303, eva = 280, agi = 52, int = 48, mnd = 72, chr = 68, dex = 84, def = 297,
                         attack_skill = 241 },
                [73] = { acc = 309, eva = 286, agi = 54, int = 48, mnd = 74, chr = 68, dex = 86, def = 302,
                         attack_skill = 246 },
                [74] = { acc = 314, eva = 291, agi = 54, int = 48, mnd = 75, chr = 69, dex = 87, def = 307,
                         attack_skill = 251 },
                [75] = { acc = 320, eva = 296, agi = 55, int = 49, mnd = 75, chr = 70, dex = 88, def = 314,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1620 },  -- taurus horn
                { rate = 50, item = 1621 },  -- taurus wing
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Taurus / Demon', notes = { 'Source species: Taurus (ID 217); family ID 94.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4648, [73] = 4733, [74] = 4819, [75] = 4904 }, mp = { [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[100],
                blue = { value = 'Frightful Roar', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 561, name = 'Frightful Roar', level = 50, min_skill = 122, skill_ids = { 501 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gore Demon UR',
            ids    = { 139, 148 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 63, mnd = 50, chr = 70, dex = 82, def = 315,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 64, mnd = 50, chr = 71, dex = 85, def = 320,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 65, mnd = 52, chr = 71, dex = 85, def = 325,
                         attack_skill = 266 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4611, [76] = 4695, [77] = 4779 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[261],
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Stygian Demon UR',
            ids    = { 144, 149 },
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 311, eva = 273, agi = 70, int = 88, mnd = 75, chr = 88, dex = 70, def = 299,
                         attack_skill = 256 },
                [76] = { acc = 316, eva = 279, agi = 72, int = 89, mnd = 75, chr = 89, dex = 71, def = 303,
                         attack_skill = 261 },
                [77] = { acc = 321, eva = 283, agi = 72, int = 91, mnd = 78, chr = 91, dex = 71, def = 309,
                         attack_skill = 266 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 50, item = 4897 },  -- ice spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 3989, [76] = 4064, [77] = 4140 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[261],
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Demons Elemental',
            ids    = { 145, 150, 181, 188, 196, 222, 230, 238, 248, 264, 269 },
            job    = 'drk/war',
            levels = {
                [66] = { acc = 267, eva = 250, agi = 65, int = 64, mnd = 49, chr = 51, dex = 70, def = 269,
                         attack_skill = 218 },
                [72] = { acc = 298, eva = 282, agi = 70, int = 68, mnd = 52, chr = 55, dex = 75, def = 301,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 70, mnd = 54, chr = 56, dex = 76, def = 307,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 293, agi = 72, int = 71, mnd = 54, chr = 56, dex = 77, def = 312,
                         attack_skill = 251 },
            },
            spawn_levels = { [145] = { 72, 74 }, [150] = { 66, 66 }, [181] = { 72, 74 }, [188] = { 72, 74 },
                             [196] = { 72, 74 }, [222] = { 72, 74 }, [230] = { 72, 74 }, [238] = { 72, 74 },
                             [248] = { 72, 74 }, [264] = { 72, 74 }, [269] = { 72, 74 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [66] = 1137, [72] = 1286, [73] = 1311, [74] = 1336 }, mp = { [66] = 1894, [72] = 2085, [73] = 2117, [74] = 2149 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Str: STR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Dex: DEX down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Vit: VIT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Agi: AGI down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Int: INT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Mnd: MND down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Chr: CHR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Tp: TP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, entries = { { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[262], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[159], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[262], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[34], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[262], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[34], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[129], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[39], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[34], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = danger[262], categories = { 'debuff' }, effects = { 'STR down' }, details = danger[169], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = danger[262], categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[172], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = danger[262], categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[177], level_ranges = { { 35, 255 } } }, { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = danger[262], categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[182], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = danger[262], categories = { 'debuff' }, effects = { 'INT down' }, details = danger[187], level_ranges = { { 39, 255 } } }, { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = danger[262], categories = { 'debuff' }, effects = { 'MND down' }, details = danger[192], level_ranges = { { 31, 255 } } }, { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = danger[262], categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[197], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = danger[262], categories = { 'drain' }, effects = { 'TP drain' }, details = danger[34], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[41] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Akselloak',
            ids    = { 153, 155, 156, 157 },
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 52, mnd = 55, chr = 68, dex = 80, def = 293,
                         attack_skill = 237 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68, dex = 80, def = 298,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68, dex = 80, def = 305,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69, dex = 82, def = 310,
                         attack_skill = 251 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 4275, [72] = 4359, [73] = 4443, [74] = 4527 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Srei Ap',
            ids    = { 159, 160, 161 },
            job    = 'war/blm',
            levels = {
                [71] = { acc = 293, eva = 279, agi = 75, int = 71, mnd = 55, chr = 69, dex = 75, def = 291,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 71, mnd = 55, chr = 69, dex = 75, def = 296,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 72, mnd = 56, chr = 70, dex = 76, def = 303,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 73, mnd = 56, chr = 71, dex = 77, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 74, mnd = 57, chr = 72, dex = 77, def = 313,
                         attack_skill = 256 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 75, mnd = 57, chr = 73, dex = 80, def = 318,
                         attack_skill = 261 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 1844 },  -- square of spectral goldenrod
                { rate = 50, item = 4788 },  -- scroll of blizzaga ii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 4120, [72] = 4202, [73] = 4284, [74] = 4365, [75] = 4447, [76] = 4529 }, mp = { [71] = 2053, [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181, [76] = 2213 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga II: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[103], danger[106], danger[107], danger[110], danger[114], danger[117], danger[35], danger[67], danger[122], danger[125], danger[126], danger[127], danger[130], danger[131], danger[134], danger[40], danger[135], danger[138] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nightmare Bats',
            ids    = { 162, 168, 170, 172, 173, 174, 202, 204, 207, 209, 302, 304, 316, 318, 319, 331, 332 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63, dex = 75, def = 292,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63, dex = 75, def = 297,
                         attack_skill = 241 },
            },
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
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 4108, [70] = 4191, [71] = 4275, [72] = 4359 }, mp = { [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[147],
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Doom Mage',
            ids    = { 163, 164, 165, 166, 167, 169, 171, 203, 205, 206, 208, 210, 211, 212, 213, 214, 215 },
            job    = 'blm/blm',
            levels = {
                [74] = { acc = 312, eva = 272, agi = 77, int = 89, mnd = 60, chr = 70, dex = 82, def = 294,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 276, agi = 77, int = 91, mnd = 62, chr = 70, dex = 82, def = 299,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 283, agi = 80, int = 92, mnd = 62, chr = 72, dex = 85, def = 303,
                         attack_skill = 261 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            steal  = { 880 },  -- bone chip
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 4024, [75] = 4101, [76] = 4178 }, mp = { [74] = 2149, [75] = 2181, [76] = 2213 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga II: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[148], danger[151], danger[155], danger[157], danger[35], danger[67], danger[122], danger[125], danger[126], danger[127], danger[130], danger[131], danger[134], danger[40], danger[135], danger[138] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Smolenkos',
            ids    = { 175, 176, 183, 191, 216, 217, 225, 234, 241 },
            job    = 'war/blm',
            levels = {
                [80] = { acc = 344, eva = 327, agi = 82, int = 78, mnd = 60, chr = 71, dex = 87, def = 339,
                         attack_skill = 281 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 80, mnd = 62, chr = 73, dex = 90, def = 344,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 80, mnd = 62, chr = 73, dex = 90, def = 349,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 50, item = 935 },  -- ahriman wing
            },
            steal  = { 921 },  -- bottle of ahriman tears
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Ahriman / Demon', notes = { 'Source species: Ahriman (ID 195); family ID 87.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 4856, [81] = 4938, [82] = 5019 }, mp = { [80] = 2342, [81] = 2374, [82] = 2406 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[219],
                blue = { value = 'Eyes On Me', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 557, name = 'Eyes On Me', level = 61, min_skill = 176, skill_ids = { 549 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kindred Warrior UR',
            ids    = { 177, 184, 192, 218, 226, 235, 242, 246, 260, 265 },
            levels = {
                [81] = { acc = 352, eva = 332, agi = 85, int = 69, mnd = 55, chr = 76, dex = 90, def = 346,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 69, mnd = 55, chr = 76, dex = 90, def = 351,
                         attack_skill = 293 },
                [83] = { acc = 364, eva = 342, agi = 85, int = 69, mnd = 55, chr = 76, dex = 90, def = 356,
                         attack_skill = 299 },
                [84] = { acc = 371, eva = 348, agi = 87, int = 70, mnd = 55, chr = 77, dex = 92, def = 363,
                         attack_skill = 305 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 5115, [82] = 5199, [83] = 5283, [84] = 5367 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[269],
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kindred Black Mage UR',
            ids    = { 178, 185, 193, 219, 227, 243, 261, 266 },
            job    = 'blm/blm',
            levels = {
                [81] = { acc = 352, eva = 307, agi = 85, int = 103, mnd = 62, chr = 82, dex = 90, def = 330,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 312, agi = 85, int = 103, mnd = 62, chr = 82, dex = 90, def = 335,
                         attack_skill = 293 },
                [83] = { acc = 364, eva = 316, agi = 85, int = 105, mnd = 62, chr = 82, dex = 90, def = 340,
                         attack_skill = 299 },
                [84] = { acc = 371, eva = 322, agi = 87, int = 106, mnd = 62, chr = 85, dex = 92, def = 345,
                         attack_skill = 305 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 4783 },  -- scroll of firaga ii
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 4562, [82] = 4638, [83] = 4715, [84] = 4792 }, mp = { [81] = 2374, [82] = 2406, [83] = 2439, [84] = 2471 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 290', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow; Condemnation: Stun; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'Condemnation: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[222], danger[226], danger[229], danger[267], danger[230], danger[35], danger[231], danger[67], danger[232], danger[233], danger[234], danger[239], danger[242], danger[247], danger[72], danger[252], danger[257], danger[126], danger[258], danger[130], danger[134], danger[40], danger[135], danger[138] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kindred Dark Knight UR',
            ids    = { 179, 186, 194, 220, 228, 236, 244, 262, 267 },
            job    = 'drk/drk',
            levels = {
                [81] = { acc = 352, eva = 328, agi = 77, int = 90, mnd = 49, chr = 63, dex = 90, def = 340,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 333, agi = 77, int = 90, mnd = 49, chr = 63, dex = 90, def = 345,
                         attack_skill = 293 },
                [83] = { acc = 364, eva = 338, agi = 77, int = 90, mnd = 49, chr = 63, dex = 90, def = 350,
                         attack_skill = 299 },
                [84] = { acc = 371, eva = 345, agi = 80, int = 92, mnd = 49, chr = 64, dex = 92, def = 356,
                         attack_skill = 305 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 4995, [82] = 5078, [83] = 5160, [84] = 5243 }, mp = { [81] = 2374, [82] = 2406, [83] = 2439, [84] = 2471 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow; Condemnation: Stun; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'Condemnation: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[222], danger[226], danger[229], danger[267], danger[160], danger[161], danger[162], danger[163], danger[164], danger[165], danger[170], danger[173], danger[178], danger[183], danger[188], danger[193], danger[198], danger[199] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kindred Summoner UR',
            ids    = { 180, 187, 195, 221, 229, 237, 247, 263, 268 },
            job    = 'smn/smn',
            levels = {
                [81] = { acc = 345, eva = 303, agi = 77, int = 96, mnd = 82, chr = 96, dex = 76, def = 330,
                         attack_skill = 287 },
                [82] = { acc = 351, eva = 308, agi = 77, int = 96, mnd = 82, chr = 96, dex = 76, def = 335,
                         attack_skill = 293 },
                [83] = { acc = 357, eva = 312, agi = 77, int = 96, mnd = 82, chr = 96, dex = 76, def = 340,
                         attack_skill = 299 },
                [84] = { acc = 363, eva = 319, agi = 80, int = 98, mnd = 83, chr = 98, dex = 77, def = 345,
                         attack_skill = 305 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 10, item = 4903 },  -- dark spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 4441, [82] = 4516, [83] = 4591, [84] = 4666 }, mp = { [81] = 2434, [82] = 2466, [83] = 2499, [84] = 2531 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 290', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[269],
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Molech',
            ids    = { 182, 189, 190, 197, 223, 231, 233, 239, 240, 245, 270, 271 },
            job    = 'mnk/mnk',
            levels = {
                [79] = { acc = 342, eva = 317, agi = 57, int = 51, mnd = 80, chr = 74, dex = 93, def = 335,
                         attack_skill = 276 },
                [80] = { acc = 347, eva = 322, agi = 57, int = 51, mnd = 80, chr = 74, dex = 93, def = 340,
                         attack_skill = 281 },
                [81] = { acc = 355, eva = 328, agi = 60, int = 54, mnd = 82, chr = 76, dex = 96, def = 345,
                         attack_skill = 287 },
                [82] = { acc = 361, eva = 333, agi = 60, int = 54, mnd = 82, chr = 76, dex = 96, def = 350,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1620 },  -- taurus horn
                { rate = 50, item = 1621 },  -- taurus wing
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Taurus / Demon', notes = { 'Source species: Taurus (ID 217); family ID 94.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [79] = 5246, [80] = 5332, [81] = 5417, [82] = 5503 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[100],
                blue = { value = 'Frightful Roar', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 561, name = 'Frightful Roar', level = 50, min_skill = 122, skill_ids = { 501 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Agloolik',
            ids    = { 198, 200, 232, 274, 275, 276, 277, 278, 287, 288, 289, 290, 291, 292, 293, 294, 297, 300,
                       301 },
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 56, mnd = 60, chr = 71, dex = 85, def = 325,
                         attack_skill = 266 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 57, mnd = 60, chr = 73, dex = 85, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 57, mnd = 61, chr = 74, dex = 87, def = 336,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 57, mnd = 61, chr = 74, dex = 87, def = 341,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4779, [78] = 4863, [79] = 4947, [80] = 5031 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Jormungand',
            ids    = { 273 },
            nm     = true,
            job    = 'drk/blm',
            levels = {
                [95] = { acc = 498, eva = 460, agi = 101, int = 119, mnd = 60, chr = 83, dex = 113, def = 515,
                         attack_skill = 376 },
            },
            ranks  = { fire = -2, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -50 },
            weapon_guard = { ranged = -50 },
            immune = { 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 150, item = 17586 },  -- mercurial pole
                { rate = 240, group = {  -- one of
                    { 903, 4500 },  -- dragon talon
                    { 1133, 4500 },  -- vial of dragon blood
                    { 4272, 1000 },  -- slice of dragon meat
                } },
                { rate = 240, group = { { 1816, 7500 }, { 4486, 2500 } } },  -- one of wyrm horn, dragon heart
                { rate = 240, group = {  -- one of
                    { 655, 1 },  -- adaman ingot
                    { 658, 1 },  -- damascus ingot
                    { 722, 1 },  -- divine log
                    { 836, 1 },  -- square of damascene cloth
                    { 837, 1 },  -- spool of malboro fiber
                    { 860, 1 },  -- behemoth hide
                    { 1110, 1 },  -- vial of black beetle blood
                    { 1311, 1 },  -- piece of oxblood
                    { 1313, 1 },  -- lock of sirens hair
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Wyrm / Dragon', notes = { 'Source species: Blue Wyrm (ID 227); family ID 98.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [95] = 100000 }, mp = { [95] = 100000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Regen 22', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                fight = { value = 'Conditional draw-in', notes = { 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Normal attacks: HP drain; Gregale Wing: Paralysis; Spike Flail: rear attack; Gregale Wing Air: Paralysis; Absolute Terror: Terror; Horrid Roar 3: Buff removal', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Gregale Wing: Paralysis. Source targeting: area around the monster.', 'Spike Flail: rear attack. Can hit from behind while grounded. Its skill check also excludes several special buffs. Source targeting: area around the monster.', 'Gregale Wing Air: Paralysis. Source targeting: area around the monster.', 'Absolute Terror: Terror. Random effects may not all happen on the same use. Source targeting: single target.', 'Horrid Roar 3: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, { kind = 'skill', id = 1289, name = 'Gregale Wing', summary = 'Gregale Wing: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[271] }, { kind = 'skill', id = 1290, name = 'Spike Flail', summary = 'Spike Flail: rear attack', notes = { 'Can hit from behind while grounded. Its skill check also excludes several special buffs. Source targeting: area around the monster.' }, categories = { 'other' }, effects = {  }, details = { notes = { 'Normal activation range: 23 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: 23 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 23.0, shape = 'area around the monster', effect_radius = 23.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } }, forced = true }, { kind = 'skill', id = 1294, name = 'Gregale Wing Air', summary = 'Gregale Wing Air: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[271] }, { kind = 'skill', id = 1295, name = 'Absolute Terror', summary = 'Absolute Terror: Terror', notes = { 'Random effects may not all happen on the same use. Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Terror' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 1296, name = 'Horrid Roar 3', summary = 'Horrid Roar 3: Buff removal', notes = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore' } } }, forced = true } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[10] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'King Buffalo',
            ids    = { 282, 283, 284, 285, 295, 298 },
            job    = 'pld/pld',
            levels = {
                [79] = { acc = 330, eva = 308, agi = 55, int = 55, mnd = 82, chr = 82, dex = 69, def = 462,
                         attack_skill = 276 },
                [80] = { acc = 335, eva = 313, agi = 55, int = 55, mnd = 82, chr = 82, dex = 69, def = 468,
                         attack_skill = 281 },
                [81] = { acc = 342, eva = 319, agi = 58, int = 58, mnd = 85, chr = 85, dex = 71, def = 474,
                         attack_skill = 287 },
                [82] = { acc = 348, eva = 324, agi = 58, int = 58, mnd = 85, chr = 85, dex = 71, def = 480,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 5152 },  -- slice of buffalo meat
                { rate = 50, item = 1628 },  -- buffalo hide
                { rate = 10, item = 1615 },  -- buffalo horn
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Buffalo / Beast', notes = { 'Source species: Buffalo (ID 88); family ID 40.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [79] = 4830, [80] = 4913, [81] = 4995, [82] = 5078 }, mp = { [79] = 1159, [80] = 1176, [81] = 1192, [82] = 1208 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[32],
                blue = { value = 'Lowing', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 588, name = 'Lowing', level = 71, min_skill = 225, skill_ids = { 497 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mountain Worm',
            ids    = { 303, 305, 307, 308, 309, 310, 311, 313, 315, 320, 322, 324, 326, 327, 329, 333, 334 },
            job    = 'blm/rdm',
            levels = {
                [66] = { acc = 265, eva = 244, agi = 66, int = 82, mnd = 62, chr = 59, dex = 67, def = 251,
                         attack_skill = 218 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 83, mnd = 63, chr = 61, dex = 69, def = 256,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 83, mnd = 64, chr = 62, dex = 69, def = 262,
                         attack_skill = 225 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 85, mnd = 64, chr = 62, dex = 70, def = 267,
                         attack_skill = 229 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 85, mnd = 65, chr = 63, dex = 71, def = 272,
                         attack_skill = 233 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 1885 },  -- chunk of zincite
                { rate = 100, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            links  = 3,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3477, [67] = 3555, [68] = 3632, [69] = 3709, [70] = 3786 }, mp = { [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989, [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[74],
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mindgazer',
            ids    = { 306, 312, 314, 317, 321, 323, 325, 328, 330, 336, 337, 338 },
            job    = 'blm/blm',
            levels = {
                [69] = { acc = 282, eva = 257, agi = 72, int = 89, mnd = 60, chr = 65, dex = 72, def = 268,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 262, agi = 73, int = 89, mnd = 61, chr = 67, dex = 73, def = 273,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 267, agi = 75, int = 92, mnd = 63, chr = 67, dex = 75, def = 277,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 272, agi = 75, int = 92, mnd = 63, chr = 67, dex = 75, def = 282,
                         attack_skill = 241 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 150, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Hecteyes / Amorph', notes = { 'Source species: Hecteye (ID 7); family ID 4.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 3641, [70] = 3717, [71] = 3794, [72] = 3871 }, mp = { [69] = 1989, [70] = 2021, [71] = 2053, [72] = 2085 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hex Eye: paralysis gaze; Petro Gaze: Petrification; Flare: Water magic evasion down; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind', notes = { 'Hex Eye: paralysis gaze. Attempts Paralysis when the target faces the monster and the monster is in front of the target. Source targeting: cone. Possible effects: Paralysis. The gaze effect requires the target to face the monster.', 'Petro Gaze: Petrification. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 438, name = 'Hex Eye', summary = 'Hex Eye: paralysis gaze', notes = { 'Attempts Paralysis when the target faces the monster and the monster is in front of the target. Source targeting: cone. Possible effects: Paralysis. The gaze effect requires the target to face the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 439, name = 'Petro Gaze', summary = 'Petro Gaze: Petrification', notes = danger[206], categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, danger[230], danger[126], danger[258], danger[130], danger[134], danger[40] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Death Ray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 522, name = 'Death Ray', level = 34, min_skill = 74, skill_ids = { 437 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mountain Worm NM',
            ids    = { 335 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 88, mnd = 67, chr = 64, dex = 72, def = 282,
                         attack_skill = 241 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 89, mnd = 68, chr = 66, dex = 74, def = 288,
                         attack_skill = 246 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 90, mnd = 68, chr = 66, dex = 75, def = 293,
                         attack_skill = 251 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 100, item = 14886 },  -- heavy gauntlets
                { rate = 150, item = 1885 },  -- chunk of zincite
            },
            links  = 3,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 6000, [73] = 6000, [74] = 6000 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Full-Force Blow: can crit; Gastric Bomb: Attack down; Sandspin: Accuracy down; Tremors: DEX down; Mp Absorption: MP drain; Sound Vacuum Worm: Silence; Quake: Wind magic evasion down; Bind: bind', notes = { 'Full-Force Blow: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Gastric Bomb: Attack down. Source targeting: single target.', 'Sandspin: Accuracy down. Source targeting: area around the monster.', 'Tremors: DEX down. Source targeting: area around the monster.', 'Mp Absorption: MP drain. Source targeting: single target.', 'Sound Vacuum Worm: Silence. Source targeting: single target.', 'Quake: Wind magic evasion down.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[45], danger[50], danger[55], danger[60], danger[63], danger[66], danger[67], danger[40] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[41] },
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bonnacon',
            ids    = { 360 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [69] = { acc = 276, eva = 257, agi = 48, int = 48, mnd = 72, chr = 72, dex = 60, def = 381,
                         attack_skill = 229 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 5152 },  -- slice of buffalo meat
                { rate = 150, item = 1628 },  -- buffalo hide
                { rate = 100, item = 18052 },  -- tredecim scythe
                { rate = 100, item = 15323 },  -- cure clogs
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Buffalo / Beast', notes = { 'Source species: Buffalo (ID 88); family ID 40.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 8800 }, mp = { [69] = 999 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Normal attacks: Stun; Rampant Gnaw: Paralysis; Lowing: Plague', notes = { 'Normal attacks: Stun. These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Rampant Gnaw: Paralysis. Source targeting: single target.', 'Lowing: Plague. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Stun', notes = { 'These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, removals = danger[77] } }, danger[27], danger[30] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Lowing', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 588, name = 'Lowing', level = 71, min_skill = 225, skill_ids = { 497 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Geush Urvan',
            ids    = { 382 },
            nm     = true,
            job    = 'blm/mnk',
            levels = {
                [85] = { acc = 375, eva = 358, agi = 80, int = 88, mnd = 76, chr = 78, dex = 89, def = 428,
                         attack_skill = 311 },
            },
            tp_moves = true,
            counters = true,
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'paralyze', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 15465 },  -- toreadors cape
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Buffalo / Beast', notes = { 'Source species: Buffalo (ID 88); family ID 40.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 32680 }, mp = { [85] = 1257 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Counter 10; Regain 150', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'The spawn uses a TP-move attack list in place of ordinary swings.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Haunted Muleta to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 15 minutes', notes = { 'Source idle-despawn delay: 15 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Lowing: Plague', notes = { 'Lowing: Plague. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = { danger[30] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[10] },
                blue = { value = 'Lowing', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 588, name = 'Lowing', level = 71, min_skill = 225, skill_ids = { 497 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'White Coney',
            ids    = { 383 },
            nm     = true,
            levels = {
                [70] = { acc = 289, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61, dex = 77, def = 289,
                         attack_skill = 233 },
                [71] = { acc = 296, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63, dex = 80, def = 293,
                         attack_skill = 237 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63, dex = 80, def = 298,
                         attack_skill = 241 },
            },
            ranks  = { fire = -2, ice = 4, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = 4, bind = 4, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 17212 },  -- selenes bow
                { rate = 50, item = 4382 },  -- frost turnip
            },
            info = {
                family = { value = 'Rabbit / Beast', notes = { 'Source species: Rabbit (ID 106); family ID 50.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 8790, [71] = 8790, [72] = 8790 }, mp = { [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 33; Store TP 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Wild Carrot', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 578, name = 'Wild Carrot', level = 30, min_skill = 62, skill_ids = { 323 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Black Coney',
            ids    = { 384 },
            nm     = true,
            job    = 'war/thf',
            levels = {
                [70] = { acc = 291, eva = 338, agi = 75, int = 61, mnd = 53, chr = 57, dex = 81, def = 289,
                         attack_skill = 233 },
                [71] = { acc = 298, eva = 344, agi = 76, int = 62, mnd = 54, chr = 59, dex = 84, def = 293,
                         attack_skill = 237 },
                [72] = { acc = 303, eva = 349, agi = 76, int = 62, mnd = 54, chr = 59, dex = 84, def = 298,
                         attack_skill = 241 },
            },
            ranks  = { fire = -2, ice = 4, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = 4, bind = 4, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 17212 },  -- selenes bow
                { rate = 50, item = 4382 },  -- frost turnip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Rabbit / Beast', notes = { 'Source species: Rabbit (ID 106); family ID 50.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 8790, [71] = 8790, [72] = 8790 }, mp = { [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10; Triple Attack 10; Store TP 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[11],
                blue = { value = 'Foot Kick', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 577, name = 'Foot Kick', level = 1, min_skill = 0, skill_ids = { 257 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Isarukitsck',
            ids    = { 385, 389, 393 },
            nm     = true,
            job    = 'mnk/blm',
            levels = {},
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Apkallu / Bird', notes = { 'Source species: Apkallu (ID 171); family ID 76.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 28', notes = { 'Source base speed is 28; the ordinary monster default is 40. Animation speed is 28.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 380', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[278],
                blue = { value = 'Yawn', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 576, name = 'Yawn', level = 64, min_skill = 191, skill_ids = { 1713 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Little Wingman',
            ids    = { 386, 387, 388, 390, 391, 392, 394, 395, 396 },
            nm     = true,
            levels = {},
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Apkallu / Bird', notes = { 'Source species: Apkallu (ID 171); family ID 76.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 28', notes = { 'Source base speed is 28; the ordinary monster default is 40. Animation speed is 28.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 380', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[278],
                blue = { value = 'Yawn', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 576, name = 'Yawn', level = 64, min_skill = 191, skill_ids = { 1713 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Camahueto',
            ids    = { 397, 398, 399 },
            nm     = true,
            levels = {},
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Buffalo / Beast', notes = { 'Source species: Buffalo (ID 88); family ID 40.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[32],
                blue = { value = 'Lowing', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 588, name = 'Lowing', level = 71, min_skill = 225, skill_ids = { 497 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
