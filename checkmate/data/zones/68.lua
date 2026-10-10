-- Aydeewa Subterrane (zone 68).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Fluid Toss: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Digest: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[3] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[4] = { notes = danger[3], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[5] = { kind = 'skill', id = 432, name = 'Fluid Toss', summary = 'Fluid Toss: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[6] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[7] = { notes = danger[6], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[8] = { kind = 'skill', id = 433, name = 'Digest', summary = 'Digest: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[7] };
danger[9] = { danger[5], danger[8] };
danger[10] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[11] = { value = 'Fluid Toss: can crit; Digest: HP drain', notes = danger[1], entries = danger[9], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[12] = { 'Suction: Stun. Source targeting: single target.', 'Acid Mist: Attack down. Source targeting: area around the monster.', 'Sand Breath: Blindness. Source targeting: cone.', 'Drainkiss: HP drain. Source targeting: single target.', 'Tp Drainkiss: TP drain. Source targeting: single target.', 'Mp Drainkiss: MP drain. Source targeting: single target.', 'Brain Drain: INT down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[13] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[14] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[15] = { notes = danger[13], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[14] };
danger[16] = { kind = 'skill', id = 414, name = 'Suction', summary = 'Suction: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[15] };
danger[17] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[18] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[19] = { danger[18] };
danger[20] = { notes = danger[17], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[19] };
danger[21] = { kind = 'skill', id = 415, name = 'Acid Mist', summary = 'Acid Mist: Attack down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[20] };
danger[22] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[23] = { notes = danger[22], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[24] = { kind = 'skill', id = 416, name = 'Sand Breath', summary = 'Sand Breath: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[23] };
danger[25] = { kind = 'skill', id = 417, name = 'Drainkiss', summary = 'Drainkiss: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[7] };
danger[26] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[27] = { notes = danger[26], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[28] = { kind = 'skill', id = 420, name = 'Tp Drainkiss', summary = 'Tp Drainkiss: TP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[27] };
danger[29] = { kind = 'skill', id = 421, name = 'Mp Drainkiss', summary = 'Mp Drainkiss: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[27] };
danger[30] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[31] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[32] = { danger[31] };
danger[33] = { notes = danger[30], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[32] };
danger[34] = { kind = 'skill', id = 423, name = 'Brain Drain', summary = 'Brain Drain: INT down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[33] };
danger[35] = { danger[16], danger[21], danger[24], danger[25], danger[28], danger[29], danger[34] };
danger[36] = { value = 'Suction: Stun; Acid Mist: Attack down; Sand Breath: Blindness; Drainkiss: HP drain; Tp Drainkiss: TP drain; Mp Drainkiss: MP drain; Brain Drain: INT down', notes = danger[12], entries = danger[35], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[37] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[38] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[39] = { danger[38] };
danger[40] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[41] = { danger[40] };
danger[42] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[43] = { notes = danger[42], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[44] = { 'Kibosh: Amnesia. Source targeting: single target.', 'Sandspray: Blindness. Source targeting: cone.', 'Faze: Terror. The gaze effect requires the target to face the monster. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[45] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[46] = { notes = danger[45], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[47] = { kind = 'skill', id = 1725, name = 'Kibosh', summary = 'Kibosh: Amnesia', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Amnesia' }, details = danger[46] };
danger[48] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 7 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[49] = { notes = danger[48], unknown = {  }, activation_range = 7.0, shape = 'front cone', cone_length = 7.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[50] = { kind = 'skill', id = 1727, name = 'Sandspray', summary = 'Sandspray: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[49] };
danger[51] = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' };
danger[52] = { kind = 'skill', id = 1728, name = 'Faze', summary = 'Faze: Terror', notes = danger[51], categories = { 'debuff' }, effects = { 'Terror' }, details = danger[46] };
danger[53] = { danger[47], danger[50], danger[52] };
danger[54] = { value = 'Kibosh: Amnesia; Sandspray: Blindness; Faze: Terror', notes = danger[44], entries = danger[53], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[55] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { notes = danger[55], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[57] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[58] = { notes = danger[57], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[59] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[60] = { danger[59] };
danger[61] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[62] = { 'Frogkick: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Spore: paralysis. Attempts Paralysis on its target. Source targeting: single target. Possible effects: Paralysis.', 'Queasyshroom: Poison, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Numbshroom: Paralysis, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Shakeshroom: Disease, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Silence Gas: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Dark Spore: Blindness. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[63] = { kind = 'skill', id = 308, name = 'Frogkick', summary = 'Frogkick: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[43] };
danger[64] = { 'Attempts Paralysis on its target. Source targeting: single target. Possible effects: Paralysis.' };
danger[65] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[66] = { notes = danger[65], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[67] = { kind = 'skill', id = 309, name = 'Spore', summary = 'Spore: paralysis', notes = danger[64], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[66] };
danger[68] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[69] = { 'Normal activation range: 14.7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[70] = { notes = danger[69], unknown = {  }, activation_range = 14.7, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[71] = { kind = 'skill', id = 310, name = 'Queasyshroom', summary = 'Queasyshroom: Poison, can crit', notes = danger[68], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[70] };
danger[72] = { 'Normal activation range: 14.7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[73] = { notes = danger[72], unknown = {  }, activation_range = 14.7, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[74] = { kind = 'skill', id = 311, name = 'Numbshroom', summary = 'Numbshroom: Paralysis, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Paralysis' }, details = danger[73] };
danger[75] = { 'Normal activation range: 14.7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[76] = { notes = danger[75], unknown = {  }, activation_range = 14.7, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } };
danger[77] = { kind = 'skill', id = 312, name = 'Shakeshroom', summary = 'Shakeshroom: Disease, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Disease' }, details = danger[76] };
danger[78] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[79] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[80] = { notes = danger[79], unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[81] = { kind = 'skill', id = 314, name = 'Silence Gas', summary = 'Silence Gas: Silence', notes = danger[78], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[80] };
danger[82] = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[83] = { notes = danger[82], unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[84] = { kind = 'skill', id = 315, name = 'Dark Spore', summary = 'Dark Spore: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[83] };
danger[85] = { danger[63], danger[67], danger[71], danger[74], danger[77], danger[81], danger[84] };
danger[86] = { value = 'Frogkick: can crit; Spore: paralysis; Queasyshroom: Poison, can crit; Numbshroom: Paralysis, can crit; Shakeshroom: Disease, can crit; Silence Gas: Silence; Dark Spore: Blindness', notes = danger[62], entries = danger[85], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[87] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[88] = { danger[87] };
danger[89] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[90] = { notes = danger[89], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[91] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[92] = { danger[91] };
danger[93] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[94] = { notes = danger[93], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[88] };
danger[95] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' };
danger[96] = { value = 'No listed threats', notes = danger[95], entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] };
danger[97] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[98] = { notes = danger[97], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[14] };
danger[99] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[98], level_ranges = { { 1, 255 } } };
danger[100] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[101] = { danger[100] };
danger[102] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[103] = { notes = danger[102], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[60] };
danger[104] = { kind = 'skill', id = 2114, name = 'Hellclap', summary = 'Hellclap: Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[103] };
danger[105] = { effect = 'Magic accuracy down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[106] = { effect = 'Magic attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[107] = { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[108] = { danger[105], danger[106], danger[107] };
danger[109] = { 'The gaze effect requires the target to face the monster. Source targeting: area around the monster.' };
danger[110] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water; Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[111] = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } };
danger[112] = { notes = danger[110], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[111] };
danger[113] = { kind = 'skill', id = 2116, name = 'Necrobane', summary = 'Necrobane: Curse, Paralysis', notes = danger[109], categories = { 'debuff' }, effects = { 'Curse', 'Paralysis' }, details = danger[112] };
danger[114] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[115] = { notes = danger[114], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[116] = { kind = 'skill', id = 2117, name = 'Necropurge', summary = 'Necropurge: Curse', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[115] };
danger[117] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[118] = { notes = danger[117], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[119] = { kind = 'skill', id = 2119, name = 'Thundris Shriek', summary = 'Thundris Shriek: Terror', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Terror' }, details = danger[118] };
danger[120] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[121] = { notes = danger[120], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[122] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[121], level_ranges = { { 1, 255 } } };
danger[123] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[124] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[125] = { danger[124] };
danger[126] = { notes = danger[123], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[125] };
danger[127] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[126], level_ranges = { { 1, 255 } } };
danger[128] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[129] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[130] = { danger[129] };
danger[131] = { notes = danger[128], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[130] };
danger[132] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[131], level_ranges = { { 1, 255 } } };
danger[133] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[134] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[135] = { danger[134] };
danger[136] = { notes = danger[133], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[135] };
danger[137] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[136], level_ranges = { { 1, 255 } } };
danger[138] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[139] = { notes = danger[138], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[140] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[139], level_ranges = { { 1, 255 } } };
danger[141] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[94], level_ranges = { { 1, 255 } } };
danger[142] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[143] = { notes = danger[142], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[144] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[143], level_ranges = { { 1, 255 } } };
danger[145] = { 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Choke: Choke.', 'Shock: Shock.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' };
danger[146] = { danger[122], danger[127], danger[132], danger[137], danger[99], danger[140], danger[141], danger[144] };
danger[147] = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' };
danger[148] = { value = 'Poisonga II: area poison; Burn: Burn; Choke: Choke; Shock: Shock; Stun: stun; Blind: Blindness; Bind: bind; Sleepga II: area sleep', notes = danger[145], entries = danger[146], coverage = 'partial', incomplete = true, reasons = danger[147], general_notes = danger[61] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Phlebotomic Slug' } },
        [2] = { sound = { 'Treant Sapling' } },
        [3] = {
            sight = { 'Bluestreak Gyugyuroon', 'Qiqirn Archaeologist', 'Qiqirn Enterpriser', 'Qiqirn Lieuter',
                      'Qiqirn Mosstrooper' },
        },
        [4] = { sound = { 'Anautogenous Slug', 'Phlebotomic Slug' } },
        [5] = { sound = { 'Defoliator' } },
        [6] = { sound = { 'Mycohopper' } },
        [7] = { sound = { 'Mold Eater' } },
        [8] = { sight = { 'Qiqirn Archaeologist', 'Qiqirn Enterpriser', 'Qiqirn Lieuter', 'Qiqirn Mosstrooper' } },
        [9] = { sight = { 'Pandemonium Lamp', 'Pandemonium Warden' } },
        [10] = { sound = { 'Pandemonium Lamp' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Anautogenous Slug'] = { id = 5, name = 'Leech' },
        ['Bluestreak Gyugyuroon'] = { id = 66, name = 'Qiqirn' },
        ['Defoliator'] = { id = 186, name = 'Crawler' },
        ['Mold Eater'] = { id = 10, name = 'Worm' },
        ['Mycohopper'] = { id = 143, name = 'Funguar' },
        ['Pandemonium Warden'] = { id = 89, name = 'Dvergr' },
        ['Phlebotomic Slug'] = { id = 5, name = 'Leech' },
        ['Qiqirn Archaeologist'] = { id = 66, name = 'Qiqirn' },
        ['Qiqirn Enterpriser'] = { id = 66, name = 'Qiqirn' },
        ['Qiqirn Lieuter'] = { id = 66, name = 'Qiqirn' },
        ['Qiqirn Mosstrooper'] = { id = 66, name = 'Qiqirn' },
        ['Treant Sapling'] = { id = 150, name = 'Sapling' },
    },
    monsters = {
        {
            name   = 'Cave Mold',
            ids    = { 1, 2 },
            levels = {
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58, dex = 70, def = 267,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59, dex = 71, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 57, chr = 60, dex = 71, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 59, chr = 60, dex = 72, def = 283,
                         attack_skill = 229 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857, [67] = 3941, [68] = 4024, [69] = 4108 }, mp = { [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[11],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Anautogenous Slug',
            ids    = { 3 },
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58, dex = 70, def = 265,
                         attack_skill = 218 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857 }, mp = { [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[36],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cave Pugil',
            ids    = { 4 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 57, dex = 72, def = 283,
                         attack_skill = 229 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1888 },  -- sack of silica
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 4108 }, mp = { [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Intimidate: Slow; Aqua Ball: STR down; Screwdriver: can crit', notes = { 'Intimidate: Slow. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Aqua Ball: STR down. Source targeting: area around the target.', 'Screwdriver: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 449, name = 'Intimidate', summary = 'Intimidate: Slow', notes = danger[37], categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[39] } }, { kind = 'skill', id = 450, name = 'Aqua Ball', summary = 'Aqua Ball: STR down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[41] } }, { kind = 'skill', id = 452, name = 'Screwdriver', summary = 'Screwdriver: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Aydeewa Crab',
            ids    = { 5 },
            job    = 'pld/pld',
            levels = {
                [68] = { acc = 271, eva = 250, agi = 45, int = 48, mnd = 71, chr = 71, dex = 60, def = 314,
                         attack_skill = 225 },
                [69] = { acc = 276, eva = 255, agi = 45, int = 48, mnd = 72, chr = 72, dex = 60, def = 320,
                         attack_skill = 229 },
                [70] = { acc = 281, eva = 260, agi = 45, int = 49, mnd = 73, chr = 73, dex = 61, def = 338,
                         attack_skill = 233 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 3924, [69] = 4006, [70] = 4088 }, mp = { [68] = 1957, [69] = 1989, [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Bubble Shower: STR down; Big Scissors: can crit', notes = { 'Bubble Shower: STR down. Source targeting: area around the monster.', 'Big Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 442, name = 'Bubble Shower', summary = 'Bubble Shower: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[41] } }, { kind = 'skill', id = 444, name = 'Big Scissors', summary = 'Big Scissors: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[43] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Metallic Body', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 517, name = 'Metallic Body', level = 8, min_skill = 0, skill_ids = { 448 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Treant Sapling AS CM',
            ids    = { 6, 7, 12, 13, 14, 15, 16, 19, 20, 21, 32, 33, 36, 37, 38, 39, 130, 131, 218, 221, 368, 370,
                       371, 375 },
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 52, chr = 55, dex = 70, def = 269,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 55, dex = 71, def = 275,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 57, dex = 71, def = 280,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 54, mnd = 54, chr = 57, dex = 72, def = 286,
                         attack_skill = 229 },
            },
            spawn_levels = { [6] = { 66, 68 }, [7] = { 66, 68 }, [12] = { 66, 68 }, [13] = { 66, 68 },
                             [14] = { 66, 68 }, [15] = { 66, 68 }, [16] = { 66, 68 }, [19] = { 66, 68 },
                             [20] = { 66, 68 }, [21] = { 66, 68 }, [32] = { 66, 68 }, [33] = { 66, 68 },
                             [36] = { 66, 68 }, [37] = { 66, 68 }, [38] = { 66, 68 }, [39] = { 67, 68 },
                             [218] = { 67, 69 }, [221] = { 67, 68 }, [368] = { 67, 69 }, [370] = { 67, 69 },
                             [371] = { 67, 69 }, [375] = { 67, 69 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
                { rate = 10, item = 575 },  -- bag of grain seeds
            },
            links  = 2,
            info = {
                family = { value = 'Sapling / Plantoid', notes = { 'Source species: Sapling (ID 360); family ID 150.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857, [67] = 3941, [68] = 4024, [69] = 4108 }, mp = { [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Slumber Powder: Sleep; Sprout Smack: Slow', notes = { 'Slumber Powder: Sleep. Source targeting: area around the monster.', 'Sprout Smack: Slow. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 686, name = 'Slumber Powder', summary = 'Slumber Powder: Sleep', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 687, name = 'Sprout Smack', summary = 'Sprout Smack: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[39] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Sprout Smack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 597, name = 'Sprout Smack', level = 4, min_skill = 0, skill_ids = { 687 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Puktrap',
            ids    = { 8, 9, 10, 11, 40, 41, 61, 64, 66, 70, 71, 204, 205, 207, 377, 378, 379, 394, 395, 397 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59, dex = 71, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60, dex = 71, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60, dex = 72, def = 283,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61, dex = 73, def = 289,
                         attack_skill = 233 },
            },
            spawn_levels = { [8] = { 67, 69 }, [9] = { 67, 69 }, [10] = { 67, 69 }, [11] = { 67, 69 },
                             [40] = { 67, 69 }, [41] = { 67, 69 }, [61] = { 67, 69 }, [64] = { 67, 69 },
                             [66] = { 67, 69 }, [70] = { 67, 69 }, [71] = { 67, 69 }, [204] = { 69, 70 },
                             [205] = { 69, 70 }, [207] = { 69, 70 }, [377] = { 69, 70 }, [378] = { 69, 70 },
                             [379] = { 69, 70 }, [394] = { 69, 70 }, [395] = { 69, 70 }, [397] = { 69, 70 } },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [67] = 0, [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Soporific: sleep; Palsy Pollen: Paralysis; Gloeosuccus: Slow', notes = { 'Soporific: sleep. Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep.', 'Palsy Pollen: Paralysis. Source targeting: cone.', 'Gloeosuccus: Slow. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 434, name = 'Soporific', summary = 'Soporific: sleep', notes = { 'Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 435, name = 'Palsy Pollen', summary = 'Palsy Pollen: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 436, name = 'Gloeosuccus', summary = 'Gloeosuccus: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[39] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Slime Mold',
            ids    = { 17, 18, 24, 25, 34, 35, 42, 43, 167, 168, 193, 194, 199, 200, 219, 220, 230, 231, 304, 305,
                       317, 318, 319, 320, 321, 322, 325, 327, 328, 334, 342, 346, 364, 365 },
            levels = {
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59, dex = 71, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 57, chr = 60, dex = 71, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 59, chr = 60, dex = 72, def = 283,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 59, chr = 61, dex = 73, def = 289,
                         attack_skill = 233 },
            },
            spawn_levels = { [17] = { 67, 69 }, [18] = { 67, 69 }, [24] = { 67, 69 }, [25] = { 67, 69 },
                             [34] = { 67, 69 }, [35] = { 67, 69 }, [42] = { 67, 69 }, [43] = { 67, 69 },
                             [167] = { 68, 70 }, [168] = { 68, 70 }, [193] = { 68, 70 }, [194] = { 68, 70 },
                             [199] = { 68, 70 }, [200] = { 68, 70 }, [219] = { 68, 70 }, [220] = { 68, 70 },
                             [230] = { 68, 70 }, [231] = { 68, 70 }, [304] = { 68, 70 }, [305] = { 68, 70 },
                             [317] = { 68, 70 }, [318] = { 68, 70 }, [319] = { 68, 70 }, [320] = { 68, 70 },
                             [321] = { 68, 70 }, [322] = { 68, 70 }, [325] = { 68, 70 }, [327] = { 68, 70 },
                             [328] = { 68, 70 }, [334] = { 68, 70 }, [342] = { 68, 70 }, [346] = { 68, 70 },
                             [364] = { 68, 70 }, [365] = { 68, 70 } },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [67] = 0, [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[11],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qiqirn Enterpriser',
            ids    = { 22, 23, 26, 27, 30, 31, 44, 45, 46, 49, 50, 51, 52, 55, 347, 360, 369, 372, 376, 398, 399,
                       401, 408, 409 },
            job    = 'rng/rng',
            levels = {
                [68] = { acc = 312, eva = 250, agi = 87, int = 57, mnd = 65, chr = 60, dex = 73, def = 267,
                         attack_skill = 225 },
                [69] = { acc = 317, eva = 255, agi = 89, int = 57, mnd = 65, chr = 60, dex = 73, def = 272,
                         attack_skill = 229 },
                [70] = { acc = 336, eva = 260, agi = 89, int = 57, mnd = 67, chr = 61, dex = 75, def = 277,
                         attack_skill = 233 },
            },
            spawn_levels = { [49] = { 69, 70 }, [398] = { 69, 70 }, [399] = { 69, 70 }, [401] = { 69, 70 },
                             [408] = { 69, 70 }, [409] = { 69, 70 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            steal  = { 2153 },  -- qiqirn sandbag
            links  = 3,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 3667, [69] = 3745, [70] = 3823 }, mp = { [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[54],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qiqirn Lieuter',
            ids    = { 28, 47, 53, 348, 350, 373, 402 },
            job    = 'thf/thf',
            levels = {
                [68] = { acc = 286, eva = 318, agi = 81, int = 68, mnd = 48, chr = 48, dex = 91, def = 267,
                         attack_skill = 225 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 69, mnd = 48, chr = 48, dex = 92, def = 272,
                         attack_skill = 229 },
                [70] = { acc = 297, eva = 342, agi = 83, int = 69, mnd = 49, chr = 49, dex = 93, def = 277,
                         attack_skill = 233 },
            },
            spawn_levels = { [402] = { 69, 70 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            steal  = { 2153 },  -- qiqirn sandbag
            links  = 3,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 3769, [69] = 3848, [70] = 3927 }, mp = { [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[54],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fossorial Flea',
            ids    = { 56, 57, 91, 92, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 122, 123, 140, 141, 142,
                       143, 144, 147, 148, 159, 160, 161, 162, 169, 189, 190, 209, 210, 214, 215, 216, 217, 228,
                       229, 247, 248, 249, 252, 255, 256, 258, 261, 262 },
            job    = 'thf/thf',
            levels = {
                [66] = { acc = 278, eva = 311, agi = 86, int = 82, mnd = 37, chr = 37, dex = 92, def = 252,
                         attack_skill = 218 },
                [67] = { acc = 283, eva = 316, agi = 87, int = 83, mnd = 37, chr = 37, dex = 95, def = 258,
                         attack_skill = 221 },
                [68] = { acc = 288, eva = 322, agi = 89, int = 83, mnd = 37, chr = 37, dex = 95, def = 263,
                         attack_skill = 225 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 2, thunder = 1, water = -1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 2, poison = -1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2365 },  -- vial of demon blood
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_drops = true },
            info = {
                family = { value = 'Chigoe / Vermin', notes = { 'Source species: Chigoe (ID 435); family ID 185.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 1083, [67] = 1107, [68] = 1130 }, mp = { [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 150 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Normal attacks: Plague', notes = { 'Normal attacks: Plague. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Plague', notes = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = { notes = { 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, removals = { { effect = 'Plague', options = { 'Viruna' } } } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[10] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Phlebotomic Slug',
            ids    = { 58, 59, 60, 222, 244, 246, 251, 254, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303,
                       306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 323, 324, 326, 330, 331, 332, 333,
                       335, 336, 337, 338, 339, 340, 341, 344, 345, 400, 404, 405, 406, 407, 410 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 59, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
            },
            spawn_levels = { [58] = { 68, 70 }, [59] = { 68, 70 }, [60] = { 68, 70 }, [222] = { 68, 70 },
                             [244] = { 68, 70 }, [246] = { 68, 70 }, [251] = { 68, 70 }, [254] = { 68, 70 },
                             [293] = { 68, 70 }, [294] = { 68, 70 }, [295] = { 68, 70 }, [296] = { 68, 70 },
                             [297] = { 68, 70 }, [298] = { 68, 70 }, [299] = { 68, 70 }, [300] = { 68, 70 },
                             [301] = { 69, 69 }, [302] = { 68, 70 }, [303] = { 68, 70 }, [306] = { 68, 70 },
                             [307] = { 68, 70 }, [308] = { 68, 70 }, [309] = { 68, 70 }, [310] = { 68, 70 },
                             [311] = { 68, 70 }, [312] = { 68, 70 }, [313] = { 68, 70 }, [314] = { 68, 70 },
                             [315] = { 68, 70 }, [316] = { 68, 70 }, [323] = { 68, 70 }, [324] = { 68, 70 },
                             [326] = { 68, 70 }, [330] = { 68, 70 }, [331] = { 68, 70 }, [332] = { 68, 70 },
                             [333] = { 68, 70 }, [335] = { 68, 70 }, [336] = { 68, 70 }, [337] = { 68, 70 },
                             [338] = { 68, 70 }, [339] = { 68, 70 }, [340] = { 68, 70 }, [341] = { 68, 70 },
                             [344] = { 68, 70 }, [345] = { 68, 70 }, [400] = { 67, 69 }, [404] = { 67, 69 },
                             [405] = { 67, 69 }, [406] = { 67, 69 }, [407] = { 67, 69 }, [410] = { 67, 69 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 4,
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [67] = 0, [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Defoliator',
            ids    = { 62, 63, 65, 67, 68, 69, 72, 73, 75, 76, 77, 78, 79, 80, 82, 84, 86, 87, 89, 111, 112, 113,
                       116, 117, 118, 120, 121 },
            levels = {
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 53, chr = 60, dex = 71, def = 259,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 54, chr = 60, dex = 72, def = 264,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 55, chr = 61, dex = 73, def = 269,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 278, agi = 72, int = 55, mnd = 55, chr = 63, dex = 75, def = 274,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 55, chr = 63, dex = 75, def = 279,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 58, chr = 64, dex = 76, def = 284,
                         attack_skill = 246 },
            },
            spawn_levels = { [62] = { 68, 70 }, [63] = { 68, 70 }, [65] = { 68, 70 }, [67] = { 68, 70 },
                             [68] = { 68, 70 }, [69] = { 68, 70 }, [72] = { 68, 70 }, [73] = { 68, 70 },
                             [75] = { 68, 70 }, [76] = { 68, 70 }, [77] = { 68, 70 }, [78] = { 68, 70 },
                             [79] = { 70, 72 }, [80] = { 70, 72 }, [82] = { 70, 72 }, [84] = { 70, 72 },
                             [86] = { 70, 72 }, [87] = { 70, 72 }, [89] = { 70, 72 }, [111] = { 71, 73 },
                             [112] = { 71, 73 }, [113] = { 71, 73 }, [116] = { 71, 73 }, [117] = { 71, 73 },
                             [118] = { 71, 73 }, [120] = { 71, 73 }, [121] = { 71, 73 } },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4357 },  -- crawler egg
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Crawler (ID 437); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275, [72] = 4359, [73] = 4443 }, mp = { [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sticky Thread: Slow; Poison Breath: poison', notes = { 'Sticky Thread: Slow. Source targeting: cone.', 'Poison Breath: poison. Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 344, name = 'Sticky Thread', summary = 'Sticky Thread: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = danger[39] } }, { kind = 'skill', id = 345, name = 'Poison Breath Crawler', summary = 'Poison Breath: poison', notes = { 'Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[56] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 74, 85, 114, 329, 343 },
            job    = 'blm/rdm',
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67, dex = 71, def = 274,
                         attack_skill = 233 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 3786 }, mp = { [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Wind weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence: silence; Tornado: Ice magic evasion down; Gravity: Weight', notes = { 'Silence: silence. Possible effects: Silence.', 'Tornado: Ice magic evasion down.', 'Gravity: Weight.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } }, level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[58], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[60] }, level_ranges = { { 21, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[61] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Aydeewa Diremite',
            ids    = { 81, 83, 88, 90, 132, 133, 136, 137, 240, 241, 242, 275, 276, 277, 286, 287, 288, 289, 290,
                       291, 380, 381, 382, 383, 384, 385 },
            job    = 'drk/drk',
            levels = {
                [70] = { acc = 287, eva = 271, agi = 67, int = 73, mnd = 49, chr = 49, dex = 73, def = 282,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 275, agi = 67, int = 75, mnd = 51, chr = 51, dex = 75, def = 287,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 280, agi = 67, int = 75, mnd = 51, chr = 51, dex = 75, def = 292,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 287, agi = 70, int = 76, mnd = 52, chr = 52, dex = 76, def = 298,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52, dex = 77, def = 303,
                         attack_skill = 251 },
            },
            spawn_levels = { [81] = { 70, 72 }, [83] = { 70, 72 }, [88] = { 70, 72 }, [90] = { 70, 72 },
                             [240] = { 72, 74 }, [241] = { 72, 74 }, [242] = { 72, 74 }, [380] = { 72, 74 },
                             [381] = { 72, 74 }, [382] = { 72, 74 }, [383] = { 72, 74 }, [384] = { 72, 74 },
                             [385] = { 72, 74 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2463 },  -- tuft of colorful hair
                { rate = 100, item = 1700 },  -- spool of bloodthread
                { rate = 50, item = 1626 },  -- bottle of avatar blood
            },
            steal  = { 924 },  -- vial of fiend blood
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Diremite / Vermin', notes = { 'Source species: Diremite (ID 442); family ID 187.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4088, [71] = 4170, [72] = 4253, [73] = 4335, [74] = 4418 }, mp = { [70] = 2021, [71] = 2053, [72] = 2085, [73] = 2117, [74] = 2149 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 210', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Filamented Hold: Slow', notes = { 'Filamented Hold: Slow. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 364, name = 'Filamented Hold', summary = 'Filamented Hold: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 12.5 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12.5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.5, shape = 'front cone', cone_length = 12.5, shadows = { { mode = 'ignore' } }, removals = danger[39] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Filamented Hold', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 548, name = 'Filamented Hold', level = 52, min_skill = 132, skill_ids = { 364 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mycohopper',
            ids    = { 93, 94, 95, 96, 124, 125, 126, 127, 232, 233, 234, 235, 236, 237, 238, 239, 279, 280, 281,
                       282, 283, 284, 285 },
            levels = {
                [68] = { acc = 276, eva = 263, agi = 71, int = 50, mnd = 53, chr = 60, dex = 71, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 51, mnd = 54, chr = 60, dex = 72, def = 283,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 51, mnd = 55, chr = 61, dex = 73, def = 289,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 52, mnd = 55, chr = 63, dex = 75, def = 293,
                         attack_skill = 237 },
            },
            spawn_levels = { [93] = { 68, 70 }, [94] = { 68, 70 }, [95] = { 68, 70 }, [96] = { 68, 70 },
                             [232] = { 70, 71 }, [233] = { 70, 71 }, [234] = { 70, 71 }, [235] = { 70, 71 },
                             [236] = { 70, 71 }, [237] = { 70, 71 }, [238] = { 70, 71 }, [239] = { 70, 71 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4373 },  -- woozyshroom
                { rate = 100, item = 4375 },  -- danceshroom
                { rate = 50, item = 4386 },  -- king truffle
            },
            steal  = { 4374 },  -- sleepshroom
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275 }, mp = { [68] = 0, [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[86],
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Great Ameretat',
            ids    = { 97, 109, 110, 115, 119, 128, 129, 264, 267, 270, 274 },
            levels = {
                [73] = { acc = 308, eva = 290, agi = 76, int = 58, mnd = 54, chr = 64, dex = 84, def = 305,
                         attack_skill = 246 },
                [74] = { acc = 313, eva = 295, agi = 77, int = 58, mnd = 54, chr = 64, dex = 85, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 319, eva = 300, agi = 77, int = 58, mnd = 55, chr = 65, dex = 86, def = 315,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 306, agi = 80, int = 59, mnd = 55, chr = 66, dex = 88, def = 320,
                         attack_skill = 261 },
            },
            spawn_levels = { [97] = { 73, 75 }, [109] = { 73, 75 }, [110] = { 73, 75 }, [115] = { 73, 75 },
                             [119] = { 73, 75 }, [128] = { 73, 75 }, [129] = { 73, 75 }, [264] = { 75, 76 },
                             [267] = { 75, 76 }, [270] = { 75, 76 }, [274] = { 75, 76 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = 3, thunder = -1, water = 3, light = -1, dark = 4,
                       paralyze = -1, bind = -1, silence = -1, slow = 3, poison = 3, light_sleep = -1,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 2307 },  -- vial of jodys acid
                { rate = 100, item = 2361 },  -- ameretat vine
                { rate = 100, item = 2361 },  -- ameretat vine
                { rate = 10, item = 1446 },  -- lacquer tree log
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Ameretat (ID 352); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611, [76] = 4695 }, mp = { [73] = 0, [74] = 0, [75] = 0, [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Normal attacks: HP drain; Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = { 'Normal attacks: HP drain. Normal hits drain HP when this Morbol is outside its spawn area. The source checks a 25-yalm distance from its spawn point; current position relative to that point is not established.', 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits drain HP when this Morbol is outside its spawn area. The source checks a 25-yalm distance from its spawn point; current position relative to that point is not established.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[88] } }, { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[43] }, { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { danger[87], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[38], danger[59] } } }, { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = danger[78], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cave Tiger',
            ids    = { 134, 135, 243, 245, 250, 253, 257, 259, 260, 263, 265, 266, 268, 269, 271, 272, 273, 278 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 50, mnd = 58, chr = 64, dex = 80, def = 305,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 50, mnd = 58, chr = 64, dex = 82, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 50, mnd = 58, chr = 65, dex = 82, def = 315,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 50, mnd = 59, chr = 66, dex = 85, def = 320,
                         attack_skill = 261 },
            },
            spawn_levels = { [243] = { 73, 75 }, [245] = { 73, 75 }, [250] = { 73, 75 }, [253] = { 73, 75 },
                             [257] = { 73, 75 }, [259] = { 73, 75 }, [260] = { 73, 75 }, [263] = { 75, 76 },
                             [265] = { 75, 76 }, [266] = { 75, 76 }, [268] = { 75, 76 }, [269] = { 75, 76 },
                             [271] = { 75, 76 }, [272] = { 75, 76 }, [273] = { 75, 76 } },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Tiger / Beast', notes = { 'Source species: Tiger (ID 114); family ID 53.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611, [76] = 4695 }, mp = { [73] = 0, [74] = 0, [75] = 0, [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 68', notes = { 'Source base speed is 68; the ordinary monster default is 40. Animation speed is 68.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Roar: paralysis', notes = { 'Roar: paralysis. Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 270, name = 'Roar', summary = 'Roar: paralysis', notes = { 'Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[90] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Claw Cyclone', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 587, name = 'Claw Cyclone', level = 20, min_skill = 32, skill_ids = { 273 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qiqirn Archaeologist',
            ids    = { 138, 139, 149, 150, 155, 156, 163, 170, 178, 181, 184, 191, 192, 195, 196, 197, 198, 203,
                       206, 208, 211, 223, 226, 227 },
            job    = 'rng/rng',
            levels = {
                [73] = { acc = 353, eva = 275, agi = 93, int = 60, mnd = 70, chr = 64, dex = 78, def = 293,
                         attack_skill = 246 },
                [74] = { acc = 358, eva = 281, agi = 94, int = 60, mnd = 70, chr = 64, dex = 78, def = 298,
                         attack_skill = 251 },
                [75] = { acc = 363, eva = 286, agi = 96, int = 62, mnd = 70, chr = 65, dex = 79, def = 303,
                         attack_skill = 256 },
            },
            ph_for = { [211] = { 412 } },
            ph_rules = {
                [211] = {
                    [412] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            steal  = { 2153 },  -- qiqirn sandbag
            links  = 3,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4058, [74] = 4136, [75] = 4214 }, mp = { [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[54],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qiqirn Mosstrooper',
            ids    = { 145, 151, 153, 157, 172, 187, 201, 212, 224 },
            job    = 'thf/thf',
            levels = {
                [73] = { acc = 314, eva = 359, agi = 86, int = 72, mnd = 52, chr = 52, dex = 97, def = 293,
                         attack_skill = 246, resist = { gravity = 20 } },
                [74] = { acc = 319, eva = 364, agi = 87, int = 73, mnd = 52, chr = 52, dex = 97, def = 298,
                         attack_skill = 251, resist = { gravity = 20 } },
                [75] = { acc = 326, eva = 370, agi = 88, int = 74, mnd = 52, chr = 52, dex = 100, def = 303,
                         attack_skill = 256, resist = { gravity = 25 } },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            steal  = { 2153 },  -- qiqirn sandbag
            links  = 3,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4167, [74] = 4246, [75] = 4326 }, mp = { [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[54],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mold Eater',
            ids    = { 164, 165, 166, 171, 174, 175, 176, 177, 179, 180, 182, 183, 185, 186, 292, 352, 353, 354,
                       356, 357, 358, 359, 361, 362, 363, 366, 367 },
            job    = 'blm/rdm',
            levels = {
                [69] = { acc = 281, eva = 259, agi = 68, int = 85, mnd = 64, chr = 62, dex = 70, def = 267,
                         attack_skill = 229 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 85, mnd = 65, chr = 63, dex = 71, def = 272,
                         attack_skill = 233 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 88, mnd = 67, chr = 64, dex = 72, def = 277,
                         attack_skill = 237 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            steal  = { 17296 },  -- pebble
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 7,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 3709, [70] = 3786, [71] = 3864 }, mp = { [69] = 1989, [70] = 2021, [71] = 2053 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Full-Force Blow: can crit; Gastric Bomb: Attack down; Sandspin: Accuracy down; Tremors: DEX down; Mp Absorption: MP drain; Sound Vacuum Worm: Silence; Quake: Wind magic evasion down; Rasp: Rasp; Bind: bind', notes = { 'Full-Force Blow: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Gastric Bomb: Attack down. Source targeting: single target.', 'Sandspin: Accuracy down. Source targeting: area around the monster.', 'Tremors: DEX down. Source targeting: area around the monster.', 'Mp Absorption: MP drain. Source targeting: single target.', 'Sound Vacuum Worm: Silence. Source targeting: single target.', 'Quake: Wind magic evasion down.', 'Rasp: Rasp.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 424, name = 'Full-Force Blow', summary = 'Full-Force Blow: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[43] }, { kind = 'skill', id = 425, name = 'Gastric Bomb', summary = 'Gastric Bomb: Attack down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[19] } }, { kind = 'skill', id = 426, name = 'Sandspin', summary = 'Sandspin: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[92] } }, { kind = 'skill', id = 427, name = 'Tremors', summary = 'Tremors: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 428, name = 'Mp Absorption', summary = 'Mp Absorption: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 429, name = 'Sound Vacuum Worm', summary = 'Sound Vacuum Worm: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[58], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[94], level_ranges = { { 7, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[61] },
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qiqirn Mine',
            ids    = { 349, 374, 403 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70, dex = 82, def = 322,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            magic_dmg = { all = -50 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Structures / Structures', notes = { 'Source species: Fortifications (ID 374); family ID 154.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4611 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[96],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Crystal Eater',
            ids    = { 411 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 55, mnd = 58, chr = 65, dex = 77, def = 315,
                         attack_skill = 256 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            immune = { 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15978 },  -- rapture earring
                { rate = 100, item = 16072 },  -- brigands mask
            },
            steal  = { 4374 },  -- sleepshroom
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 9000 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[86],
                blue = { value = 'Queasyshroom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 599, name = 'Queasyshroom', level = 8, min_skill = 0, skill_ids = { 310 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bluestreak Gyugyuroon',
            ids    = { 412 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [80] = { acc = 391, eva = 311, agi = 101, int = 65, mnd = 75, chr = 69, dex = 84, def = 329,
                         attack_skill = 281 },
            },
            no_swings = true,
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15531 },  -- qiqirn collar
                { rate = 100, item = 18706 },  -- peacemaker
            },
            steal  = { 2153 },  -- qiqirn sandbag
            links  = 8,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 12000 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 480', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[54],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nosferatu',
            ids    = { 413 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [87] = { acc = 383, eva = 333, agi = 82, int = 105, mnd = 91, chr = 82, dex = 80, def = 384,
                         attack_skill = 323 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 107, mnd = 93, chr = 83, dex = 81, def = 389,
                         attack_skill = 329 },
            },
            ranks  = { fire = 1, ice = 4, wind = 3, earth = 3, thunder = 1, water = 1, light = -1, dark = 11,
                       paralyze = 4, bind = 4, silence = 3, slow = 3, poison = 1, light_sleep = -1, dark_sleep = 11,
                       blind = 11, stun = 1, gravity = 3 },
            magic_dmg = { all = -25 },
            undead = true,
            drops  = {
                { rate = 1000, item = 2620 },  -- nosferatus claw
                { rate = 240, item = 19036 },  -- earth grip
                { rate = 240, item = 19033 },  -- wind grip
                { rate = 1000, group = {  -- one of
                    { 17960, 1 },  -- labrys
                    { 15021, 1 },  -- aurum gauntlets
                    { 11378, 1 },  -- enkidus leggings
                } },
                { rate = 100, group = {  -- one of
                    { 17960, 1 },  -- labrys
                    { 15021, 1 },  -- aurum gauntlets
                    { 11378, 1 },  -- enkidus leggings
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Vampyr / Undead', notes = { 'Source species: Vampyr (ID 421); family ID 179.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [87] = 33000, [88] = 33000 }, mp = { [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 290', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Vial Of Pure Blood to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Bloodrake: HP drain; Wings Of Gehenna: Stun; Eternal Damnation: Doom; Drain: HP drain; Drain II: HP drain; Stun: stun; Absorb-Tp: TP drain', notes = { 'Bloodrake: HP drain. Source targeting: single target.', 'Wings Of Gehenna: Stun. Source targeting: area around the monster.', 'Eternal Damnation: Doom. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Drain: HP drain.', 'Drain II: HP drain.', 'Stun: stun. Possible effects: Stun.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 2106, name = 'Bloodrake', summary = 'Bloodrake: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 2110, name = 'Wings Of Gehenna', summary = 'Wings Of Gehenna: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[14] } }, { kind = 'skill', id = 2111, name = 'Eternal Damnation', summary = 'Eternal Damnation: Doom', notes = danger[37], categories = { 'debuff' }, effects = { 'Doom' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Doom: Cursna (can fail), Holy Water (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Doom removal is a chance, not a guarantee.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Doom', options = { 'Cursna (can fail)', 'Holy Water (can fail)' } } } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[58], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 246, name = 'Drain II', summary = 'Drain II: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[58], level_ranges = { { 1, 255 } } }, danger[99], { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[58], level_ranges = { { 1, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[61] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Nosferatu Bats',
            ids    = { 414, 415, 416 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64, dex = 76, def = 303,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64, dex = 77, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65, dex = 77, def = 313,
                         attack_skill = 256 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611 }, mp = { [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Sonic Boom: Attack down', notes = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[19] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nosferatu Wolf',
            ids    = { 417, 418, 419 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 54, chr = 68, dex = 76, def = 297,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 54, chr = 69, dex = 77, def = 301,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 55, chr = 70, dex = 77, def = 306,
                         attack_skill = 256 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = 12.5 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Hound / Undead', notes = { 'Source species: Hound (ID 409); family ID 174.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611 }, mp = { [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Howling: Paralysis; Poison Breath Hound: Poison; Rot Gas: Disease; Dirty Claw: can crit; Shadow Claw: Blindness', notes = { 'Howling: Paralysis. Source targeting: area around the monster.', 'Poison Breath Hound: Poison. Source targeting: cone.', 'Rot Gas: Disease. Source targeting: area around the monster.', 'Dirty Claw: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Shadow Claw: Blindness. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 465, name = 'Howling', summary = 'Howling: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[90] }, { kind = 'skill', id = 466, name = 'Poison Breath Hound', summary = 'Poison Breath Hound: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[56] }, { kind = 'skill', id = 467, name = 'Rot Gas', summary = 'Rot Gas: Disease', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } } }, { kind = 'skill', id = 468, name = 'Dirty Claw', summary = 'Dirty Claw: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[43] }, { kind = 'skill', id = 469, name = 'Shadow Claw', summary = 'Shadow Claw: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Poison Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 536, name = 'Poison Breath', level = 22, min_skill = 38, skill_ids = { 466 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nosferatu Murk',
            ids    = { 420, 421, 422 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 58, chr = 68, dex = 76, def = 305,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 69, dex = 77, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 70, dex = 77, def = 315,
                         attack_skill = 256 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611 }, mp = { [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 247, name = 'Foxfire', summary = 'Foxfire: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[14] } }, { kind = 'skill', id = 248, name = 'Grim Halo', summary = 'Grim Halo: can crit', notes = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' }, categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 249, name = 'Netherspikes', summary = 'Netherspikes: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[88] } }, { kind = 'skill', id = 251, name = 'Aegis Schism', summary = 'Aegis Schism: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[101] } }, { kind = 'skill', id = 252, name = 'Dancing Chains', summary = 'Dancing Chains: Drown', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 253, name = 'Barbed Crescent', summary = 'Barbed Crescent: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[92] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 423 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, dex = 80, def = 491,
                         attack_skill = 317, meva = { all = 94 } },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, dex = 80, def = 491,
                         attack_skill = 323, meva = { all = 88 } },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, dex = 81, def = 491,
                         attack_skill = 329, meva = { all = 82 } },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 3503 },  -- chunk of mulcibars scoria
                { rate = 50, item = 3503 },  -- chunk of mulcibars scoria
                { rate = 1000, item = 2372 },  -- khimaira mane
                { rate = 1000, item = 2169 },  -- cerberus hide
                { rate = 1000, item = 2172 },  -- hydra scale
                { rate = 240, item = 2158 },  -- hydra fang
                { rate = 240, item = 2168 },  -- cerberus claw
                { rate = 240, item = 2371 },  -- khimaira horn
                { rate = 240, item = 11281 },  -- hachiryu haramaki
                { rate = 240, item = 18447 },  -- nanatsusayanotachi
                { rate = 240, item = 18759 },  -- shenlongs baghnakhs
                { rate = 240, item = 18594 },  -- dorje
            },
            links  = 9,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Warden (ID 205); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Pandemonium Key to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 15 minutes; Conditional draw-in', notes = { 'Source idle-despawn delay: 15 minutes. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Hellsnap: Stun; Hellclap: Weight; Cackle: Magic accuracy down, Magic attack down, Magic defense down; Necrobane: Curse, Paralysis; Necropurge: Curse; Bilgestorm: Accuracy down, Attack down, Defense down; Thundris Shriek: Terror', notes = { 'Hellsnap: Stun. Source targeting: area around the monster.', 'Hellclap: Weight. Source targeting: cone.', 'Cackle: Magic accuracy down, Magic attack down, Magic defense down. Source targeting: area around the monster.', 'Necrobane: Curse, Paralysis. The gaze effect requires the target to face the monster. Source targeting: area around the monster.', 'Necropurge: Curse. Source targeting: area around the monster.', 'Bilgestorm: Accuracy down, Attack down, Defense down. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Thundris Shriek: Terror. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell-list replacement is not resolved.' }, entries = { { kind = 'skill', id = 2113, name = 'Hellsnap', summary = 'Hellsnap: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = danger[14] }, forced = true }, danger[104], { kind = 'skill', id = 2115, name = 'Cackle', summary = 'Cackle: Magic accuracy down, Magic attack down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Magic accuracy down', 'Magic attack down', 'Magic defense down' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Magic accuracy down, Magic attack down, Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = danger[108] }, forced = true }, danger[113], danger[116], { kind = 'skill', id = 2118, name = 'Bilgestorm', summary = 'Bilgestorm: Accuracy down, Attack down, Defense down', notes = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down', 'Attack down', 'Defense down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment); Attack down, Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = true } }, removals = { danger[91], danger[18], danger[100] } } }, danger[119] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[10] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 424 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, dex = 80, def = 491,
                         attack_skill = 317, meva = { all = 94 } },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, dex = 80, def = 491,
                         attack_skill = 323, meva = { all = 88 } },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, dex = 81, def = 491,
                         attack_skill = 329, meva = { all = 82 } },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            resist = { status = 50 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            links  = 9,
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Warden (ID 205); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Draw-in', notes = { 'The draw-in mixin checks the current target at twice the monster\'s melee range or farther.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted skill list value is not resolved.', 'A scripted move argument is not resolved.', 'A scripted spell-list replacement is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted skill list value is not resolved.', 'A scripted move argument is not resolved.', 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[10] },
                blue = { value = 'Unknown', notes = { 'A scripted skill list value is not resolved.', 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Pandemonium Lamp',
            ids    = { 425, 426, 427, 428, 429, 430, 431, 432 },
            nm     = true,
            job    = 'blm/war',
            levels = {
                [77] = { acc = 326, eva = 315, agi = 89, int = 82, mnd = 78, chr = 58, dex = 80, def = 312,
                         attack_skill = 266 },
                [78] = { acc = 331, eva = 320, agi = 89, int = 82, mnd = 79, chr = 59, dex = 80, def = 317,
                         attack_skill = 271 },
                [79] = { acc = 337, eva = 326, agi = 91, int = 84, mnd = 80, chr = 60, dex = 82, def = 323,
                         attack_skill = 276 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11 },
            magic_dmg = { all = -6.3 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            links  = 10,
            info = {
                family = { value = 'Corpselight / Undead', notes = { 'Source species: Corpselight (ID 391); family ID 167.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 9000, [78] = 9000, [79] = 9000 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -101%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Hellsnap: Stun; Hellclap: Weight; Cackle: Magic accuracy down, Magic attack down, Magic defense down; Necrobane: Curse, Paralysis; Necropurge: Curse; Thundris Shriek: Terror; Poisonga II: area poison; Burn: Burn; Choke: Choke; Shock: Shock; Stun: stun; Blind: Blindness; Bind: bind; Sleepga II: area sleep', notes = { 'Hellsnap: Stun. Source targeting: area around the monster.', 'Hellclap: Weight. Source targeting: cone.', 'Cackle: Magic accuracy down, Magic attack down, Magic defense down. Source targeting: area around the monster.', 'Necrobane: Curse, Paralysis. The gaze effect requires the target to face the monster. Source targeting: area around the monster.', 'Necropurge: Curse. Source targeting: area around the monster.', 'Thundris Shriek: Terror. Source targeting: area around the monster.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Choke: Choke.', 'Shock: Shock.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 2113, name = 'Hellsnap', summary = 'Hellsnap: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = danger[14] } }, danger[104], { kind = 'skill', id = 2115, name = 'Cackle', summary = 'Cackle: Magic accuracy down, Magic attack down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Magic accuracy down', 'Magic attack down', 'Magic defense down' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Magic accuracy down, Magic attack down, Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = danger[108] } }, danger[113], danger[116], danger[119], danger[122], danger[127], danger[132], danger[137], danger[99], danger[140], danger[141], danger[144] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[61] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 433 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, dex = 80, def = 355,
                         attack_skill = 317 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, dex = 80, def = 360,
                         attack_skill = 323 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, dex = 81, def = 365,
                         attack_skill = 329 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Warden (ID 205); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -101%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[148],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 434 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, dex = 80, def = 355,
                         attack_skill = 317 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, dex = 80, def = 360,
                         attack_skill = 323 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, dex = 81, def = 365,
                         attack_skill = 329 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Warden (ID 205); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -101%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[148],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 435 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, dex = 80, def = 355,
                         attack_skill = 317 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, dex = 80, def = 360,
                         attack_skill = 323 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, dex = 81, def = 365,
                         attack_skill = 329 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Warden (ID 205); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -101%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[148],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 436, 437, 438 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 331, agi = 86, int = 110, mnd = 91, chr = 95, dex = 80, def = 358,
                         attack_skill = 317 },
                [87] = { acc = 383, eva = 335, agi = 87, int = 111, mnd = 91, chr = 96, dex = 80, def = 363,
                         attack_skill = 323 },
                [88] = { acc = 389, eva = 340, agi = 87, int = 112, mnd = 93, chr = 97, dex = 81, def = 368,
                         attack_skill = 329 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Dvergr (ID 204); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -101%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[148],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 439, 440, 441 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, dex = 80, def = 355,
                         attack_skill = 317 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, dex = 80, def = 360,
                         attack_skill = 323 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, dex = 81, def = 365,
                         attack_skill = 329 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Dvergr / Demon', notes = { 'Source species: Warden (ID 205); family ID 89.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 147000, [87] = 147000, [88] = 147000 }, mp = { [86] = 2596, [87] = 2629, [88] = 2661 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -101%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[148],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
        {
            name   = 'Chigre',
            ids    = { 442 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [82] = { acc = 369, eva = 413, agi = 105, int = 99, mnd = 45, chr = 45, dex = 112, def = 335,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 2, thunder = 1, water = -1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 2, poison = -1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 2638 },  -- chigre
                { rate = 150, item = 15827 },  -- insect ring
                { rate = 150, item = 15828 },  -- blood ring
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Chigoe / Vermin', notes = { 'Source species: Chigoe (ID 435); family ID 185.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 50 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Bottle Of Spoilt Blood to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 5 minutes', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[10] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Morta',
            ids    = { 443, 450, 457 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [94] = { acc = 444, eva = 472, agi = 102, int = 96, mnd = 65, chr = 65, dex = 111, def = 404,
                         attack_skill = 369 },
                [95] = { acc = 452, eva = 478, agi = 104, int = 96, mnd = 65, chr = 65, dex = 113, def = 409,
                         attack_skill = 376 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 3, thunder = 1, water = 6, light = 2, dark = 6,
                       paralyze = 2, bind = 2, silence = -1, slow = 3, poison = 6, light_sleep = 2, dark_sleep = 6,
                       blind = 6, stun = 1, gravity = 1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Belladonna / Plantoid', notes = { 'Source species: Belladonna (ID 332); family ID 140.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [94] = 5841, [95] = 5921 }, mp = { [94] = 0, [95] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[96],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ravishing Rafflesia',
            ids    = { 444, 445, 446, 447, 448, 449, 451, 452, 453, 454, 455, 456, 458, 459, 460, 461, 462, 463 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [92] = { acc = 429, eva = 461, agi = 100, int = 94, mnd = 64, chr = 60, dex = 109, def = 396,
                         attack_skill = 355 },
                [93] = { acc = 437, eva = 467, agi = 102, int = 95, mnd = 65, chr = 60, dex = 111, def = 402,
                         attack_skill = 362 },
            },
            ranks  = { fire = -2, wind = -1, earth = 3, thunder = 1, light = 2, silence = -1, slow = 3,
                       light_sleep = 2, stun = 1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Rafflesia / Plantoid', notes = { 'Source species: Rafflesia (ID 359); family ID 149.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [92] = 5682, [93] = 5762 }, mp = { [92] = 1371, [93] = 1387 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Seedspray: Defense down; Viscid Emission: Amnesia; Rotten Stench: Accuracy down, Magic accuracy down; Bloody Caress: HP drain', notes = { 'Seedspray: Defense down. Source targeting: single target.', 'Viscid Emission: Amnesia. Source targeting: cone.', 'Rotten Stench: Accuracy down, Magic accuracy down. Source targeting: area around the monster.', 'Bloody Caress: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 2163, name = 'Seedspray', summary = 'Seedspray: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 11.5 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 11.5, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[101] } }, { kind = 'skill', id = 2164, name = 'Viscid Emission', summary = 'Viscid Emission: Amnesia', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Amnesia' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 2165, name = 'Rotten Stench', summary = 'Rotten Stench: Accuracy down, Magic accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down', 'Magic accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment); Magic accuracy down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = { danger[91], danger[105] } } }, { kind = 'skill', id = 2167, name = 'Bloody Caress', summary = 'Bloody Caress: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'Seedspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 650, name = 'Seedspray', level = 61, min_skill = 176, skill_ids = { 2163 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Missabikong',
            ids    = { 620 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 635, agi = 132, int = 113, mnd = 113, chr = 125, dex = 147, def = 654,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 3, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 3, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Marolith / Arcana', notes = { 'Source species: Marolith (ID 71); family ID 32.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 9987 }, mp = { [139] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[96],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Awoken Hrungnir',
            ids    = { 621 },
            nm     = true,
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 97, mnd = 97, chr = 108, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            info = {
                family = { value = 'Golem / Arcana', notes = { 'Source species: Golem (ID 63); family ID 28.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Heavy Strike: can crit; Crystal Weapon Fire Dynamis: Plague; Crystal Weapon Stone Dynamis: Petrification; Crystal Weapon Water Dynamis: Poison; Crystal Weapon Wind Dynamis: Weight; Ice Break 2128: Bind', notes = { 'Heavy Strike: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Crystal Weapon Fire Dynamis: Plague. Source targeting: single target.', 'Crystal Weapon Stone Dynamis: Petrification. Source targeting: single target.', 'Crystal Weapon Water Dynamis: Poison. Source targeting: single target.', 'Crystal Weapon Wind Dynamis: Weight. Source targeting: single target.', 'Ice Break 2128: Bind. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1649, name = 'Heavy Strike', summary = 'Heavy Strike: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[43] }, { kind = 'skill', id = 1653, name = 'Crystal Weapon Fire Dynamis', summary = 'Crystal Weapon Fire Dynamis: Plague', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } } }, { kind = 'skill', id = 1654, name = 'Crystal Weapon Stone Dynamis', summary = 'Crystal Weapon Stone Dynamis: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 1655, name = 'Crystal Weapon Water Dynamis', summary = 'Crystal Weapon Water Dynamis: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 1656, name = 'Crystal Weapon Wind Dynamis', summary = 'Crystal Weapon Wind Dynamis: Weight', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[60] } }, { kind = 'skill', id = 2128, name = 'Ice Break 2128', summary = 'Ice Break 2128: Bind', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[88] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[10] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
