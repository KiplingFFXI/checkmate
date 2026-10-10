-- AlTaieu (zone 33).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Biotic Boomerang: Plague, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[2] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[3] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[4] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[5] = { danger[4] };
danger[6] = { notes = danger[3], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = danger[5] };
danger[7] = { kind = 'skill', id = 1378, name = 'Wing Thrust', summary = 'Wing Thrust: Slow', notes = danger[2], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[6] };
danger[8] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[9] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[10] = { notes = danger[9], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[11] = { kind = 'skill', id = 1379, name = 'Auroral Wind', summary = 'Auroral Wind: Silence', notes = danger[8], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[10] };
danger[12] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[13] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[14] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[15] = { danger[14], { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[16] = { notes = danger[13], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[15] };
danger[17] = { kind = 'skill', id = 1380, name = 'Impact Stream', summary = 'Impact Stream: Defense down, Stun', notes = danger[12], categories = { 'debuff' }, effects = { 'Defense down', 'Stun' }, details = danger[16] };
danger[18] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[19] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[20] = { notes = danger[19], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[21] = { kind = 'skill', id = 1385, name = 'Biotic Boomerang', summary = 'Biotic Boomerang: Plague, can crit', notes = danger[18], categories = { 'crit', 'debuff' }, effects = { 'Plague' }, details = danger[20] };
danger[22] = { danger[7], danger[11], danger[17], danger[21] };
danger[23] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[24] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Biotic Boomerang: Plague, can crit', notes = danger[1], entries = danger[22], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[23] };
danger[25] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Diaga II: Dia. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Slow: slow. Possible effects: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Paralyze: paralysis. Possible effects: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' };
danger[26] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[27] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[28] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[29] = { danger[28] };
danger[30] = { notes = danger[27], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[29] };
danger[31] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = danger[26], categories = { 'debuff' }, effects = { 'Dia' }, details = danger[30], level_ranges = { { 60, 255 } } };
danger[32] = { 'Possible effects: Slow.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[33] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[34] = { notes = danger[33], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[5] };
danger[35] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = danger[32], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[34], level_ranges = { { 13, 255 } } };
danger[36] = { 'Possible effects: Paralysis.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[37] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[38] = { notes = danger[37], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[39] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = danger[36], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[38], level_ranges = { { 4, 255 } } };
danger[40] = { 'Possible effects: Silence.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[41] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[42] = { notes = danger[41], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[43] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = danger[40], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[42], level_ranges = { { 15, 255 } } };
danger[44] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[45] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[46] = { notes = danger[44], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[45] };
danger[47] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = danger[26], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[46], level_ranges = { { 45, 255 } } };
danger[48] = { danger[7], danger[11], danger[17], danger[31], danger[35], danger[39], danger[43], danger[47] };
danger[49] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[50] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = danger[25], entries = danger[48], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] };
danger[51] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 5 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[52] = { notes = danger[51], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 5 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[53] = { kind = 'skill', id = 1384, name = 'Disseverment', summary = 'Disseverment: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[52] };
danger[54] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[55] = { notes = danger[54], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[56] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[55], level_ranges = { { 60, 255 } } };
danger[57] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[55], level_ranges = { { 50, 255 } } };
danger[58] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[55], level_ranges = { { 52, 255 } } };
danger[59] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[55], level_ranges = { { 54, 255 } } };
danger[60] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[55], level_ranges = { { 56, 255 } } };
danger[61] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[55], level_ranges = { { 58, 255 } } };
danger[62] = { 'Possible effects: Poison.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[63] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[64] = { notes = danger[63], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[65] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = danger[62], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[64], level_ranges = { { 72, 255 } } };
danger[66] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[67] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[68] = { danger[67] };
danger[69] = { notes = danger[66], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[68] };
danger[70] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = danger[26], categories = { 'debuff' }, effects = { 'Burn' }, details = danger[69], level_ranges = { { 24, 255 } } };
danger[71] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[72] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[73] = { danger[72] };
danger[74] = { notes = danger[71], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[73] };
danger[75] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = danger[26], categories = { 'debuff' }, effects = { 'Frost' }, details = danger[74], level_ranges = { { 22, 255 } } };
danger[76] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[77] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[78] = { danger[77] };
danger[79] = { notes = danger[76], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[78] };
danger[80] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = danger[26], categories = { 'debuff' }, effects = { 'Choke' }, details = danger[79], level_ranges = { { 20, 255 } } };
danger[81] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[82] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[83] = { danger[82] };
danger[84] = { notes = danger[81], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[83] };
danger[85] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = danger[26], categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[84], level_ranges = { { 18, 255 } } };
danger[86] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[87] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[88] = { danger[87] };
danger[89] = { notes = danger[86], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[88] };
danger[90] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = danger[26], categories = { 'debuff' }, effects = { 'Shock' }, details = danger[89], level_ranges = { { 16, 255 } } };
danger[91] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[92] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[93] = { danger[92] };
danger[94] = { notes = danger[91], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[93] };
danger[95] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = danger[26], categories = { 'debuff' }, effects = { 'Drown' }, details = danger[94], level_ranges = { { 27, 255 } } };
danger[96] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[26], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[55], level_ranges = { { 12, 255 } } };
danger[97] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[26], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[55], level_ranges = { { 25, 255 } } };
danger[98] = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[99] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[100] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[101] = { notes = danger[99], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[100] };
danger[102] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[98], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[101], level_ranges = { { 45, 255 } } };
danger[103] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[104] = { notes = danger[103], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[105] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[26], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[104], level_ranges = { { 4, 255 } } };
danger[106] = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[107] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[108] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[109] = { danger[108] };
danger[110] = { notes = danger[107], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[109] };
danger[111] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[106], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[110], level_ranges = { { 7, 255 } } };
danger[112] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[113] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[112], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 41, 255 } } };
danger[114] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[115] = { notes = danger[114], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[116] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = danger[112], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[115], level_ranges = { { 56, 255 } } };
danger[117] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Diaga II: Dia. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Slow: slow. Possible effects: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Paralyze: paralysis. Possible effects: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Gravity: Weight. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dispel: removes a buff. Possible effects: Buff removal. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' };
danger[118] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[119] = { notes = danger[118], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[120] = { kind = 'skill', id = 1383, name = 'Glacier Splitter', summary = 'Glacier Splitter: Paralysis', notes = danger[2], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[119] };
danger[121] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = danger[26], categories = { 'debuff' }, effects = { 'Dia' }, details = danger[30], level_ranges = { { 55, 255 } } };
danger[122] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = danger[36], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[38], level_ranges = { { 6, 255 } } };
danger[123] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = danger[40], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[42], level_ranges = { { 18, 255 } } };
danger[124] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[125] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[126] = { danger[125] };
danger[127] = { notes = danger[124], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[126] };
danger[128] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = danger[26], categories = { 'debuff' }, effects = { 'Weight' }, details = danger[127], level_ranges = { { 21, 255 } } };
danger[129] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[130] = { notes = danger[129], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[131] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[26], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[130], level_ranges = { { 46, 255 } } };
danger[132] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[26], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[104], level_ranges = { { 8, 255 } } };
danger[133] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[106], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[110], level_ranges = { { 11, 255 } } };
danger[134] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[112], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 46, 255 } } };
danger[135] = { 'Possible effects: Buff removal.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[136] = { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = danger[135], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[55], level_ranges = { { 32, 255 } } };
danger[137] = { danger[7], danger[11], danger[17], danger[120], danger[121], danger[35], danger[122], danger[123], danger[128], danger[131], danger[132], danger[133], danger[134], danger[136] };
danger[138] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = danger[117], entries = danger[137], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] };
danger[139] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Foe Requiem VI: Requiem. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Horde Lullaby: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Carnage Elegy: Elegy. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Magic Finale: Buff removal. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Foe Lullaby: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' };
danger[140] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[141] = { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } };
danger[142] = { danger[141] };
danger[143] = { notes = danger[140], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[142] };
danger[144] = { kind = 'spell', id = 373, name = 'Foe Requiem VI', summary = 'Foe Requiem VI: Requiem', notes = danger[26], categories = { 'debuff' }, effects = { 'Requiem' }, details = danger[143], level_ranges = { { 67, 255 } } };
danger[145] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[146] = { notes = danger[145], unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } };
danger[147] = { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = danger[26], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[146], level_ranges = { { 27, 255 } } };
danger[148] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[149] = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } };
danger[150] = { notes = danger[148], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[149] };
danger[151] = { kind = 'spell', id = 422, name = 'Carnage Elegy', summary = 'Carnage Elegy: Elegy', notes = danger[26], categories = { 'debuff' }, effects = { 'Elegy' }, details = danger[150], level_ranges = { { 59, 255 } } };
danger[152] = { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = danger[26], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[55], level_ranges = { { 33, 255 } } };
danger[153] = { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = danger[26], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 16, 255 } } };
danger[154] = { danger[7], danger[11], danger[17], danger[53], danger[144], danger[147], danger[151], danger[152], danger[153] };
danger[155] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Foe Requiem VI: Requiem; Horde Lullaby: Sleep; Carnage Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = danger[139], entries = danger[154], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] };
danger[156] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Medusa Javelin: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[157] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[158] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[159] = { notes = danger[158], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[160] = { kind = 'skill', id = 1386, name = 'Medusa Javelin', summary = 'Medusa Javelin: Petrification, can crit', notes = danger[157], categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[159] };
danger[161] = { danger[7], danger[11], danger[17], danger[160] };
danger[162] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Medusa Javelin: Petrification, can crit', notes = danger[156], entries = danger[161], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[23] };
danger[163] = { 'Dual Strike: Stun. Source targeting: single target.', 'Mantle Pierce: Weight, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[164] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 2 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[165] = { notes = danger[164], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 2 } }, removals = danger[100] };
danger[166] = { kind = 'skill', id = 1347, name = 'Dual Strike', summary = 'Dual Strike: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[165] };
danger[167] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[168] = { notes = danger[167], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[126] };
danger[169] = { kind = 'skill', id = 1349, name = 'Mantle Pierce', summary = 'Mantle Pierce: Weight, can crit', notes = danger[157], categories = { 'crit', 'debuff' }, effects = { 'Weight' }, details = danger[168] };
danger[170] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[171] = { notes = danger[170], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[172] = { kind = 'skill', id = 1350, name = 'Ink Cloud', summary = 'Ink Cloud: Blindness', notes = danger[12], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[171] };
danger[173] = { danger[166], danger[169], danger[172] };
danger[174] = { value = 'Dual Strike: Stun; Mantle Pierce: Weight, can crit; Ink Cloud: Blindness', notes = danger[163], entries = danger[173], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[23] };
danger[175] = { 'Tail Thrust: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Temporal Shift: Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sinuate Rush: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Ichor Stream: Poison. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[176] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[177] = { notes = danger[176], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[178] = { kind = 'skill', id = 1365, name = 'Tail Thrust', summary = 'Tail Thrust: Paralysis', notes = danger[2], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[177] };
danger[179] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[180] = { notes = danger[179], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[100] };
danger[181] = { kind = 'skill', id = 1366, name = 'Temporal Shift', summary = 'Temporal Shift: Stun', notes = danger[12], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[180] };
danger[182] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[183] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[184] = { notes = danger[183], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[185] = { kind = 'skill', id = 1367, name = 'Sinuate Rush', summary = 'Sinuate Rush: can crit', notes = danger[182], categories = { 'crit' }, effects = {  }, details = danger[184] };
danger[186] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[187] = { notes = danger[186], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[188] = { kind = 'skill', id = 1369, name = 'Ichor Stream', summary = 'Ichor Stream: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[187] };
danger[189] = { danger[178], danger[181], danger[185], danger[188] };
danger[190] = { value = 'Tail Thrust: Paralysis; Temporal Shift: Stun; Sinuate Rush: can crit; Ichor Stream: Poison', notes = danger[175], entries = danger[189], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[23] };
danger[191] = { 'Aerial Collision: Defense down. Random effects may not all happen on the same use. Source targeting: cone.', 'Spine Lash: Plague, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Voiceless Storm: Silence. Source targeting: area around the monster.', 'Tidal Dive: Bind, Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[192] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[193] = { danger[14] };
danger[194] = { notes = danger[192], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'wipe', per_hit = true } }, removals = danger[193] };
danger[195] = { kind = 'skill', id = 1353, name = 'Aerial Collision', summary = 'Aerial Collision: Defense down', notes = danger[8], categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[194] };
danger[196] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[197] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[198] = { notes = danger[197], unknown = {  }, activation_range = 12.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[199] = { kind = 'skill', id = 1355, name = 'Spine Lash', summary = 'Spine Lash: Plague, can crit', notes = danger[196], categories = { 'crit', 'debuff' }, effects = { 'Plague' }, details = danger[198] };
danger[200] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[201] = { notes = danger[200], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[202] = { kind = 'skill', id = 1356, name = 'Voiceless Storm', summary = 'Voiceless Storm: Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[201] };
danger[203] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[204] = { danger[108], danger[125] };
danger[205] = { notes = danger[203], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[204] };
danger[206] = { kind = 'skill', id = 1357, name = 'Tidal Dive', summary = 'Tidal Dive: Bind, Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bind', 'Weight' }, details = danger[205] };
danger[207] = { danger[195], danger[199], danger[202], danger[206] };
danger[208] = { value = 'Aerial Collision: Defense down; Spine Lash: Plague, can crit; Voiceless Storm: Silence; Tidal Dive: Bind, Weight', notes = danger[191], entries = danger[207], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[23] };
danger[209] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[210] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[211] = { notes = danger[210], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[212] = { kind = 'skill', id = 1387, name = 'Sideswipe', summary = 'Sideswipe: can crit', notes = danger[196], categories = { 'crit' }, effects = {  }, details = danger[211] };
danger[213] = { danger[7], danger[11], danger[17], danger[212] };
danger[214] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit', notes = danger[209], entries = danger[213], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[23] };
danger[215] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' };
danger[216] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = danger[26], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[46], level_ranges = { { 37, 255 } } };
danger[217] = { danger[7], danger[11], danger[17], danger[120], danger[216] };
danger[218] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Flash: Flash', notes = danger[215], entries = danger[217], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] };
danger[219] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[220] = { danger[7], danger[11], danger[17], danger[53] };
danger[221] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison', notes = danger[219], entries = danger[220], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[23] };
danger[222] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Str: STR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Dex: DEX down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Vit: VIT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Agi: AGI down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Int: INT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Mnd: MND down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Chr: CHR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Tp: TP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' };
danger[223] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[26], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[55], level_ranges = { { 10, 255 } } };
danger[224] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[26], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[55], level_ranges = { { 20, 255 } } };
danger[225] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[98], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[101], level_ranges = { { 37, 255 } } };
danger[226] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[106], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[110], level_ranges = { { 20, 255 } } };
danger[227] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[112], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 56, 255 } } };
danger[228] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[229] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[230] = { danger[229] };
danger[231] = { notes = danger[228], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[230] };
danger[232] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = danger[26], categories = { 'debuff' }, effects = { 'STR down' }, details = danger[231], level_ranges = { { 43, 255 } } };
danger[233] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[234] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[235] = { danger[234] };
danger[236] = { notes = danger[233], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[235] };
danger[237] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = danger[26], categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[236], level_ranges = { { 41, 255 } } };
danger[238] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[239] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[240] = { danger[239] };
danger[241] = { notes = danger[238], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[240] };
danger[242] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = danger[26], categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[241], level_ranges = { { 35, 255 } } };
danger[243] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[244] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[245] = { danger[244] };
danger[246] = { notes = danger[243], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[245] };
danger[247] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = danger[26], categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[246], level_ranges = { { 37, 255 } } };
danger[248] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[249] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[250] = { danger[249] };
danger[251] = { notes = danger[248], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[250] };
danger[252] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = danger[26], categories = { 'debuff' }, effects = { 'INT down' }, details = danger[251], level_ranges = { { 39, 255 } } };
danger[253] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[254] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[255] = { danger[254] };
danger[256] = { notes = danger[253], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[255] };
danger[257] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = danger[26], categories = { 'debuff' }, effects = { 'MND down' }, details = danger[256], level_ranges = { { 31, 255 } } };
danger[258] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[259] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[260] = { danger[259] };
danger[261] = { notes = danger[258], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[260] };
danger[262] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = danger[26], categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[261], level_ranges = { { 33, 255 } } };
danger[263] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = danger[26], categories = { 'drain' }, effects = { 'TP drain' }, details = danger[55], level_ranges = { { 45, 255 } } };
danger[264] = { danger[7], danger[11], danger[17], danger[120], danger[131], danger[223], danger[224], danger[225], danger[226], danger[227], danger[232], danger[237], danger[242], danger[247], danger[252], danger[257], danger[262], danger[263] };
danger[265] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[222], entries = danger[264], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] };
danger[266] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[267] = { notes = danger[266], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[268] = { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[267], level_ranges = { { 40, 255 } } };
danger[269] = { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[267], level_ranges = { { 40, 255 } } };
danger[270] = { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[267], level_ranges = { { 40, 255 } } };
danger[271] = { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[267], level_ranges = { { 40, 255 } } };
danger[272] = { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[267], level_ranges = { { 40, 255 } } };
danger[273] = { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[267], level_ranges = { { 40, 255 } } };
danger[274] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[275] = { notes = danger[274], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[276] = { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = danger[26], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[275], level_ranges = { { 65, 255 } } };
danger[277] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[278] = { notes = danger[277], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[5] };
danger[279] = { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = danger[26], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[278], level_ranges = { { 48, 255 } } };
danger[280] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[281] = { notes = danger[280], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[282] = { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = danger[26], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[281], level_ranges = { { 56, 255 } } };
danger[283] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[284] = { danger[7], danger[11], danger[17] };
danger[285] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun', notes = danger[283], entries = danger[284], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[23] };
danger[286] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[130], level_ranges = { { 46, 255 } } };
danger[287] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[55], level_ranges = { { 10, 255 } } };
danger[288] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[55], level_ranges = { { 20, 255 } } };
danger[289] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[101], level_ranges = { { 37, 255 } } };
danger[290] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[110], level_ranges = { { 20, 255 } } };
danger[291] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 56, 255 } } };
danger[292] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[231], level_ranges = { { 43, 255 } } };
danger[293] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[236], level_ranges = { { 41, 255 } } };
danger[294] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[241], level_ranges = { { 35, 255 } } };
danger[295] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[246], level_ranges = { { 37, 255 } } };
danger[296] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[251], level_ranges = { { 39, 255 } } };
danger[297] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[256], level_ranges = { { 31, 255 } } };
danger[298] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[261], level_ranges = { { 33, 255 } } };
danger[299] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[55], level_ranges = { { 45, 255 } } };
danger[300] = { 'Normal attacks: Paralysis. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Vitriolic Barrage: Poison. Source targeting: area around the monster.', 'Primal Drill: Bind. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Concussive Oscillation: Weight. Source targeting: area around the monster.', 'Ion Shower: Stun. Source targeting: area around the monster.', 'Asthenic Fog: Drown. Source targeting: area around the monster.', 'Luminous Drape: Charm. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[301] = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' };
danger[302] = { 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[303] = { notes = danger[302], unknown = {  }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[304] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Paralysis', notes = danger[301], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[303] };
danger[305] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[306] = { notes = danger[305], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = true } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[307] = { kind = 'skill', id = 1370, name = 'Vitriolic Barrage', summary = 'Vitriolic Barrage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[306] };
danger[308] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[309] = { notes = danger[308], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[109] };
danger[310] = { kind = 'skill', id = 1371, name = 'Primal Drill', summary = 'Primal Drill: Bind', notes = danger[12], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[309] };
danger[311] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[312] = { notes = danger[311], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[126] };
danger[313] = { kind = 'skill', id = 1372, name = 'Concussive Oscillation', summary = 'Concussive Oscillation: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[312] };
danger[314] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[315] = { notes = danger[314], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[100] };
danger[316] = { kind = 'skill', id = 1373, name = 'Ion Shower', summary = 'Ion Shower: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[315] };
danger[317] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[318] = { notes = danger[317], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[93] };
danger[319] = { kind = 'skill', id = 1375, name = 'Asthenic Fog', summary = 'Asthenic Fog: Drown', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[318] };
danger[320] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[321] = { notes = danger[320], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } };
danger[322] = { kind = 'skill', id = 1376, name = 'Luminous Drape', summary = 'Luminous Drape: Charm', notes = danger[12], categories = { 'debuff' }, effects = { 'Charm' }, details = danger[321] };
danger[323] = { danger[304], danger[307], danger[310], danger[313], danger[316], danger[319], danger[322] };
danger[324] = { value = 'Normal attacks: Paralysis; Vitriolic Barrage: Poison; Primal Drill: Bind; Concussive Oscillation: Weight; Ion Shower: Stun; Asthenic Fog: Drown; Luminous Drape: Charm', notes = danger[300], entries = danger[323], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[23] };
danger[325] = { 'Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' };
danger[326] = { kind = 'skill', id = 1378, name = 'Wing Thrust', summary = 'Wing Thrust: Slow, can crit during Mighty Strikes', notes = danger[325], categories = { 'crit', 'debuff' }, effects = { 'Slow' }, details = danger[6] };
danger[327] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[34], level_ranges = { { 13, 255 } } };
danger[328] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Biotic Boomerang: Plague, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[329] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Biotic Boomerang: Plague, can crit', notes = danger[328], entries = danger[22], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[23] };
danger[330] = { 'Dual Strike: Stun. Source targeting: single target.', 'Mantle Pierce: Weight, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Some job-special buff choices depend on script values that could not be resolved.', 'A scripted move argument is not resolved.' };
danger[331] = { 'A scripted move argument is not resolved.', 'Some job-special buff choices depend on script values that could not be resolved.' };
danger[332] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Some job-special buff choices depend on script values that could not be resolved.' };
danger[333] = { value = 'Dual Strike: Stun; Mantle Pierce: Weight, can crit; Ink Cloud: Blindness', notes = danger[330], entries = danger[173], coverage = 'partial', incomplete = true, reasons = danger[331], general_notes = danger[332] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { both = { 'Absolute Virtue', 'Omaern', 'Ulaern' }, true_both = { 'Ruaern' } },
        [2] = { true_sound = { 'Jailer of Prudence', 'Omhpemde', 'Ulhpemde' } },
        [3] = { sight = { 'Aerns Wynav' } },
        [4] = { sight = { 'Omxzomit' } },
        [5] = { superlink = { 'Qnxzomit' } },
        [6] = { superlink = { 'Jailer of Justice', 'Qnxzomit' } },
        [7] = { superlink = { 'Qnhpemde', 'Qnxzomit', 'Ruphuabo' } },
        [8] = { superlink = { 'Jailer of Love', 'Qnhpemde', 'Qnxzomit', 'Ruphuabo' } },
        [9] = { both = { 'Omaern', 'Ulaern' }, true_both = { 'Ruaern' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Absolute Virtue'] = { id = 131, name = 'Aern' },
        ['Aerns Wynav'] = { id = 135, name = 'Wynav' },
        ['Jailer of Justice'] = { id = 136, name = 'Xzomit' },
        ['Jailer of Love'] = { id = 137, name = 'Yovra' },
        ['Jailer of Prudence'] = { id = 133, name = 'Hpemde' },
        ['Omaern'] = { id = 131, name = 'Aern' },
        ['Omhpemde'] = { id = 133, name = 'Hpemde' },
        ['Omxzomit'] = { id = 136, name = 'Xzomit' },
        ['Qnhpemde'] = { id = 133, name = 'Hpemde' },
        ['Qnxzomit'] = { id = 136, name = 'Xzomit' },
        ['Ruaern'] = { id = 131, name = 'Aern' },
        ['Ruphuabo'] = { id = 134, name = 'Phuabo' },
        ['Ulaern'] = { id = 131, name = 'Aern' },
        ['Ulhpemde'] = { id = 133, name = 'Hpemde' },
    },
    monsters = {
        {
            name   = 'Ulaern war',
            ids    = { 1, 2 },
            levels = {
                [70] = { acc = 291, eva = 276, agi = 77, int = 67, mnd = 67, chr = 73, dex = 81, def = 291,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 282, agi = 80, int = 68, mnd = 68, chr = 76, dex = 83, def = 296,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 287, agi = 80, int = 68, mnd = 68, chr = 76, dex = 83, def = 301,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 292, agi = 80, int = 71, mnd = 71, chr = 77, dex = 84, def = 307,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3771, [71] = 3847, [72] = 3923, [73] = 3998 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[24],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern whm',
            ids    = { 3 },
            job    = 'whm/whm',
            levels = {
                [70] = { acc = 282, eva = 248, agi = 65, int = 73, mnd = 97, chr = 85, dex = 63, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 287, eva = 254, agi = 68, int = 76, mnd = 100, chr = 88, dex = 63, def = 286,
                         attack_skill = 237 },
                [72] = { acc = 292, eva = 259, agi = 68, int = 76, mnd = 100, chr = 88, dex = 63, def = 291,
                         attack_skill = 241 },
                [73] = { acc = 299, eva = 263, agi = 68, int = 77, mnd = 102, chr = 89, dex = 66, def = 297,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3440, [71] = 3510, [72] = 3581, [73] = 3652 }, mp = { [70] = 5000, [71] = 5000, [72] = 5000, [73] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[50],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern blm',
            ids    = { 4 },
            job    = 'blm/blm',
            levels = {
                [70] = { acc = 291, eva = 254, agi = 77, int = 97, mnd = 73, chr = 79, dex = 81, def = 275,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 260, agi = 80, int = 100, mnd = 76, chr = 80, dex = 83, def = 280,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 265, agi = 80, int = 100, mnd = 76, chr = 80, dex = 83, def = 285,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 269, agi = 80, int = 102, mnd = 77, chr = 83, dex = 84, def = 291,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3345, [71] = 3414, [72] = 3483, [73] = 3553 }, mp = { [70] = 5000, [71] = 5000, [72] = 5000, [73] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Flare: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Tornado: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Quake: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burst: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flood: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga II: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga II: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[53], danger[56], danger[57], danger[58], danger[59], danger[60], danger[61], { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = danger[62], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[64], level_ranges = { { 24, 71 } } }, danger[65], danger[70], danger[75], danger[80], danger[85], danger[90], danger[95], danger[96], danger[97], danger[102], danger[105], danger[111], danger[113], danger[116] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulaern rdm',
            ids    = { 5 },
            job    = 'rdm/rdm',
            levels = {
                [70] = { acc = 288, eva = 262, agi = 65, int = 85, mnd = 85, chr = 79, dex = 75, def = 278,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 268, agi = 68, int = 88, mnd = 88, chr = 80, dex = 75, def = 284,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 273, agi = 68, int = 88, mnd = 88, chr = 80, dex = 75, def = 289,
                         attack_skill = 241 },
                [73] = { acc = 305, eva = 278, agi = 68, int = 89, mnd = 89, chr = 83, dex = 78, def = 294,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3534, [71] = 3606, [72] = 3678, [73] = 3750 }, mp = { [70] = 5000, [71] = 5000, [72] = 5000, [73] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[138],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern brd',
            ids    = { 6 },
            job    = 'brd/brd',
            levels = {
                [70] = { acc = 288, eva = 259, agi = 59, int = 79, mnd = 79, chr = 91, dex = 75, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 264, agi = 60, int = 80, mnd = 80, chr = 92, dex = 75, def = 286,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 269, agi = 60, int = 80, mnd = 80, chr = 92, dex = 75, def = 291,
                         attack_skill = 241 },
                [73] = { acc = 305, eva = 275, agi = 62, int = 83, mnd = 83, chr = 95, dex = 78, def = 297,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3534, [71] = 3606, [72] = 3678, [73] = 3750 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[155],
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulaern rng',
            ids    = { 7 },
            job    = 'rng/rng',
            levels = {
                [70] = { acc = 336, eva = 260, agi = 89, int = 73, mnd = 79, chr = 73, dex = 75, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 341, eva = 266, agi = 92, int = 76, mnd = 80, chr = 76, dex = 75, def = 286,
                         attack_skill = 237 },
                [72] = { acc = 346, eva = 271, agi = 92, int = 76, mnd = 80, chr = 76, dex = 75, def = 291,
                         attack_skill = 241 },
                [73] = { acc = 353, eva = 275, agi = 93, int = 77, mnd = 83, chr = 77, dex = 78, def = 297,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3440, [71] = 3510, [72] = 3581, [73] = 3652 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[24],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern sam',
            ids    = { 8, 9 },
            job    = 'sam/sam',
            levels = {
                [70] = { acc = 291, eva = 280, agi = 71, int = 73, mnd = 73, chr = 79, dex = 81, def = 284,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 285, agi = 72, int = 76, mnd = 76, chr = 80, dex = 83, def = 290,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 290, agi = 72, int = 76, mnd = 76, chr = 80, dex = 83, def = 295,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 296, agi = 74, int = 77, mnd = 77, chr = 83, dex = 84, def = 300,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3771, [71] = 3847, [72] = 3923, [73] = 3998 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[162],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulxzomit',
            ids    = { 10, 25, 38, 42, 45, 48, 51, 59, 62, 65, 68, 71, 84, 161, 164 },
            job    = 'pld/war',
            levels = {
                [68] = { acc = 275, eva = 252, agi = 48, int = 54, mnd = 62, chr = 67, dex = 68, def = 308,
                         attack_skill = 225 },
                [69] = { acc = 280, eva = 257, agi = 49, int = 55, mnd = 63, chr = 68, dex = 69, def = 313,
                         attack_skill = 229 },
                [70] = { acc = 285, eva = 262, agi = 49, int = 55, mnd = 63, chr = 69, dex = 69, def = 331,
                         attack_skill = 233 },
                [71] = { acc = 292, eva = 267, agi = 51, int = 57, mnd = 65, chr = 71, dex = 72, def = 336,
                         attack_skill = 237 },
            },
            spawn_levels = { [51] = { 70, 71 }, [71] = { 70, 71 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 1000, item = 1785 },  -- xzomit organ
                { rate = 100, item = 1855 },  -- high-quality xzomit organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 3957, [69] = 4040, [70] = 4122, [71] = 4205 }, mp = { [68] = 1957, [69] = 1989, [70] = 2021, [71] = 2053 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulxzomit',
            ids    = { 11, 12, 26, 27, 39, 40, 43, 44, 46, 47, 49, 50, 52, 53, 60, 61, 63, 64, 66, 67, 69, 70, 72,
                       73, 85, 86, 162, 163, 165, 166 },
            job    = 'mnk/war',
            levels = {
                [68] = { acc = 280, eva = 260, agi = 51, int = 54, mnd = 58, chr = 60, dex = 79, def = 283,
                         attack_skill = 225 },
                [69] = { acc = 286, eva = 266, agi = 53, int = 55, mnd = 58, chr = 60, dex = 80, def = 288,
                         attack_skill = 229 },
                [70] = { acc = 291, eva = 271, agi = 53, int = 55, mnd = 59, chr = 61, dex = 81, def = 293,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 276, agi = 54, int = 57, mnd = 60, chr = 63, dex = 83, def = 298,
                         attack_skill = 237 },
            },
            spawn_levels = { [12] = { 70, 71 }, [27] = { 70, 71 }, [40] = { 70, 71 }, [50] = { 70, 71 },
                             [52] = { 70, 71 }, [53] = { 70, 71 }, [63] = { 70, 71 }, [64] = { 70, 71 },
                             [72] = { 70, 71 }, [73] = { 70, 71 }, [86] = { 70, 71 }, [163] = { 70, 71 },
                             [166] = { 70, 71 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 10, item = 1785 },  -- xzomit organ
                { rate = 10, item = 1855 },  -- high-quality xzomit organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4213, [69] = 4298, [70] = 4442, [71] = 4527 }, mp = { [68] = 0, [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulhpemde',
            ids    = { 13, 14, 15, 16, 28, 29, 35, 36, 54, 55, 56, 58, 74, 75, 78, 79, 80, 81, 82, 83, 167, 168,
                       169, 170, 171, 172, 173, 174, 175 },
            job    = 'drg/drg',
            levels = {
                [68] = { acc = 297, eva = 267, agi = 65, int = 53, mnd = 60, chr = 68, dex = 69, def = 271,
                         attack_skill = 225 },
                [69] = { acc = 303, eva = 272, agi = 65, int = 54, mnd = 60, chr = 69, dex = 70, def = 277,
                         attack_skill = 229 },
                [70] = { acc = 308, eva = 278, agi = 67, int = 55, mnd = 61, chr = 69, dex = 71, def = 282,
                         attack_skill = 233 },
                [71] = { acc = 314, eva = 282, agi = 67, int = 55, mnd = 63, chr = 72, dex = 72, def = 287,
                         attack_skill = 237 },
                [72] = { acc = 319, eva = 287, agi = 67, int = 55, mnd = 63, chr = 72, dex = 72, def = 292,
                         attack_skill = 241 },
            },
            spawn_levels = { [15] = { 69, 72 }, [36] = { 69, 72 }, [75] = { 69, 72 }, [167] = { 69, 72 },
                             [172] = { 69, 72 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1871 },  -- high-quality hpemde organ
                { rate = 50, item = 1787 },  -- hpemde organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Hpemde / Luminian', notes = { 'Source species: Hpemde (ID 322); family ID 133.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275, [72] = 4359 }, mp = { [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[190],
                blue = { value = 'Temporal Shift', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 616, name = 'Temporal Shift', level = 73, min_skill = 235, skill_ids = { 1366 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulphuabo',
            ids    = { 17, 18, 30, 41, 57, 76, 77, 87, 176, 177 },
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 311, eva = 295, agi = 66, int = 66, mnd = 82, chr = 82, dex = 70, def = 363,
                         attack_skill = 256 },
                [76] = { acc = 316, eva = 299, agi = 67, int = 67, mnd = 85, chr = 85, dex = 71, def = 368,
                         attack_skill = 261 },
                [77] = { acc = 321, eva = 305, agi = 68, int = 68, mnd = 85, chr = 85, dex = 71, def = 373,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1784 },  -- phuabo organ
                { rate = 50, item = 1784 },  -- phuabo organ
                { rate = 50, item = 1852 },  -- high-quality phuabo organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Phuabo / Luminian', notes = { 'Source species: Phuabo (ID 323); family ID 134.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4500, [76] = 4583, [77] = 4665 }, mp = { [75] = 1095, [76] = 1111, [77] = 1127 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 80', notes = { 'Source base speed is 80; the ordinary monster default is 40. Animation speed is 80.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier +10%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[208],
                blue = { value = 'Plasma Charge', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 615, name = 'Plasma Charge', level = 75, min_skill = 245, skill_ids = { 1358 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulaern mnk',
            ids    = { 19 },
            job    = 'mnk/mnk',
            levels = {
                [70] = { acc = 294, eva = 274, agi = 59, int = 61, mnd = 79, chr = 73, dex = 87, def = 290,
                         attack_skill = 233 },
                [71] = { acc = 299, eva = 279, agi = 60, int = 64, mnd = 80, chr = 76, dex = 87, def = 296,
                         attack_skill = 237 },
                [72] = { acc = 304, eva = 284, agi = 60, int = 64, mnd = 80, chr = 76, dex = 87, def = 301,
                         attack_skill = 241 },
                [73] = { acc = 311, eva = 290, agi = 62, int = 65, mnd = 83, chr = 77, dex = 90, def = 306,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 4029, [71] = 4105, [72] = 4183, [73] = 4259 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[214],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern pld',
            ids    = { 20 },
            job    = 'pld/pld',
            levels = {
                [70] = { acc = 285, eva = 264, agi = 53, int = 61, mnd = 85, chr = 85, dex = 69, def = 338,
                         attack_skill = 233 },
                [71] = { acc = 291, eva = 270, agi = 56, int = 64, mnd = 88, chr = 88, dex = 71, def = 344,
                         attack_skill = 237 },
                [72] = { acc = 296, eva = 275, agi = 56, int = 64, mnd = 88, chr = 88, dex = 71, def = 349,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 280, agi = 56, int = 65, mnd = 89, chr = 89, dex = 72, def = 354,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3679, [71] = 3753, [72] = 3827, [73] = 3901 }, mp = { [70] = 2021, [71] = 2053, [72] = 2085, [73] = 2117 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[218],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern bst',
            ids    = { 21 },
            job    = 'bst/bst',
            levels = {
                [70] = { acc = 291, eva = 267, agi = 59, int = 73, mnd = 73, chr = 97, dex = 81, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 272, agi = 60, int = 76, mnd = 76, chr = 100, dex = 83, def = 286,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 277, agi = 60, int = 76, mnd = 76, chr = 100, dex = 83, def = 291,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 283, agi = 62, int = 77, mnd = 77, chr = 102, dex = 84, def = 297,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3679, [71] = 3753, [72] = 3827, [73] = 3901 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[24],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern drg',
            ids    = { 22 },
            job    = 'drg/drg',
            levels = {
                [70] = { acc = 310, eva = 280, agi = 71, int = 67, mnd = 73, chr = 85, dex = 75, def = 284,
                         attack_skill = 233 },
                [71] = { acc = 315, eva = 285, agi = 72, int = 68, mnd = 76, chr = 88, dex = 75, def = 290,
                         attack_skill = 237 },
                [72] = { acc = 320, eva = 290, agi = 72, int = 68, mnd = 76, chr = 88, dex = 75, def = 295,
                         attack_skill = 241 },
                [73] = { acc = 327, eva = 296, agi = 74, int = 71, mnd = 77, chr = 89, dex = 78, def = 300,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3771, [71] = 3847, [72] = 3923, [73] = 3998 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[162],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Wynav',
            ids    = { 23, 97, 136, 189, 190, 290, 343, 364, 493, 494, 495, 496, 497, 498 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 59, mnd = 49, chr = 55, dex = 72, def = 265,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 60, mnd = 49, chr = 55, dex = 75, def = 269,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 60, mnd = 49, chr = 55, dex = 75, def = 275,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 61, mnd = 50, chr = 57, dex = 75, def = 280,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 62, mnd = 51, chr = 57, dex = 77, def = 286,
                         attack_skill = 229 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep' },
            links  = 3,
            info = {
                family = { value = 'Wynav / Luminian', notes = { 'Source species: Wynav (ID 324); family ID 135.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[23] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
            info_by_index = {
                [493] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
                [494] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
                [495] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
                [496] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
                [497] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
                [498] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 1500, [66] = 1500, [67] = 1500, [68] = 1500, [69] = 1500 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
            },
        },
        {
            name   = 'Aerns Xzomit',
            ids    = { 24, 99, 147, 230, 283, 341 },
            levels = {
                [65] = { acc = 263, eva = 244, agi = 61, int = 56, mnd = 49, chr = 58, dex = 72, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 249, agi = 63, int = 57, mnd = 49, chr = 58, dex = 75, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 254, agi = 63, int = 57, mnd = 49, chr = 59, dex = 75, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 259, agi = 63, int = 57, mnd = 50, chr = 60, dex = 75, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 265, agi = 65, int = 59, mnd = 51, chr = 60, dex = 77, def = 282,
                         attack_skill = 229 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            links  = 4,
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [65] = 1132, [66] = 1157, [67] = 1182, [68] = 1207, [69] = 1232 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulaern thf',
            ids    = { 31 },
            job    = 'thf/thf',
            levels = {
                [70] = { acc = 297, eva = 342, agi = 83, int = 85, mnd = 61, chr = 61, dex = 93, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 303, eva = 348, agi = 84, int = 88, mnd = 64, chr = 64, dex = 95, def = 286,
                         attack_skill = 237 },
                [72] = { acc = 308, eva = 353, agi = 84, int = 88, mnd = 64, chr = 64, dex = 95, def = 291,
                         attack_skill = 241 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 89, mnd = 65, chr = 65, dex = 97, def = 297,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3534, [71] = 3606, [72] = 3678, [73] = 3750 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[221],
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ulaern drk',
            ids    = { 32 },
            job    = 'drk/drk',
            levels = {
                [70] = { acc = 291, eva = 273, agi = 71, int = 85, mnd = 61, chr = 61, dex = 81, def = 284,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 278, agi = 72, int = 88, mnd = 64, chr = 64, dex = 83, def = 290,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 283, agi = 72, int = 88, mnd = 64, chr = 64, dex = 83, def = 295,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 289, agi = 74, int = 89, mnd = 65, chr = 65, dex = 84, def = 300,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3679, [71] = 3753, [72] = 3827, [73] = 3901 }, mp = { [70] = 5000, [71] = 5000, [72] = 5000, [73] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[265],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern nin',
            ids    = { 33 },
            job    = 'nin/nin',
            levels = {
                [70] = { acc = 294, eva = 294, agi = 83, int = 79, mnd = 61, chr = 67, dex = 87, def = 284,
                         attack_skill = 233 },
                [71] = { acc = 299, eva = 300, agi = 84, int = 80, mnd = 64, chr = 68, dex = 87, def = 290,
                         attack_skill = 237 },
                [72] = { acc = 304, eva = 305, agi = 84, int = 80, mnd = 64, chr = 68, dex = 87, def = 295,
                         attack_skill = 241 },
                [73] = { acc = 311, eva = 311, agi = 86, int = 83, mnd = 65, chr = 71, dex = 90, def = 300,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3534, [71] = 3606, [72] = 3678, [73] = 3750 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hyoton Ni: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Huton Ni: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Doton Ni: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Raiton Ni: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Suiton Ni: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Jubaku Ni: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hojo Ni: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Kurayami Ni: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dokumori Ni: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[212], danger[268], danger[269], danger[270], danger[271], danger[272], danger[273], danger[276], danger[279], { kind = 'spell', id = 348, name = 'Kurayami Ni', summary = 'Kurayami Ni: Blindness', notes = danger[26], categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } }, level_ranges = { { 44, 72 } } }, danger[282] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulaern smn',
            ids    = { 34 },
            job    = 'smn/smn',
            levels = {
                [70] = { acc = 285, eva = 251, agi = 71, int = 91, mnd = 91, chr = 91, dex = 69, def = 275,
                         attack_skill = 233 },
                [71] = { acc = 291, eva = 256, agi = 72, int = 92, mnd = 92, chr = 92, dex = 71, def = 280,
                         attack_skill = 237 },
                [72] = { acc = 296, eva = 261, agi = 72, int = 92, mnd = 92, chr = 92, dex = 71, def = 285,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 266, agi = 74, int = 95, mnd = 95, chr = 95, dex = 72, def = 291,
                         attack_skill = 246 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3251, [71] = 3319, [72] = 3386, [73] = 3455 }, mp = { [70] = 5060, [71] = 5060, [72] = 5060, [73] = 5060 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[285],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Elemental',
            ids    = { 37, 98, 146, 209, 329, 379 },
            job    = 'drk/rdm',
            levels = {
                [65] = { acc = 260, eva = 244, agi = 61, int = 68, mnd = 53, chr = 51, dex = 66, def = 254,
                         attack_skill = 214 },
                [66] = { acc = 265, eva = 248, agi = 61, int = 70, mnd = 55, chr = 52, dex = 67, def = 259,
                         attack_skill = 218 },
                [67] = { acc = 270, eva = 254, agi = 63, int = 71, mnd = 56, chr = 54, dex = 69, def = 264,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 259, agi = 63, int = 71, mnd = 56, chr = 54, dex = 69, def = 269,
                         attack_skill = 225 },
                [69] = { acc = 281, eva = 264, agi = 63, int = 72, mnd = 56, chr = 54, dex = 70, def = 275,
                         attack_skill = 229 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [65] = 1089, [66] = 1113, [67] = 1138, [68] = 1162, [69] = 1187 }, mp = { [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[286], danger[287], danger[288], danger[289], danger[290], danger[291], danger[292], danger[293], danger[294], danger[295], danger[296], danger[297], danger[298], danger[299] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[49] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Omaern whm',
            ids    = { 88, 104, 200, 294, 326, 377 },
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 309, eva = 273, agi = 70, int = 79, mnd = 105, chr = 91, dex = 67, def = 307,
                         attack_skill = 256 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 79, mnd = 105, chr = 93, dex = 67, def = 312,
                         attack_skill = 261 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 80, mnd = 107, chr = 94, dex = 69, def = 317,
                         attack_skill = 266 },
                [78] = { acc = 325, eva = 288, agi = 73, int = 82, mnd = 107, chr = 94, dex = 69, def = 322,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3792, [76] = 3862, [77] = 3933, [78] = 4004 }, mp = { [75] = 5000, [76] = 5000, [77] = 5000, [78] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[50],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern bst',
            ids    = { 89, 144, 225, 282, 340 },
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 319, eva = 293, agi = 63, int = 79, mnd = 79, chr = 105, dex = 86, def = 307,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 298, agi = 64, int = 79, mnd = 79, chr = 105, dex = 88, def = 312,
                         attack_skill = 261 },
                [77] = { acc = 330, eva = 303, agi = 65, int = 80, mnd = 80, chr = 107, dex = 89, def = 317,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 308, agi = 65, int = 82, mnd = 82, chr = 107, dex = 89, def = 322,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4050, [76] = 4124, [77] = 4198, [78] = 4273 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[24],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern drg',
            ids    = { 90, 135, 187, 188, 289, 342, 363 },
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 337, eva = 306, agi = 75, int = 72, mnd = 79, chr = 91, dex = 79, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 343, eva = 312, agi = 77, int = 72, mnd = 79, chr = 93, dex = 80, def = 316,
                         attack_skill = 261 },
                [77] = { acc = 348, eva = 317, agi = 77, int = 74, mnd = 80, chr = 94, dex = 81, def = 321,
                         attack_skill = 266 },
                [78] = { acc = 353, eva = 322, agi = 77, int = 74, mnd = 82, chr = 94, dex = 81, def = 326,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4149, [76] = 4225, [77] = 4301, [78] = 4376 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[162],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern smn',
            ids    = { 91, 145, 204, 328, 378 },
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 313, eva = 275, agi = 75, int = 97, mnd = 97, chr = 97, dex = 74, def = 301,
                         attack_skill = 256 },
                [76] = { acc = 318, eva = 281, agi = 77, int = 97, mnd = 97, chr = 97, dex = 74, def = 306,
                         attack_skill = 261 },
                [77] = { acc = 323, eva = 285, agi = 77, int = 100, mnd = 100, chr = 100, dex = 75, def = 311,
                         attack_skill = 266 },
                [78] = { acc = 329, eva = 290, agi = 77, int = 100, mnd = 100, chr = 100, dex = 77, def = 316,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3590, [76] = 3657, [77] = 3726, [78] = 3793 }, mp = { [75] = 5060, [76] = 5060, [77] = 5060, [78] = 5060 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[285],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omhpemde',
            ids    = { 92, 93, 94, 95, 96, 112, 113, 114, 123, 124, 125, 126, 127, 128, 129, 130, 148, 149, 150,
                       151, 154, 155, 156, 157, 205, 206, 207, 208, 215, 216, 217, 218, 219, 220, 226, 227, 228,
                       229 },
            job    = 'drg/drg',
            levels = {
                [73] = { acc = 325, eva = 294, agi = 70, int = 58, mnd = 64, chr = 72, dex = 74, def = 298,
                         attack_skill = 246 },
                [74] = { acc = 330, eva = 299, agi = 70, int = 58, mnd = 64, chr = 73, dex = 75, def = 303,
                         attack_skill = 251 },
                [75] = { acc = 335, eva = 304, agi = 70, int = 58, mnd = 65, chr = 74, dex = 75, def = 308,
                         attack_skill = 256 },
                [76] = { acc = 341, eva = 310, agi = 72, int = 59, mnd = 66, chr = 76, dex = 77, def = 314,
                         attack_skill = 261 },
                [77] = { acc = 346, eva = 315, agi = 72, int = 60, mnd = 66, chr = 76, dex = 77, def = 319,
                         attack_skill = 266 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1871 },  -- high-quality hpemde organ
                { rate = 100, item = 1787 },  -- hpemde organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Hpemde / Luminian', notes = { 'Source species: Hpemde (ID 322); family ID 133.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611, [76] = 4695, [77] = 4779 }, mp = { [73] = 0, [74] = 0, [75] = 0, [76] = 0, [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[190],
                blue = { value = 'Temporal Shift', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 616, name = 'Temporal Shift', level = 73, min_skill = 235, skill_ids = { 1366 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omxzomit',
            ids    = { 100, 120, 137, 140, 191, 194, 196, 198, 210, 231, 242, 244, 247, 249, 252, 258, 276, 298,
                       300, 303, 305, 307, 313, 316, 323, 391, 396, 401, 403, 405, 408, 410, 412, 416, 422 },
            job    = 'pld/war',
            levels = {
                [72] = { acc = 297, eva = 272, agi = 51, int = 57, mnd = 65, chr = 71, dex = 72, def = 341,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 278, agi = 52, int = 58, mnd = 66, chr = 72, dex = 72, def = 347,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 283, agi = 52, int = 59, mnd = 67, chr = 73, dex = 73, def = 352,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 288, agi = 52, int = 59, mnd = 68, chr = 73, dex = 74, def = 358,
                         attack_skill = 256 },
                [76] = { acc = 319, eva = 293, agi = 54, int = 61, mnd = 69, chr = 75, dex = 76, def = 362,
                         attack_skill = 261 },
            },
            spawn_levels = { [100] = { 73, 76 }, [120] = { 73, 76 }, [137] = { 73, 76 }, [140] = { 73, 76 },
                             [191] = { 73, 76 }, [194] = { 73, 76 }, [196] = { 73, 76 }, [198] = { 73, 76 },
                             [210] = { 73, 76 }, [231] = { 73, 76 }, [242] = { 73, 76 }, [244] = { 72, 75 },
                             [247] = { 73, 76 }, [249] = { 72, 74 }, [252] = { 73, 76 }, [258] = { 74, 76 },
                             [276] = { 73, 76 }, [298] = { 72, 75 }, [300] = { 73, 76 }, [303] = { 72, 75 },
                             [305] = { 72, 75 }, [307] = { 73, 76 }, [313] = { 73, 74 }, [316] = { 73, 76 },
                             [323] = { 73, 76 }, [391] = { 73, 76 }, [396] = { 72, 75 }, [401] = { 72, 75 },
                             [403] = { 73, 76 }, [405] = { 73, 76 }, [408] = { 72, 75 }, [410] = { 72, 75 },
                             [412] = { 72, 75 }, [416] = { 72, 75 }, [422] = { 72, 75 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1785 },  -- xzomit organ
                { rate = 100, item = 1855 },  -- high-quality xzomit organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 4,
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4288, [73] = 4371, [74] = 4454, [75] = 4537, [76] = 4620 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181, [76] = 2213 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omxzomit',
            ids    = { 101, 102, 121, 122, 138, 139, 141, 142, 192, 195, 197, 199, 211, 232, 243, 245, 248, 250,
                       253, 259, 260, 277, 299, 301, 304, 306, 308, 314, 315, 317, 324, 392, 397, 402, 404, 406,
                       409, 411, 413, 417, 421 },
            job    = 'mnk/war',
            levels = {
                [72] = { acc = 302, eva = 281, agi = 54, int = 57, mnd = 60, chr = 63, dex = 83, def = 303,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 287, agi = 56, int = 58, mnd = 62, chr = 64, dex = 84, def = 309,
                         attack_skill = 246 },
                [74] = { acc = 313, eva = 292, agi = 56, int = 59, mnd = 62, chr = 64, dex = 85, def = 314,
                         attack_skill = 251 },
                [75] = { acc = 319, eva = 297, agi = 56, int = 59, mnd = 63, chr = 65, dex = 86, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 302, agi = 57, int = 61, mnd = 64, chr = 66, dex = 88, def = 324,
                         attack_skill = 261 },
            },
            spawn_levels = { [101] = { 73, 76 }, [102] = { 73, 76 }, [121] = { 73, 75 }, [122] = { 73, 76 },
                             [138] = { 73, 76 }, [139] = { 73, 76 }, [141] = { 73, 76 }, [142] = { 73, 76 },
                             [192] = { 73, 76 }, [195] = { 73, 76 }, [197] = { 73, 76 }, [199] = { 73, 76 },
                             [211] = { 73, 76 }, [232] = { 73, 76 }, [243] = { 73, 76 }, [245] = { 73, 76 },
                             [248] = { 73, 76 }, [250] = { 73, 76 }, [253] = { 73, 76 }, [259] = { 73, 76 },
                             [260] = { 73, 76 }, [277] = { 73, 76 }, [299] = { 73, 76 }, [301] = { 73, 76 },
                             [304] = { 72, 75 }, [306] = { 73, 73 }, [308] = { 73, 76 }, [314] = { 73, 76 },
                             [315] = { 73, 76 }, [317] = { 73, 76 }, [324] = { 74, 75 }, [392] = { 73, 76 },
                             [397] = { 73, 76 }, [402] = { 73, 76 }, [404] = { 73, 76 }, [406] = { 73, 76 },
                             [409] = { 73, 76 }, [411] = { 73, 76 }, [413] = { 72, 75 }, [417] = { 73, 76 },
                             [421] = { 73, 76 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1785 },  -- xzomit organ
                { rate = 100, item = 1855 },  -- high-quality xzomit organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 4,
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4612, [73] = 4697, [74] = 4782, [75] = 4867, [76] = 4952 }, mp = { [72] = 0, [73] = 0, [74] = 0, [75] = 0, [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[174],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omaern war',
            ids    = { 103, 178, 179, 310, 338 },
            levels = {
                [75] = { acc = 319, eva = 303, agi = 82, int = 72, mnd = 72, chr = 79, dex = 86, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 308, agi = 85, int = 72, mnd = 72, chr = 79, dex = 88, def = 322,
                         attack_skill = 261 },
                [77] = { acc = 330, eva = 313, agi = 85, int = 74, mnd = 74, chr = 80, dex = 89, def = 327,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 318, agi = 85, int = 74, mnd = 74, chr = 82, dex = 89, def = 332,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4149, [76] = 4225, [77] = 4301, [78] = 4376 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[24],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern pld',
            ids    = { 105, 201, 287, 311, 381 },
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 313, eva = 290, agi = 57, int = 66, mnd = 91, chr = 91, dex = 74, def = 366,
                         attack_skill = 256 },
                [76] = { acc = 318, eva = 295, agi = 59, int = 67, mnd = 93, chr = 93, dex = 74, def = 370,
                         attack_skill = 261 },
                [77] = { acc = 323, eva = 300, agi = 59, int = 68, mnd = 94, chr = 94, dex = 75, def = 376,
                         attack_skill = 266 },
                [78] = { acc = 329, eva = 305, agi = 59, int = 68, mnd = 94, chr = 94, dex = 77, def = 381,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4050, [76] = 4124, [77] = 4198, [78] = 4273 }, mp = { [75] = 5000, [76] = 5000, [77] = 5000, [78] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[218],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern drk',
            ids    = { 106, 107, 202, 295, 331, 339 },
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 319, eva = 299, agi = 75, int = 91, mnd = 66, chr = 66, dex = 86, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 93, mnd = 67, chr = 67, dex = 88, def = 316,
                         attack_skill = 261 },
                [77] = { acc = 330, eva = 309, agi = 77, int = 94, mnd = 68, chr = 68, dex = 89, def = 321,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 314, agi = 77, int = 94, mnd = 68, chr = 68, dex = 89, def = 326,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4050, [76] = 4124, [77] = 4198, [78] = 4273 }, mp = { [75] = 5000, [76] = 5000, [77] = 5000, [78] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[265],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern brd',
            ids    = { 108, 109, 203, 332, 371 },
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 315, eva = 284, agi = 63, int = 84, mnd = 84, chr = 97, dex = 79, def = 307,
                         attack_skill = 256 },
                [76] = { acc = 321, eva = 290, agi = 64, int = 85, mnd = 85, chr = 97, dex = 80, def = 312,
                         attack_skill = 261 },
                [77] = { acc = 326, eva = 294, agi = 65, int = 86, mnd = 86, chr = 100, dex = 81, def = 317,
                         attack_skill = 266 },
                [78] = { acc = 331, eva = 299, agi = 65, int = 86, mnd = 86, chr = 100, dex = 81, def = 322,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3893, [76] = 3965, [77] = 4037, [78] = 4108 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[155],
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omaern sam',
            ids    = { 110, 111, 185, 271, 325, 369 },
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 319, eva = 306, agi = 75, int = 79, mnd = 79, chr = 84, dex = 86, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 312, agi = 77, int = 79, mnd = 79, chr = 85, dex = 88, def = 316,
                         attack_skill = 261 },
                [77] = { acc = 330, eva = 317, agi = 77, int = 80, mnd = 80, chr = 86, dex = 89, def = 321,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 322, agi = 77, int = 82, mnd = 82, chr = 86, dex = 89, def = 326,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4149, [76] = 4225, [77] = 4301, [78] = 4376 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[162],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern mnk',
            ids    = { 115, 180, 181, 221, 264, 376 },
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 322, eva = 300, agi = 63, int = 66, mnd = 84, chr = 79, dex = 92, def = 318,
                         attack_skill = 256 },
                [76] = { acc = 327, eva = 306, agi = 64, int = 67, mnd = 85, chr = 79, dex = 92, def = 322,
                         attack_skill = 261 },
                [77] = { acc = 333, eva = 311, agi = 65, int = 68, mnd = 86, chr = 80, dex = 95, def = 328,
                         attack_skill = 266 },
                [78] = { acc = 338, eva = 316, agi = 65, int = 68, mnd = 86, chr = 82, dex = 95, def = 333,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4413, [76] = 4491, [77] = 4567, [78] = 4644 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[214],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern blm',
            ids    = { 116, 133, 222, 234, 265, 322, 361 },
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 319, eva = 279, agi = 82, int = 105, mnd = 79, chr = 84, dex = 86, def = 301,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 285, agi = 85, int = 105, mnd = 79, chr = 85, dex = 88, def = 306,
                         attack_skill = 261 },
                [77] = { acc = 330, eva = 289, agi = 85, int = 107, mnd = 80, chr = 86, dex = 89, def = 311,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 294, agi = 85, int = 107, mnd = 82, chr = 86, dex = 89, def = 316,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3690, [76] = 3760, [77] = 3829, [78] = 3897 }, mp = { [75] = 5000, [76] = 5000, [77] = 5000, [78] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Flare: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Tornado: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Quake: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burst: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flood: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga II: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga II: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[53], danger[56], danger[57], danger[58], danger[59], danger[60], danger[61], danger[65], danger[70], danger[75], danger[80], danger[85], danger[90], danger[95], danger[96], danger[97], danger[102], danger[105], danger[111], danger[113], danger[116] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omaern rdm',
            ids    = { 117, 143, 223, 235, 266, 312, 362 },
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 315, eva = 288, agi = 70, int = 91, mnd = 91, chr = 84, dex = 79, def = 305,
                         attack_skill = 256 },
                [76] = { acc = 321, eva = 293, agi = 71, int = 93, mnd = 93, chr = 85, dex = 80, def = 309,
                         attack_skill = 261 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 94, mnd = 94, chr = 86, dex = 81, def = 314,
                         attack_skill = 266 },
                [78] = { acc = 331, eva = 303, agi = 73, int = 94, mnd = 94, chr = 86, dex = 81, def = 320,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3893, [76] = 3965, [77] = 4037, [78] = 4108 }, mp = { [75] = 5000, [76] = 5000, [77] = 5000, [78] = 5000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[138],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omaern thf',
            ids    = { 118, 182, 224, 272, 348, 358, 370 },
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 326, eva = 370, agi = 88, int = 91, mnd = 66, chr = 66, dex = 100, def = 307,
                         attack_skill = 256 },
                [76] = { acc = 331, eva = 375, agi = 89, int = 93, mnd = 67, chr = 67, dex = 100, def = 312,
                         attack_skill = 261 },
                [77] = { acc = 337, eva = 381, agi = 91, int = 94, mnd = 68, chr = 68, dex = 102, def = 317,
                         attack_skill = 266 },
                [78] = { acc = 342, eva = 386, agi = 91, int = 94, mnd = 68, chr = 68, dex = 102, def = 322,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3893, [76] = 3965, [77] = 4037, [78] = 4108 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[221],
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omaern nin',
            ids    = { 119, 134, 186, 288, 333, 372 },
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 322, eva = 322, agi = 88, int = 84, mnd = 66, chr = 72, dex = 92, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 327, eva = 327, agi = 89, int = 85, mnd = 67, chr = 72, dex = 92, def = 316,
                         attack_skill = 261 },
                [77] = { acc = 333, eva = 333, agi = 91, int = 86, mnd = 68, chr = 74, dex = 95, def = 321,
                         attack_skill = 266 },
                [78] = { acc = 338, eva = 338, agi = 91, int = 86, mnd = 68, chr = 74, dex = 95, def = 326,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3893, [76] = 3965, [77] = 4037, [78] = 4108 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hyoton Ni: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Huton Ni: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Doton Ni: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Raiton Ni: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Suiton Ni: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Jubaku Ni: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hojo Ni: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dokumori Ni: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[212], danger[268], danger[269], danger[270], danger[271], danger[272], danger[273], danger[276], danger[279], danger[282] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omphuabo',
            ids    = { 131, 132, 152, 153, 158, 159, 160, 193, 212, 213, 214, 233, 246, 251, 256, 257, 263, 269,
                       270, 275, 280, 286, 293, 302, 309, 318, 319, 320, 321, 330, 336, 337, 346, 347, 350, 351,
                       355, 356, 357, 360, 367, 368, 373, 374, 375, 380, 383, 390, 395, 400, 407, 414, 415, 420,
                       425, 426 },
            job    = 'pld/pld',
            levels = {
                [79] = { acc = 333, eva = 315, agi = 69, int = 69, mnd = 87, chr = 87, dex = 74, def = 385,
                         attack_skill = 276 },
                [80] = { acc = 338, eva = 320, agi = 69, int = 69, mnd = 87, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
                [81] = { acc = 345, eva = 326, agi = 72, int = 72, mnd = 90, chr = 90, dex = 76, def = 395,
                         attack_skill = 287 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 1784 },  -- phuabo organ
                { rate = 100, item = 1784 },  -- phuabo organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, item = 1852 },  -- high-quality phuabo organ
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Phuabo / Luminian', notes = { 'Source species: Phuabo (ID 323); family ID 134.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [79] = 4830, [80] = 4913, [81] = 4995 }, mp = { [79] = 1159, [80] = 1176, [81] = 1192 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 80', notes = { 'Source base speed is 80; the ordinary monster default is 40. Animation speed is 80.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[208],
                blue = { value = 'Plasma Charge', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 615, name = 'Plasma Charge', level = 75, min_skill = 245, skill_ids = { 1358 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Omaern rng',
            ids    = { 183, 184, 281, 327, 359, 382 },
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 363, eva = 286, agi = 96, int = 79, mnd = 84, chr = 79, dex = 79, def = 307,
                         attack_skill = 256 },
                [76] = { acc = 369, eva = 291, agi = 97, int = 79, mnd = 85, chr = 79, dex = 80, def = 312,
                         attack_skill = 261 },
                [77] = { acc = 374, eva = 296, agi = 98, int = 80, mnd = 86, chr = 80, dex = 81, def = 317,
                         attack_skill = 266 },
                [78] = { acc = 379, eva = 301, agi = 98, int = 82, mnd = 86, chr = 82, dex = 81, def = 322,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3792, [76] = 3862, [77] = 3933, [78] = 4004 }, mp = { [75] = 0, [76] = 0, [77] = 0, [78] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[24],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omyovra',
            ids    = { 236, 237, 238, 239, 428, 430, 432, 434, 436, 438, 440, 442, 444 },
            nm     = true,
            job    = 'blm/drk',
            levels = {
                [84] = { acc = 371, eva = 342, agi = 75, int = 86, mnd = 58, chr = 63, dex = 92, def = 349,
                         attack_skill = 305 },
                [85] = { acc = 377, eva = 348, agi = 76, int = 88, mnd = 60, chr = 64, dex = 92, def = 354,
                         attack_skill = 311 },
            },
            ranks  = { earth = -2, thunder = 6, light = 2, dark = -1, slow = -2, light_sleep = 2, dark_sleep = -1,
                       blind = -1, stun = 6 },
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 1788 },  -- yovra organ
                { rate = 50, item = 1788 },  -- yovra organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_defense = true },
            info = {
                family = { value = 'Yovra / Luminian', notes = { 'Source species: Yovra (ID 327); family ID 137.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [84] = 18000, [85] = 18000 }, mp = { [84] = 1240, [85] = 1257 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier +35%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 50', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[324],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ulyovra',
            ids    = { 240, 241 },
            nm     = true,
            job    = 'blm/drk',
            levels = {
                [79] = { acc = 339, eva = 316, agi = 71, int = 82, mnd = 55, chr = 59, dex = 87, def = 323,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 321, agi = 71, int = 82, mnd = 55, chr = 59, dex = 87, def = 328,
                         attack_skill = 281 },
            },
            ranks  = { earth = -2, thunder = 6, light = 2, dark = -1, slow = -2, light_sleep = 2, dark_sleep = -1,
                       blind = -1, stun = 6 },
            immune = { 'paralyze' },
            drops  = {
                { rate = 240, item = 1788 },  -- yovra organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 100, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yovra / Luminian', notes = { 'Source species: Yovra (ID 327); family ID 137.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [79] = 15000, [80] = 15000 }, mp = { [79] = 1159, [80] = 1176 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier +35%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 50', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[324],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Omhpemde',
            ids    = { 254, 255, 261, 262, 267, 268, 273, 274, 278, 279, 284, 285, 291, 292, 296, 297, 334, 335,
                       344, 345, 349, 352, 353, 354, 365, 366, 384, 385, 386, 387, 388, 389, 393, 394, 398, 399,
                       418, 419, 423, 424 },
            job    = 'drg/drg',
            levels = {
                [73] = { acc = 325, eva = 294, agi = 70, int = 58, mnd = 64, chr = 72, dex = 74, def = 298,
                         attack_skill = 246 },
                [74] = { acc = 330, eva = 299, agi = 70, int = 58, mnd = 64, chr = 73, dex = 75, def = 303,
                         attack_skill = 251 },
                [75] = { acc = 335, eva = 304, agi = 70, int = 58, mnd = 65, chr = 74, dex = 75, def = 308,
                         attack_skill = 256 },
                [76] = { acc = 341, eva = 310, agi = 72, int = 59, mnd = 66, chr = 76, dex = 77, def = 314,
                         attack_skill = 261 },
                [77] = { acc = 346, eva = 315, agi = 72, int = 60, mnd = 66, chr = 76, dex = 77, def = 319,
                         attack_skill = 266 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1871 },  -- high-quality hpemde organ
                { rate = 100, item = 1787 },  -- hpemde organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Hpemde / Luminian', notes = { 'Source species: Hpemde (ID 322); family ID 133.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527, [75] = 4611, [76] = 4695, [77] = 4779 }, mp = { [73] = 0, [74] = 0, [75] = 0, [76] = 0, [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[190],
                blue = { value = 'Temporal Shift', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 616, name = 'Temporal Shift', level = 73, min_skill = 235, skill_ids = { 1366 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Aweuvhi',
            ids    = { 427, 429, 431, 433, 435, 437, 439, 441, 443 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 82, dex = 85, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 61, chr = 83, dex = 87, def = 336,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 61, chr = 83, dex = 87, def = 341,
                         attack_skill = 281 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            drops  = {
                { rate = 50, item = 1818 },  -- euvhi organ
                { rate = 50, item = 1899 },  -- high-quality euvhi organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            no_aggro = true,
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 3890, [79] = 3957, [80] = 4024 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 10 minutes', notes = { 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Vertical Cleave: can crit; Efflorescent Foetor: Blindness, Silence; Stupor Spores: Sleep; Viscid Nectar: Slow; Morning Glory: can crit; Axial Bloom: Bind; Nutrient Absorption: HP drain', notes = { 'Vertical Cleave: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Efflorescent Foetor: Blindness, Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Stupor Spores: Sleep. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Viscid Nectar: Slow. Source targeting: cone.', 'Morning Glory: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Axial Bloom: Bind. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Nutrient Absorption: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1447, name = 'Vertical Cleave', summary = 'Vertical Cleave: can crit', notes = danger[196], categories = { 'crit' }, effects = {  }, details = danger[211] }, { kind = 'skill', id = 1448, name = 'Efflorescent Foetor', summary = 'Efflorescent Foetor: Blindness, Silence', notes = danger[8], categories = { 'debuff' }, effects = { 'Blindness', 'Silence' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, { kind = 'skill', id = 1449, name = 'Stupor Spores', summary = 'Stupor Spores: Sleep', notes = danger[12], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } } } }, { kind = 'skill', id = 1450, name = 'Viscid Nectar', summary = 'Viscid Nectar: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[5] } }, { kind = 'skill', id = 1451, name = 'Morning Glory', summary = 'Morning Glory: can crit', notes = danger[182], categories = { 'crit' }, effects = {  }, details = danger[184] }, { kind = 'skill', id = 1452, name = 'Axial Bloom', summary = 'Axial Bloom: Bind', notes = danger[12], categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[109] } }, { kind = 'skill', id = 1453, name = 'Nutrient Absorption', summary = 'Nutrient Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[23] },
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ruaern war',
            ids    = { 445 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 276, agi = 77, int = 67, mnd = 67, chr = 73, dex = 81, def = 291,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 282, agi = 80, int = 68, mnd = 68, chr = 76, dex = 83, def = 296,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3771, [71] = 3847 }, mp = { [70] = 0, [71] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow, can crit during Mighty Strikes; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Biotic Boomerang: Plague, can crit', notes = { 'Wing Thrust: Slow, can crit during Mighty Strikes. Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Biotic Boomerang: Plague, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { danger[326], danger[11], danger[17], danger[21] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[23] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern whm',
            ids    = { 446 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [70] = { acc = 282, eva = 248, agi = 65, int = 73, mnd = 97, chr = 85, dex = 63, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 287, eva = 254, agi = 68, int = 76, mnd = 100, chr = 88, dex = 63, def = 286,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3440, [71] = 3510 }, mp = { [70] = 2021, [71] = 2053 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[30], level_ranges = { { 60, 255 } } }, danger[327], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[38], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[42], level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[46], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern sam',
            ids    = { 447 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [70] = { acc = 291, eva = 280, agi = 71, int = 73, mnd = 73, chr = 79, dex = 81, def = 284,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 285, agi = 72, int = 76, mnd = 76, chr = 80, dex = 83, def = 290,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3771, [71] = 3847 }, mp = { [70] = 0, [71] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Medusa Javelin: Petrification, can crit', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Medusa Javelin: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = danger[161], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[23] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern drk',
            ids    = { 448 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [70] = { acc = 291, eva = 273, agi = 71, int = 85, mnd = 61, chr = 61, dex = 81, def = 284,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 278, agi = 72, int = 88, mnd = 64, chr = 64, dex = 83, def = 290,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3679, [71] = 3753 }, mp = { [70] = 2021, [71] = 2053 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: HP drain; Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, danger[7], danger[11], danger[17], danger[120], danger[286], danger[287], danger[288], danger[289], danger[290], danger[291], danger[292], danger[293], danger[294], danger[295], danger[296], danger[297], danger[298], danger[299] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern rdm',
            ids    = { 449 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [70] = { acc = 288, eva = 262, agi = 65, int = 85, mnd = 85, chr = 79, dex = 75, def = 278,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 268, agi = 68, int = 88, mnd = 88, chr = 80, dex = 75, def = 284,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3534, [71] = 3606 }, mp = { [70] = 2021, [71] = 2053 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[120], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[30], level_ranges = { { 55, 255 } } }, danger[327], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[38], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[42], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[127], level_ranges = { { 21, 255 } } }, danger[286], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[104], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[110], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[55], level_ranges = { { 32, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern rng',
            ids    = { 450 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [70] = { acc = 336, eva = 260, agi = 89, int = 73, mnd = 79, chr = 73, dex = 75, def = 281,
                         attack_skill = 233 },
                [71] = { acc = 341, eva = 266, agi = 92, int = 76, mnd = 80, chr = 76, dex = 75, def = 286,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3440, [71] = 3510 }, mp = { [70] = 0, [71] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[329],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern pld',
            ids    = { 451 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [70] = { acc = 285, eva = 264, agi = 53, int = 61, mnd = 85, chr = 85, dex = 69, def = 338,
                         attack_skill = 233 },
                [71] = { acc = 291, eva = 270, agi = 56, int = 64, mnd = 88, chr = 88, dex = 71, def = 344,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3679, [71] = 3753 }, mp = { [70] = 2021, [71] = 2053 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[120], { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[46], level_ranges = { { 37, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern blm',
            ids    = { 452 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [70] = { acc = 291, eva = 254, agi = 77, int = 97, mnd = 73, chr = 79, dex = 81, def = 275,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 260, agi = 80, int = 100, mnd = 76, chr = 80, dex = 83, def = 280,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 3345, [71] = 3414 }, mp = { [70] = 2021, [71] = 2053 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[7], danger[11], danger[17], danger[53], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[55], level_ranges = { { 60, 255 } } }, { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[55], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[55], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[55], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[55], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[55], level_ranges = { { 58, 255 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[64], level_ranges = { { 24, 71 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[69], level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[74], level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[79], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[84], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[89], level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[94], level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[55], level_ranges = { { 12, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[55], level_ranges = { { 25, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[101], level_ranges = { { 45, 255 } } }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[104], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[110], level_ranges = { { 7, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[55], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[115], level_ranges = { { 56, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Ruaern mnk',
            ids    = { 453 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [70] = { acc = 294, eva = 274, agi = 59, int = 61, mnd = 79, chr = 73, dex = 87, def = 290,
                         attack_skill = 233 },
                [71] = { acc = 299, eva = 279, agi = 60, int = 64, mnd = 80, chr = 76, dex = 87, def = 296,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 4029, [71] = 4105 }, mp = { [70] = 0, [71] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[329],
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Jailer of Hope',
            ids    = { 454 },
            nm     = true,
            job    = 'war/blm',
            levels = {
                [85] = { acc = 377, eva = 391, agi = 102, int = 93, mnd = 74, chr = 81, dex = 92, def = 547,
                         attack_skill = 311 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'blind',
                       'poison', 'petrify' },
            drops  = {
                { rate = 1000, item = 1847 },  -- fifth virtue
                { rate = 1000, item = 17595 },  -- hope staff
                { rate = 100, item = 15509 },  -- hope torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Phuabo / Luminian', notes = { 'Source species: Phuabo (ID 323); family ID 134.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 29200 }, mp = { [85] = 1257 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 80', notes = { 'Source base speed is 80; the ordinary monster default is 40. Animation speed is 80.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'Movement is disabled in the stored spawn setup.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 150', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: Stun; Aerial Collision: Defense down, can crit during Mighty Strikes; Spine Lash: Plague, can crit; Voiceless Storm: Silence; Tidal Dive: Bind, Weight, can crit during Mighty Strikes; Burst II: Earth magic evasion down', notes = { 'Normal attacks: Stun. These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Aerial Collision: Defense down, can crit during Mighty Strikes. Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: cone.', 'Spine Lash: Plague, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Voiceless Storm: Silence. Source targeting: area around the monster.', 'Tidal Dive: Bind, Weight, can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: area around the monster.', 'Burst II: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Stun', notes = { 'These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, removals = danger[100] } }, { kind = 'skill', id = 1353, name = 'Aerial Collision', summary = 'Aerial Collision: Defense down, can crit during Mighty Strikes', notes = { 'Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: cone.' }, categories = { 'crit', 'debuff' }, effects = { 'Defense down' }, details = danger[194] }, danger[199], danger[202], { kind = 'skill', id = 1357, name = 'Tidal Dive', summary = 'Tidal Dive: Bind, Weight, can crit during Mighty Strikes', notes = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: area around the monster.' }, categories = { 'crit', 'debuff' }, effects = { 'Bind', 'Weight' }, details = danger[205] }, { kind = 'spell', id = 213, name = 'Burst II', summary = 'Burst II: Earth magic evasion down', notes = danger[26], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[55], level_ranges = { { 1, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[49] },
                blue = { value = 'Plasma Charge', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 615, name = 'Plasma Charge', level = 75, min_skill = 245, skill_ids = { 1358 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Jailer of Justice',
            ids    = { 455 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [85] = { acc = 377, eva = 338, agi = 57, int = 79, mnd = 70, chr = 102, dex = 92, def = 356,
                         attack_skill = 311 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun', 'blind', 'petrify', 'terror',
                       'plague' },
            drops  = {
                { rate = 1000, item = 1848 },  -- fourth virtue
                { rate = 1000, item = 17710 },  -- justice sword
                { rate = 100, item = 15508 },  -- justice torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 37000 }, mp = { [85] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Charm; Dual Strike: Stun; Mantle Pierce: Weight, can crit; Ink Cloud: Blindness', notes = { 'Charm. Can charm a player; the target and effect check still have to pass. Source targeting: single target. Possible effects: Charm.', 'Dual Strike: Stun. Source targeting: single target.', 'Mantle Pierce: Weight, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 710, name = 'Charm', summary = 'Charm', notes = { 'Can charm a player; the target and effect check still have to pass. Source targeting: single target. Possible effects: Charm.' }, categories = { 'debuff' }, effects = { 'Charm' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore' } } }, forced = true }, danger[166], danger[169], danger[172] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[23] },
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Qnxzomit',
            ids    = { 456, 457, 458, 459, 460, 461 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [80] = { acc = 347, eva = 342, agi = 79, int = 80, mnd = 51, chr = 61, dex = 93, def = 333,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'stun', 'blind', 'petrify' },
            links  = 6,
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[333],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
            info_by_index = {
                [457] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } } },
                [458] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } } },
                [459] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } } },
                [460] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } } },
                [461] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } } },
            },
        },
        {
            name   = 'Jailer of Prudence',
            ids    = { 462, 463 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [85] = { acc = 384, eva = 422, agi = 93, int = 87, mnd = 59, chr = 55, dex = 107, def = 476,
                         attack_skill = 311 },
            },
            loot_conditions = { 'Only the surviving Jailer drops these items after the other one is defeated.' },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'stun', 'paralyze', 'slow', 'blind', 'poison' },
            drops  = {
                { rate = 1000, item = 1849 },  -- sixth virtue
                { rate = 1000, item = 18397 },  -- prudence rod
                { rate = 100, item = 15510 },  -- prudence torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
            flags  = { scripted_drops = true },
            info = {
                family = { value = 'Hpemde / Luminian', notes = { 'Source species: Hpemde (ID 322); family ID 133.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 20000 }, mp = { [85] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 20; Store TP 100', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[190],
                blue = { value = 'Temporal Shift', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 616, name = 'Temporal Shift', level = 73, min_skill = 235, skill_ids = { 1366 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Jailer of Love',
            ids    = { 464 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [90] = { acc = 402, eva = 365, agi = 75, int = 90, mnd = 90, chr = 90, dex = 82, def = 663,
                         attack_skill = 341 },
            },
            ranks  = { earth = -2, thunder = 6, light = 2, dark = -1, slow = -2, light_sleep = 2, dark_sleep = -1,
                       blind = -1, stun = 6 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow',
                       'elegy', 'blind', 'poison', 'requiem', 'terror' },
            drops  = {
                { rate = 1000, item = 18100 },  -- love halberd
                { rate = 150, item = 1911 },  -- aura of adulation
                { rate = 150, item = 1912 },  -- aura of voracity
                { rate = 150, item = 15514 },  -- love torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 7,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Yovra / Luminian', notes = { 'Source species: Yovra (ID 327); family ID 137.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [90] = 57000 }, mp = { [90] = 100060 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regen 260', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes; Conditional draw-in', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Vitriolic Barrage: Poison; Primal Drill: Bind; Concussive Oscillation: Weight; Ion Shower: Stun; Asthenic Fog: Drown; Luminous Drape: Charm', notes = { 'Vitriolic Barrage: Poison. Source targeting: area around the monster.', 'Primal Drill: Bind. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Concussive Oscillation: Weight. Source targeting: area around the monster.', 'Ion Shower: Stun. Source targeting: area around the monster.', 'Asthenic Fog: Drown. Source targeting: area around the monster.', 'Luminous Drape: Charm. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell-list replacement is not resolved.' }, entries = { danger[307], danger[310], danger[313], danger[316], danger[319], danger[322] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[23] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ruphuabo',
            ids    = { 465, 466, 467, 468, 469, 470, 471, 472, 473 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 338, eva = 320, agi = 69, int = 69, mnd = 87, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 8,
            info = {
                family = { value = 'Phuabo / Luminian', notes = { 'Source species: Phuabo (ID 323); family ID 134.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 1176 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 80', notes = { 'Source base speed is 80; the ordinary monster default is 40. Animation speed is 80.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[208],
                blue = { value = 'Plasma Charge', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 615, name = 'Plasma Charge', level = 75, min_skill = 245, skill_ids = { 1358 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qnxzomit',
            ids    = { 474, 475, 476, 477, 478, 479, 480, 481, 482 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [80] = { acc = 347, eva = 342, agi = 79, int = 80, mnd = 51, chr = 61, dex = 93, def = 333,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            links  = 8,
            info = {
                family = { value = 'Xzomit / Luminian', notes = { 'Source species: Xzomit (ID 325); family ID 136.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[333],
                blue = { value = 'Saline Coat', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 614, name = 'Saline Coat', level = 72, min_skill = 230, skill_ids = { 1352 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Qnhpemde',
            ids    = { 483, 484, 485, 486, 487, 488, 489, 490, 491 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [80] = { acc = 363, eva = 331, agi = 75, int = 61, mnd = 69, chr = 78, dex = 80, def = 335,
                         attack_skill = 281 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            links  = 8,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Hpemde / Luminian', notes = { 'Source species: Hpemde (ID 322); family ID 133.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 2500 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled; EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[190],
                blue = { value = 'Temporal Shift', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 616, name = 'Temporal Shift', level = 73, min_skill = 235, skill_ids = { 1366 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Absolute Virtue',
            ids    = { 492 },
            nm     = true,
            job    = 'drg/blm',
            levels = {
                [92] = { acc = 446, eva = 399, agi = 94, int = 99, mnd = 95, chr = 107, dex = 98, def = 397,
                         attack_skill = 355 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 1000, item = 1916 },  -- sin of invidiousness
                { rate = 1000, item = 1917 },  -- sin of insolence
                { rate = 1000, item = 1918 },  -- sin of infatuation
                { rate = 150, item = 1919 },  -- sin of intemperance
                { rate = 150, item = 1914 },  -- sin of indolence
                { rate = 150, item = 1913 },  -- sin of indignation
                { rate = 50, item = 1915 },  -- sin of indulgence
            },
            links  = 9,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [92] = 59400 }, mp = { [92] = 2732 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 250', notes = { 'Base attack delay 180 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow, can crit during Mighty Strikes; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis, can crit during Mighty Strikes; Disseverment: Poison, can crit during Mighty Strikes; Medusa Javelin: Petrification, can crit; Slowga: Slow', notes = { 'Wing Thrust: Slow, can crit during Mighty Strikes. Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis, can crit during Mighty Strikes. Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Disseverment: Poison, can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Medusa Javelin: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Slowga: Slow.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Mighty Strikes is possible while its special remains unlocked.', 'A scripted move argument is not resolved.', 'The monster script changes targeting. Its final range and area are not established here.', 'Shadow handling also depends on the unresolved targeting.' }, entries = { danger[326], danger[11], danger[17], { kind = 'skill', id = 1383, name = 'Glacier Splitter', summary = 'Glacier Splitter: Paralysis, can crit during Mighty Strikes', notes = danger[325], categories = { 'crit', 'debuff' }, effects = { 'Paralysis' }, details = danger[119] }, { kind = 'skill', id = 1384, name = 'Disseverment', summary = 'Disseverment: Poison, can crit during Mighty Strikes', notes = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' }, categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[52] }, danger[160], { kind = 'spell', id = 357, name = 'Slowga', summary = 'Slowga: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'The monster script changes targeting. Its final range and area are not established here.', 'Shadow handling also depends on the unresolved targeting.' }, unknown = { 'The monster script changes targeting. Its final range and area are not established here.', 'Shadow handling also depends on the unresolved targeting.' }, shadows = {  }, removals = danger[5] }, level_ranges = { { 1, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'The monster script changes targeting. Its final range and area are not established here.', 'Shadow handling also depends on the unresolved targeting.' }, general_notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Mighty Strikes is possible while its special remains unlocked.' } },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
