-- Grand Palace of HuXzoi (zone 34).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[2] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[3] = { notes = danger[1], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[2] };
danger[4] = { kind = 'skill', id = 1441, name = 'Actinic Burst', summary = 'Actinic Burst: Flash', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[3] };
danger[5] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[6] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[7] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[8] = { 'Optic Induration: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: cone.', 'Static Filament: Stun. Source targeting: cone.', 'Decayed Filament: Poison. Source targeting: area around the monster.', 'Reactor Overheat: Plague. Random effects may not all happen on the same use. Source targeting: cone.', 'Reactor Overload: Silence. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[9] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: cone.' };
danger[10] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[11] = { notes = danger[10], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = true } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[12] = { kind = 'skill', id = 1465, name = 'Optic Induration', summary = 'Optic Induration: Petrification, can crit', notes = danger[9], categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[11], forced = true };
danger[13] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[14] = { notes = danger[13], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[6] };
danger[15] = { kind = 'skill', id = 1466, name = 'Static Filament', summary = 'Static Filament: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[14] };
danger[16] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 2 images for the damage step. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[17] = { notes = danger[16], unknown = {  }, activation_range = 8.0, shape = 'area around the monster', effect_radius = 8.0, shadows = { { mode = 'absorb', per_hit = false, count = 2 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[18] = { kind = 'skill', id = 1467, name = 'Decayed Filament', summary = 'Decayed Filament: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[17] };
danger[19] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[20] = { notes = danger[19], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[21] = { kind = 'skill', id = 1468, name = 'Reactor Overheat', summary = 'Reactor Overheat: Plague', notes = danger[5], categories = { 'debuff' }, effects = { 'Plague' }, details = danger[20] };
danger[22] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[23] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images for the damage step. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[24] = { notes = danger[23], unknown = {  }, activation_range = 8.0, shape = 'area around the monster', effect_radius = 8.0, shadows = { { mode = 'absorb', per_hit = false, count = 3 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[25] = { kind = 'skill', id = 1469, name = 'Reactor Overload', summary = 'Reactor Overload: Silence', notes = danger[22], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[24] };
danger[26] = { danger[12], danger[15], danger[18], danger[21], danger[25] };
danger[27] = { value = 'Optic Induration: Petrification, can crit; Static Filament: Stun; Decayed Filament: Poison; Reactor Overheat: Plague; Reactor Overload: Silence', notes = danger[8], entries = danger[26], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[28] = { 'Vertical Cleave: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Efflorescent Foetor: Blindness, Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Stupor Spores: Sleep. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Viscid Nectar: Slow. Source targeting: cone.', 'Morning Glory: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Axial Bloom: Bind. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Nutrient Absorption: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[29] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[30] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[31] = { notes = danger[30], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[32] = { kind = 'skill', id = 1447, name = 'Vertical Cleave', summary = 'Vertical Cleave: can crit', notes = danger[29], categories = { 'crit' }, effects = {  }, details = danger[31] };
danger[33] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[34] = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } };
danger[35] = { notes = danger[33], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[34] };
danger[36] = { kind = 'skill', id = 1448, name = 'Efflorescent Foetor', summary = 'Efflorescent Foetor: Blindness, Silence', notes = danger[5], categories = { 'debuff' }, effects = { 'Blindness', 'Silence' }, details = danger[35] };
danger[37] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[38] = { notes = danger[37], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[39] = { kind = 'skill', id = 1449, name = 'Stupor Spores', summary = 'Stupor Spores: Sleep', notes = danger[22], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[38] };
danger[40] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[41] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[42] = { danger[41] };
danger[43] = { notes = danger[40], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[42] };
danger[44] = { kind = 'skill', id = 1450, name = 'Viscid Nectar', summary = 'Viscid Nectar: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[43] };
danger[45] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[46] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[47] = { notes = danger[46], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[48] = { kind = 'skill', id = 1451, name = 'Morning Glory', summary = 'Morning Glory: can crit', notes = danger[45], categories = { 'crit' }, effects = {  }, details = danger[47] };
danger[49] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[50] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[51] = { danger[50] };
danger[52] = { notes = danger[49], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[51] };
danger[53] = { kind = 'skill', id = 1452, name = 'Axial Bloom', summary = 'Axial Bloom: Bind', notes = danger[22], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[52] };
danger[54] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[55] = { notes = danger[54], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[56] = { kind = 'skill', id = 1453, name = 'Nutrient Absorption', summary = 'Nutrient Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[55] };
danger[57] = { danger[32], danger[36], danger[39], danger[44], danger[48], danger[53], danger[56] };
danger[58] = { value = 'Vertical Cleave: can crit; Efflorescent Foetor: Blindness, Silence; Stupor Spores: Sleep; Viscid Nectar: Slow; Morning Glory: can crit; Axial Bloom: Bind; Nutrient Absorption: HP drain', notes = danger[28], entries = danger[57], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[59] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Biotic Boomerang: Plague, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[60] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[61] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[62] = { notes = danger[61], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = danger[42] };
danger[63] = { kind = 'skill', id = 1378, name = 'Wing Thrust', summary = 'Wing Thrust: Slow', notes = danger[60], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[62] };
danger[64] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[65] = { notes = danger[64], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[66] = { kind = 'skill', id = 1379, name = 'Auroral Wind', summary = 'Auroral Wind: Silence', notes = danger[5], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[65] };
danger[67] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[68] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[69] = { danger[68], { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[70] = { notes = danger[67], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[69] };
danger[71] = { kind = 'skill', id = 1380, name = 'Impact Stream', summary = 'Impact Stream: Defense down, Stun', notes = danger[22], categories = { 'debuff' }, effects = { 'Defense down', 'Stun' }, details = danger[70] };
danger[72] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[73] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[74] = { notes = danger[73], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[75] = { kind = 'skill', id = 1385, name = 'Biotic Boomerang', summary = 'Biotic Boomerang: Plague, can crit', notes = danger[72], categories = { 'crit', 'debuff' }, effects = { 'Plague' }, details = danger[74] };
danger[76] = { danger[63], danger[66], danger[71], danger[75] };
danger[77] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Biotic Boomerang: Plague, can crit', notes = danger[59], entries = danger[76], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[7] };
danger[78] = { kind = 'skill', id = 1387, name = 'Sideswipe', summary = 'Sideswipe: can crit', notes = danger[29], categories = { 'crit' }, effects = {  }, details = danger[31] };
danger[79] = { danger[63], danger[66], danger[71], danger[78] };
danger[80] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 5 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[81] = { notes = danger[80], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 5 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[82] = { kind = 'skill', id = 1384, name = 'Disseverment', summary = 'Disseverment: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[81] };
danger[83] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[84] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[85] = { notes = danger[84], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[86] = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[87] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[88] = { notes = danger[87], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[6] };
danger[89] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[90] = { notes = danger[89], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[91] = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[92] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[93] = { notes = danger[92], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[51] };
danger[94] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[95] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[96] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[97] = { notes = danger[96], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[98] = { kind = 'skill', id = 1383, name = 'Glacier Splitter', summary = 'Glacier Splitter: Paralysis', notes = danger[60], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[97] };
danger[99] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[100] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[101] = { danger[100] };
danger[102] = { notes = danger[99], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[101] };
danger[103] = { 'Possible effects: Slow.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[104] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[105] = { notes = danger[104], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[42] };
danger[106] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = danger[103], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[105], level_ranges = { { 13, 255 } } };
danger[107] = { 'Possible effects: Paralysis.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[108] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[109] = { notes = danger[108], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[110] = { 'Possible effects: Silence.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[111] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[112] = { notes = danger[111], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[113] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[114] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[115] = { danger[114] };
danger[116] = { notes = danger[113], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[115] };
danger[117] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[118] = { notes = danger[117], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[119] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[83], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[118], level_ranges = { { 46, 255 } } };
danger[120] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[118], level_ranges = { { 46, 255 } } };
danger[121] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[122] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[123] = { danger[122] };
danger[124] = { notes = danger[121], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[123] };
danger[125] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[126] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[127] = { danger[126] };
danger[128] = { notes = danger[125], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[127] };
danger[129] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[130] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[131] = { danger[130] };
danger[132] = { notes = danger[129], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[131] };
danger[133] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[134] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[135] = { danger[134] };
danger[136] = { notes = danger[133], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[135] };
danger[137] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[138] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[139] = { danger[138] };
danger[140] = { notes = danger[137], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[139] };
danger[141] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[142] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[143] = { danger[142] };
danger[144] = { notes = danger[141], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[143] };
danger[145] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[146] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[147] = { danger[146] };
danger[148] = { notes = danger[145], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[147] };
danger[149] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[150] = { notes = danger[149], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[2] };
danger[151] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[152] = { notes = danger[151], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[153] = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Medusa Javelin: Petrification, can crit. Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' };
danger[154] = { 'Random effects may not all happen on the same use. This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[155] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[156] = { notes = danger[155], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[157] = { kind = 'skill', id = 1386, name = 'Medusa Javelin', summary = 'Medusa Javelin: Petrification, can crit', notes = danger[154], categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[156] };
danger[158] = { danger[63], danger[66], danger[71], danger[157] };
danger[159] = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Medusa Javelin: Petrification, can crit', notes = danger[153], entries = danger[158], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[7] };
danger[160] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[105], level_ranges = { { 13, 255 } } };
danger[161] = { 'A scripted move argument is not resolved.', 'Some job-special buff choices depend on script values that could not be resolved.' };
danger[162] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Some job-special buff choices depend on script values that could not be resolved.' };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Eoeuvhi' } },
        [2] = { both = { 'Eoaern' } },
        [3] = { superlink = { 'Qnaern' } },
        [4] = { superlink = { 'Ixaern', 'Qnaern' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Eoaern'] = { id = 131, name = 'Aern' },
        ['Eoeuvhi'] = { id = 132, name = 'Euvhi' },
        ['Ixaern'] = { id = 131, name = 'Aern' },
        ['Qnaern'] = { id = 131, name = 'Aern' },
    },
    monsters = {
        {
            name   = 'Eoghrah',
            ids    = { 1, 3, 4, 6, 14, 15, 16, 17, 18, 20, 21, 23, 32, 33, 34, 36, 37, 39, 48, 49, 51, 53, 54, 56,
                       64, 65, 67, 69, 70, 72, 81, 82, 92, 103, 112, 130, 140, 153, 171, 172, 173, 174, 176, 177,
                       184, 185, 186, 187, 189, 190, 191, 192, 194, 195, 201, 202, 204, 205, 206, 207, 209, 210,
                       217, 218, 221, 222, 223, 224, 226, 227, 233, 234, 237, 238, 239, 240, 242, 243, 249, 250,
                       258, 259, 271, 274, 285, 286, 291, 292, 293, 304, 307, 318, 319 },
            job    = 'war/blm',
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 69, mnd = 60, chr = 67, dex = 82, def = 315,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 308, agi = 85, int = 70, mnd = 61, chr = 68, dex = 85, def = 320,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 313, agi = 85, int = 71, mnd = 62, chr = 68, dex = 85, def = 325,
                         attack_skill = 266 },
            },
            spawn_levels = { [3] = { 76, 76 }, [4] = { 76, 76 }, [6] = { 75, 75 }, [20] = { 77, 77 },
                             [21] = { 77, 77 }, [67] = { 75, 75 }, [69] = { 75, 75 }, [70] = { 77, 77 },
                             [72] = { 77, 77 }, [81] = { 75, 75 }, [82] = { 75, 75 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
                { rate = 50, item = 1872 },  -- ghrah m chip
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3557, [76] = 3623, [77] = 3688 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Actinic Burst: Flash; Damnation Dive: Stun', notes = { 'Actinic Burst: Flash. Source targeting: area around the monster.', 'Damnation Dive: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell-list replacement is not resolved.' }, entries = { danger[4], { kind = 'skill', id = 1445, name = 'Damnation Dive', summary = 'Damnation Dive: Stun', notes = danger[5], categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[6] } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[7] },
                blue = { value = 'Actinic Burst', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 612, name = 'Actinic Burst', level = 74, min_skill = 240, skill_ids = { 1441 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eozdei',
            ids    = { 2, 7, 19, 24, 35, 40, 52, 57, 68, 73, 175, 188, 208, 225, 241 },
            job    = 'pld/pld',
            levels = {
                [77] = { acc = 321, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85, dex = 71, def = 373,
                         attack_skill = 266 },
                [78] = { acc = 327, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85, dex = 73, def = 378,
                         attack_skill = 271 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 3732, [78] = 3798 }, mp = { [77] = 2245, [78] = 2277 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eozdei',
            ids    = { 5, 8, 22, 25, 38, 41, 55, 58, 71, 74, 170, 193, 203, 220, 236 },
            job    = 'pld/pld',
            levels = {
                [77] = { acc = 321, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85, dex = 71, def = 373,
                         attack_skill = 266 },
                [78] = { acc = 327, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85, dex = 73, def = 378,
                         attack_skill = 271 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 3732, [78] = 3798 }, mp = { [77] = 2245, [78] = 2277 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eozdei',
            ids    = { 9, 28, 45, 61, 80, 100, 101, 120, 121, 128, 129, 149, 150, 168, 169, 178, 198, 214, 230, 248,
                       267, 284, 300, 317 },
            job    = 'pld/pld',
            levels = {
                [77] = { acc = 321, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85, dex = 71, def = 373,
                         attack_skill = 266 },
                [78] = { acc = 327, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85, dex = 73, def = 378,
                         attack_skill = 271 },
            },
            spawn_levels = { [284] = { 78, 78 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 3732, [78] = 3798 }, mp = { [77] = 2245, [78] = 2277 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Reactor Cool', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 613, name = 'Reactor Cool', level = 74, min_skill = 240, skill_ids = { 1463 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eoeuvhi',
            ids    = { 10, 11, 12, 13, 26, 27, 29, 30, 42, 43, 44, 46, 47, 59, 60, 62, 63, 75, 76, 78, 79, 90, 91,
                       102, 111, 139, 179, 180, 181, 182, 183, 196, 197, 199, 200, 211, 212, 213, 215, 216, 219,
                       228, 229, 231, 232, 244, 245, 246, 247, 269, 270, 272, 273, 287, 288, 289, 290, 302, 303,
                       305, 306 },
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 77, dex = 82, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 79, dex = 82, def = 315,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 79, dex = 85, def = 320,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 80, dex = 85, def = 325,
                         attack_skill = 266 },
            },
            spawn_levels = { [10] = { 75, 77 }, [11] = { 75, 77 }, [12] = { 75, 77 }, [13] = { 75, 77 },
                             [26] = { 75, 77 }, [27] = { 75, 77 }, [29] = { 75, 77 }, [30] = { 76, 76 },
                             [42] = { 74, 76 }, [43] = { 75, 77 }, [44] = { 75, 77 }, [46] = { 75, 76 },
                             [47] = { 75, 77 }, [59] = { 75, 77 }, [60] = { 75, 77 }, [62] = { 75, 77 },
                             [63] = { 75, 77 }, [75] = { 75, 77 }, [76] = { 75, 77 }, [78] = { 75, 77 },
                             [79] = { 75, 77 }, [90] = { 75, 77 }, [91] = { 74, 76 }, [102] = { 74, 76 },
                             [111] = { 74, 76 }, [139] = { 74, 76 }, [179] = { 75, 77 }, [180] = { 75, 77 },
                             [181] = { 74, 76 }, [182] = { 75, 77 }, [196] = { 75, 77 }, [197] = { 75, 77 },
                             [199] = { 75, 77 }, [200] = { 75, 77 }, [211] = { 75, 77 }, [212] = { 75, 77 },
                             [213] = { 75, 77 }, [215] = { 75, 77 }, [216] = { 76, 76 }, [219] = { 75, 77 },
                             [228] = { 75, 77 }, [229] = { 75, 77 }, [231] = { 75, 77 }, [232] = { 75, 77 },
                             [244] = { 75, 77 }, [245] = { 75, 77 }, [246] = { 75, 77 }, [247] = { 75, 77 },
                             [269] = { 76, 76 }, [270] = { 74, 76 }, [272] = { 75, 76 }, [273] = { 74, 76 },
                             [287] = { 75, 76 }, [288] = { 74, 76 }, [289] = { 76, 76 }, [290] = { 74, 74 },
                             [302] = { 74, 76 }, [303] = { 74, 76 }, [305] = { 74, 76 }, [306] = { 74, 76 } },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            drops  = {
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, item = 1818 },  -- euvhi organ
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
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 3621, [75] = 3688, [76] = 3756, [77] = 3823 }, mp = { [74] = 0, [75] = 0, [76] = 0, [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[58],
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eoeuvhi',
            ids    = { 31, 50, 66, 77, 131, 151, 152, 235, 268, 275, 301, 308 },
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 77, dex = 82, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 79, dex = 82, def = 315,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 79, dex = 85, def = 320,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 80, dex = 85, def = 325,
                         attack_skill = 266 },
            },
            spawn_levels = { [31] = { 74, 76 }, [50] = { 74, 76 }, [66] = { 74, 76 }, [77] = { 74, 76 },
                             [131] = { 75, 77 }, [151] = { 74, 76 }, [152] = { 75, 77 }, [235] = { 76, 76 },
                             [268] = { 74, 76 }, [275] = { 74, 76 }, [301] = { 74, 76 }, [308] = { 74, 76 } },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            drops  = {
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, item = 1818 },  -- euvhi organ
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
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 3621, [75] = 3688, [76] = 3756, [77] = 3823 }, mp = { [74] = 0, [75] = 0, [76] = 0, [77] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[58],
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern war',
            ids    = { 83, 113, 132, 251, 252, 276, 309 },
            levels = {
                [79] = { acc = 341, eva = 324, agi = 87, int = 75, mnd = 75, chr = 83, dex = 91, def = 339,
                         attack_skill = 276 },
                [80] = { acc = 346, eva = 329, agi = 87, int = 75, mnd = 75, chr = 83, dex = 91, def = 344,
                         attack_skill = 281 },
                [81] = { acc = 354, eva = 335, agi = 90, int = 78, mnd = 78, chr = 85, dex = 94, def = 349,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 340, agi = 90, int = 78, mnd = 78, chr = 85, dex = 94, def = 354,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4452, [80] = 4527, [81] = 4603, [82] = 4679 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[77],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern mnk',
            ids    = { 84, 85, 141, 154, 253, 320, 321 },
            job    = 'mnk/mnk',
            levels = {
                [79] = { acc = 344, eva = 322, agi = 66, int = 69, mnd = 89, chr = 83, dex = 97, def = 339,
                         attack_skill = 276 },
                [80] = { acc = 349, eva = 327, agi = 66, int = 69, mnd = 89, chr = 83, dex = 97, def = 344,
                         attack_skill = 281 },
                [81] = { acc = 357, eva = 332, agi = 69, int = 72, mnd = 91, chr = 85, dex = 100, def = 349,
                         attack_skill = 287 },
                [82] = { acc = 363, eva = 337, agi = 69, int = 72, mnd = 91, chr = 85, dex = 100, def = 354,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4721, [80] = 4798, [81] = 4875, [82] = 4952 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = danger[79], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern blm',
            ids    = { 86, 123, 124, 161, 254, 295, 327 },
            job    = 'blm/blm',
            levels = {
                [79] = { acc = 341, eva = 299, agi = 87, int = 110, mnd = 83, chr = 89, dex = 91, def = 322,
                         attack_skill = 276 },
                [80] = { acc = 346, eva = 304, agi = 87, int = 110, mnd = 83, chr = 89, dex = 91, def = 327,
                         attack_skill = 281 },
                [81] = { acc = 354, eva = 310, agi = 90, int = 112, mnd = 85, chr = 91, dex = 94, def = 332,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 315, agi = 90, int = 112, mnd = 85, chr = 91, dex = 94, def = 337,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 3967, [80] = 4036, [81] = 4105, [82] = 4174 }, mp = { [79] = 9999, [80] = 9999, [81] = 9999, [82] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Flare: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Tornado: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Quake: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burst: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flood: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga II: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga II: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[82], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[85], level_ranges = { { 60, 255 } } }, { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[85], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[85], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[85], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[85], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[85], level_ranges = { { 58, 255 } } }, { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } }, level_ranges = { { 72, 255 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = danger[83], categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = danger[83], categories = { 'debuff' }, effects = { 'Frost' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = danger[83], categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = danger[83], categories = { 'debuff' }, effects = { 'Rasp' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = danger[83], categories = { 'debuff' }, effects = { 'Shock' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = danger[83], categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[83], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[85], level_ranges = { { 12, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[83], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[85], level_ranges = { { 25, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[86], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[88], level_ranges = { { 45, 255 } } }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[83], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[90], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[91], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[93], level_ranges = { { 7, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[94], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[85], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = danger[94], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 56, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern rdm',
            ids    = { 87, 142, 143, 155, 255, 322 },
            job    = 'rdm/rdm',
            levels = {
                [79] = { acc = 338, eva = 309, agi = 74, int = 96, mnd = 96, chr = 89, dex = 84, def = 326,
                         attack_skill = 276 },
                [80] = { acc = 343, eva = 314, agi = 74, int = 96, mnd = 96, chr = 89, dex = 84, def = 331,
                         attack_skill = 281 },
                [81] = { acc = 350, eva = 319, agi = 76, int = 99, mnd = 99, chr = 91, dex = 86, def = 336,
                         attack_skill = 287 },
                [82] = { acc = 356, eva = 324, agi = 76, int = 99, mnd = 99, chr = 91, dex = 86, def = 341,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4180, [80] = 4252, [81] = 4324, [82] = 4395 }, mp = { [79] = 9999, [80] = 9999, [81] = 9999, [82] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Diaga II: Dia. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Slow: slow. Possible effects: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Paralyze: paralysis. Possible effects: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Gravity: Weight. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dispel: removes a buff. Possible effects: Buff removal. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[98], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = danger[83], categories = { 'debuff' }, effects = { 'Dia' }, details = danger[102], level_ranges = { { 55, 255 } } }, danger[106], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = danger[107], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[109], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = danger[110], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[112], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = danger[83], categories = { 'debuff' }, effects = { 'Weight' }, details = danger[116], level_ranges = { { 21, 255 } } }, danger[119], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[83], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[90], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[91], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[93], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[94], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[85], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[85], level_ranges = { { 32, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern smn',
            ids    = { 88, 137, 146, 256, 313, 314 },
            job    = 'smn/smn',
            levels = {
                [79] = { acc = 335, eva = 296, agi = 80, int = 102, mnd = 102, chr = 102, dex = 78, def = 322,
                         attack_skill = 276 },
                [80] = { acc = 340, eva = 301, agi = 80, int = 102, mnd = 102, chr = 102, dex = 78, def = 327,
                         attack_skill = 281 },
                [81] = { acc = 347, eva = 306, agi = 82, int = 105, mnd = 105, chr = 105, dex = 80, def = 332,
                         attack_skill = 287 },
                [82] = { acc = 353, eva = 311, agi = 82, int = 105, mnd = 105, chr = 105, dex = 80, def = 337,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 3861, [80] = 3928, [81] = 3996, [82] = 4064 }, mp = { [79] = 10059, [80] = 10059, [81] = 10059, [82] = 10059 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Elemental',
            ids    = { 89, 138, 148, 257, 315, 316 },
            job    = 'drk/rdm',
            levels = {
                [63] = { acc = 249, eva = 233, agi = 58, int = 66, mnd = 52, chr = 50, dex = 64, def = 243,
                         attack_skill = 207 },
                [64] = { acc = 255, eva = 239, agi = 60, int = 68, mnd = 53, chr = 51, dex = 66, def = 249,
                         attack_skill = 210 },
                [65] = { acc = 260, eva = 244, agi = 61, int = 68, mnd = 53, chr = 51, dex = 66, def = 254,
                         attack_skill = 214 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [63] = 1041, [64] = 1065, [65] = 1089 }, mp = { [63] = 1799, [64] = 1831, [65] = 1862 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[120], { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[85], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[85], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[88], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[93], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[85], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[124], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[128], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[132], level_ranges = { { 35, 255 } } }, { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[136], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[140], level_ranges = { { 39, 255 } } }, { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[144], level_ranges = { { 31, 255 } } }, { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[148], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[85], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[95] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Indoor aern thf',
            ids    = { 93, 135, 144, 260, 261, 311 },
            job    = 'thf/thf',
            levels = {
                [79] = { acc = 348, eva = 392, agi = 93, int = 96, mnd = 69, chr = 69, dex = 105, def = 329,
                         attack_skill = 276 },
                [80] = { acc = 353, eva = 397, agi = 93, int = 96, mnd = 69, chr = 69, dex = 105, def = 334,
                         attack_skill = 281 },
                [81] = { acc = 360, eva = 404, agi = 96, int = 99, mnd = 72, chr = 72, dex = 107, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 366, eva = 409, agi = 96, int = 99, mnd = 72, chr = 72, dex = 107, def = 344,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4180, [80] = 4252, [81] = 4324, [82] = 4395 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[82] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[7] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern pld',
            ids    = { 94, 105, 114, 162, 163, 262, 277, 328 },
            job    = 'pld/pld',
            levels = {
                [79] = { acc = 335, eva = 311, agi = 60, int = 69, mnd = 96, chr = 96, dex = 78, def = 387,
                         attack_skill = 276 },
                [80] = { acc = 340, eva = 316, agi = 60, int = 69, mnd = 96, chr = 96, dex = 78, def = 392,
                         attack_skill = 281 },
                [81] = { acc = 347, eva = 321, agi = 63, int = 72, mnd = 99, chr = 99, dex = 80, def = 397,
                         attack_skill = 287 },
                [82] = { acc = 353, eva = 326, agi = 63, int = 72, mnd = 99, chr = 99, dex = 80, def = 402,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4347, [80] = 4421, [81] = 4495, [82] = 4570 }, mp = { [79] = 9999, [80] = 9999, [81] = 9999, [82] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[98], { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = danger[83], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[150], level_ranges = { { 37, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern rng',
            ids    = { 95, 96, 126, 158, 263, 298, 324 },
            job    = 'rng/rng',
            levels = {
                [79] = { acc = 386, eva = 306, agi = 101, int = 83, mnd = 89, chr = 83, dex = 84, def = 329,
                         attack_skill = 276 },
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
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4074, [80] = 4144, [81] = 4215, [82] = 4285 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[77],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern nin',
            ids    = { 97, 116, 117, 166, 264, 279, 331 },
            job    = 'nin/nin',
            levels = {
                [79] = { acc = 344, eva = 344, agi = 93, int = 89, mnd = 69, chr = 75, dex = 97, def = 332,
                         attack_skill = 276 },
                [80] = { acc = 349, eva = 349, agi = 93, int = 89, mnd = 69, chr = 75, dex = 97, def = 337,
                         attack_skill = 281 },
                [81] = { acc = 357, eva = 356, agi = 96, int = 91, mnd = 72, chr = 78, dex = 100, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 363, eva = 361, agi = 96, int = 91, mnd = 72, chr = 78, dex = 100, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4180, [80] = 4252, [81] = 4324, [82] = 4395 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hyoton Ni: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Huton Ni: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Doton Ni: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Raiton Ni: Earth magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Suiton Ni: Thunder magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Jubaku Ni: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Hojo Ni: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Dokumori Ni: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[78], { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[152], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[152], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[152], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[152], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[152], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = danger[83], categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[152], level_ranges = { { 40, 255 } } }, { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = danger[83], categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } }, level_ranges = { { 65, 255 } } }, { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = danger[83], categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[42] }, level_ranges = { { 48, 255 } } }, { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = danger[83], categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } }, level_ranges = { { 56, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern drg',
            ids    = { 98, 118, 159, 265, 280, 281, 325 },
            job    = 'drg/drg',
            levels = {
                [79] = { acc = 360, eva = 329, agi = 80, int = 75, mnd = 83, chr = 96, dex = 84, def = 332,
                         attack_skill = 276 },
                [80] = { acc = 365, eva = 334, agi = 80, int = 75, mnd = 83, chr = 96, dex = 84, def = 337,
                         attack_skill = 281 },
                [81] = { acc = 372, eva = 339, agi = 82, int = 78, mnd = 85, chr = 99, dex = 86, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 378, eva = 344, agi = 82, int = 78, mnd = 85, chr = 99, dex = 86, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4452, [80] = 4527, [81] = 4603, [82] = 4679 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Wynav',
            ids    = { 99, 119, 160, 266, 282, 283, 326 },
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 56, mnd = 46, chr = 52, dex = 70, def = 254,
                         attack_skill = 207 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 57, mnd = 46, chr = 52, dex = 72, def = 260,
                         attack_skill = 210 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 59, mnd = 49, chr = 55, dex = 72, def = 265,
                         attack_skill = 214 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep' },
            info = {
                family = { value = 'Wynav / Luminian', notes = { 'Source species: Wynav (ID 324); family ID 135.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [63] = 1082, [64] = 1107, [65] = 1132 }, mp = { [63] = 0, [64] = 0, [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern whm',
            ids    = { 104, 122, 133, 134, 294, 310 },
            job    = 'whm/whm',
            levels = {
                [79] = { acc = 331, eva = 293, agi = 74, int = 83, mnd = 110, chr = 96, dex = 70, def = 329,
                         attack_skill = 276 },
                [80] = { acc = 336, eva = 298, agi = 74, int = 83, mnd = 110, chr = 96, dex = 70, def = 334,
                         attack_skill = 281 },
                [81] = { acc = 343, eva = 303, agi = 76, int = 85, mnd = 112, chr = 99, dex = 73, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 349, eva = 308, agi = 76, int = 85, mnd = 112, chr = 99, dex = 73, def = 344,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4074, [80] = 4144, [81] = 4215, [82] = 4285 }, mp = { [79] = 9999, [80] = 9999, [81] = 9999, [82] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Diaga II: Dia. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Slow: slow. Possible effects: Slow. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Paralyze: paralysis. Possible effects: Paralysis. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = danger[83], categories = { 'debuff' }, effects = { 'Dia' }, details = danger[102], level_ranges = { { 60, 255 } } }, danger[106], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = danger[107], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[109], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = danger[110], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[112], level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = danger[83], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[150], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern bst',
            ids    = { 106, 145, 164, 329 },
            job    = 'bst/bst',
            levels = {
                [79] = { acc = 341, eva = 314, agi = 66, int = 83, mnd = 83, chr = 110, dex = 91, def = 329,
                         attack_skill = 276 },
                [80] = { acc = 346, eva = 319, agi = 66, int = 83, mnd = 83, chr = 110, dex = 91, def = 334,
                         attack_skill = 281 },
                [81] = { acc = 354, eva = 324, agi = 69, int = 85, mnd = 85, chr = 112, dex = 94, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 329, agi = 69, int = 85, mnd = 85, chr = 112, dex = 94, def = 344,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4347, [80] = 4421, [81] = 4495, [82] = 4570 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[77],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Indoor aern brd',
            ids    = { 107, 115, 156, 157, 278, 323 },
            job    = 'brd/brd',
            levels = {
                [79] = { acc = 338, eva = 305, agi = 66, int = 89, mnd = 89, chr = 102, dex = 84, def = 329,
                         attack_skill = 276 },
                [80] = { acc = 343, eva = 310, agi = 66, int = 89, mnd = 89, chr = 102, dex = 84, def = 334,
                         attack_skill = 281 },
                [81] = { acc = 350, eva = 315, agi = 69, int = 91, mnd = 91, chr = 105, dex = 86, def = 339,
                         attack_skill = 287 },
                [82] = { acc = 356, eva = 320, agi = 69, int = 91, mnd = 91, chr = 105, dex = 86, def = 344,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4180, [80] = 4252, [81] = 4324, [82] = 4395 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Disseverment: Poison; Foe Requiem VI: Requiem; Horde Lullaby: Sleep; Carnage Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Disseverment: Poison. Source targeting: single target.', 'Foe Requiem VI: Requiem. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Horde Lullaby: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Carnage Elegy: Elegy. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Magic Finale: Buff removal. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Foe Lullaby: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[82], { kind = 'spell', id = 373, name = 'Foe Requiem VI', summary = 'Foe Requiem VI: Requiem', notes = danger[83], categories = { 'debuff' }, effects = { 'Requiem' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 67, 255 } } }, { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = danger[83], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 422, name = 'Carnage Elegy', summary = 'Carnage Elegy: Elegy', notes = danger[83], categories = { 'debuff' }, effects = { 'Elegy' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 59, 255 } } }, { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = danger[83], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[85], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = danger[83], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[85], level_ranges = { { 16, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'Disseverment', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 611, name = 'Disseverment', level = 72, min_skill = 230, skill_ids = { 1384 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern sam',
            ids    = { 108, 109, 127, 165, 299, 330 },
            job    = 'sam/sam',
            levels = {
                [79] = { acc = 341, eva = 329, agi = 80, int = 83, mnd = 83, chr = 89, dex = 91, def = 332,
                         attack_skill = 276 },
                [80] = { acc = 346, eva = 334, agi = 80, int = 83, mnd = 83, chr = 89, dex = 91, def = 337,
                         attack_skill = 281 },
                [81] = { acc = 354, eva = 339, agi = 82, int = 85, mnd = 85, chr = 91, dex = 94, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 344, agi = 82, int = 85, mnd = 85, chr = 91, dex = 94, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4452, [80] = 4527, [81] = 4603, [82] = 4679 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[159],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aerns Euvhi',
            ids    = { 110, 147, 167, 332 },
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 67, dex = 70, def = 252,
                         attack_skill = 207 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 67, dex = 72, def = 258,
                         attack_skill = 210 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 70, dex = 72, def = 263,
                         attack_skill = 214 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = 12.5 },
            links  = 1,
            info = {
                family = { value = 'Euvhi / Luminian', notes = { 'Source species: Euvhi (ID 321); family ID 132.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [63] = 865, [64] = 885, [65] = 905 }, mp = { [63] = 0, [64] = 0, [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[58],
                blue = { value = 'Vertical Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 617, name = 'Vertical Cleave', level = 75, min_skill = 245, skill_ids = { 1447 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Indoor aern drk',
            ids    = { 125, 136, 296, 297, 312 },
            job    = 'drk/drk',
            levels = {
                [79] = { acc = 341, eva = 321, agi = 80, int = 96, mnd = 69, chr = 69, dex = 91, def = 332,
                         attack_skill = 276 },
                [80] = { acc = 346, eva = 326, agi = 80, int = 96, mnd = 69, chr = 69, dex = 91, def = 337,
                         attack_skill = 281 },
                [81] = { acc = 354, eva = 331, agi = 82, int = 99, mnd = 72, chr = 72, dex = 94, def = 343,
                         attack_skill = 287 },
                [82] = { acc = 360, eva = 336, agi = 82, int = 99, mnd = 72, chr = 72, dex = 94, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [79] = 4347, [80] = 4421, [81] = 4495, [82] = 4570 }, mp = { [79] = 9999, [80] = 9999, [81] = 9999, [82] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Str: STR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Dex: DEX down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Vit: VIT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Agi: AGI down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Int: INT down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Mnd: MND down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Chr: CHR down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Absorb-Tp: TP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted spell argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[98], danger[119], { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[83], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[85], level_ranges = { { 10, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[83], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[85], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = danger[86], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[88], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = danger[91], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[93], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[94], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[85], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = danger[83], categories = { 'debuff' }, effects = { 'STR down' }, details = danger[124], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = danger[83], categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[128], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = danger[83], categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[132], level_ranges = { { 35, 255 } } }, { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = danger[83], categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[136], level_ranges = { { 37, 255 } } }, { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = danger[83], categories = { 'debuff' }, effects = { 'INT down' }, details = danger[140], level_ranges = { { 39, 255 } } }, { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = danger[83], categories = { 'debuff' }, effects = { 'MND down' }, details = danger[144], level_ranges = { { 31, 255 } } }, { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = danger[83], categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[148], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = danger[83], categories = { 'drain' }, effects = { 'TP drain' }, details = danger[85], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[95] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ixghrah',
            ids    = { 333 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66, dex = 85, def = 322,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 313, agi = 85, int = 60, mnd = 60, chr = 66, dex = 85, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_defense = true },
            info = {
                family = { value = 'Ghrah / Luminion', notes = { 'Source species: Bird Ghrah (ID 328); family ID 138.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [76] = 7200, [77] = 7200 }, mp = { [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Regen 30', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Actinic Burst: Flash', notes = { 'Actinic Burst: Flash. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Mighty Strikes is possible in spider form at the special-ability threshold.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' }, entries = { danger[4] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.' }, general_notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Mighty Strikes is possible in spider form at the special-ability threshold.' } },
                blue = { value = 'Actinic Burst', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 612, name = 'Actinic Burst', level = 74, min_skill = 240, skill_ids = { 1441 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Jailer of Temperance',
            ids    = { 334 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [85] = { acc = 377, eva = 368, agi = 80, int = 74, mnd = 74, chr = 85, dex = 92, def = 311,
                         attack_skill = 311 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            weapon_dmg = { blunt = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'stun', 'paralyze', 'slow', 'elegy', 'blind', 'petrify',
                       'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1850 },  -- first virtue
                { rate = 1000, item = 17948 },  -- temperance axe
                { rate = 100, item = 15513 },  -- temperance torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Zdei / Luminion', notes = { 'Source species: Zdei (ID 331); family ID 139.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [85] = 20000 }, mp = { [85] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Store TP 110', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.' }, general_notes = danger[7] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'A scripted move chooser return is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.' }, incomplete = true },
            },
        },
        {
            name   = 'Ixaern mnk',
            ids    = { 335 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [83] = { acc = 369, eva = 342, agi = 69, int = 73, mnd = 92, chr = 86, dex = 100, def = 360,
                         attack_skill = 299 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun', 'paralyze', 'blind', 'terror' },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_drops = true },
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [83] = 11862 }, mp = { [83] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Counter 10; Store TP 100', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Sideswipe: can crit', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Sideswipe: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = danger[79], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Qnaern rdm',
            ids    = { 336 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [80] = { acc = 343, eva = 314, agi = 74, int = 96, mnd = 96, chr = 89, dex = 84, def = 331,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'terror' },
            links  = 4,
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 6750 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 45', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Glacier Splitter: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Glacier Splitter: Paralysis. Random effects may not all happen on the same use. Source targeting: single target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Some job-special buff choices depend on script values that could not be resolved.', 'A scripted move argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], danger[98], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[102], level_ranges = { { 55, 255 } } }, danger[160], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[109], level_ranges = { { 6, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[112], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[116], level_ranges = { { 21, 255 } } }, danger[120], { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[90], level_ranges = { { 8, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[93], level_ranges = { { 11, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[85], level_ranges = { { 46, 255 } } }, { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[85], level_ranges = { { 32, 255 } } } }, coverage = 'partial', incomplete = true, reasons = danger[161], general_notes = danger[162] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Qnaern whm',
            ids    = { 337 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [80] = { acc = 336, eva = 298, agi = 74, int = 83, mnd = 110, chr = 96, dex = 70, def = 334,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'terror' },
            links  = 4,
            info = {
                family = { value = 'Aern / Luminian', notes = { 'Source species: Aern (ID 320); family ID 131.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 6750 }, mp = { [80] = 2342 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 45; Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Wing Thrust: Slow; Auroral Wind: Silence; Impact Stream: Defense down, Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Wing Thrust: Slow. Random effects may not all happen on the same use. Source targeting: single target.', 'Auroral Wind: Silence. Random effects may not all happen on the same use. Source targeting: cone.', 'Impact Stream: Defense down, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Some job-special buff choices depend on script values that could not be resolved.', 'A scripted move argument is not resolved.' }, entries = { danger[63], danger[66], danger[71], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[102], level_ranges = { { 60, 255 } } }, danger[160], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[109], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[112], level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[150], level_ranges = { { 45, 255 } } } }, coverage = 'partial', incomplete = true, reasons = danger[161], general_notes = danger[162] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
