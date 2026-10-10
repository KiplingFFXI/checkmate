-- The Garden of RuHmet (zone 35).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Optic Induration: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: cone.', 'Static Filament: Stun. Source targeting: cone.', 'Decayed Filament: Poison. Source targeting: area around the monster.', 'Reactor Overheat: Plague. Random effects may not all happen on the same use. Source targeting: cone.', 'Reactor Overload: Silence. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: cone.' };
danger[3] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[4] = { notes = danger[3], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = true } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[5] = { kind = 'skill', id = 1465, name = 'Optic Induration', summary = 'Optic Induration: Petrification, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[4], forced = true };
danger[6] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[7] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[8] = { notes = danger[6], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[7] };
danger[9] = { kind = 'skill', id = 1466, name = 'Static Filament', summary = 'Static Filament: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[8] };
danger[10] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 2 images for the damage step. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[11] = { notes = danger[10], unknown = {  }, activation_range = 8.0, shape = 'area around the monster', effect_radius = 8.0, shadows = { { mode = 'absorb', per_hit = false, count = 2 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[12] = { kind = 'skill', id = 1467, name = 'Decayed Filament', summary = 'Decayed Filament: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[11] };
danger[13] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[14] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[16] = { kind = 'skill', id = 1468, name = 'Reactor Overheat', summary = 'Reactor Overheat: Plague', notes = danger[13], categories = { 'debuff' }, effects = { 'Plague' }, details = danger[15] };
danger[17] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[18] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images for the damage step. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[19] = { notes = danger[18], unknown = {  }, activation_range = 8.0, shape = 'area around the monster', effect_radius = 8.0, shadows = { { mode = 'absorb', per_hit = false, count = 3 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[20] = { kind = 'skill', id = 1469, name = 'Reactor Overload', summary = 'Reactor Overload: Silence', notes = danger[17], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[19] };
danger[21] = { danger[5], danger[9], danger[12], danger[16], danger[20] };
danger[22] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[23] = { value = 'Optic Induration: Petrification, can crit; Static Filament: Stun; Decayed Filament: Poison; Reactor Overheat: Plague; Reactor Overload: Silence', notes = danger[1], entries = danger[21], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[22] };
danger[24] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[25] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[26] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[27] = { danger[26] };
danger[28] = { notes = danger[25], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = danger[27] };
danger[29] = { kind = 'skill', id = 1378, name = 'Wing Thrust', summary = 'Wing Thrust: Slow', notes = danger[24], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[28] };
danger[30] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[31] = { notes = danger[30], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[32] = { kind = 'skill', id = 1379, name = 'Auroral Wind', summary = 'Auroral Wind: Silence', notes = danger[13], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[31] };
danger[33] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[34] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[35] = { danger[34], { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[36] = { notes = danger[33], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[35] };
danger[37] = { kind = 'skill', id = 1380, name = 'Impact Stream', summary = 'Impact Stream: Defense down, Stun', notes = danger[17], categories = { 'debuff' }, effects = { 'Defense down', 'Stun' }, details = danger[36] };
danger[38] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 5 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[39] = { notes = danger[38], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 5 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[40] = { kind = 'skill', id = 1384, name = 'Disseverment', summary = 'Disseverment: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[39] };
danger[41] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[42] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[43] = { notes = danger[42], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[44] = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[45] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[46] = { notes = danger[45], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[7] };
danger[47] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[48] = { notes = danger[47], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[49] = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[50] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[51] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[52] = { danger[51] };
danger[53] = { notes = danger[50], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[52] };
danger[54] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[55] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[56] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[57] = { notes = danger[56], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[58] = { kind = 'skill', id = 1383, name = 'Glacier Splitter', summary = 'Glacier Splitter: Paralysis', notes = danger[24], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[57] };
danger[59] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[60] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[61] = { notes = danger[59], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[60] };
danger[62] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Medusa Javelin: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[63] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[64] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[65] = { notes = danger[64], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[66] = { kind = 'skill', id = 1386, name = 'Medusa Javelin', summary = 'Medusa Javelin: Petrification, can crit', notes = danger[63], categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[65] };
danger[67] = { danger[29], danger[32], danger[37], danger[66] };
danger[68] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Medusa Javelin: Petrification, can crit', notes = danger[62], entries = danger[67], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[22] };
danger[69] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[70] = { notes = danger[69], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[71] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[41], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[70], level_ranges = { { 46, 255 } } };
danger[72] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[73] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[74] = { danger[73] };
danger[75] = { notes = danger[72], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[74] };
danger[76] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[77] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[78] = { danger[77] };
danger[79] = { notes = danger[76], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[78] };
danger[80] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[81] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[82] = { danger[81] };
danger[83] = { notes = danger[80], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[82] };
danger[84] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[85] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[86] = { danger[85] };
danger[87] = { notes = danger[84], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[86] };
danger[88] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[89] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[90] = { danger[89] };
danger[91] = { notes = danger[88], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[90] };
danger[92] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[93] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[94] = { danger[93] };
danger[95] = { notes = danger[92], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[94] };
danger[96] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[97] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[98] = { danger[97] };
danger[99] = { notes = danger[96], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[98] };
danger[100] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Biotic Boomerang: Plague, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[101] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[102] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[103] = { notes = danger[102], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[104] = { kind = 'skill', id = 1385, name = 'Biotic Boomerang', summary = 'Biotic Boomerang: Plague, can crit', notes = danger[101], categories = { 'crit', 'debuff' }, effects = { 'Plague' }, details = danger[103] };
danger[105] = { danger[29], danger[32], danger[37], danger[104] };
danger[106] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Biotic Boomerang: Plague, can crit', notes = danger[100], entries = danger[105], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[22] };
danger[107] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[108] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[109] = { notes = danger[108], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[110] = { kind = 'skill', id = 1387, name = 'Sideswipe', summary = 'Sideswipe: can crit', notes = danger[107], categories = { 'crit' }, effects = {  }, details = danger[109] };
danger[111] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[112] = { notes = danger[111], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[113] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[114] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[115] = { danger[114] };
danger[116] = { notes = danger[113], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[115] };
danger[117] = { 'Possible effects: Slow.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[118] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[119] = { notes = danger[118], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[27] };
danger[120] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = danger[117], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[119], level_ranges = { { 13, 255 } } };
danger[121] = { 'Possible effects: Paralysis.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[122] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[123] = { notes = danger[122], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[124] = { 'Possible effects: Silence.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[125] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[126] = { notes = danger[125], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[127] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[128] = { notes = danger[127], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[60] };
danger[129] = { kind = 'skill', id = 1441, name = 'Actinic Burst', summary = 'Actinic Burst: Flash', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[128] };
danger[130] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[131] = { notes = danger[130], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[7] };
danger[132] = { kind = 'skill', id = 1445, name = 'Damnation Dive', summary = 'Damnation Dive: Stun', notes = danger[13], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[131] };
danger[133] = { danger[129], danger[132] };
danger[134] = { 'Vertical Cleave: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Efflorescent Foetor: Blindness, Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Stupor Spores: Sleep. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Viscid Nectar: Slow. Source targeting: cone.', 'Morning Glory: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Axial Bloom: Bind. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Nutrient Absorption: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[135] = { kind = 'skill', id = 1447, name = 'Vertical Cleave', summary = 'Vertical Cleave: can crit', notes = danger[107], categories = { 'crit' }, effects = {  }, details = danger[109] };
danger[136] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[137] = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } };
danger[138] = { notes = danger[136], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[137] };
danger[139] = { kind = 'skill', id = 1448, name = 'Efflorescent Foetor', summary = 'Efflorescent Foetor: Blindness, Silence', notes = danger[13], categories = { 'debuff' }, effects = { 'Blindness', 'Silence' }, details = danger[138] };
danger[140] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[141] = { notes = danger[140], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[142] = { kind = 'skill', id = 1449, name = 'Stupor Spores', summary = 'Stupor Spores: Sleep', notes = danger[17], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[141] };
danger[143] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[144] = { notes = danger[143], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[27] };
danger[145] = { kind = 'skill', id = 1450, name = 'Viscid Nectar', summary = 'Viscid Nectar: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[144] };
danger[146] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[147] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[148] = { notes = danger[147], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[149] = { kind = 'skill', id = 1451, name = 'Morning Glory', summary = 'Morning Glory: can crit', notes = danger[146], categories = { 'crit' }, effects = {  }, details = danger[148] };
danger[150] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[151] = { notes = danger[150], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[52] };
danger[152] = { kind = 'skill', id = 1452, name = 'Axial Bloom', summary = 'Axial Bloom: Bind', notes = danger[17], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[151] };
danger[153] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[154] = { notes = danger[153], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[155] = { kind = 'skill', id = 1453, name = 'Nutrient Absorption', summary = 'Nutrient Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[154] };
danger[156] = { danger[135], danger[139], danger[142], danger[145], danger[149], danger[152], danger[155] };
danger[157] = { value = 'Vertical Cleave: can crit; Efflorescent Foetor: Blindness, Silence; Stupor Spores: Sleep; Viscid Nectar: Slow; Morning Glory: can crit; Axial Bloom: Bind; Nutrient Absorption: HP drain', notes = danger[134], entries = danger[156], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[22] };
danger[158] = { 'Actinic Burst: Flash. Source targeting: area around the monster.', 'Damnation Dive: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[159] = { value = 'Actinic Burst: Flash; Damnation Dive: Stun', notes = danger[158], entries = danger[133], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[22] };
danger[160] = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { true_sight = { 'Qnzdei' } },
        [2] = { both = { 'Awaern', 'Ixaern', 'Qnaern' } },
        [3] = { sound = { 'Aweuvhi' } },
        [4] = { superlink = { 'Ixzdei' } },
        [5] = { superlink = { 'Kfghrah' } },
        [6] = { superlink = { 'Jailer of Fortitude', 'Kfghrah' } },
        [7] = { both = { 'Awaern', 'Qnaern' } },
        [8] = { superlink = { 'Aerns Wynav' } },
        [9] = { superlink = { 'Aerns Wynav', 'Ixaern' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Aerns Wynav'] = { id = 135, name = 'Wynav' },
        ['Awaern'] = { id = 131, name = 'Aern' },
        ['Aweuvhi'] = { id = 132, name = 'Euvhi' },
        ['Ixaern'] = { id = 131, name = 'Aern' },
        ['Ixzdei'] = { id = 139, name = 'Zdei' },
        ['Jailer of Fortitude'] = { id = 138, name = 'Ghrah' },
        ['Kfghrah'] = { id = 138, name = 'Ghrah' },
        ['Qnaern'] = { id = 131, name = 'Aern' },
        ['Qnzdei'] = { id = 139, name = 'Zdei' },
    },
    monsters = {
        {
            name   = 'Qnzdei',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 188, 189, 190, 191 },
            nm     = true,
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 71, dex = 85, def = 325,
                         attack_skill = 266 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 3823 }, mp = { [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern blm',
            ids    = { 13, 39, 70, 196, 221, 224 },
            job    = 'blm/blm',
            levels = {
                [81] = { acc = 354, eva = 310, agi = 90, int = 112, mnd = 85, chr = 91, dex = 94, def = 332,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 315, agi = 90, int = 112, mnd = 85, chr = 91, dex = 94, def = 337,
                         attack_skill = 293 },
                [83] = { acc = 366, eva = 319, agi = 90, int = 115, mnd = 86, chr = 92, dex = 94, def = 342,
                         attack_skill = 299 },
                [84] = { acc = 373, eva = 325, agi = 92, int = 115, mnd = 86, chr = 94, dex = 96, def = 348,
                         attack_skill = 305 },
            },
            spawn_levels = { [13] = { 81, 83 }, [39] = { 81, 83 }, [70] = { 81, 83 }, [196] = { 83, 84 },
                             [221] = { 83, 84 }, [224] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4105, [82] = 4174, [83] = 4243, [84] = 4312 }, mp = { [81] = 9999, [82] = 9999, [83] = 9999, [84] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Flare: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Tornado: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Quake: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burst: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flood: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga II: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga II: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[40], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[43], level_ranges = { { 60, 255 } } }, { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[43], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[43], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[43], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[43], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[43], level_ranges = { { 58, 255 } } }, { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } }, level_ranges = { { 72, 255 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = danger[41], categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = danger[41], categories = { 'debuff' }, effects = { 'Frost' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = danger[41], categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = danger[41], categories = { 'debuff' }, effects = { 'Rasp' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = danger[41], categories = { 'debuff' }, effects = { 'Shock' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = danger[41], categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[41], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[43], level_ranges = { { 12, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[41], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[43], level_ranges = { { 25, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[44], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[46], level_ranges = { { 45, 255 } } }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[41], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[48], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[49], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[53], level_ranges = { { 7, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[54], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[43], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = danger[54], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 56, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern thf',
            ids    = { 14, 77, 209, 223 },
            job    = 'thf/thf',
            levels = {
                [81] = { acc = 360, eva = 404, agi = 96, int = 99, mnd = 72, chr = 72, dex = 107, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 366, eva = 409, agi = 96, int = 99, mnd = 72, chr = 72, dex = 107, def = 344,
                         attack_skill = 293 },
                [83] = { acc = 373, eva = 414, agi = 96, int = 100, mnd = 73, chr = 73, dex = 109, def = 349,
                         attack_skill = 299 },
                [84] = { acc = 380, eva = 420, agi = 98, int = 101, mnd = 73, chr = 73, dex = 110, def = 355,
                         attack_skill = 305 },
            },
            spawn_levels = { [14] = { 81, 83 }, [77] = { 81, 83 }, [209] = { 83, 84 }, [223] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4324, [82] = 4395, [83] = 4467, [84] = 4539 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[40] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern pld',
            ids    = { 15, 84, 193, 210 },
            job    = 'pld/pld',
            levels = {
                [81] = { acc = 347, eva = 321, agi = 63, int = 72, mnd = 99, chr = 99, dex = 80, def = 397,
                         attack_skill = 287 },
                [82] = { acc = 353, eva = 326, agi = 63, int = 72, mnd = 99, chr = 99, dex = 80, def = 402,
                         attack_skill = 293 },
                [83] = { acc = 359, eva = 331, agi = 63, int = 73, mnd = 100, chr = 100, dex = 80, def = 408,
                         attack_skill = 299 },
                [84] = { acc = 365, eva = 337, agi = 64, int = 73, mnd = 101, chr = 101, dex = 81, def = 414,
                         attack_skill = 305 },
            },
            spawn_levels = { [15] = { 81, 83 }, [84] = { 81, 83 }, [193] = { 83, 84 }, [210] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4495, [82] = 4570, [83] = 4644, [84] = 4718 }, mp = { [81] = 9999, [82] = 9999, [83] = 9999, [84] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[58], { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = danger[41], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[61], level_ranges = { { 37, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern sam',
            ids    = { 16, 79, 200, 215 },
            job    = 'sam/sam',
            levels = {
                [81] = { acc = 354, eva = 339, agi = 82, int = 85, mnd = 85, chr = 91, dex = 94, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 344, agi = 82, int = 85, mnd = 85, chr = 91, dex = 94, def = 348,
                         attack_skill = 293 },
                [83] = { acc = 366, eva = 349, agi = 82, int = 86, mnd = 86, chr = 92, dex = 94, def = 353,
                         attack_skill = 299 },
                [84] = { acc = 373, eva = 355, agi = 85, int = 86, mnd = 86, chr = 94, dex = 96, def = 359,
                         attack_skill = 305 },
            },
            spawn_levels = { [16] = { 81, 83 }, [79] = { 81, 83 }, [200] = { 83, 84 }, [215] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4603, [82] = 4679, [83] = 4754, [84] = 4830 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[68],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern drk',
            ids    = { 17, 91, 194, 206 },
            job    = 'drk/drk',
            levels = {
                [81] = { acc = 354, eva = 331, agi = 82, int = 99, mnd = 72, chr = 72, dex = 94, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 336, agi = 82, int = 99, mnd = 72, chr = 72, dex = 94, def = 348,
                         attack_skill = 293 },
                [83] = { acc = 366, eva = 341, agi = 82, int = 100, mnd = 73, chr = 73, dex = 94, def = 353,
                         attack_skill = 299 },
                [84] = { acc = 373, eva = 347, agi = 85, int = 101, mnd = 73, chr = 73, dex = 96, def = 359,
                         attack_skill = 305 },
            },
            spawn_levels = { [17] = { 81, 83 }, [91] = { 81, 83 }, [194] = { 83, 84 }, [206] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4495, [82] = 4570, [83] = 4644, [84] = 4718 }, mp = { [81] = 9999, [82] = 9999, [83] = 9999, [84] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Str: STR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Dex: DEX down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Vit: VIT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Agi: AGI down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Int: INT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Mnd: MND down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Chr: CHR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Tp: TP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[58], danger[71], { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[41], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[43], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[41], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[43], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[44], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[46], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[49], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[53], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[54], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[43], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = danger[41], categories = { 'debuff' }, effects = { 'STR down' }, details = danger[75], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = danger[41], categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[79], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = danger[41], categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[83], level_ranges = { { 35, 255 } } }, { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = danger[41], categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[87], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = danger[41], categories = { 'debuff' }, effects = { 'INT down' }, details = danger[91], level_ranges = { { 39, 255 } } }, { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = danger[41], categories = { 'debuff' }, effects = { 'MND down' }, details = danger[95], level_ranges = { { 31, 255 } } }, { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = danger[41], categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[99], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = danger[41], categories = { 'drain' }, effects = { 'TP drain' }, details = danger[43], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern rng',
            ids    = { 18, 36, 75, 201, 226 },
            job    = 'rng/rng',
            levels = {
                [81] = { acc = 398, eva = 316, agi = 103, int = 85, mnd = 91, chr = 85, dex = 86, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 404, eva = 321, agi = 103, int = 85, mnd = 91, chr = 85, dex = 86, def = 344,
                         attack_skill = 293 },
                [83] = { acc = 410, eva = 326, agi = 105, int = 86, mnd = 92, chr = 86, dex = 86, def = 349,
                         attack_skill = 299 },
                [84] = { acc = 417, eva = 332, agi = 106, int = 86, mnd = 94, chr = 86, dex = 89, def = 355,
                         attack_skill = 305 },
            },
            spawn_levels = { [18] = { 81, 83 }, [36] = { 81, 83 }, [75] = { 81, 83 }, [201] = { 83, 84 },
                             [226] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4215, [82] = 4285, [83] = 4356, [84] = 4426 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[106],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern nin',
            ids    = { 19, 80, 205, 225 },
            job    = 'nin/nin',
            levels = {
                [81] = { acc = 357, eva = 356, agi = 96, int = 91, mnd = 72, chr = 78, dex = 100, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 363, eva = 361, agi = 96, int = 91, mnd = 72, chr = 78, dex = 100, def = 348,
                         attack_skill = 293 },
                [83] = { acc = 369, eva = 366, agi = 96, int = 92, mnd = 73, chr = 79, dex = 100, def = 353,
                         attack_skill = 299 },
                [84] = { acc = 376, eva = 372, agi = 98, int = 94, mnd = 73, chr = 79, dex = 102, def = 359,
                         attack_skill = 305 },
            },
            spawn_levels = { [19] = { 81, 83 }, [80] = { 81, 83 }, [205] = { 83, 84 }, [225] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4324, [82] = 4395, [83] = 4467, [84] = 4539 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hyoton Ni: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Huton Ni: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Doton Ni: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Raiton Ni: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Suiton Ni: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Jubaku Ni: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hojo Ni: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dokumori Ni: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[110], { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[112], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[112], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[112], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[112], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[112], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = danger[41], categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[112], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = danger[41], categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } }, level_ranges = { { 65, 255 } } }, { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = danger[41], categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[27] }, level_ranges = { { 48, 255 } } }, { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = danger[41], categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } }, level_ranges = { { 56, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern drg',
            ids    = { 20, 86, 207 },
            job    = 'drg/drg',
            levels = {
                [81] = { acc = 372, eva = 339, agi = 82, int = 78, mnd = 85, chr = 99, dex = 86, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 378, eva = 344, agi = 82, int = 78, mnd = 85, chr = 99, dex = 86, def = 348,
                         attack_skill = 293 },
                [83] = { acc = 384, eva = 349, agi = 82, int = 79, mnd = 86, chr = 100, dex = 86, def = 353,
                         attack_skill = 299 },
                [84] = { acc = 391, eva = 355, agi = 85, int = 79, mnd = 86, chr = 101, dex = 89, def = 359,
                         attack_skill = 305 },
            },
            spawn_levels = { [20] = { 81, 83 }, [86] = { 81, 83 }, [207] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4603, [82] = 4679, [83] = 4754, [84] = 4830 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[68],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Wynav',
            ids    = { 21, 87, 208 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 59, mnd = 49, chr = 55, dex = 72, def = 265,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 60, mnd = 49, chr = 55, dex = 75, def = 269,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 60, mnd = 49, chr = 55, dex = 75, def = 275,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 61, mnd = 50, chr = 57, dex = 75, def = 280,
                         attack_skill = 225 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep' },
            info = {
                family = { value = 'Wynav / Luminian', notes = { 'Source species: Wynav (ID 324); family ID 135.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [65] = 1132, [66] = 1157, [67] = 1182, [68] = 1207 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[22] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern mnk',
            ids    = { 22, 38, 90, 199, 213 },
            job    = 'mnk/mnk',
            levels = {
                [81] = { acc = 357, eva = 332, agi = 69, int = 72, mnd = 91, chr = 85, dex = 100, def = 349,
                         attack_skill = 287 },
                [82] = { acc = 363, eva = 337, agi = 69, int = 72, mnd = 91, chr = 85, dex = 100, def = 354,
                         attack_skill = 293 },
                [83] = { acc = 369, eva = 342, agi = 69, int = 73, mnd = 92, chr = 86, dex = 100, def = 360,
                         attack_skill = 299 },
                [84] = { acc = 376, eva = 348, agi = 70, int = 73, mnd = 94, chr = 86, dex = 102, def = 366,
                         attack_skill = 305 },
            },
            spawn_levels = { [22] = { 81, 83 }, [38] = { 81, 83 }, [90] = { 81, 83 }, [199] = { 83, 84 },
                             [213] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4875, [82] = 4952, [83] = 5029, [84] = 5106 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[110] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern whm',
            ids    = { 23, 85, 195, 220 },
            job    = 'whm/whm',
            levels = {
                [81] = { acc = 343, eva = 303, agi = 76, int = 85, mnd = 112, chr = 99, dex = 73, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 349, eva = 308, agi = 76, int = 85, mnd = 112, chr = 99, dex = 73, def = 344,
                         attack_skill = 293 },
                [83] = { acc = 355, eva = 312, agi = 76, int = 86, mnd = 115, chr = 100, dex = 73, def = 349,
                         attack_skill = 299 },
                [84] = { acc = 362, eva = 317, agi = 77, int = 86, mnd = 115, chr = 101, dex = 74, def = 355,
                         attack_skill = 305 },
            },
            spawn_levels = { [23] = { 81, 83 }, [85] = { 81, 83 }, [195] = { 83, 84 }, [220] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4215, [82] = 4285, [83] = 4356, [84] = 4426 }, mp = { [81] = 9999, [82] = 9999, [83] = 9999, [84] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Diaga II: Dia. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Slow: slow. Possible effects: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Paralyze: paralysis. Possible effects: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = danger[41], categories = { 'debuff' }, effects = { 'Dia' }, details = danger[116], level_ranges = { { 60, 255 } } }, danger[120], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = danger[121], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[123], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = danger[124], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[126], level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = danger[41], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[61], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern rdm',
            ids    = { 24, 35, 76, 192, 202, 219 },
            job    = 'rdm/rdm',
            levels = {
                [81] = { acc = 350, eva = 319, agi = 76, int = 99, mnd = 99, chr = 91, dex = 86, def = 336,
                         attack_skill = 287 },
                [82] = { acc = 356, eva = 324, agi = 76, int = 99, mnd = 99, chr = 91, dex = 86, def = 341,
                         attack_skill = 293 },
                [83] = { acc = 362, eva = 329, agi = 76, int = 100, mnd = 100, chr = 92, dex = 86, def = 346,
                         attack_skill = 299 },
                [84] = { acc = 369, eva = 333, agi = 77, int = 101, mnd = 101, chr = 94, dex = 89, def = 351,
                         attack_skill = 305 },
            },
            spawn_levels = { [24] = { 81, 83 }, [35] = { 81, 83 }, [76] = { 81, 83 }, [192] = { 83, 84 },
                             [202] = { 83, 84 }, [219] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4324, [82] = 4395, [83] = 4467, [84] = 4539 }, mp = { [81] = 9999, [82] = 9999, [83] = 9999, [84] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Diaga II: Dia. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Slow: slow. Possible effects: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Paralyze: paralysis. Possible effects: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Gravity: Weight. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dispel: removes a buff. Possible effects: Buff removal. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[58], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = danger[41], categories = { 'debuff' }, effects = { 'Dia' }, details = danger[116], level_ranges = { { 55, 255 } } }, danger[120], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = danger[121], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[123], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = danger[124], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[126], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = danger[41], categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 21, 255 } } }, danger[71], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[41], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[48], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[49], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[53], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[54], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[43], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[43], level_ranges = { { 32, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern brd',
            ids    = { 25, 37, 71, 197, 214 },
            job    = 'brd/brd',
            levels = {
                [81] = { acc = 350, eva = 315, agi = 69, int = 91, mnd = 91, chr = 105, dex = 86, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 356, eva = 320, agi = 69, int = 91, mnd = 91, chr = 105, dex = 86, def = 344,
                         attack_skill = 293 },
                [83] = { acc = 362, eva = 325, agi = 69, int = 92, mnd = 92, chr = 106, dex = 86, def = 349,
                         attack_skill = 299 },
                [84] = { acc = 369, eva = 330, agi = 70, int = 94, mnd = 94, chr = 107, dex = 89, def = 355,
                         attack_skill = 305 },
            },
            spawn_levels = { [25] = { 81, 83 }, [37] = { 81, 83 }, [71] = { 81, 83 }, [197] = { 83, 84 },
                             [214] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4324, [82] = 4395, [83] = 4467, [84] = 4539 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Foe Requiem VI: Requiem; Horde Lullaby: Sleep; Carnage Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Foe Requiem VI: Requiem. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Horde Lullaby: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Carnage Elegy: Elegy. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Magic Finale: Buff removal. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Foe Lullaby: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37], danger[40], { kind = 'spell', id = 373, name = 'Foe Requiem VI', summary = 'Foe Requiem VI: Requiem', notes = danger[41], categories = { 'debuff' }, effects = { 'Requiem' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 67, 255 } } }, { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = danger[41], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 422, name = 'Carnage Elegy', summary = 'Carnage Elegy: Elegy', notes = danger[41], categories = { 'debuff' }, effects = { 'Elegy' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 59, 255 } } }, { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = danger[41], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[43], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = danger[41], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[43], level_ranges = { { 16, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[55] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awghrah',
            ids    = { 26, 27, 28, 29, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 54, 57, 60, 63, 66, 69, 74,
                       78, 83, 88, 92, 94, 97, 100, 103, 106, 107, 113, 116, 119, 122, 125, 126, 132, 135, 138, 141,
                       144, 145, 151, 154, 157, 160, 163, 164, 170, 173, 176, 179, 182, 183, 216, 217, 218, 227,
                       228, 229, 230, 231, 232, 233, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 247, 249,
                       263, 264, 265, 284, 285, 286, 305, 306, 307, 326, 327, 328, 347, 348, 349, 357, 360, 365,
                       366, 367, 368, 373, 376, 381, 382, 383, 384, 389, 392, 397, 398, 399, 400, 405, 408, 413,
                       414, 415, 416, 421, 424, 429, 430, 431, 432 },
            job    = 'war/blm',
            levels = {
                [79] = { acc = 339, eva = 324, agi = 87, int = 73, mnd = 64, chr = 71, dex = 87, def = 336,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 329, agi = 87, int = 73, mnd = 64, chr = 71, dex = 87, def = 341,
                         attack_skill = 281 },
                [81] = { acc = 352, eva = 335, agi = 90, int = 75, mnd = 66, chr = 73, dex = 90, def = 347,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 340, agi = 90, int = 75, mnd = 66, chr = 73, dex = 90, def = 352,
                         attack_skill = 293 },
            },
            spawn_levels = { [26] = { 79, 80 }, [27] = { 79, 80 }, [28] = { 79, 80 }, [29] = { 79, 80 },
                             [40] = { 79, 80 }, [41] = { 79, 80 }, [42] = { 79, 80 }, [43] = { 79, 80 },
                             [44] = { 79, 80 }, [45] = { 79, 80 }, [46] = { 79, 80 }, [47] = { 79, 80 },
                             [48] = { 79, 80 }, [49] = { 79, 80 }, [50] = { 79, 80 }, [51] = { 79, 80 },
                             [54] = { 79, 80 }, [57] = { 79, 80 }, [60] = { 79, 80 }, [63] = { 79, 80 },
                             [66] = { 79, 80 }, [69] = { 79, 80 }, [74] = { 79, 80 }, [78] = { 79, 80 },
                             [83] = { 79, 80 }, [88] = { 79, 80 }, [92] = { 79, 80 }, [94] = { 79, 80 },
                             [97] = { 79, 80 }, [100] = { 79, 80 }, [103] = { 79, 80 }, [106] = { 79, 80 },
                             [107] = { 79, 80 }, [113] = { 79, 80 }, [116] = { 79, 80 }, [119] = { 79, 80 },
                             [122] = { 79, 80 }, [125] = { 79, 80 }, [126] = { 79, 80 }, [132] = { 79, 80 },
                             [135] = { 79, 80 }, [138] = { 79, 80 }, [141] = { 79, 80 }, [144] = { 79, 80 },
                             [145] = { 79, 80 }, [151] = { 79, 80 }, [154] = { 79, 80 }, [157] = { 79, 80 },
                             [160] = { 79, 80 }, [163] = { 79, 80 }, [164] = { 79, 80 }, [170] = { 79, 80 },
                             [173] = { 79, 80 }, [176] = { 79, 80 }, [179] = { 79, 80 }, [182] = { 79, 80 },
                             [183] = { 79, 80 }, [216] = { 80, 81 }, [217] = { 80, 81 }, [218] = { 80, 81 },
                             [227] = { 80, 81 }, [228] = { 80, 81 }, [229] = { 80, 81 }, [230] = { 80, 81 },
                             [231] = { 80, 81 }, [232] = { 80, 81 }, [233] = { 80, 81 }, [236] = { 80, 81 },
                             [237] = { 80, 81 }, [238] = { 80, 81 }, [239] = { 80, 81 }, [240] = { 80, 81 },
                             [241] = { 80, 81 }, [242] = { 80, 81 }, [243] = { 80, 81 }, [244] = { 80, 81 },
                             [245] = { 80, 81 }, [247] = { 80, 81 }, [249] = { 80, 81 }, [263] = { 80, 81 },
                             [264] = { 80, 81 }, [265] = { 80, 81 }, [284] = { 80, 81 }, [285] = { 80, 81 },
                             [286] = { 80, 81 }, [305] = { 80, 81 }, [306] = { 80, 81 }, [307] = { 80, 81 },
                             [326] = { 80, 81 }, [327] = { 80, 81 }, [328] = { 80, 81 }, [347] = { 80, 81 },
                             [348] = { 80, 81 }, [349] = { 80, 81 }, [357] = { 81, 82 }, [360] = { 81, 82 },
                             [365] = { 81, 82 }, [366] = { 81, 82 }, [367] = { 81, 82 }, [368] = { 81, 82 },
                             [373] = { 81, 82 }, [376] = { 81, 82 }, [381] = { 81, 82 }, [382] = { 81, 82 },
                             [383] = { 81, 82 }, [384] = { 81, 82 }, [389] = { 81, 82 }, [392] = { 81, 82 },
                             [397] = { 81, 82 }, [398] = { 81, 82 }, [399] = { 81, 82 }, [400] = { 81, 82 },
                             [405] = { 81, 82 }, [408] = { 81, 82 }, [413] = { 81, 82 }, [414] = { 81, 82 },
                             [415] = { 81, 82 }, [416] = { 81, 82 }, [421] = { 81, 82 }, [424] = { 81, 82 },
                             [429] = { 81, 82 }, [430] = { 81, 82 }, [431] = { 81, 82 }, [432] = { 81, 82 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
                { rate = 10, item = 1872 },  -- ghrah m chip
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
            aggro_note = 'form',
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Ghrah / Luminion', notes = { 'Source species: Bird Ghrah (ID 328); family ID 138.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 3819, [80] = 3884, [81] = 3950, [82] = 4015 }, mp = { [79] = 2309, [80] = 2342, [81] = 2374, [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Actinic Burst: Flash; Damnation Dive: Stun', notes = { 'Actinic Burst: Flash. Source targeting: area around the monster.', 'Damnation Dive: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell-list replacement is not resolved.' }, entries = danger[133], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Actinic Burst', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 612, name = 'Actinic Burst', level = 74, min_skill = 240, skill_ids = { 1441 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern bst',
            ids    = { 30, 81, 203 },
            job    = 'bst/bst',
            levels = {
                [81] = { acc = 354, eva = 324, agi = 69, int = 85, mnd = 85, chr = 112, dex = 94, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 329, agi = 69, int = 85, mnd = 85, chr = 112, dex = 94, def = 344,
                         attack_skill = 293 },
                [83] = { acc = 366, eva = 334, agi = 69, int = 86, mnd = 86, chr = 115, dex = 94, def = 349,
                         attack_skill = 299 },
                [84] = { acc = 373, eva = 340, agi = 70, int = 86, mnd = 86, chr = 115, dex = 96, def = 355,
                         attack_skill = 305 },
            },
            spawn_levels = { [30] = { 81, 83 }, [81] = { 81, 83 }, [203] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4495, [82] = 4570, [83] = 4644, [84] = 4718 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[106],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Euvhi',
            ids    = { 31, 82, 204 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 70, dex = 72, def = 263,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 70, dex = 75, def = 267,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 71, dex = 75, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 72, dex = 75, def = 278,
                         attack_skill = 225 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            links  = 3,
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [65] = 905, [66] = 925, [67] = 945, [68] = 965 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[157],
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern war',
            ids    = { 32, 89, 198, 222 },
            levels = {
                [81] = { acc = 354, eva = 335, agi = 90, int = 78, mnd = 78, chr = 85, dex = 94, def = 349,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 340, agi = 90, int = 78, mnd = 78, chr = 85, dex = 94, def = 354,
                         attack_skill = 293 },
                [83] = { acc = 366, eva = 345, agi = 90, int = 79, mnd = 79, chr = 86, dex = 94, def = 359,
                         attack_skill = 299 },
                [84] = { acc = 373, eva = 351, agi = 92, int = 79, mnd = 79, chr = 86, dex = 96, def = 365,
                         attack_skill = 305 },
            },
            spawn_levels = { [32] = { 81, 83 }, [89] = { 81, 83 }, [198] = { 83, 84 }, [222] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 4603, [82] = 4679, [83] = 4754, [84] = 4830 }, mp = { [81] = 0, [82] = 0, [83] = 0, [84] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[106],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern smn',
            ids    = { 33, 72, 211 },
            job    = 'smn/smn',
            levels = {
                [81] = { acc = 347, eva = 306, agi = 82, int = 105, mnd = 105, chr = 105, dex = 80, def = 332,
                         attack_skill = 287 },
                [82] = { acc = 353, eva = 311, agi = 82, int = 105, mnd = 105, chr = 105, dex = 80, def = 337,
                         attack_skill = 293 },
                [83] = { acc = 359, eva = 315, agi = 82, int = 106, mnd = 106, chr = 106, dex = 80, def = 342,
                         attack_skill = 299 },
                [84] = { acc = 365, eva = 321, agi = 85, int = 107, mnd = 107, chr = 107, dex = 81, def = 348,
                         attack_skill = 305 },
            },
            spawn_levels = { [33] = { 81, 83 }, [72] = { 81, 83 }, [211] = { 83, 84 } },
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [81] = 3996, [82] = 4064, [83] = 4131, [84] = 4199 }, mp = { [81] = 10059, [82] = 10059, [83] = 10059, [84] = 10059 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = { danger[29], danger[32], danger[37] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Elemental',
            ids    = { 34, 73, 212 },
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
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [65] = 1089, [66] = 1113, [67] = 1138, [68] = 1162 }, mp = { [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[70], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[43], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[43], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[46], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[53], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[43], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[75], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[79], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[83], level_ranges = { { 35, 255 } } }, { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[87], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[91], level_ranges = { { 39, 255 } } }, { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[95], level_ranges = { { 31, 255 } } }, { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[99], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[43], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[55] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Aweuvhi',
            ids    = { 52, 55, 58, 61, 64, 67, 95, 98, 101, 104, 114, 117, 120, 123, 133, 136, 139, 142, 152, 155,
                       158, 161, 171, 174, 177, 180, 246, 248, 251, 254, 257, 260, 270, 272, 275, 278, 281, 291,
                       293, 296, 299, 302, 312, 314, 317, 320, 323, 333, 335, 338, 341, 344, 354 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 82, dex = 85, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 61, chr = 83, dex = 87, def = 336,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 61, chr = 83, dex = 87, def = 341,
                         attack_skill = 281 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 64, mnd = 64, chr = 85, dex = 90, def = 346,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 64, mnd = 64, chr = 85, dex = 90, def = 351,
                         attack_skill = 293 },
            },
            spawn_levels = { [52] = { 80, 82 }, [55] = { 80, 82 }, [58] = { 80, 82 }, [61] = { 80, 80 },
                             [64] = { 80, 82 }, [67] = { 80, 82 }, [95] = { 80, 82 }, [98] = { 80, 82 },
                             [101] = { 80, 82 }, [104] = { 80, 82 }, [114] = { 80, 82 }, [117] = { 80, 82 },
                             [120] = { 80, 82 }, [123] = { 80, 82 }, [133] = { 80, 82 }, [136] = { 80, 82 },
                             [139] = { 80, 82 }, [142] = { 80, 82 }, [152] = { 80, 82 }, [155] = { 80, 82 },
                             [158] = { 80, 82 }, [161] = { 80, 82 }, [171] = { 80, 82 }, [174] = { 80, 82 },
                             [177] = { 80, 82 }, [180] = { 80, 82 }, [246] = { 80, 82 }, [248] = { 80, 82 },
                             [251] = { 80, 82 }, [254] = { 78, 80 }, [257] = { 78, 80 }, [260] = { 78, 80 },
                             [270] = { 80, 82 }, [272] = { 80, 82 }, [275] = { 80, 82 }, [278] = { 80, 82 },
                             [281] = { 80, 82 }, [291] = { 80, 82 }, [293] = { 78, 80 }, [296] = { 78, 80 },
                             [299] = { 78, 80 }, [302] = { 78, 80 }, [312] = { 80, 82 }, [314] = { 80, 82 },
                             [317] = { 80, 82 }, [320] = { 80, 82 }, [323] = { 80, 82 }, [333] = { 80, 82 },
                             [335] = { 80, 82 }, [338] = { 80, 82 }, [341] = { 80, 82 }, [344] = { 80, 82 },
                             [354] = { 80, 82 } },
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
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_weapons = true },
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 3890, [79] = 3957, [80] = 4024, [81] = 4092, [82] = 4159 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[157],
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Aweuvhi',
            ids    = { 53, 56, 59, 62, 65, 68, 96, 99, 102, 105, 115, 118, 121, 124, 134, 137, 140, 143, 153, 156,
                       159, 162, 172, 175, 178, 181, 252, 253, 255, 256, 258, 259, 261, 262, 273, 274, 276, 277,
                       279, 280, 282, 283, 294, 295, 297, 298, 300, 301, 303, 304, 315, 316, 318, 319, 321, 322,
                       324, 325, 336, 337, 339, 340, 342, 343, 345, 346 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 82, dex = 85, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 61, chr = 83, dex = 87, def = 336,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 61, chr = 83, dex = 87, def = 341,
                         attack_skill = 281 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 64, mnd = 64, chr = 85, dex = 90, def = 346,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 64, mnd = 64, chr = 85, dex = 90, def = 351,
                         attack_skill = 293 },
            },
            spawn_levels = { [53] = { 78, 80 }, [56] = { 78, 80 }, [59] = { 78, 80 }, [62] = { 78, 80 },
                             [65] = { 78, 80 }, [68] = { 78, 80 }, [96] = { 78, 80 }, [99] = { 80, 82 },
                             [102] = { 80, 82 }, [105] = { 80, 82 }, [115] = { 78, 80 }, [118] = { 78, 80 },
                             [121] = { 78, 80 }, [124] = { 78, 80 }, [134] = { 78, 80 }, [137] = { 78, 80 },
                             [140] = { 78, 80 }, [143] = { 78, 80 }, [153] = { 78, 80 }, [156] = { 80, 82 },
                             [159] = { 80, 82 }, [162] = { 78, 80 }, [172] = { 80, 82 }, [175] = { 80, 82 },
                             [178] = { 80, 82 }, [181] = { 78, 80 }, [252] = { 80, 82 }, [253] = { 80, 82 },
                             [255] = { 78, 80 }, [256] = { 80, 82 }, [258] = { 78, 80 }, [259] = { 80, 82 },
                             [261] = { 78, 80 }, [262] = { 80, 82 }, [273] = { 80, 82 }, [274] = { 80, 82 },
                             [276] = { 80, 82 }, [277] = { 80, 82 }, [279] = { 80, 82 }, [280] = { 80, 82 },
                             [282] = { 80, 82 }, [283] = { 80, 82 }, [294] = { 78, 80 }, [295] = { 80, 82 },
                             [297] = { 78, 80 }, [298] = { 80, 82 }, [300] = { 78, 80 }, [301] = { 80, 82 },
                             [303] = { 80, 82 }, [304] = { 80, 82 }, [315] = { 80, 82 }, [316] = { 80, 82 },
                             [318] = { 80, 82 }, [319] = { 80, 82 }, [321] = { 80, 82 }, [322] = { 80, 82 },
                             [324] = { 80, 82 }, [325] = { 80, 82 }, [336] = { 80, 82 }, [337] = { 80, 82 },
                             [339] = { 80, 82 }, [340] = { 80, 82 }, [342] = { 80, 82 }, [343] = { 80, 82 },
                             [345] = { 80, 82 }, [346] = { 80, 82 } },
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
            links  = 3,
            flags  = { scripted_weapons = true },
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 3890, [79] = 3957, [80] = 4024, [81] = 4092, [82] = 4159 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[157],
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awzdei',
            ids    = { 93, 112, 131, 150, 169, 362, 364, 378, 380, 394, 396, 410, 412, 426, 428 },
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 3930 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awzdei',
            ids    = { 108, 110, 127, 129, 146, 148, 165, 167, 184, 186, 266, 268, 287, 289, 308, 310, 329, 331,
                       350, 352, 369, 385, 401, 417, 433 },
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 3930 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awzdei',
            ids    = { 109, 111, 128, 130, 147, 149, 166, 168, 185, 187, 267, 269, 288, 290, 309, 311, 330, 332,
                       351, 353, 370, 386, 402, 418, 434 },
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 3930 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awzdei',
            ids    = { 234 },
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 3930 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awzdei',
            ids    = { 235, 250, 271, 292, 313, 334, 361, 363, 377, 379, 393, 395, 409, 411, 425, 427 },
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87, dex = 74, def = 390,
                         attack_skill = 281 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 3930 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Awzdei',
            ids    = { 355, 356, 358, 359, 371, 372, 374, 375, 387, 388, 390, 391, 403, 404, 406, 407, 419, 420,
                       422, 423 },
            job    = 'pld/pld',
            levels = {
                [83] = { acc = 357, eva = 329, agi = 58, int = 58, mnd = 85, chr = 90, dex = 76, def = 406,
                         attack_skill = 299 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [83] = 4128 }, mp = { [83] = 2439 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[23],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ixzdei',
            ids    = { 435, 436 },
            nm     = true,
            job    = 'rdm/blm',
            levels = {
                [78] = { acc = 331, eva = 303, agi = 72, int = 84, mnd = 76, chr = 77, dex = 80, def = 316,
                         attack_skill = 271 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 5200 }, mp = { [78] = 6500 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Optic Induration: Petrification, can crit; Static Filament: Stun; Decayed Filament: Poison; Reactor Overheat: Plague; Reactor Overload: Silence', notes = { 'Optic Induration: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: cone.', 'Static Filament: Stun. Source targeting: cone.', 'Decayed Filament: Poison. Source targeting: area around the monster.', 'Reactor Overheat: Plague. Random effects may not all happen on the same use. Source targeting: cone.', 'Reactor Overload: Silence. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.', 'A scripted spell argument is not resolved.' }, entries = danger[21], coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.', 'A scripted spell argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ixzdei',
            ids    = { 437, 438 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [78] = { acc = 333, eva = 292, agi = 80, int = 93, mnd = 68, chr = 77, dex = 85, def = 314,
                         attack_skill = 271 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 5200 }, mp = { [78] = 6500 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 225', notes = { 'Base attack delay 225 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Optic Induration: Petrification, can crit; Static Filament: Stun; Decayed Filament: Poison; Reactor Overheat: Plague; Reactor Overload: Silence', notes = { 'Optic Induration: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: cone.', 'Static Filament: Stun. Source targeting: cone.', 'Decayed Filament: Poison. Source targeting: area around the monster.', 'Reactor Overheat: Plague. Random effects may not all happen on the same use. Source targeting: cone.', 'Reactor Overload: Silence. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.', 'A scripted spell argument is not resolved.' }, entries = danger[21], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.', 'A scripted spell argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Jailer of Fortitude',
            ids    = { 439 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [85] = { acc = 370, eva = 342, agi = 64, int = 59, mnd = 87, chr = 87, dex = 79, def = 894,
                         attack_skill = 311 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5, hand_to_hand = -12.5 },
            weapon_guard = { physical = -95, ranged = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'blind', 'petrify',
                       'plague' },
            drops  = {
                { rate = 1000, item = 1853 },  -- second virtue
                { rate = 1000, item = 18222 },  -- fortitude axe
                { rate = 100, item = 15511 },  -- fortitude torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 5,
            info = {
                family = { value = 'Ghrah / Luminion', notes = { 'Source species: Bird Ghrah (ID 328); family ID 138.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 20000 }, mp = { [85] = 25000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Actinic Burst: Flash', notes = { 'Actinic Burst: Flash. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { danger[129] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Actinic Burst', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 612, name = 'Actinic Burst', level = 74, min_skill = 240, skill_ids = { 1441 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Kfghrah whm',
            ids    = { 440 },
            nm     = true,
            job    = 'war/whm',
            levels = {
                [80] = { acc = 341, eva = 327, agi = 83, int = 64, mnd = 73, chr = 73, dex = 80, def = 344,
                         attack_skill = 281 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'paralyze', 'petrify', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Ghrah / Luminion', notes = { 'Source species: Bird Ghrah (ID 328); family ID 138.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 7200 }, mp = { [80] = 10000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 45; Regen 1', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[159],
                blue = { value = 'Actinic Burst', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 612, name = 'Actinic Burst', level = 74, min_skill = 240, skill_ids = { 1441 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kfghrah blm',
            ids    = { 441 },
            nm     = true,
            job    = 'war/blm',
            levels = {
                [80] = { acc = 344, eva = 329, agi = 87, int = 73, mnd = 64, chr = 71, dex = 87, def = 341,
                         attack_skill = 281 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'paralyze', 'petrify', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Ghrah / Luminion', notes = { 'Source species: Bird Ghrah (ID 328); family ID 138.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 7200 }, mp = { [80] = 10000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 45', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[159],
                blue = { value = 'Actinic Burst', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 612, name = 'Actinic Burst', level = 74, min_skill = 240, skill_ids = { 1441 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ixaern drk',
            ids    = { 442 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 99, mnd = 72, chr = 72, dex = 94, def = 348,
                         attack_skill = 293 },
                [83] = { acc = 366, eva = 341, agi = 82, int = 100, mnd = 73, chr = 73, dex = 94, def = 353,
                         attack_skill = 299 },
                [84] = { acc = 373, eva = 347, agi = 85, int = 101, mnd = 73, chr = 73, dex = 96, def = 359,
                         attack_skill = 305 },
                [85] = { acc = 379, eva = 352, agi = 85, int = 102, mnd = 74, chr = 74, dex = 96, def = 364,
                         attack_skill = 311 },
                [86] = { acc = 386, eva = 357, agi = 86, int = 104, mnd = 75, chr = 75, dex = 99, def = 369,
                         attack_skill = 317 },
                [87] = { acc = 392, eva = 362, agi = 87, int = 105, mnd = 76, chr = 76, dex = 99, def = 374,
                         attack_skill = 323 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow',
                       'elegy', 'blind', 'terror' },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1854, 8500 },  -- deed of moderation
                    { 1902, 1500 },  -- vice of avarice
                } },
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 7,
            flags  = { scripted_drops = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [82] = 18900, [83] = 18900, [84] = 18900, [85] = 18900, [86] = 18900, [87] = 18900 }, mp = { [82] = 2406, [83] = 2439, [84] = 2471, [85] = 2504, [86] = 2536, [87] = 2569 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: HP drain; Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, danger[29], danger[32], danger[37], danger[58] }, coverage = 'partial', incomplete = true, reasons = danger[160], general_notes = danger[22] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Qnaern rng',
            ids    = { 443, 444 },
            job    = 'rng/rng',
            levels = {
                [80] = { acc = 391, eva = 311, agi = 101, int = 83, mnd = 89, chr = 83, dex = 84, def = 334,
                         attack_skill = 281 },
                [81] = { acc = 398, eva = 316, agi = 103, int = 85, mnd = 91, chr = 85, dex = 86, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 404, eva = 321, agi = 103, int = 85, mnd = 91, chr = 85, dex = 86, def = 344,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'bind' },
            links  = 2,
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 4144, [81] = 4215, [82] = 4285 }, mp = { [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Biotic Boomerang: Plague, can crit', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Biotic Boomerang: Plague, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = danger[105], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Jailer of Faith',
            ids    = { 445 },
            nm     = true,
            job    = 'blm/war',
            levels = {
                [85] = { acc = 377, eva = 353, agi = 87, int = 90, mnd = 71, chr = 93, dex = 92, def = 463,
                         attack_skill = 311 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'paralyze', 'slow', 'elegy',
                       'poison', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1856 },  -- third virtue
                { rate = 1000, item = 18360 },  -- faith baghnakhs
                { rate = 100, item = 15512 },  -- faith torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 20000 }, mp = { [85] = 25000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 100', notes = { 'Base attack delay 180 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade High Quality Euvhi Organ to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 15 minutes', notes = { 'Source idle-despawn delay: 15 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Vertical Cleave: can crit; Efflorescent Foetor: Blindness, Silence; Stupor Spores: Sleep; Viscid Nectar: Slow; Morning Glory: can crit; Axial Bloom: Bind; Nutrient Absorption: HP drain', notes = { 'Vertical Cleave: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Efflorescent Foetor: Blindness, Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Stupor Spores: Sleep. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Viscid Nectar: Slow. Source targeting: cone.', 'Morning Glory: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Axial Bloom: Bind. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Nutrient Absorption: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' }, entries = danger[156], coverage = 'partial', incomplete = true, reasons = danger[160], general_notes = danger[22] },
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Ixaern drg',
            ids    = { 446 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 378, eva = 344, agi = 82, int = 78, mnd = 85, chr = 99, dex = 86, def = 348,
                         attack_skill = 293 },
                [83] = { acc = 384, eva = 349, agi = 82, int = 79, mnd = 86, chr = 100, dex = 86, def = 353,
                         attack_skill = 299 },
                [84] = { acc = 391, eva = 355, agi = 85, int = 79, mnd = 86, chr = 101, dex = 89, def = 359,
                         attack_skill = 305 },
                [85] = { acc = 397, eva = 360, agi = 85, int = 81, mnd = 89, chr = 102, dex = 89, def = 364,
                         attack_skill = 311 },
                [86] = { acc = 404, eva = 366, agi = 86, int = 81, mnd = 89, chr = 104, dex = 90, def = 369,
                         attack_skill = 317 },
                [87] = { acc = 410, eva = 371, agi = 87, int = 82, mnd = 90, chr = 105, dex = 91, def = 374,
                         attack_skill = 323 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun', 'terror' },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1870, 8500 },  -- deed of sensibility
                    { 1903, 1500 },  -- vice of aspersion
                } },
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 8,
            flags  = { scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 13500, [83] = 13500, [84] = 13500, [85] = 13500, [86] = 13500, [87] = 13500 }, mp = { [82] = 0, [83] = 0, [84] = 0, [85] = 0, [86] = 0, [87] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[160], general_notes = danger[22] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ixaern drgs Wynav',
            ids    = { 447, 448, 449 },
            nm     = true,
            job    = 'brd/war',
            levels = {
                [78] = { acc = 331, eva = 309, agi = 67, int = 77, mnd = 65, chr = 77, dex = 80, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 337, eva = 315, agi = 68, int = 79, mnd = 66, chr = 78, dex = 82, def = 339,
                         attack_skill = 276 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            links  = 9,
            info = {
                family = { value = 'Wynav / Luminian', notes = { 'Source species: Wynav (ID 324); family ID 135.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 4659, [79] = 4740 }, mp = { [78] = 0, [79] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.', 'A scripted move chooser return is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.', 'A scripted move chooser return is not resolved.' }, general_notes = danger[22] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'Scripts disable ordinary TP moves; only explicit scripted moves are listed.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
