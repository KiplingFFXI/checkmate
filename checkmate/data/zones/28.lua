-- Sacrarium (zone 28).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Attempts Paralysis when the target faces the monster and the monster is in front of the target. Source targeting: cone. Possible effects: Paralysis. The gaze effect requires the target to face the monster.' };
danger[2] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[3] = { notes = danger[2], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[4] = { kind = 'skill', id = 438, name = 'Hex Eye', summary = 'Hex Eye: paralysis gaze', notes = danger[1], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[3] };
danger[5] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[6] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[7] = { danger[6] };
danger[8] = { notes = danger[5], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[7] };
danger[9] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[10] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[11] = { danger[10] };
danger[12] = { notes = danger[9], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[11] };
danger[13] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[14] = { notes = danger[13], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[15] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[14], level_ranges = { { 12, 255 } } };
danger[16] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[14], level_ranges = { { 25, 255 } } };
danger[17] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[18] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[19] = { notes = danger[17], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[18] };
danger[20] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[19], level_ranges = { { 45, 255 } } };
danger[21] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[22] = { notes = danger[21], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[23] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[22], level_ranges = { { 4, 255 } } };
danger[24] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[25] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[26] = { danger[25] };
danger[27] = { notes = danger[24], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[26] };
danger[28] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[27], level_ranges = { { 7, 255 } } };
danger[29] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[30] = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'Slipstream: Accuracy down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[31] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[32] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[33] = { danger[32] };
danger[34] = { notes = danger[31], unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[33] };
danger[35] = { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[34] };
danger[36] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[37] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[38] = { danger[37] };
danger[39] = { notes = danger[36], unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = danger[38] };
danger[40] = { kind = 'skill', id = 1157, name = 'Slipstream', summary = 'Slipstream: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[39] };
danger[41] = { danger[35], danger[40] };
danger[42] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[43] = { value = 'Sonic Boom: Attack down; Slipstream: Accuracy down', notes = danger[30], entries = danger[41], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[42] };
danger[44] = { 'Triclip: DEX down. Source targeting: single target.', 'Back Swish: can crit. This move can crit. Its current critical chance is not known. Source targeting: cone.', 'Mow: Poison, can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Frightful Roar: defense down. Attempts Defense Down on its targets. Source targeting: area around the monster. Possible effects: Defense down.', 'Mortal Ray: Doom gaze. Attempts Doom when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Doom. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[45] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[46] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[47] = { danger[46] };
danger[48] = { notes = danger[45], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[47] };
danger[49] = { kind = 'skill', id = 498, name = 'Triclip', summary = 'Triclip: DEX down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[48] };
danger[50] = { 'This move can crit. Its current critical chance is not known. Source targeting: cone.' };
danger[51] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[52] = { notes = danger[51], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[53] = { kind = 'skill', id = 499, name = 'Back Swish', summary = 'Back Swish: can crit', notes = danger[50], categories = { 'crit' }, effects = {  }, details = danger[52] };
danger[54] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[55] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { notes = danger[55], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[57] = { kind = 'skill', id = 500, name = 'Mow', summary = 'Mow: Poison, can crit', notes = danger[54], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[56] };
danger[58] = { 'Attempts Defense Down on its targets. Source targeting: area around the monster. Possible effects: Defense down.' };
danger[59] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[60] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[61] = { danger[60] };
danger[62] = { notes = danger[59], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[61] };
danger[63] = { kind = 'skill', id = 501, name = 'Frightful Roar', summary = 'Frightful Roar: defense down', notes = danger[58], categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[62] };
danger[64] = { 'Attempts Doom when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Doom. The gaze effect requires the target to face the monster.' };
danger[65] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Doom: Cursna (can fail), Holy Water (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Doom removal is a chance, not a guarantee.' };
danger[66] = { { effect = 'Doom', options = { 'Cursna (can fail)', 'Holy Water (can fail)' } } };
danger[67] = { notes = danger[65], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[66] };
danger[68] = { kind = 'skill', id = 502, name = 'Mortal Ray', summary = 'Mortal Ray: Doom gaze', notes = danger[64], categories = { 'debuff' }, effects = { 'Doom' }, details = danger[67] };
danger[69] = { danger[49], danger[53], danger[57], danger[63], danger[68] };
danger[70] = { value = 'Triclip: DEX down; Back Swish: can crit; Mow: Poison, can crit; Frightful Roar: defense down; Mortal Ray: Doom gaze', notes = danger[44], entries = danger[69], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[42] };
danger[71] = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[72] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[73] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[74] = { notes = danger[73], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[75] = { kind = 'skill', id = 478, name = 'Hell Slash', summary = 'Hell Slash: can crit', notes = danger[72], categories = { 'crit' }, effects = {  }, details = danger[74] };
danger[76] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[77] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[78] = { danger[77] };
danger[79] = { notes = danger[76], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[78] };
danger[80] = { kind = 'skill', id = 479, name = 'Horror Cloud', summary = 'Horror Cloud: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[79] };
danger[81] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[82] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[83] = { notes = danger[82], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[84] = { kind = 'skill', id = 484, name = 'Black Cloud', summary = 'Black Cloud: Blindness', notes = danger[81], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[83] };
danger[85] = { 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.' };
danger[86] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[87] = { notes = danger[86], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[88] = { kind = 'skill', id = 485, name = 'Blood Saber', summary = 'Blood Saber: HP drain', notes = danger[85], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[87] };
danger[89] = { danger[75], danger[80], danger[84], danger[88] };
danger[90] = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain', notes = danger[71], entries = danger[89], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[42] };
danger[91] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[14], level_ranges = { { 50, 255 } } };
danger[92] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[14], level_ranges = { { 54, 255 } } };
danger[93] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[94] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[95] = { danger[94] };
danger[96] = { notes = danger[93], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[95] };
danger[97] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[96], level_ranges = { { 21, 255 } } };
danger[98] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[99] = { notes = danger[98], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[100] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[99], level_ranges = { { 43, 64 } } };
danger[101] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[102] = { notes = danger[101], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[103] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[102], level_ranges = { { 24, 69 } } };
danger[104] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[14], level_ranges = { { 25, 82 } } };
danger[105] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 20, 255 } } };
danger[106] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 41, 255 } } };
danger[107] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[108] = { notes = danger[107], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[109] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 31, 55 } } };
danger[110] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 56, 255 } } };
danger[111] = { kind = 'skill', id = 472, name = 'Grave Reel', summary = 'Grave Reel: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[87] };
danger[112] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[113] = { notes = danger[112], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[114] = { kind = 'skill', id = 473, name = 'Ectosmash', summary = 'Ectosmash: can crit', notes = danger[72], categories = { 'crit' }, effects = {  }, details = danger[113] };
danger[115] = { kind = 'skill', id = 474, name = 'Fear Touch', summary = 'Fear Touch: can crit', notes = danger[72], categories = { 'crit' }, effects = {  }, details = danger[74] };
danger[116] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[117] = { notes = danger[116], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[33] };
danger[118] = { kind = 'skill', id = 475, name = 'Terror Touch', summary = 'Terror Touch: Attack down, can crit', notes = danger[72], categories = { 'crit', 'debuff' }, effects = { 'Attack down' }, details = danger[117] };
danger[119] = { 'Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.' };
danger[120] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[121] = { notes = danger[120], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[122] = { kind = 'skill', id = 476, name = 'Curse', summary = 'Curse: curse', notes = danger[119], categories = { 'debuff' }, effects = { 'Curse' }, details = danger[121] };
danger[123] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[124] = { notes = danger[123], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[125] = { kind = 'skill', id = 477, name = 'Dark Sphere', summary = 'Dark Sphere: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[124] };
danger[126] = { 'Attempts Silence on its targets. Source targeting: area around the monster. Possible effects: Silence.' };
danger[127] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[128] = { notes = danger[127], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[129] = { kind = 'skill', id = 531, name = 'Silence Seal', summary = 'Silence Seal: silence', notes = danger[126], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[128] };
danger[130] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[131] = { notes = danger[130], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[132] = { kind = 'skill', id = 532, name = 'Envoutement', summary = 'Envoutement: Curse', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[131] };
danger[133] = { 'Can charm a player; the target and effect check still have to pass. Source targeting: single target. Possible effects: Charm.' };
danger[134] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[135] = { notes = danger[134], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[136] = { kind = 'skill', id = 533, name = 'Danse Macabre', summary = 'Danse Macabre: charm', notes = danger[133], categories = { 'debuff' }, effects = { 'Charm' }, details = danger[135] };
danger[137] = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[138] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[139] = { notes = danger[138], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[18] };
danger[140] = { kind = 'skill', id = 247, name = 'Foxfire', summary = 'Foxfire: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[139] };
danger[141] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[142] = { notes = danger[141], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[143] = { kind = 'skill', id = 248, name = 'Grim Halo', summary = 'Grim Halo: can crit', notes = danger[54], categories = { 'crit' }, effects = {  }, details = danger[142] };
danger[144] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[145] = { notes = danger[144], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[26] };
danger[146] = { kind = 'skill', id = 249, name = 'Netherspikes', summary = 'Netherspikes: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[145] };
danger[147] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[148] = { notes = danger[147], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[61] };
danger[149] = { kind = 'skill', id = 251, name = 'Aegis Schism', summary = 'Aegis Schism: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[148] };
danger[150] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[151] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[152] = { danger[151] };
danger[153] = { notes = danger[150], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[152] };
danger[154] = { kind = 'skill', id = 252, name = 'Dancing Chains', summary = 'Dancing Chains: Drown', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[153] };
danger[155] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[156] = { notes = danger[155], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[38] };
danger[157] = { kind = 'skill', id = 253, name = 'Barbed Crescent', summary = 'Barbed Crescent: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[156] };
danger[158] = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157] };
danger[159] = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down', notes = danger[137], entries = danger[158], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[42] };
danger[160] = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ichi: Poison.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[161] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[162] = { notes = danger[161], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[163] = { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[162], level_ranges = { { 40, 255 } } };
danger[164] = { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[162], level_ranges = { { 40, 255 } } };
danger[165] = { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[162], level_ranges = { { 40, 255 } } };
danger[166] = { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[162], level_ranges = { { 40, 255 } } };
danger[167] = { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[162], level_ranges = { { 40, 255 } } };
danger[168] = { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[162], level_ranges = { { 40, 255 } } };
danger[169] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[170] = { notes = danger[169], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[171] = { kind = 'spell', id = 341, name = 'Jubaku Ichi', summary = 'Jubaku Ichi: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[170], level_ranges = { { 30, 64 } } };
danger[172] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[173] = { notes = danger[172], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[78] };
danger[174] = { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[173], level_ranges = { { 48, 255 } } };
danger[175] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[176] = { notes = danger[175], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[177] = { kind = 'spell', id = 348, name = 'Kurayami Ni', summary = 'Kurayami Ni: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[176], level_ranges = { { 44, 72 } } };
danger[178] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[179] = { notes = danger[178], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[180] = { kind = 'spell', id = 350, name = 'Dokumori Ichi', summary = 'Dokumori Ichi: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[179], level_ranges = { { 27, 55 } } };
danger[181] = { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[179], level_ranges = { { 56, 255 } } };
danger[182] = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[163], danger[164], danger[165], danger[166], danger[167], danger[168], danger[171], danger[174], danger[177], danger[180], danger[181] };
danger[183] = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ichi: Poison; Dokumori Ni: Poison', notes = danger[160], entries = danger[182], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] };
danger[184] = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Foe Requiem Iv: Requiem.', 'Horde Lullaby: Sleep.', 'Battlefield Elegy: Elegy.', 'Magic Finale: Buff removal.', 'Foe Lullaby: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[185] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[186] = { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } };
danger[187] = { danger[186] };
danger[188] = { notes = danger[185], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[187] };
danger[189] = { kind = 'spell', id = 371, name = 'Foe Requiem Iv', summary = 'Foe Requiem Iv: Requiem', notes = {  }, categories = { 'debuff' }, effects = { 'Requiem' }, details = danger[188], level_ranges = { { 47, 56 } } };
danger[190] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[191] = { notes = danger[190], unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } };
danger[192] = { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[191], level_ranges = { { 27, 255 } } };
danger[193] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[194] = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } };
danger[195] = { notes = danger[193], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[194] };
danger[196] = { kind = 'spell', id = 421, name = 'Battlefield Elegy', summary = 'Battlefield Elegy: Elegy', notes = {  }, categories = { 'debuff' }, effects = { 'Elegy' }, details = danger[195], level_ranges = { { 39, 58 } } };
danger[197] = { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = {  }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[14], level_ranges = { { 33, 255 } } };
danger[198] = { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 16, 255 } } };
danger[199] = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[189], danger[192], danger[196], danger[197], danger[198] };
danger[200] = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Foe Requiem Iv: Requiem; Horde Lullaby: Sleep; Battlefield Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = danger[184], entries = danger[199], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] };
danger[201] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[14], level_ranges = { { 52, 255 } } };
danger[202] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[14], level_ranges = { { 56, 255 } } };
danger[203] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[102], level_ranges = { { 24, 71 } } };
danger[204] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[8], level_ranges = { { 24, 255 } } };
danger[205] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[206] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[207] = { danger[206] };
danger[208] = { notes = danger[205], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[207] };
danger[209] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[208], level_ranges = { { 22, 255 } } };
danger[210] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[12], level_ranges = { { 20, 255 } } };
danger[211] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[212] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[213] = { danger[212] };
danger[214] = { notes = danger[211], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[213] };
danger[215] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[214], level_ranges = { { 18, 255 } } };
danger[216] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[217] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[218] = { danger[217] };
danger[219] = { notes = danger[216], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[218] };
danger[220] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[219], level_ranges = { { 16, 255 } } };
danger[221] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[222] = { notes = danger[221], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[152] };
danger[223] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[222], level_ranges = { { 27, 255 } } };
danger[224] = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[225] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[226] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[227] = { danger[226] };
danger[228] = { notes = danger[225], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[227] };
danger[229] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[228], level_ranges = { { 55, 255 } } };
danger[230] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[231] = { notes = danger[230], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[78] };
danger[232] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[231], level_ranges = { { 13, 255 } } };
danger[233] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[234] = { notes = danger[233], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[235] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[234], level_ranges = { { 6, 255 } } };
danger[236] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[237] = { notes = danger[236], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[238] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[237], level_ranges = { { 18, 255 } } };
danger[239] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[99], level_ranges = { { 46, 255 } } };
danger[240] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[22], level_ranges = { { 8, 255 } } };
danger[241] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[27], level_ranges = { { 11, 255 } } };
danger[242] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 46, 255 } } };
danger[243] = { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[14], level_ranges = { { 32, 255 } } };
danger[244] = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[229], danger[232], danger[235], danger[238], danger[97], danger[239], danger[240], danger[241], danger[242], danger[243] };
danger[245] = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = danger[224], entries = danger[244], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] };
danger[246] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[14], level_ranges = { { 10, 255 } } };
danger[247] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[14], level_ranges = { { 20, 255 } } };
danger[248] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[19], level_ranges = { { 37, 255 } } };
danger[249] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[27], level_ranges = { { 20, 255 } } };
danger[250] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 56, 255 } } };
danger[251] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[252] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[253] = { danger[252] };
danger[254] = { notes = danger[251], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[253] };
danger[255] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[254], level_ranges = { { 43, 255 } } };
danger[256] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[257] = { notes = danger[256], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[47] };
danger[258] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[257], level_ranges = { { 41, 255 } } };
danger[259] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[260] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[261] = { danger[260] };
danger[262] = { notes = danger[259], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[261] };
danger[263] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[262], level_ranges = { { 35, 255 } } };
danger[264] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[265] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[266] = { danger[265] };
danger[267] = { notes = danger[264], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[266] };
danger[268] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[267], level_ranges = { { 37, 255 } } };
danger[269] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[270] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[271] = { danger[270] };
danger[272] = { notes = danger[269], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[271] };
danger[273] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[272], level_ranges = { { 39, 255 } } };
danger[274] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[275] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[276] = { danger[275] };
danger[277] = { notes = danger[274], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[276] };
danger[278] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[277], level_ranges = { { 31, 255 } } };
danger[279] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[280] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[281] = { danger[280] };
danger[282] = { notes = danger[279], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[281] };
danger[283] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[282], level_ranges = { { 33, 255 } } };
danger[284] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[14], level_ranges = { { 45, 255 } } };
danger[285] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[286] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = danger[285], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[14], level_ranges = { { 50, 255 } } };
danger[287] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[285], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[99], level_ranges = { { 43, 64 } } };
danger[288] = { 'Possible effects: Poison.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[289] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = danger[288], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[102], level_ranges = { { 24, 71 } } };
danger[290] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = danger[285], categories = { 'debuff' }, effects = { 'Burn' }, details = danger[8], level_ranges = { { 24, 255 } } };
danger[291] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = danger[285], categories = { 'debuff' }, effects = { 'Frost' }, details = danger[208], level_ranges = { { 22, 255 } } };
danger[292] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = danger[285], categories = { 'debuff' }, effects = { 'Choke' }, details = danger[12], level_ranges = { { 20, 255 } } };
danger[293] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = danger[285], categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[214], level_ranges = { { 18, 255 } } };
danger[294] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = danger[285], categories = { 'debuff' }, effects = { 'Shock' }, details = danger[219], level_ranges = { { 16, 255 } } };
danger[295] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = danger[285], categories = { 'debuff' }, effects = { 'Drown' }, details = danger[222], level_ranges = { { 27, 255 } } };
danger[296] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[285], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[14], level_ranges = { { 12, 255 } } };
danger[297] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[285], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[14], level_ranges = { { 25, 255 } } };
danger[298] = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[299] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[298], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[19], level_ranges = { { 45, 255 } } };
danger[300] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[285], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[22], level_ranges = { { 4, 255 } } };
danger[301] = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[302] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[301], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[27], level_ranges = { { 7, 255 } } };
danger[303] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[304] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[303], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 41, 255 } } };
danger[305] = { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = danger[303], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108], level_ranges = { { 31, 55 } } };
danger[306] = { 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' };
danger[307] = { 'Scripted spell selection has separate conditions from the ordinary spell-list level limits.' };
danger[308] = { 'Possible effects: Sleep.', 'Scripted spell selection has separate conditions from the ordinary spell-list level limits.' };
danger[309] = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[310] = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[91], danger[201], danger[92], danger[202], danger[100], danger[203], danger[204], danger[209], danger[210], danger[215], danger[220], danger[223], danger[15], danger[16], danger[20], danger[23], danger[28], danger[106], danger[110] };
danger[311] = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[309], entries = danger[310], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] };
danger[312] = { 'Foxfire: Stun. Source targeting: cone.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[313] = { danger[140], danger[146], danger[149], danger[154], danger[157] };
danger[314] = { value = 'Foxfire: Stun; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down', notes = danger[312], entries = danger[313], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[42] };
danger[315] = { 'Foxfire: Stun. Source targeting: cone.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' };
danger[316] = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' };
danger[317] = { value = 'Foxfire: Stun; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down', notes = danger[315], entries = danger[313], coverage = 'partial', incomplete = true, reasons = danger[316], general_notes = danger[42] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Greater Gaylas' } },
        [2] = { true_sight = { 'Stegotaur', 'Teratotaur' } },
        [3] = { sound = { 'Fomor Ranger', 'Fomor Thief', 'Fomor Warrior' } },
        [4] = { true_sound = { 'Mariselles Pupil' } },
        [5] = { superlink = { 'Fomor Ninja', 'Fomor Samurai' } },
        [6] = { superlink = { 'Fomor Monk', 'Fomor Ninja' } },
        [7] = { superlink = { 'Fomor Monk', 'Fomor Samurai' } },
        [8] = { superlink = { 'Fomor Ranger', 'Fomor Red Mage' } },
        [9] = { superlink = { 'Fomor Black Mage', 'Fomor Red Mage' } },
        [10] = { superlink = { 'Fomor Black Mage', 'Fomor Ranger' } },
        [11] = { superlink = { 'Fomor Samurai' } },
        [12] = { superlink = { 'Fomor Thief' } },
        [13] = { superlink = { 'Fomor Warrior' } },
        [14] = { superlink = { 'Fomor Monk' } },
        [15] = { superlink = { 'Fomor Dragoon' } },
        [16] = { superlink = { 'Fomor Black Mage', 'Fomor Dark Knight' } },
        [17] = { superlink = { 'Fomor Bard', 'Fomor Black Mage' } },
        [18] = { superlink = { 'Fomor Bard', 'Fomor Dark Knight' } },
        [19] = { sound = { 'Azren Kuba', 'Azren Kuguza' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Azren Kuba'] = { id = 178, name = 'Skeleton' },
        ['Azren Kuguza'] = { id = 178, name = 'Skeleton' },
        ['Fomor Bard'] = { id = 172, name = 'Fomor' },
        ['Fomor Black Mage'] = { id = 172, name = 'Fomor' },
        ['Fomor Dark Knight'] = { id = 172, name = 'Fomor' },
        ['Fomor Dragoon'] = { id = 172, name = 'Fomor' },
        ['Fomor Monk'] = { id = 172, name = 'Fomor' },
        ['Fomor Ninja'] = { id = 172, name = 'Fomor' },
        ['Fomor Ranger'] = { id = 172, name = 'Fomor' },
        ['Fomor Red Mage'] = { id = 172, name = 'Fomor' },
        ['Fomor Samurai'] = { id = 172, name = 'Fomor' },
        ['Fomor Thief'] = { id = 172, name = 'Fomor' },
        ['Fomor Warrior'] = { id = 172, name = 'Fomor' },
        ['Greater Gaylas'] = { id = 81, name = 'Flock Bat' },
        ['Mariselles Pupil'] = { id = 173, name = 'Ghost' },
        ['Stegotaur'] = { id = 94, name = 'Taurus' },
        ['Teratotaur'] = { id = 94, name = 'Taurus' },
    },
    monsters = {
        {
            name   = 'Gazer',
            ids    = { 1, 2, 5 },
            job    = 'blm/blm',
            levels = {
                [48] = { acc = 173, eva = 157, agi = 52, int = 64, mnd = 44, chr = 47, dex = 52, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 176, eva = 160, agi = 53, int = 66, mnd = 44, chr = 47, dex = 53, def = 167,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 163, agi = 54, int = 66, mnd = 45, chr = 50, dex = 54, def = 170,
                         attack_skill = 147 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 150, item = 914 },  -- vial of mercury
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Hecteyes / Amorph', notes = { 'Source species: Hecteye (ID 7); family ID 4.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [48] = 2008, [49] = 2081, [50] = 2192 }, mp = { [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hex Eye: paralysis gaze; Burn: Burn; Choke: Choke; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep', notes = { 'Hex Eye: paralysis gaze. Attempts Paralysis when the target faces the monster and the monster is in front of the target. Source targeting: cone. Possible effects: Paralysis. The gaze effect requires the target to face the monster.', 'Burn: Burn.', 'Choke: Choke.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[4], { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[8], level_ranges = { { 24, 50 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[12], level_ranges = { { 24, 50 } } }, danger[15], danger[16], danger[20], danger[23], danger[28], { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 41, 55 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'Death Ray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 522, name = 'Death Ray', level = 34, min_skill = 74, skill_ids = { 437 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Greater Gaylas',
            ids    = { 3, 8, 77, 84, 93, 100, 109, 117, 141, 142, 143, 144 },
            levels = {
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42, dex = 51, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43, dex = 52, def = 173,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44, dex = 52, def = 176,
                         attack_skill = 141 },
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
            links  = 1,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 2129, [47] = 2212, [48] = 2295 }, mp = { [46] = 0, [47] = 0, [48] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[43],
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Stegotaur S',
            ids    = { 4, 6, 7, 45, 46 },
            job    = 'mnk/mnk',
            levels = {
                [47] = { acc = 173, eva = 155, agi = 35, int = 32, mnd = 50, chr = 46, dex = 58, def = 170,
                         attack_skill = 138 },
                [48] = { acc = 176, eva = 159, agi = 36, int = 33, mnd = 50, chr = 47, dex = 59, def = 173,
                         attack_skill = 141 },
                [49] = { acc = 180, eva = 163, agi = 38, int = 33, mnd = 51, chr = 48, dex = 60, def = 177,
                         attack_skill = 144 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1877 },  -- fomor codex
                { rate = 50, item = 1620 },  -- taurus horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Taurus / Demon', notes = { 'Source species: Taurus (ID 217); family ID 94.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 2337, [48] = 2422, [49] = 2501 }, mp = { [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[70],
                blue = { value = 'Frightful Roar', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 561, name = 'Frightful Roar', level = 50, min_skill = 122, skill_ids = { 501 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mummy',
            ids    = { 9, 10, 12, 14, 16, 19, 22, 24, 27, 30, 32, 33, 36 },
            levels = {
                [54] = { acc = 204, eva = 190, agi = 58, int = 43, mnd = 40, chr = 48, dex = 62, def = 205,
                         attack_skill = 166 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 43, mnd = 41, chr = 49, dex = 62, def = 210,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 44, mnd = 41, chr = 50, dex = 65, def = 215,
                         attack_skill = 176 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            drops  = {
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2855, [55] = 2939, [56] = 3022 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[90],
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lich',
            ids    = { 11, 13, 15, 17, 18, 20, 25, 28, 31, 34, 35, 37 },
            job    = 'blm/blm',
            levels = {
                [54] = { acc = 204, eva = 173, agi = 58, int = 67, mnd = 45, chr = 52, dex = 62, def = 190,
                         attack_skill = 166 },
                [55] = { acc = 209, eva = 177, agi = 58, int = 69, mnd = 47, chr = 52, dex = 62, def = 195,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 183, agi = 61, int = 70, mnd = 47, chr = 55, dex = 65, def = 200,
                         attack_skill = 176 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2497, [55] = 2574, [56] = 2650 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep; Sleepga II: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[75], danger[80], danger[84], danger[88], danger[91], danger[92], danger[97], danger[100], danger[103], danger[15], danger[104], danger[20], danger[105], danger[23], danger[28], danger[106], danger[109], danger[110] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Blubber Eyes PX',
            ids    = { 21, 23, 26, 29, 120, 136, 137, 173, 174, 175, 176 },
            job    = 'blm/blm',
            levels = {
                [57] = { acc = 218, eva = 197, agi = 61, int = 75, mnd = 50, chr = 55, dex = 61, def = 206,
                         attack_skill = 181 },
                [58] = { acc = 223, eva = 202, agi = 61, int = 75, mnd = 52, chr = 55, dex = 61, def = 211,
                         attack_skill = 186 },
                [59] = { acc = 229, eva = 207, agi = 63, int = 78, mnd = 53, chr = 57, dex = 63, def = 216,
                         attack_skill = 191 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 2726, [58] = 2802, [59] = 2879 }, mp = { [57] = 1612, [58] = 1643, [59] = 1674 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hex Eye: paralysis gaze; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind', notes = { 'Hex Eye: paralysis gaze. Attempts Paralysis when the target faces the monster and the monster is in front of the target. Source targeting: cone. Possible effects: Paralysis. The gaze effect requires the target to face the monster.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[4], danger[15], danger[16], danger[20], danger[23], danger[28] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'Death Ray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 522, name = 'Death Ray', level = 34, min_skill = 74, skill_ids = { 437 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Utukku S',
            ids    = { 38, 39, 40, 41, 42, 43 },
            job    = 'war/blm',
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 56, mnd = 43, chr = 54, dex = 58, def = 208,
                         attack_skill = 171 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            steal  = { 825 },  -- square of cotton cloth
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2820 }, mp = { [55] = 1550 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[111], danger[114], danger[115], danger[118], danger[122], danger[125], danger[91], danger[92], danger[97], danger[100], danger[103], danger[15], danger[104], danger[20], danger[105], danger[23], danger[28], danger[106], danger[109] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Elel',
            ids    = { 44 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [60] = { acc = 234, eva = 204, agi = 67, int = 74, mnd = 53, chr = 50, dex = 63, def = 221,
                         attack_skill = 196 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 10,
                       paralyze = 2, bind = 10, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 1614 },  -- corse bracelet
                { rate = 100, item = 14867 },  -- magical mitts
                { rate = 100, item = 1639 },  -- corse robe
                { rate = 100, item = 15174 },  -- frenzy sallet
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Corse / Undead', notes = { 'Source species: Corse (ID 394); family ID 168.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 6500 }, mp = { [60] = 1705 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 290', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Silence Seal: silence; Envoutement: Curse; Danse Macabre: charm', notes = { 'Silence Seal: silence. Attempts Silence on its targets. Source targeting: area around the monster. Possible effects: Silence.', 'Envoutement: Curse. Source targeting: single target.', 'Danse Macabre: charm. Can charm a player; the target and effect check still have to pass. Source targeting: single target. Possible effects: Charm.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = { danger[129], danger[132], danger[136] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[42] },
                blue = { value = 'Memento Mori', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 538, name = 'Memento Mori', level = 62, min_skill = 181, skill_ids = { 530 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 47, 80, 83 },
            job    = 'rng/rng',
            levels = {
                [54] = { acc = 234, eva = 177, agi = 67, int = 48, mnd = 52, chr = 52, dex = 52, def = 195,
                         attack_skill = 166 },
                [55] = { acc = 239, eva = 182, agi = 69, int = 49, mnd = 52, chr = 53, dex = 52, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 245, eva = 188, agi = 70, int = 50, mnd = 55, chr = 54, dex = 55, def = 205,
                         attack_skill = 176 },
            },
            spawn_levels = { [80] = { 55, 56 }, [83] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15380 },  -- virgo subligar
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2579, [55] = 2657, [56] = 2734 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 48, 96, 99 },
            job    = 'nin/nin',
            levels = {
                [54] = { acc = 203, eva = 203, agi = 61, int = 52, mnd = 39, chr = 47, dex = 61, def = 198,
                         attack_skill = 166 },
                [55] = { acc = 209, eva = 209, agi = 63, int = 52, mnd = 39, chr = 47, dex = 63, def = 203,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 215, agi = 64, int = 55, mnd = 41, chr = 48, dex = 64, def = 208,
                         attack_skill = 176 },
            },
            spawn_levels = { [96] = { 55, 56 }, [99] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15376 },  -- taurus subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2659, [55] = 2739, [56] = 2818 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[183],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Bard',
            ids    = { 49, 54, 104, 108 },
            job    = 'brd/brd',
            levels = {
                [54] = { acc = 199, eva = 175, agi = 43, int = 52, mnd = 52, chr = 65, dex = 52, def = 195,
                         attack_skill = 166 },
                [55] = { acc = 204, eva = 180, agi = 43, int = 52, mnd = 52, chr = 67, dex = 52, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 210, eva = 186, agi = 44, int = 55, mnd = 55, chr = 68, dex = 55, def = 205,
                         attack_skill = 176 },
            },
            spawn_levels = { [104] = { 55, 56 }, [108] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15381 },  -- libra subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2659, [55] = 2739, [56] = 2818 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[200],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 50, 71, 75 },
            job    = 'drg/drg',
            levels = {
                [54] = { acc = 209, eva = 192, agi = 52, int = 43, mnd = 48, chr = 62, dex = 52, def = 198,
                         attack_skill = 166 },
                [55] = { acc = 214, eva = 197, agi = 52, int = 43, mnd = 49, chr = 62, dex = 52, def = 203,
                         attack_skill = 171 },
                [56] = { acc = 220, eva = 203, agi = 55, int = 44, mnd = 50, chr = 65, dex = 55, def = 208,
                         attack_skill = 176 },
            },
            spawn_levels = { [71] = { 55, 56 }, [75] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15379 },  -- leo subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2855, [55] = 2939, [56] = 3022 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomors Wyvern',
            ids    = { 51, 72, 76, 132 },
            levels = {
                [49] = { acc = 176, eva = 165, agi = 53, int = 40, mnd = 40, chr = 44, dex = 53, def = 180,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45, dex = 54, def = 185,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47, dex = 56, def = 189,
                         attack_skill = 151 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47, dex = 56, def = 194,
                         attack_skill = 156 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Blue Wyvern (ID 236); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [49] = 711, [50] = 756, [51] = 781, [52] = 806 }, mp = { [49] = 552, [50] = 564, [51] = 576, [52] = 588 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[42] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 52, 69, 73, 171 },
            job    = 'rng/rng',
            levels = {
                [54] = { acc = 234, eva = 177, agi = 67, int = 48, mnd = 52, chr = 52, dex = 52, def = 195,
                         attack_skill = 166 },
                [55] = { acc = 239, eva = 182, agi = 69, int = 49, mnd = 52, chr = 53, dex = 52, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 245, eva = 188, agi = 70, int = 50, mnd = 55, chr = 54, dex = 55, def = 205,
                         attack_skill = 176 },
            },
            spawn_levels = { [69] = { 55, 56 }, [73] = { 55, 56 }, [171] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15380 },  -- virgo subligar
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2579, [55] = 2657, [56] = 2734 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 53, 86, 90 },
            job    = 'blm/blm',
            levels = {
                [54] = { acc = 202, eva = 173, agi = 58, int = 67, mnd = 48, chr = 56, dex = 58, def = 190,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 177, agi = 58, int = 69, mnd = 49, chr = 56, dex = 58, def = 195,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 183, agi = 61, int = 70, mnd = 50, chr = 59, dex = 61, def = 200,
                         attack_skill = 176 },
            },
            spawn_levels = { [86] = { 55, 56 }, [90] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15375 },  -- aries subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2497, [55] = 2574, [56] = 2650 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep; Sleepga II: area sleep', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[91], danger[201], danger[92], danger[202], danger[100], danger[203], danger[204], danger[209], danger[210], danger[215], danger[220], danger[223], danger[15], danger[16], danger[20], danger[23], danger[28], danger[106], danger[109], danger[110] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Beastmaster',
            ids    = { 55, 102, 106 },
            job    = 'bst/bst',
            levels = {
                [54] = { acc = 202, eva = 182, agi = 43, int = 48, mnd = 48, chr = 71, dex = 58, def = 195,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 187, agi = 43, int = 49, mnd = 49, chr = 73, dex = 58, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 192, agi = 44, int = 50, mnd = 50, chr = 74, dex = 61, def = 205,
                         attack_skill = 176 },
            },
            spawn_levels = { [102] = { 55, 56 }, [106] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15388 },  -- ophiuchus subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2776, [55] = 2858, [56] = 2940 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomors Bats',
            ids    = { 56, 103, 107 },
            levels = {
                [49] = { acc = 176, eva = 167, agi = 57, int = 40, mnd = 40, chr = 44, dex = 53, def = 179,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45, dex = 54, def = 183,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, dex = 56, def = 188,
                         attack_skill = 151 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            links  = 1,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [49] = 711, [50] = 756, [51] = 781 }, mp = { [49] = 0, [50] = 0, [51] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[43],
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fomor Monk',
            ids    = { 57, 85, 89 },
            job    = 'mnk/mnk',
            levels = {
                [54] = { acc = 203, eva = 187, agi = 43, int = 39, mnd = 52, chr = 52, dex = 61, def = 202,
                         attack_skill = 166 },
                [55] = { acc = 209, eva = 192, agi = 43, int = 39, mnd = 52, chr = 53, dex = 63, def = 208,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 198, agi = 44, int = 41, mnd = 55, chr = 54, dex = 64, def = 213,
                         attack_skill = 176 },
            },
            spawn_levels = { [85] = { 55, 56 }, [89] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2997, [55] = 3142, [56] = 3227 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 58, 94, 97, 177 },
            job    = 'rdm/rdm',
            levels = {
                [54] = { acc = 199, eva = 178, agi = 48, int = 58, mnd = 58, chr = 56, dex = 52, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 204, eva = 183, agi = 49, int = 58, mnd = 58, chr = 56, dex = 52, def = 198,
                         attack_skill = 171 },
                [56] = { acc = 210, eva = 189, agi = 50, int = 61, mnd = 61, chr = 59, dex = 55, def = 203,
                         attack_skill = 176 },
            },
            spawn_levels = { [94] = { 55, 56 }, [97] = { 55, 56 }, [177] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2659, [55] = 2739, [56] = 2818 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[245],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 59, 70, 74, 172 },
            job    = 'sam/sam',
            levels = {
                [54] = { acc = 202, eva = 192, agi = 52, int = 48, mnd = 48, chr = 56, dex = 58, def = 198,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 197, agi = 52, int = 49, mnd = 49, chr = 56, dex = 58, def = 203,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 203, agi = 55, int = 50, mnd = 50, chr = 59, dex = 61, def = 208,
                         attack_skill = 176 },
            },
            spawn_levels = { [70] = { 55, 56 }, [74] = { 55, 56 }, [172] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15378 },  -- cancer subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2855, [55] = 2939, [56] = 3022 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 20', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 60, 95, 98, 178 },
            job    = 'drk/drk',
            levels = {
                [54] = { acc = 202, eva = 187, agi = 52, int = 58, mnd = 39, chr = 43, dex = 58, def = 198,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 192, agi = 52, int = 58, mnd = 39, chr = 43, dex = 58, def = 203,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 45, dex = 61, def = 208,
                         attack_skill = 176 },
            },
            spawn_levels = { [95] = { 55, 56 }, [98] = { 55, 56 }, [178] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2776, [55] = 2858, [56] = 2940 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[239], danger[246], danger[247], danger[248], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14], level_ranges = { { 30, 55 } } }, danger[249], danger[250], danger[255], danger[258], danger[263], danger[268], danger[273], danger[278], danger[283], danger[284] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Summoner',
            ids    = { 61, 87, 91, 121 },
            job    = 'smn/smn',
            levels = {
                [54] = { acc = 197, eva = 170, agi = 52, int = 61, mnd = 61, chr = 65, dex = 48, def = 190,
                         attack_skill = 166 },
                [55] = { acc = 202, eva = 174, agi = 52, int = 63, mnd = 63, chr = 67, dex = 49, def = 195,
                         attack_skill = 171 },
                [56] = { acc = 208, eva = 180, agi = 55, int = 64, mnd = 64, chr = 68, dex = 50, def = 200,
                         attack_skill = 176 },
            },
            spawn_levels = { [87] = { 55, 56 }, [91] = { 55, 56 }, [121] = { 54, 55 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15384 },  -- capricornus subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2417, [55] = 2492, [56] = 2566 }, mp = { [54] = 1559, [55] = 1590, [56] = 1621 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 62, 88, 92, 122 },
            job    = 'blm/rdm',
            levels = {
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47, dex = 51, def = 167,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50, dex = 54, def = 175,
                         attack_skill = 151 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Earth Elemental (ID 260); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [49] = 634, [50] = 672, [51] = 695 }, mp = { [49] = 1365, [50] = 1395, [51] = 1426 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Freeze: Fire magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, entries = { danger[286], danger[287], danger[289], danger[290], danger[291], danger[292], danger[293], danger[294], danger[295], danger[296], danger[297], danger[299], danger[300], danger[302], danger[304], danger[305] }, coverage = 'partial', incomplete = true, reasons = danger[306], general_notes = danger[29] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 63, 78, 81 },
            levels = {
                [54] = { acc = 202, eva = 190, agi = 58, int = 43, mnd = 43, chr = 52, dex = 58, def = 205,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 43, chr = 53, dex = 58, def = 210,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 44, chr = 54, dex = 61, def = 215,
                         attack_skill = 176 },
            },
            spawn_levels = { [78] = { 55, 56 }, [81] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2855, [55] = 2939, [56] = 3022 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Thief',
            ids    = { 64, 79, 82 },
            job    = 'thf/thf',
            levels = {
                [54] = { acc = 206, eva = 238, agi = 61, int = 58, mnd = 39, chr = 43, dex = 67, def = 195,
                         attack_skill = 166 },
                [55] = { acc = 212, eva = 244, agi = 63, int = 58, mnd = 39, chr = 43, dex = 69, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 218, eva = 250, agi = 64, int = 61, mnd = 41, chr = 45, dex = 70, def = 205,
                         attack_skill = 176 },
            },
            spawn_levels = { [79] = { 55, 56 }, [82] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15377 },  -- gemini subligar
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2659, [55] = 2739, [56] = 2818 }, mp = { [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 0-5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 65, 101, 105 },
            job    = 'pld/pld',
            levels = {
                [54] = { acc = 197, eva = 180, agi = 39, int = 39, mnd = 58, chr = 62, dex = 48, def = 237,
                         attack_skill = 166 },
                [55] = { acc = 202, eva = 185, agi = 39, int = 39, mnd = 58, chr = 62, dex = 49, def = 243,
                         attack_skill = 171 },
                [56] = { acc = 208, eva = 190, agi = 41, int = 41, mnd = 61, chr = 65, dex = 50, def = 248,
                         attack_skill = 176 },
            },
            spawn_levels = { [101] = { 55, 56 }, [105] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15386 },  -- pisces subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2776, [55] = 2858, [56] = 2940 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Flash: Flash', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 37, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Old Professor Mariselle',
            ids    = { 66 },
            nm     = true,
            job    = 'blm/drk',
            levels = {
                [55] = { acc = 207, eva = 194, agi = 56, int = 69, mnd = 44, chr = 52, dex = 58, def = 198,
                         attack_skill = 171 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            immune = { 'dark_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 5000 }, mp = { [55] = 5000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Drain: HP drain; Blind: Blindness; Sleep II: sleep; Absorb-Int: INT down; Sleepga II: area sleep', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Drain: HP drain. Scripted spell selection has separate conditions from the ordinary spell-list level limits.', 'Blind: Blindness. Scripted spell selection has separate conditions from the ordinary spell-list level limits.', 'Sleep II: sleep. Possible effects: Sleep. Scripted spell selection has separate conditions from the ordinary spell-list level limits.', 'Absorb-Int: INT down. Scripted spell selection has separate conditions from the ordinary spell-list level limits.', 'Sleepga II: area sleep. Possible effects: Sleep. Scripted spell selection has separate conditions from the ordinary spell-list level limits.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[111], danger[114], danger[115], danger[118], danger[122], danger[125], { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[307], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[14] }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[307], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[22] }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[308], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[14] }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = danger[307], categories = { 'debuff' }, effects = { 'INT down' }, details = danger[272] }, { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = danger[308], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[108] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[42] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mariselles Pupil',
            ids    = { 67, 68 },
            nm     = true,
            job    = 'rdm/blm',
            levels = {
                [47] = { acc = 168, eva = 151, agi = 46, int = 58, mnd = 46, chr = 50, dex = 49, def = 161,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 58, mnd = 47, chr = 50, dex = 49, def = 165,
                         attack_skill = 141 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            immune = { 'dark_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 1000, [48] = 1000 }, mp = { [47] = 1303, [48] = 1334 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Gravity: Weight', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Gravity: Weight.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = { danger[111], danger[114], danger[115], danger[118], danger[122], danger[125], { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Scripted casting can bypass normal spell selection range.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[95] }, forced = true } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[42] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fomor Bard',
            ids    = { 110 },
            job    = 'brd/brd',
            levels = {
                [55] = { acc = 204, eva = 180, agi = 43, int = 52, mnd = 52, chr = 67, dex = 52, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 210, eva = 186, agi = 44, int = 55, mnd = 55, chr = 68, dex = 55, def = 205,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15381 },  -- libra subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2739, [56] = 2818 }, mp = { [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[200],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Monk',
            ids    = { 111 },
            job    = 'mnk/mnk',
            levels = {
                [56] = { acc = 215, eva = 198, agi = 44, int = 41, mnd = 55, chr = 54, dex = 64, def = 213,
                         attack_skill = 176 },
                [57] = { acc = 220, eva = 204, agi = 46, int = 41, mnd = 55, chr = 54, dex = 65, def = 218,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 5,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 3227, [57] = 3312 }, mp = { [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 112 },
            job    = 'sam/sam',
            levels = {
                [55] = { acc = 207, eva = 197, agi = 52, int = 49, mnd = 49, chr = 56, dex = 58, def = 203,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 203, agi = 55, int = 50, mnd = 50, chr = 59, dex = 61, def = 208,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15378 },  -- cancer subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 6,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2939, [56] = 3022 }, mp = { [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 20', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 113 },
            job    = 'nin/nin',
            levels = {
                [55] = { acc = 209, eva = 209, agi = 63, int = 52, mnd = 39, chr = 47, dex = 63, def = 203,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 215, agi = 64, int = 55, mnd = 41, chr = 48, dex = 64, def = 208,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15376 },  -- taurus subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 7,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2739, [56] = 2818 }, mp = { [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[183],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 114 },
            job    = 'blm/blm',
            levels = {
                [56] = { acc = 213, eva = 183, agi = 61, int = 70, mnd = 50, chr = 59, dex = 61, def = 200,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 187, agi = 61, int = 71, mnd = 50, chr = 59, dex = 61, def = 206,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15375 },  -- aries subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 8,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 2650, [57] = 2726 }, mp = { [56] = 1581, [57] = 1612 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[311],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 115 },
            job    = 'rng/rng',
            levels = {
                [55] = { acc = 239, eva = 182, agi = 69, int = 49, mnd = 52, chr = 53, dex = 52, def = 200,
                         attack_skill = 171 },
                [56] = { acc = 245, eva = 188, agi = 70, int = 50, mnd = 55, chr = 54, dex = 55, def = 205,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15380 },  -- virgo subligar
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2657, [56] = 2734 }, mp = { [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 116 },
            job    = 'rdm/rdm',
            levels = {
                [55] = { acc = 204, eva = 183, agi = 49, int = 58, mnd = 58, chr = 56, dex = 52, def = 198,
                         attack_skill = 171 },
                [56] = { acc = 210, eva = 189, agi = 50, int = 61, mnd = 61, chr = 59, dex = 55, def = 203,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 10,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2739, [56] = 2818 }, mp = { [55] = 1550, [56] = 1581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[245],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Thief',
            ids    = { 118 },
            job    = 'thf/thf',
            levels = {
                [57] = { acc = 223, eva = 255, agi = 65, int = 61, mnd = 41, chr = 45, dex = 71, def = 210,
                         attack_skill = 181 },
                [58] = { acc = 228, eva = 260, agi = 65, int = 61, mnd = 41, chr = 45, dex = 71, def = 215,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15377 },  -- gemini subligar
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 11,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 2897, [58] = 2976 }, mp = { [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 119 },
            job    = 'sam/sam',
            levels = {
                [56] = { acc = 213, eva = 203, agi = 55, int = 50, mnd = 50, chr = 59, dex = 61, def = 208,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 208, agi = 55, int = 50, mnd = 50, chr = 59, dex = 61, def = 213,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15378 },  -- cancer subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 12,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 3022, [57] = 3106 }, mp = { [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 20', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Monk',
            ids    = { 123 },
            job    = 'mnk/mnk',
            levels = {
                [57] = { acc = 220, eva = 204, agi = 46, int = 41, mnd = 55, chr = 54, dex = 65, def = 218,
                         attack_skill = 181 },
                [58] = { acc = 225, eva = 209, agi = 46, int = 41, mnd = 55, chr = 56, dex = 65, def = 223,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 13,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 3312, [58] = 3397 }, mp = { [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 124 },
            levels = {
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 44, chr = 54, dex = 61, def = 215,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 46, chr = 54, dex = 61, def = 220,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 14,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 3022, [57] = 3106 }, mp = { [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Teratotaur',
            ids    = { 125, 126, 127, 128, 129, 138, 139, 140 },
            job    = 'mnk/mnk',
            levels = {
                [57] = { acc = 222, eva = 202, agi = 43, int = 38, mnd = 59, chr = 54, dex = 69, def = 217,
                         attack_skill = 181 },
                [58] = { acc = 227, eva = 208, agi = 44, int = 39, mnd = 59, chr = 56, dex = 69, def = 222,
                         attack_skill = 186 },
                [59] = { acc = 234, eva = 213, agi = 44, int = 39, mnd = 61, chr = 57, dex = 72, def = 228,
                         attack_skill = 191 },
            },
            spawn_levels = { [125] = { 57, 58 }, [126] = { 57, 58 }, [127] = { 57, 58 }, [128] = { 57, 58 },
                             [129] = { 57, 58 }, [138] = { 57, 58 }, [139] = { 58, 59 }, [140] = { 58, 59 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1877 },  -- fomor codex
                { rate = 50, item = 1620 },  -- taurus horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Taurus / Demon', notes = { 'Source species: Taurus (ID 217); family ID 94.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 3312, [58] = 3397, [59] = 3482 }, mp = { [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[70],
                blue = { value = 'Frightful Roar', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 561, name = 'Frightful Roar', level = 50, min_skill = 122, skill_ids = { 501 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 130 },
            levels = {
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 46, chr = 54, dex = 61, def = 220,
                         attack_skill = 181 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 46, mnd = 46, chr = 56, dex = 61, def = 225,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 15,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 3106, [58] = 3189 }, mp = { [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 131 },
            job    = 'drg/drg',
            levels = {
                [56] = { acc = 220, eva = 203, agi = 55, int = 44, mnd = 50, chr = 65, dex = 55, def = 208,
                         attack_skill = 176 },
                [57] = { acc = 225, eva = 208, agi = 55, int = 46, mnd = 50, chr = 65, dex = 55, def = 213,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15379 },  -- leo subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 13,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 3022, [57] = 3106 }, mp = { [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Bard',
            ids    = { 133 },
            job    = 'brd/brd',
            levels = {
                [56] = { acc = 210, eva = 186, agi = 44, int = 55, mnd = 55, chr = 68, dex = 55, def = 205,
                         attack_skill = 176 },
                [57] = { acc = 215, eva = 191, agi = 46, int = 55, mnd = 55, chr = 69, dex = 55, def = 210,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15381 },  -- libra subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 16,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 2818, [57] = 2897 }, mp = { [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Foe Requiem Iv: Requiem; Foe Requiem V: Requiem; Horde Lullaby: Sleep; Battlefield Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Foe Requiem Iv: Requiem.', 'Foe Requiem V: Requiem.', 'Horde Lullaby: Sleep.', 'Battlefield Elegy: Elegy.', 'Magic Finale: Buff removal.', 'Foe Lullaby: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[189], { kind = 'spell', id = 372, name = 'Foe Requiem V', summary = 'Foe Requiem V: Requiem', notes = {  }, categories = { 'debuff' }, effects = { 'Requiem' }, details = danger[188], level_ranges = { { 57, 66 } } }, danger[192], danger[196], danger[197], danger[198] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 134 },
            job    = 'drk/drk',
            levels = {
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 45, dex = 61, def = 208,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 202, agi = 55, int = 61, mnd = 41, chr = 45, dex = 61, def = 213,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 17,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 2940, [57] = 3022 }, mp = { [56] = 1581, [57] = 1612 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[140], danger[143], danger[146], danger[149], danger[154], danger[157], danger[239], danger[246], danger[247], danger[248], danger[249], danger[250], danger[255], danger[258], danger[263], danger[268], danger[273], danger[278], danger[283], danger[284] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 135 },
            job    = 'blm/blm',
            levels = {
                [56] = { acc = 213, eva = 183, agi = 61, int = 70, mnd = 50, chr = 59, dex = 61, def = 200,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 187, agi = 61, int = 71, mnd = 50, chr = 59, dex = 61, def = 206,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15375 },  -- aries subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 18,
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 2650, [57] = 2726 }, mp = { [56] = 1581, [57] = 1612 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[311],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Keremet',
            ids    = { 145 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [56] = { acc = 213, eva = 185, agi = 65, int = 70, mnd = 50, chr = 48, dex = 61, def = 200,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 189, agi = 65, int = 71, mnd = 50, chr = 49, dex = 61, def = 206,
                         attack_skill = 181 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 1658 },  -- sealion crest key
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Corse / Undead', notes = { 'Source species: Corse (ID 394); family ID 168.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 6000, [57] = 6000 }, mp = { [56] = 1581, [57] = 1612 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 290', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence Seal: silence; Envoutement: Curse; Danse Macabre: charm; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Silence Seal: silence. Attempts Silence on its targets. Source targeting: area around the monster. Possible effects: Silence.', 'Envoutement: Curse. Source targeting: single target.', 'Danse Macabre: charm. Can charm a player; the target and effect check still have to pass. Source targeting: single target. Possible effects: Charm.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[129], danger[132], danger[136], danger[91], danger[201], danger[92], danger[202], danger[100], danger[203], danger[204], danger[209], danger[210], danger[215], danger[220], danger[223], danger[15], danger[16], danger[20], danger[23], danger[28], danger[106], danger[110] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'Memento Mori', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 538, name = 'Memento Mori', level = 62, min_skill = 181, skill_ids = { 530 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Azren Kuguza',
            ids    = { 146, 148, 150, 152, 154, 156 },
            levels = {
                [42] = { acc = 154, eva = 142, agi = 47, int = 35, mnd = 33, chr = 39, dex = 50, def = 158,
                         attack_skill = 123 },
                [43] = { acc = 157, eva = 145, agi = 47, int = 35, mnd = 33, chr = 39, dex = 50, def = 161,
                         attack_skill = 126 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 19,
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 300, [43] = 300 }, mp = { [42] = 0, [43] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[90],
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Azren Kuba',
            ids    = { 147, 149, 151, 153, 155, 157 },
            job    = 'blm/blm',
            levels = {
                [42] = { acc = 154, eva = 129, agi = 47, int = 54, mnd = 37, chr = 42, dex = 50, def = 144,
                         attack_skill = 123 },
                [43] = { acc = 157, eva = 132, agi = 47, int = 56, mnd = 37, chr = 42, dex = 50, def = 147,
                         attack_skill = 126 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
            undead = true,
            immune = { 'dark_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 19,
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Skeleton (ID 419); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 300, [43] = 300 }, mp = { [42] = 1152, [43] = 1182 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hell Slash: can crit; Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Gravity: Weight; Poison II: Poison; Poisonga: area poison; Frost: Frost; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Hell Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Gravity: Weight.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Frost: Frost.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[75], danger[80], danger[84], danger[88], danger[97], danger[100], danger[103], { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[208], level_ranges = { { 22, 50 } } }, danger[15], danger[104], danger[105], danger[23], danger[28], danger[106], danger[109] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[29] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 158, 161 },
            job    = 'blm/rdm',
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57, dex = 61, def = 222,
                         attack_skill = 196 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3014 }, mp = { [60] = 1705 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Wind weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence: silence; Tornado: Ice magic evasion down; Gravity: Weight', notes = { 'Silence: silence. Possible effects: Silence.', 'Tornado: Ice magic evasion down.', 'Gravity: Weight.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[237], level_ranges = { { 15, 255 } } }, danger[201], danger[97] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[29] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 159, 162 },
            job    = 'blm/rdm',
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57, dex = 61, def = 222,
                         attack_skill = 196 },
            },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3014 }, mp = { [60] = 1705 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Thunder weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Burst: Earth magic evasion down; Stun: stun', notes = { 'Burst: Earth magic evasion down.', 'Stun: stun. Possible effects: Stun.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[202], danger[248] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[29] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Dark Elemental',
            ids    = { 160, 163 },
            job    = 'drk/drk',
            levels = {
                [60] = { acc = 234, eva = 218, agi = 57, int = 63, mnd = 42, chr = 42, dex = 63, def = 229,
                         attack_skill = 196 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'dark_sleep', 'light_sleep', 'blind' },
            drops  = {
                { rate = 1000, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3268 }, mp = { [60] = 1705 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Dark weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Drain: HP drain; Aspir: MP drain; Stun: stun; Dispel: removes a buff; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Sleepga II: area sleep; Absorb-Tp: TP drain', notes = { 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[15], danger[16], danger[248], danger[243], danger[255], danger[258], danger[263], danger[268], danger[273], danger[278], danger[283], danger[110], danger[284] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[29] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Balor',
            ids    = { 164 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [57] = { acc = 250, eva = 192, agi = 71, int = 50, mnd = 55, chr = 54, dex = 55, def = 210,
                         attack_skill = 181 },
                [58] = { acc = 255, eva = 197, agi = 71, int = 52, mnd = 55, chr = 56, dex = 55, def = 215,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6300, [58] = 6300 }, mp = { [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 30', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[314],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Luaith',
            ids    = { 165 },
            nm     = true,
            job    = 'thf/war',
            levels = {
                [57] = { acc = 222, eva = 255, agi = 64, int = 56, mnd = 43, chr = 48, dex = 68, def = 220,
                         attack_skill = 181 },
                [58] = { acc = 227, eva = 260, agi = 64, int = 56, mnd = 43, chr = 49, dex = 68, def = 225,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6400, [58] = 6400 }, mp = { [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10; Triple Attack 5', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[314],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Lobais',
            ids    = { 166 },
            nm     = true,
            job    = 'smn/blm',
            levels = {
                [57] = { acc = 215, eva = 185, agi = 57, int = 67, mnd = 60, chr = 66, dex = 54, def = 206,
                         attack_skill = 181 },
                [58] = { acc = 220, eva = 190, agi = 57, int = 67, mnd = 61, chr = 66, dex = 55, def = 211,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6100, [58] = 6100 }, mp = { [57] = 1652, [58] = 1683 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 210', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down', notes = { 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted spell argument is not resolved.' }, entries = { danger[143], danger[146], danger[149], danger[154], danger[157] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'A scripted spell argument is not resolved.' }, general_notes = danger[42] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 167 },
            job    = 'blm/rdm',
            levels = {
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52, dex = 55, def = 186,
                         attack_skill = 161 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'dark_sleep' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Earth Elemental (ID 260); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [53] = 790 }, mp = { [53] = 1488 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Tornado: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, entries = { danger[286], { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = danger[285], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[14], level_ranges = { { 52, 255 } } }, danger[287], danger[289], danger[290], danger[291], danger[292], danger[293], danger[294], danger[295], danger[296], danger[297], danger[299], danger[300], danger[302], danger[304], danger[305] }, coverage = 'partial', incomplete = true, reasons = danger[306], general_notes = danger[29] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Fomors Avatar',
            ids    = { 168 },
            job    = 'blm/blm',
            levels = {
                [49] = { acc = 176, eva = 150, agi = 53, int = 62, mnd = 44, chr = 47, dex = 53, def = 161,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 153, agi = 54, int = 63, mnd = 45, chr = 50, dex = 54, def = 164,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 158, agi = 56, int = 65, mnd = 47, chr = 50, dex = 56, def = 168,
                         attack_skill = 151 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [49] = 2081, [50] = 2192, [51] = 2269 }, mp = { [49] = 1365, [50] = 1395, [51] = 1426 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, general_notes = danger[42] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
        {
            name   = 'Caithleann',
            ids    = { 169 },
            nm     = true,
            job    = 'rdm/nin',
            levels = {
                [57] = { acc = 217, eva = 215, agi = 55, int = 59, mnd = 54, chr = 56, dex = 58, def = 210,
                         attack_skill = 181 },
                [58] = { acc = 222, eva = 221, agi = 56, int = 59, mnd = 54, chr = 56, dex = 58, def = 215,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6200, [58] = 6200 }, mp = { [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[317],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Indich',
            ids    = { 170 },
            nm     = true,
            job    = 'brd/pld',
            levels = {
                [57] = { acc = 214, eva = 197, agi = 44, int = 50, mnd = 57, chr = 68, dex = 53, def = 248,
                         attack_skill = 181 },
                [58] = { acc = 220, eva = 202, agi = 44, int = 50, mnd = 57, chr = 68, dex = 54, def = 253,
                         attack_skill = 186 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6500, [58] = 6500 }, mp = { [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[317],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
