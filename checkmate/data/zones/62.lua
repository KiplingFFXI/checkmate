-- Halvung (zone 62).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Kibosh: Amnesia. Source targeting: single target.', 'Sandspray: Blindness. Source targeting: cone.', 'Faze: Terror. The gaze effect requires the target to face the monster. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[3] = { notes = danger[2], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[4] = { kind = 'skill', id = 1725, name = 'Kibosh', summary = 'Kibosh: Amnesia', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Amnesia' }, details = danger[3] };
danger[5] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 7 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[6] = { notes = danger[5], unknown = {  }, activation_range = 7.0, shape = 'front cone', cone_length = 7.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[7] = { kind = 'skill', id = 1727, name = 'Sandspray', summary = 'Sandspray: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[6] };
danger[8] = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' };
danger[9] = { kind = 'skill', id = 1728, name = 'Faze', summary = 'Faze: Terror', notes = danger[8], categories = { 'debuff' }, effects = { 'Terror' }, details = danger[3] };
danger[10] = { danger[4], danger[7], danger[9] };
danger[11] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[12] = { value = 'Kibosh: Amnesia; Sandspray: Blindness; Faze: Terror', notes = danger[1], entries = danger[10], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] };
danger[13] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[14] = { danger[13] };
danger[15] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[16] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[17] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[18] = { notes = danger[17], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[19] = { kind = 'skill', id = 1896, name = 'Rock Smash', summary = 'Rock Smash: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[18] };
danger[20] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down, Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[21] = { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[22] = { danger[15], danger[21] };
danger[23] = { notes = danger[20], unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'ignore' } }, removals = danger[22] };
danger[24] = { kind = 'skill', id = 1898, name = 'Enervation', summary = 'Enervation: Defense down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down', 'Magic defense down' }, details = danger[23] };
danger[25] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[26] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[27] = { notes = danger[25], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[26] };
danger[28] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[27], level_ranges = { { 37, 255 } } };
danger[29] = { danger[19], danger[24], danger[28] };
danger[30] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[31] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Flash: Flash', notes = danger[16], entries = danger[29], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] };
danger[32] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[33] = { kind = 'skill', id = 1743, name = 'Rock Smash', summary = 'Rock Smash: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[18] };
danger[34] = { kind = 'skill', id = 1745, name = 'Enervation', summary = 'Enervation: Defense down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down', 'Magic defense down' }, details = danger[23] };
danger[35] = { danger[33], danger[34] };
danger[36] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down', notes = danger[32], entries = danger[35], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] };
danger[37] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[38] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[39] = { notes = danger[38], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[40] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[39], level_ranges = { { 46, 255 } } };
danger[41] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[42] = { notes = danger[41], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[43] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[42], level_ranges = { { 10, 255 } } };
danger[44] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[42], level_ranges = { { 20, 255 } } };
danger[45] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[46] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[47] = { notes = danger[45], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[46] };
danger[48] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[47], level_ranges = { { 37, 255 } } };
danger[49] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[50] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[51] = { danger[50] };
danger[52] = { notes = danger[49], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[51] };
danger[53] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[52], level_ranges = { { 20, 255 } } };
danger[54] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[42], level_ranges = { { 56, 255 } } };
danger[55] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[57] = { danger[56] };
danger[58] = { notes = danger[55], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[57] };
danger[59] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[58], level_ranges = { { 43, 255 } } };
danger[60] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { danger[61] };
danger[63] = { notes = danger[60], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[62] };
danger[64] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[63], level_ranges = { { 41, 255 } } };
danger[65] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[66] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[67] = { danger[66] };
danger[68] = { notes = danger[65], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[67] };
danger[69] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[68], level_ranges = { { 35, 255 } } };
danger[70] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[71] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[72] = { danger[71] };
danger[73] = { notes = danger[70], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[72] };
danger[74] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[73], level_ranges = { { 37, 255 } } };
danger[75] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[76] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[77] = { danger[76] };
danger[78] = { notes = danger[75], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[77] };
danger[79] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[78], level_ranges = { { 39, 255 } } };
danger[80] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[81] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[82] = { danger[81] };
danger[83] = { notes = danger[80], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[82] };
danger[84] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[83], level_ranges = { { 31, 255 } } };
danger[85] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[86] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[87] = { danger[86] };
danger[88] = { notes = danger[85], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[87] };
danger[89] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[88], level_ranges = { { 33, 255 } } };
danger[90] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[42], level_ranges = { { 45, 255 } } };
danger[91] = { danger[19], danger[24], danger[40], danger[43], danger[44], danger[48], danger[53], danger[54], danger[59], danger[64], danger[69], danger[74], danger[79], danger[84], danger[89], danger[90] };
danger[92] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[37], entries = danger[91], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] };
danger[93] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[94] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[95] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[96] = { danger[95] };
danger[97] = { notes = danger[94], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[96] };
danger[98] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[97], level_ranges = { { 55, 255 } } };
danger[99] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[100] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[101] = { danger[100] };
danger[102] = { notes = danger[99], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[101] };
danger[103] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[102], level_ranges = { { 13, 255 } } };
danger[104] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[105] = { notes = danger[104], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[106] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[105], level_ranges = { { 6, 255 } } };
danger[107] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[108] = { notes = danger[107], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[109] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[108], level_ranges = { { 18, 255 } } };
danger[110] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[111] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[112] = { danger[111] };
danger[113] = { notes = danger[110], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[112] };
danger[114] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[113], level_ranges = { { 21, 255 } } };
danger[115] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[116] = { notes = danger[115], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[117] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[116], level_ranges = { { 8, 255 } } };
danger[118] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[52], level_ranges = { { 11, 255 } } };
danger[119] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[42], level_ranges = { { 46, 255 } } };
danger[120] = { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[42], level_ranges = { { 32, 255 } } };
danger[121] = { danger[33], danger[34], danger[98], danger[103], danger[106], danger[109], danger[114], danger[40], danger[117], danger[118], danger[119], danger[120] };
danger[122] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = danger[93], entries = danger[121], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] };
danger[123] = { danger[19], danger[24] };
danger[124] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down', notes = danger[32], entries = danger[123], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] };
danger[125] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[42], level_ranges = { { 54, 255 } } };
danger[126] = { 'Boiling Point: Magic defense down. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[127] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[128] = { danger[21] };
danger[129] = { notes = danger[127], unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[128] };
danger[130] = { kind = 'skill', id = 1822, name = 'Boiling Point', summary = 'Boiling Point: Magic defense down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Magic defense down' }, details = danger[129] };
danger[131] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[42], level_ranges = { { 60, 255 } } };
danger[132] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[42], level_ranges = { { 50, 255 } } };
danger[133] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[42], level_ranges = { { 52, 255 } } };
danger[134] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[42], level_ranges = { { 56, 255 } } };
danger[135] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[42], level_ranges = { { 58, 255 } } };
danger[136] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[137] = { notes = danger[136], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[138] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[137], level_ranges = { { 72, 255 } } };
danger[139] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[140] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[141] = { danger[140] };
danger[142] = { notes = danger[139], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[141] };
danger[143] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[142], level_ranges = { { 24, 255 } } };
danger[144] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[145] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[146] = { danger[145] };
danger[147] = { notes = danger[144], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[146] };
danger[148] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[147], level_ranges = { { 22, 255 } } };
danger[149] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[150] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[151] = { danger[150] };
danger[152] = { notes = danger[149], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[151] };
danger[153] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[152], level_ranges = { { 20, 255 } } };
danger[154] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[155] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[156] = { danger[155] };
danger[157] = { notes = danger[154], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[156] };
danger[158] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[157], level_ranges = { { 18, 255 } } };
danger[159] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[160] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[161] = { danger[160] };
danger[162] = { notes = danger[159], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[161] };
danger[163] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[162], level_ranges = { { 16, 255 } } };
danger[164] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[165] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[166] = { danger[165] };
danger[167] = { notes = danger[164], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[166] };
danger[168] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[167], level_ranges = { { 27, 255 } } };
danger[169] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[42], level_ranges = { { 12, 255 } } };
danger[170] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[42], level_ranges = { { 25, 255 } } };
danger[171] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[47], level_ranges = { { 45, 255 } } };
danger[172] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[116], level_ranges = { { 4, 255 } } };
danger[173] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[52], level_ranges = { { 7, 255 } } };
danger[174] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[42], level_ranges = { { 41, 255 } } };
danger[175] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[176] = { notes = danger[175], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[177] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[176], level_ranges = { { 56, 255 } } };
danger[178] = { danger[130], danger[131], danger[132], danger[133], danger[125], danger[134], danger[135], danger[138], danger[143], danger[148], danger[153], danger[158], danger[163], danger[168], danger[169], danger[170], danger[171], danger[172], danger[173], danger[174], danger[177] };
danger[179] = { value = 'Boiling Point: Magic defense down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[126], entries = danger[178], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] };
danger[180] = { 'Vitriolic Spray: Burn. Source targeting: cone.', 'Thermal Pulse: Blindness. Source targeting: area around the monster.', 'Vitriolic Shower: Burn. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[181] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[182] = { notes = danger[181], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[141] };
danger[183] = { kind = 'skill', id = 1816, name = 'Vitriolic Spray', summary = 'Vitriolic Spray: Burn', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[182] };
danger[184] = { 'Normal activation range: 12.5 yalms. This is the move selection limit, not its affected area.', 'Area: 12.5 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[185] = { notes = danger[184], unknown = {  }, activation_range = 12.5, shape = 'area around the monster', effect_radius = 12.5, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[186] = { kind = 'skill', id = 1817, name = 'Thermal Pulse', summary = 'Thermal Pulse: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[185] };
danger[187] = { kind = 'skill', id = 1820, name = 'Vitriolic Shower', summary = 'Vitriolic Shower: Burn', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[182] };
danger[188] = { danger[183], danger[186], danger[187] };
danger[189] = { value = 'Vitriolic Spray: Burn; Thermal Pulse: Blindness; Vitriolic Shower: Burn', notes = danger[180], entries = danger[188], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] };
danger[190] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[191] = { notes = danger[190], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[46] };
danger[192] = { kind = 'skill', id = 1081, name = 'Frypan', summary = 'Frypan: Stun', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[191] };
danger[193] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[194] = { notes = danger[193], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[195] = { kind = 'skill', id = 1082, name = 'Smokebomb', summary = 'Smokebomb: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[194] };
danger[196] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[197] = { notes = danger[196], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[198] = { kind = 'skill', id = 1086, name = 'Paralysis Shower', summary = 'Paralysis Shower: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[197] };
danger[199] = { 'Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.' };
danger[200] = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[201] = { notes = danger[200], unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[202] = { kind = 'skill', id = 509, name = 'Self-Destruct Bomb', summary = 'Self-Destruct: explosion', notes = danger[199], categories = { 'other' }, effects = {  }, details = danger[201] };
danger[203] = { 'Proboscis: Buff removal, MP drain. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: cone.', 'Erosion Dust: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[204] = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: cone.' };
danger[205] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[206] = { notes = danger[205], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[207] = { kind = 'skill', id = 1953, name = 'Proboscis', summary = 'Proboscis: Buff removal, MP drain', notes = danger[204], categories = { 'dispel', 'drain' }, effects = { 'Buff removal', 'MP drain' }, details = danger[206] };
danger[208] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[209] = { notes = danger[208], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[96] };
danger[210] = { kind = 'skill', id = 1954, name = 'Erosion Dust', summary = 'Erosion Dust: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[209] };
danger[211] = { danger[207], danger[210] };
danger[212] = { value = 'Proboscis: Buff removal, MP drain; Erosion Dust: Dia', notes = danger[203], entries = danger[211], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] };
danger[213] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Qiqirn Diamantaire', 'Qiqirn Mercenary' } },
        [2] = { sight = { 'Qiqirn Mercenary' } },
        [3] = { sound = { 'Purgatory Bat', 'Volcanic Bats' } },
        [4] = {
            sight = { 'Troll Cameist', 'Troll Cuirasser', 'Troll Engraver', 'Troll Gemologist', 'Troll Ironworker',
                      'Troll Lapidarist', 'Troll Smelter', 'Troll Stoneworker' },
            true_sight = { 'Troll Artilleryman', 'Troll Combatant', 'Troll Grenadier', 'Troll Machinist',
                           'Troll Scrimer', 'Troll Targeteer' },
        },
        [5] = { sound = { 'Wamouracampa' }, true_sound = { 'Wamoura' } },
        [6] = { sound = { 'Magmatic Eruca' } },
        [7] = { sight = { 'Moblin Billionaire', 'Moblin Millionaire' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Magmatic Eruca'] = { id = 186, name = 'Crawler' },
        ['Moblin Billionaire'] = { id = 58, name = 'Goblin' },
        ['Moblin Millionaire'] = { id = 58, name = 'Goblin' },
        ['Purgatory Bat'] = { id = 77, name = 'Bat' },
        ['Qiqirn Diamantaire'] = { id = 66, name = 'Qiqirn' },
        ['Qiqirn Mercenary'] = { id = 66, name = 'Qiqirn' },
        ['Troll Artilleryman'] = { id = 72, name = 'Troll' },
        ['Troll Cameist'] = { id = 72, name = 'Troll' },
        ['Troll Combatant'] = { id = 72, name = 'Troll' },
        ['Troll Cuirasser'] = { id = 72, name = 'Troll' },
        ['Troll Engraver'] = { id = 72, name = 'Troll' },
        ['Troll Gemologist'] = { id = 72, name = 'Troll' },
        ['Troll Grenadier'] = { id = 72, name = 'Troll' },
        ['Troll Ironworker'] = { id = 72, name = 'Troll' },
        ['Troll Lapidarist'] = { id = 72, name = 'Troll' },
        ['Troll Machinist'] = { id = 72, name = 'Troll' },
        ['Troll Scrimer'] = { id = 72, name = 'Troll' },
        ['Troll Smelter'] = { id = 72, name = 'Troll' },
        ['Troll Stoneworker'] = { id = 72, name = 'Troll' },
        ['Troll Targeteer'] = { id = 72, name = 'Troll' },
        ['Volcanic Bats'] = { id = 81, name = 'Flock Bat' },
        ['Wamoura'] = { id = 197, name = 'Wamoura' },
        ['Wamouracampa'] = { id = 198, name = 'Wamouracampa' },
    },
    monsters = {
        {
            name   = 'Qiqirn Mercenary',
            ids    = { 1, 101 },
            job    = 'rng/rng',
            levels = {
                [72] = { acc = 346, eva = 271, agi = 92, int = 60, mnd = 67, chr = 63, dex = 75, def = 287,
                         attack_skill = 241 },
                [73] = { acc = 353, eva = 275, agi = 93, int = 60, mnd = 70, chr = 64, dex = 78, def = 293,
                         attack_skill = 246 },
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
            links  = 1,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3979, [73] = 4058 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[12],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qiqirn Diamantaire',
            ids    = { 2 },
            job    = 'thf/thf',
            levels = {
                [72] = { acc = 308, eva = 353, agi = 84, int = 72, mnd = 51, chr = 51, dex = 95, def = 287,
                         attack_skill = 241 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 72, mnd = 52, chr = 52, dex = 97, def = 293,
                         attack_skill = 246 },
            },
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
            links  = 2,
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4087, [73] = 4167 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[12],
                blue = { value = 'Sandspray', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 621, name = 'Sandspray', level = 66, min_skill = 201, skill_ids = { 1727 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Volcanic Bats',
            ids    = { 4, 7, 13, 14, 46, 51, 100, 102, 103 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63, dex = 75, def = 292,
                         attack_skill = 237 },
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
            links  = 3,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 4108, [70] = 4191, [71] = 4275 }, mp = { [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sonic Boom: Attack down; Slipstream: Accuracy down', notes = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'Slipstream: Accuracy down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1157, name = 'Slipstream', summary = 'Slipstream: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] },
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Purgatory Bat',
            ids    = { 5, 8, 12, 15, 47, 48, 53, 104, 105 },
            levels = {
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
            links  = 3,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4191, [71] = 4275, [72] = 4359 }, mp = { [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Ultrasonics: Evasion down; Blood Drain: HP drain; Subsonics: Defense down; Marrow Drain: MP drain', notes = { 'Ultrasonics: Evasion down. Source targeting: area around the monster.', 'Blood Drain: HP drain. Source targeting: single target.', 'Subsonics: Defense down. Source targeting: area around the monster.', 'Marrow Drain: MP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 392, name = 'Ultrasonics', summary = 'Ultrasonics: Evasion down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[14] } }, { kind = 'skill', id = 394, name = 'Blood Drain', summary = 'Blood Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow behavior changes with script conditions; the following are possible rules.', 'Utsusemi and Blink do not absorb the damage step.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false }, { mode = 'absorb', per_hit = false, count = 1 } } } }, { kind = 'skill', id = 1155, name = 'Subsonics', summary = 'Subsonics: Defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = { danger[15] } } }, { kind = 'skill', id = 1156, name = 'Marrow Drain', summary = 'Marrow Drain: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] },
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Gemologist',
            ids    = { 6, 32, 38, 56, 57, 75, 87, 99, 124, 130, 179, 182, 195 },
            job    = 'pld/pld',
            levels = {
                [71] = { acc = 290, eva = 266, agi = 48, int = 48, mnd = 80, chr = 75, dex = 68, def = 345,
                         attack_skill = 237, resist = { sleep = 20 } },
                [72] = { acc = 295, eva = 271, agi = 48, int = 48, mnd = 80, chr = 75, dex = 68, def = 350,
                         attack_skill = 241, resist = { sleep = 20 } },
                [73] = { acc = 300, eva = 276, agi = 48, int = 48, mnd = 80, chr = 76, dex = 68, def = 356,
                         attack_skill = 246, resist = { sleep = 20 } },
                [74] = { acc = 305, eva = 281, agi = 48, int = 48, mnd = 82, chr = 77, dex = 69, def = 361,
                         attack_skill = 251, resist = { sleep = 20 } },
                [75] = { acc = 311, eva = 286, agi = 49, int = 49, mnd = 82, chr = 77, dex = 70, def = 368,
                         attack_skill = 256, resist = { sleep = 25 } },
            },
            spawn_levels = { [6] = { 73, 73 }, [32] = { 73, 75 }, [38] = { 73, 75 }, [56] = { 73, 75 },
                             [57] = { 73, 75 }, [75] = { 73, 75 }, [87] = { 71, 73 }, [99] = { 73, 75 },
                             [124] = { 73, 75 }, [130] = { 71, 73 }, [179] = { 73, 75 }, [182] = { 73, 75 },
                             [195] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6255, [72] = 6379, [73] = 6502, [74] = 6627, [75] = 6750 }, mp = { [71] = 2053, [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[31],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Stoneworker',
            ids    = { 9, 16, 20, 45, 85, 125, 193, 282 },
            job    = 'mnk/mnk',
            levels = {
                [71] = { acc = 298, eva = 275, agi = 52, int = 48, mnd = 72, chr = 63, dex = 84, def = 297,
                         attack_skill = 237 },
                [72] = { acc = 303, eva = 280, agi = 52, int = 48, mnd = 72, chr = 63, dex = 84, def = 302,
                         attack_skill = 241 },
                [73] = { acc = 309, eva = 286, agi = 54, int = 48, mnd = 74, chr = 64, dex = 86, def = 308,
                         attack_skill = 246 },
                [74] = { acc = 314, eva = 291, agi = 54, int = 48, mnd = 75, chr = 64, dex = 87, def = 313,
                         attack_skill = 251 },
                [75] = { acc = 320, eva = 296, agi = 55, int = 49, mnd = 75, chr = 65, dex = 88, def = 320,
                         attack_skill = 256 },
            },
            spawn_levels = { [9] = { 71, 72 }, [16] = { 73, 75 }, [20] = { 73, 75 }, [45] = { 73, 75 },
                             [85] = { 71, 73 }, [125] = { 73, 75 }, [193] = { 73, 75 }, [282] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6843, [72] = 6972, [73] = 7099, [74] = 7228, [75] = 7356 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Lapidarist',
            ids    = { 10, 26, 40, 58, 73, 79, 89, 123, 131, 183 },
            job    = 'drk/drk',
            levels = {
                [71] = { acc = 296, eva = 274, agi = 64, int = 72, mnd = 56, chr = 51, dex = 80, def = 291,
                         attack_skill = 237, resist = { paralyze = 20 } },
                [72] = { acc = 301, eva = 279, agi = 64, int = 72, mnd = 56, chr = 51, dex = 80, def = 296,
                         attack_skill = 241, resist = { paralyze = 20 } },
                [73] = { acc = 306, eva = 285, agi = 66, int = 72, mnd = 56, chr = 52, dex = 80, def = 302,
                         attack_skill = 246, resist = { paralyze = 20 } },
                [74] = { acc = 312, eva = 290, agi = 66, int = 73, mnd = 57, chr = 52, dex = 82, def = 307,
                         attack_skill = 251, resist = { paralyze = 20 } },
                [75] = { acc = 317, eva = 295, agi = 67, int = 74, mnd = 57, chr = 52, dex = 82, def = 313,
                         attack_skill = 256, resist = { paralyze = 25 } },
            },
            spawn_levels = { [10] = { 71, 73 }, [26] = { 73, 75 }, [40] = { 73, 75 }, [58] = { 73, 75 },
                             [73] = { 73, 75 }, [79] = { 71, 73 }, [89] = { 71, 73 }, [123] = { 73, 75 },
                             [131] = { 71, 73 }, [183] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6255, [72] = 6379, [73] = 6502, [74] = 6627, [75] = 6750 }, mp = { [71] = 2053, [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[92],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Smelter',
            ids    = { 11, 25, 37, 61, 185, 196 },
            job    = 'rng/rng',
            levels = {
                [71] = { acc = 340, eva = 262, agi = 84, int = 60, mnd = 72, chr = 63, dex = 72, def = 287,
                         attack_skill = 237 },
                [72] = { acc = 345, eva = 267, agi = 84, int = 60, mnd = 72, chr = 63, dex = 72, def = 292,
                         attack_skill = 241 },
                [73] = { acc = 351, eva = 271, agi = 85, int = 60, mnd = 74, chr = 64, dex = 74, def = 299,
                         attack_skill = 246 },
                [74] = { acc = 356, eva = 276, agi = 85, int = 60, mnd = 75, chr = 64, dex = 75, def = 304,
                         attack_skill = 251 },
                [75] = { acc = 361, eva = 282, agi = 88, int = 62, mnd = 75, chr = 65, dex = 75, def = 309,
                         attack_skill = 256 },
            },
            spawn_levels = { [11] = { 71, 73 }, [25] = { 73, 75 }, [37] = { 73, 75 }, [61] = { 73, 75 },
                             [185] = { 71, 73 }, [196] = { 71, 73 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 5851, [72] = 5968, [73] = 6087, [74] = 6204, [75] = 6321 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Engraver',
            ids    = { 17, 29, 63, 76, 128, 134, 175, 186, 191 },
            job    = 'pup/pup',
            levels = {
                [71] = { acc = 298, eva = 320, agi = 72, int = 60, mnd = 60, chr = 75, dex = 84, def = 287,
                         attack_skill = 237 },
                [72] = { acc = 303, eva = 325, agi = 72, int = 60, mnd = 60, chr = 75, dex = 84, def = 292,
                         attack_skill = 241 },
                [73] = { acc = 309, eva = 330, agi = 72, int = 60, mnd = 62, chr = 76, dex = 86, def = 299,
                         attack_skill = 246 },
                [74] = { acc = 314, eva = 335, agi = 73, int = 60, mnd = 63, chr = 77, dex = 87, def = 304,
                         attack_skill = 251 },
                [75] = { acc = 320, eva = 341, agi = 74, int = 62, mnd = 63, chr = 77, dex = 88, def = 309,
                         attack_skill = 256 },
            },
            spawn_levels = { [17] = { 73, 75 }, [29] = { 73, 75 }, [63] = { 73, 75 }, [76] = { 71, 73 },
                             [128] = { 71, 73 }, [134] = { 71, 73 }, [175] = { 73, 75 }, [186] = { 73, 75 },
                             [191] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 2333 },  -- puppetmasters testimony
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6010, [72] = 6130, [73] = 6250, [74] = 6369, [75] = 6489 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 380', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Trolls Automaton',
            ids    = { 18, 30, 64, 77, 129, 135, 176, 187, 192, 235, 258, 271, 304, 311, 336, 346, 358, 373, 383 },
            levels = {
                [69] = { acc = 273, eva = 241, agi = 60, int = 60, mnd = 84, chr = 72, dex = 54, def = 273,
                         attack_skill = 229 },
                [70] = { acc = 278, eva = 246, agi = 61, int = 61, mnd = 85, chr = 73, dex = 55, def = 279,
                         attack_skill = 233 },
                [71] = { acc = 283, eva = 251, agi = 63, int = 63, mnd = 87, chr = 75, dex = 55, def = 283,
                         attack_skill = 237 },
                [72] = { acc = 288, eva = 256, agi = 63, int = 63, mnd = 87, chr = 75, dex = 55, def = 288,
                         attack_skill = 241 },
                [73] = { acc = 295, eva = 261, agi = 64, int = 64, mnd = 89, chr = 76, dex = 58, def = 295,
                         attack_skill = 246 },
                [74] = { acc = 300, eva = 266, agi = 64, int = 64, mnd = 89, chr = 77, dex = 58, def = 300,
                         attack_skill = 251 },
                [75] = { acc = 305, eva = 270, agi = 65, int = 65, mnd = 91, chr = 77, dex = 58, def = 305,
                         attack_skill = 256 },
                [76] = { acc = 310, eva = 276, agi = 66, int = 66, mnd = 92, chr = 80, dex = 59, def = 310,
                         attack_skill = 261 },
                [77] = { acc = 316, eva = 280, agi = 66, int = 66, mnd = 93, chr = 80, dex = 60, def = 315,
                         attack_skill = 266 },
                [78] = { acc = 321, eva = 286, agi = 68, int = 68, mnd = 93, chr = 80, dex = 60, def = 320,
                         attack_skill = 271 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true, scripted_attack_skill = true },
            info = {
                family = { value = 'Automaton / Supreme Beings', notes = { 'Source species: Automaton (ID 382); family ID 158.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [69] = 1123, [70] = 1146, [71] = 1170, [72] = 1193, [73] = 1217, [74] = 1240, [75] = 1264, [76] = 1287, [77] = 1311, [78] = 1334 }, mp = { [69] = 1989, [70] = 2021, [71] = 2053, [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181, [76] = 2213, [77] = 2245, [78] = 2277 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Knockout: Evasion down', notes = { 'Knockout: Evasion down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Scripted job changes may add move lists that are not resolved.', 'A scripted special skill value is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.', 'A scripted spell-list replacement is not resolved.' }, entries = { { kind = 'skill', id = 2067, name = 'Knockout', summary = 'Knockout: Evasion down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[14] } } }, coverage = 'partial', incomplete = true, reasons = { 'Scripted job changes may add move lists that are not resolved.', 'A scripted special skill value is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.', 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[11] },
                blue = { value = 'Unknown', notes = { 'Scripted job changes may add move lists that are not resolved.', 'A scripted special skill value is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.' }, incomplete = true },
            },
        },
        {
            name   = 'Troll Cameist',
            ids    = { 19, 22, 36, 42, 54, 86, 98, 127, 178, 180, 190 },
            job    = 'rdm/rdm',
            levels = {
                [71] = { acc = 292, eva = 264, agi = 60, int = 72, mnd = 80, chr = 67, dex = 72, def = 285,
                         attack_skill = 237 },
                [72] = { acc = 297, eva = 269, agi = 60, int = 72, mnd = 80, chr = 67, dex = 72, def = 290,
                         attack_skill = 241 },
                [73] = { acc = 303, eva = 274, agi = 60, int = 72, mnd = 80, chr = 70, dex = 74, def = 296,
                         attack_skill = 246 },
                [74] = { acc = 308, eva = 278, agi = 60, int = 73, mnd = 82, chr = 70, dex = 75, def = 301,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 284, agi = 62, int = 74, mnd = 82, chr = 70, dex = 75, def = 307,
                         attack_skill = 256 },
            },
            spawn_levels = { [19] = { 73, 75 }, [22] = { 73, 75 }, [36] = { 73, 75 }, [42] = { 73, 75 },
                             [54] = { 73, 75 }, [86] = { 71, 73 }, [98] = { 73, 75 }, [127] = { 71, 73 },
                             [178] = { 73, 75 }, [180] = { 73, 75 }, [190] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6010, [72] = 6130, [73] = 6250, [74] = 6369, [75] = 6489 }, mp = { [71] = 2053, [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[122],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Ironworker',
            ids    = { 21, 31, 41, 60, 78, 126, 177, 184, 189, 197 },
            levels = {
                [71] = { acc = 296, eva = 278, agi = 72, int = 52, mnd = 60, chr = 63, dex = 80, def = 297,
                         attack_skill = 237 },
                [72] = { acc = 301, eva = 283, agi = 72, int = 52, mnd = 60, chr = 63, dex = 80, def = 302,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 288, agi = 72, int = 54, mnd = 62, chr = 64, dex = 80, def = 309,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 293, agi = 73, int = 54, mnd = 63, chr = 64, dex = 82, def = 314,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 299, agi = 74, int = 55, mnd = 63, chr = 65, dex = 82, def = 319,
                         attack_skill = 256 },
            },
            spawn_levels = { [21] = { 73, 75 }, [31] = { 73, 75 }, [41] = { 73, 75 }, [60] = { 73, 75 },
                             [78] = { 71, 73 }, [126] = { 73, 75 }, [177] = { 73, 75 }, [184] = { 73, 75 },
                             [189] = { 73, 75 }, [197] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6412, [72] = 6538, [73] = 6664, [74] = 6790, [75] = 6916 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[124],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 23, 139, 157, 287 },
            job    = 'blm/rdm',
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70, dex = 75, def = 295,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70, dex = 75, def = 300,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 4097, [75] = 4175 }, mp = { [74] = 2149, [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Earth weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Slow: slow; Slow II: Slow; Quake: Wind magic evasion down', notes = { 'Slow: slow. Possible effects: Slow.', 'Slow II: Slow.', 'Quake: Wind magic evasion down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[102], level_ranges = { { 13, 74 } } }, { kind = 'spell', id = 79, name = 'Slow II', summary = 'Slow II: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[102], level_ranges = { { 75, 255 } } }, danger[125] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[30] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Black Pudding',
            ids    = { 24, 27, 28, 34, 39, 43, 44, 55, 59, 62, 65, 141, 145 },
            job    = 'blm/blm',
            levels = {
                [72] = { acc = 298, eva = 262, agi = 75, int = 92, mnd = 60, chr = 72, dex = 75, def = 282,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 93, mnd = 60, chr = 74, dex = 76, def = 289,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 272, agi = 77, int = 94, mnd = 60, chr = 75, dex = 77, def = 294,
                         attack_skill = 251 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -37.5 },
            drops  = {
                { rate = 240, item = 2175 },  -- chunk of flan meat
            },
            aggro  = true,
            detects = { 'sight', 'ability' },
            info = {
                family = { value = 'Flan / Amorph', notes = { 'Source species: Flan (ID 5); family ID 3.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3871, [73] = 3948, [74] = 4024 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +6%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[179],
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wamouracampa',
            ids    = { 33, 35, 94, 96, 136, 137, 138, 140, 142, 143, 146, 147, 148, 151, 152, 153, 163, 166, 168,
                       170, 172, 202, 207 },
            levels = {
                [72] = { acc = 297, eva = 283, agi = 72, int = 52, mnd = 52, chr = 60, dex = 72, def = 305,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60, dex = 72, def = 311,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60, dex = 73, def = 316,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62, dex = 74, def = 322,
                         attack_skill = 256 },
                [76] = { acc = 319, eva = 304, agi = 76, int = 55, mnd = 55, chr = 62, dex = 76, def = 326,
                         attack_skill = 261 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5 },
            drops  = {
                { rate = 50, item = 2173 },  -- wamoura cocoon
            },
            links  = 5,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Wamouracampa / Vermin', notes = { 'Source species: Wamouracampa (ID 471); family ID 198.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4359, [73] = 4443, [74] = 4527, [75] = 4611, [76] = 4695 }, mp = { [72] = 0, [73] = 0, [74] = 0, [75] = 0, [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 24.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[189],
                blue = { value = 'Cannonball', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 643, name = 'Cannonball', level = 70, min_skill = 220, skill_ids = { 1818 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Magmatic Eruca',
            ids    = { 49, 50, 66, 67, 68, 69, 70, 71, 72, 80, 81, 82, 83, 84, 90, 91, 106, 107, 108, 109, 110, 111,
                       112, 113, 114, 115, 116, 117, 118, 132, 133, 154, 155, 156, 158, 159, 160, 161, 162 },
            levels = {
                [71] = { acc = 293, eva = 278, agi = 72, int = 55, mnd = 55, chr = 63, dex = 75, def = 274,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 55, chr = 63, dex = 75, def = 279,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 58, chr = 64, dex = 76, def = 284,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 293, agi = 73, int = 58, mnd = 58, chr = 64, dex = 77, def = 289,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 58, chr = 65, dex = 77, def = 293,
                         attack_skill = 256 },
            },
            spawn_levels = { [49] = { 71, 73 }, [50] = { 71, 73 }, [66] = { 72, 74 }, [67] = { 72, 74 },
                             [68] = { 72, 74 }, [69] = { 72, 74 }, [70] = { 72, 74 }, [71] = { 72, 74 },
                             [72] = { 72, 74 }, [80] = { 73, 75 }, [81] = { 73, 75 }, [82] = { 73, 75 },
                             [83] = { 73, 75 }, [84] = { 73, 75 }, [90] = { 71, 73 }, [91] = { 71, 73 },
                             [106] = { 71, 73 }, [107] = { 71, 73 }, [108] = { 71, 73 }, [109] = { 71, 73 },
                             [110] = { 71, 73 }, [111] = { 71, 73 }, [112] = { 71, 73 }, [113] = { 71, 73 },
                             [114] = { 71, 73 }, [115] = { 71, 73 }, [116] = { 71, 73 }, [117] = { 71, 73 },
                             [118] = { 71, 73 }, [132] = { 71, 73 }, [133] = { 71, 73 }, [154] = { 73, 75 },
                             [155] = { 73, 75 }, [156] = { 73, 75 }, [158] = { 73, 75 }, [159] = { 73, 75 },
                             [160] = { 73, 75 }, [161] = { 73, 75 }, [162] = { 73, 75 } },
            ranks  = { fire = 1, ice = -1, wind = -1, thunder = -1, water = -2, dark = -1, paralyze = -1, bind = -1,
                       silence = -1, poison = -2, dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
                { rate = 150, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'sleeps',
            aggro_hours = { 6, 20 },
            links  = 6,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Eruca (ID 439); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 4275, [72] = 4359, [73] = 4443, [74] = 4527, [75] = 4611 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sticky Thread: Slow', notes = { 'Sticky Thread: Slow. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A helper used by the monster could not be read: xi.data.element.getWeatherElement.' }, entries = { { kind = 'skill', id = 344, name = 'Sticky Thread', summary = 'Sticky Thread: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = danger[101] } } }, coverage = 'partial', incomplete = true, reasons = { 'A helper used by the monster could not be read: xi.data.element.getWeatherElement.' }, general_notes = danger[11] },
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A helper used by the monster could not be read: xi.data.element.getWeatherElement.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Moblin Millionaire',
            ids    = { 74, 194, 308 },
            job    = 'whm/whm',
            levels = {
                [74] = { acc = 304, eva = 268, agi = 69, int = 64, mnd = 89, chr = 77, dex = 66, def = 298,
                         attack_skill = 251 },
                [75] = { acc = 309, eva = 273, agi = 70, int = 65, mnd = 91, chr = 77, dex = 67, def = 303,
                         attack_skill = 256 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 66, mnd = 92, chr = 80, dex = 67, def = 308,
                         attack_skill = 261 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 66, mnd = 93, chr = 80, dex = 69, def = 313,
                         attack_skill = 266 },
            },
            spawn_levels = { [74] = { 74, 75 }, [194] = { 74, 75 }, [308] = { 76, 77 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 1000, item = 2221 },  -- halvung shakudo key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 4136, [75] = 4214, [76] = 4292, [77] = 4371 }, mp = { [74] = 2149, [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[192], danger[195], danger[198], { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[97], level_ranges = { { 60, 255 } } }, danger[103], { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[105], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[108], level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[27], level_ranges = { { 45, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 88, 122, 212, 224, 232, 295 },
            job    = 'blm/rdm',
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70, dex = 75, def = 295,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70, dex = 75, def = 300,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 4097, [75] = 4175 }, mp = { [74] = 2149, [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fire weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flare: Water magic evasion down', notes = { 'Flare: Water magic evasion down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[131] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[30] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Friars Lantern',
            ids    = { 92, 93, 95, 97, 119, 120, 121, 149, 150, 164, 165, 203, 204, 205, 206, 211, 213, 216, 217,
                       218, 219, 220, 221, 222, 223, 227, 228, 229, 294, 296, 297, 320, 321, 328, 329, 331, 337,
                       338, 340, 349, 351, 355, 359, 363, 366, 371, 375, 387 },
            job    = 'war/blm',
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 63, mnd = 58, chr = 69, dex = 80, def = 296,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 64, mnd = 60, chr = 70, dex = 80, def = 303,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 64, mnd = 60, chr = 71, dex = 82, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 66, mnd = 60, chr = 72, dex = 82, def = 313,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 66, mnd = 61, chr = 73, dex = 85, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 67, mnd = 62, chr = 73, dex = 85, def = 323,
                         attack_skill = 266 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 68, mnd = 63, chr = 74, dex = 85, def = 328,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 69, mnd = 64, chr = 76, dex = 87, def = 334,
                         attack_skill = 276 },
            },
            spawn_levels = { [92] = { 72, 76 }, [93] = { 72, 76 }, [95] = { 72, 76 }, [97] = { 72, 76 },
                             [119] = { 72, 76 }, [120] = { 72, 76 }, [121] = { 72, 76 }, [149] = { 72, 76 },
                             [150] = { 72, 76 }, [164] = { 72, 76 }, [165] = { 72, 76 }, [203] = { 72, 76 },
                             [204] = { 72, 76 }, [205] = { 72, 76 }, [206] = { 72, 76 }, [211] = { 72, 76 },
                             [213] = { 72, 76 }, [216] = { 72, 76 }, [217] = { 72, 76 }, [218] = { 72, 76 },
                             [219] = { 72, 76 }, [220] = { 72, 76 }, [221] = { 72, 76 }, [222] = { 72, 76 },
                             [223] = { 72, 76 }, [227] = { 72, 76 }, [228] = { 72, 76 }, [229] = { 72, 76 },
                             [294] = { 72, 76 }, [296] = { 72, 76 }, [297] = { 76, 76 }, [320] = { 77, 79 },
                             [321] = { 77, 79 }, [328] = { 77, 79 }, [329] = { 77, 79 }, [331] = { 77, 79 },
                             [337] = { 77, 79 }, [338] = { 77, 79 }, [340] = { 77, 79 }, [349] = { 77, 79 },
                             [351] = { 77, 79 }, [355] = { 77, 79 }, [359] = { 77, 79 }, [363] = { 77, 79 },
                             [366] = { 77, 79 }, [371] = { 77, 79 }, [375] = { 77, 79 }, [387] = { 77, 79 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 50, item = 17316 },  -- bomb arm
            },
            steal  = { 17316 },  -- bomb arm
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4202, [73] = 4284, [74] = 4365, [75] = 4447, [76] = 4529, [77] = 4611, [78] = 4692, [79] = 4774 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181, [76] = 2213, [77] = 2245, [78] = 2277, [79] = 2309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Self-Destruct: explosion; Flare: Water magic evasion down', notes = { 'Self-Destruct: explosion. Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[202], danger[131] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] },
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wamoura',
            ids    = { 167, 169, 171, 174 },
            levels = {
                [80] = { acc = 340, eva = 325, agi = 78, int = 57, mnd = 57, chr = 65, dex = 78, def = 348,
                         attack_skill = 281 },
                [81] = { acc = 347, eva = 330, agi = 81, int = 60, mnd = 60, chr = 67, dex = 81, def = 353,
                         attack_skill = 287 },
                [82] = { acc = 353, eva = 335, agi = 81, int = 60, mnd = 60, chr = 67, dex = 81, def = 358,
                         attack_skill = 293 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            weapon_dmg = { piercing = 12.5 },
            drops  = {
                { rate = 150, item = 2337 },  -- clump of wamoura hair
                { rate = 240, item = 2338 },  -- wamoura scale
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 5,
            info = {
                family = { value = 'Wamoura / Vermin', notes = { 'Source species: Wamoura (ID 470); family ID 197.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 5031, [81] = 5115, [82] = 5199 }, mp = { [80] = 1176, [81] = 1192, [82] = 1208 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[212],
                blue = { value = 'Exuviation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 645, name = 'Exuviation', level = 75, min_skill = 245, skill_ids = { 1955 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wamouracampa',
            ids    = { 173 },
            levels = {
                [72] = { acc = 297, eva = 283, agi = 72, int = 52, mnd = 52, chr = 60, dex = 72, def = 305,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60, dex = 72, def = 311,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60, dex = 73, def = 316,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62, dex = 74, def = 322,
                         attack_skill = 256 },
                [76] = { acc = 319, eva = 304, agi = 76, int = 55, mnd = 55, chr = 62, dex = 76, def = 326,
                         attack_skill = 261 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5 },
            drops  = {
                { rate = 50, item = 2173 },  -- wamoura cocoon
            },
            links  = 5,
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Wamouracampa / Vermin', notes = { 'Source species: Wamouracampa (ID 471); family ID 198.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4359, [73] = 4443, [74] = 4527, [75] = 4611, [76] = 4695 }, mp = { [72] = 0, [73] = 0, [74] = 0, [75] = 0, [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 24.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[189],
                blue = { value = 'Cannonball', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 643, name = 'Cannonball', level = 70, min_skill = 220, skill_ids = { 1818 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Moblin Billionaire',
            ids    = { 181, 188, 312 },
            job    = 'rdm/rdm',
            levels = {
                [74] = { acc = 310, eva = 282, agi = 69, int = 77, mnd = 77, chr = 70, dex = 78, def = 295,
                         attack_skill = 251 },
                [75] = { acc = 315, eva = 288, agi = 70, int = 77, mnd = 77, chr = 70, dex = 79, def = 301,
                         attack_skill = 256 },
                [76] = { acc = 321, eva = 293, agi = 71, int = 80, mnd = 80, chr = 72, dex = 80, def = 305,
                         attack_skill = 261 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 80, mnd = 80, chr = 72, dex = 81, def = 310,
                         attack_skill = 266 },
            },
            spawn_levels = { [181] = { 74, 75 }, [188] = { 74, 75 }, [312] = { 76, 77 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 1000, item = 2221 },  -- halvung shakudo key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Moblin (ID 127); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 4246, [75] = 4326, [76] = 4406, [77] = 4486 }, mp = { [74] = 2149, [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Frypan: Stun; Smokebomb: Blindness; Paralysis Shower: Paralysis; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = { 'Frypan: Stun. Source targeting: area around the monster.', 'Smokebomb: Blindness. Source targeting: cone.', 'Paralysis Shower: Paralysis. Source targeting: cone.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[192], danger[195], danger[198], danger[98], danger[103], danger[106], danger[109], danger[114], danger[40], danger[117], danger[118], danger[119], danger[120] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] },
                blue = { value = 'Frypan', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 628, name = 'Frypan', level = 63, min_skill = 186, skill_ids = { 1081 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Artilleryman',
            ids    = { 198, 240, 254, 265, 300, 309, 318, 325, 333, 343, 369, 380, 388 },
            job    = 'rng/rng',
            levels = {
                [78] = { acc = 377, eva = 297, agi = 90, int = 65, mnd = 77, chr = 68, dex = 77, def = 324,
                         attack_skill = 271, resist = { poison = 20 } },
                [79] = { acc = 384, eva = 302, agi = 92, int = 65, mnd = 80, chr = 69, dex = 80, def = 331,
                         attack_skill = 276, resist = { poison = 20 } },
                [80] = { acc = 389, eva = 307, agi = 92, int = 65, mnd = 80, chr = 69, dex = 80, def = 336,
                         attack_skill = 281, resist = { poison = 20 } },
                [81] = { acc = 396, eva = 312, agi = 94, int = 67, mnd = 82, chr = 71, dex = 82, def = 341,
                         attack_skill = 287, resist = { poison = 25 } },
                [82] = { acc = 402, eva = 317, agi = 94, int = 67, mnd = 82, chr = 71, dex = 82, def = 346,
                         attack_skill = 293, resist = { poison = 25 } },
                [83] = { acc = 408, eva = 322, agi = 96, int = 67, mnd = 82, chr = 71, dex = 82, def = 351,
                         attack_skill = 299, resist = { poison = 25 } },
            },
            spawn_levels = { [198] = { 78, 82 }, [240] = { 78, 82 }, [254] = { 78, 82 }, [265] = { 78, 82 },
                             [300] = { 78, 82 }, [309] = { 78, 82 }, [318] = { 78, 82 }, [325] = { 78, 82 },
                             [333] = { 78, 82 }, [343] = { 78, 82 }, [369] = { 78, 82 }, [380] = { 78, 82 },
                             [388] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 6673, [79] = 6790, [80] = 6907, [81] = 7026, [82] = 7143, [83] = 7260 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0, [83] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Combatant',
            ids    = { 199, 256, 268, 319, 334, 353, 370, 381, 393, 394 },
            job    = 'mnk/mnk',
            levels = {
                [78] = { acc = 336, eva = 312, agi = 57, int = 51, mnd = 77, chr = 68, dex = 91, def = 335,
                         attack_skill = 271 },
                [79] = { acc = 342, eva = 317, agi = 57, int = 51, mnd = 80, chr = 69, dex = 93, def = 341,
                         attack_skill = 276 },
                [80] = { acc = 347, eva = 322, agi = 57, int = 51, mnd = 80, chr = 69, dex = 93, def = 346,
                         attack_skill = 281 },
                [81] = { acc = 355, eva = 328, agi = 60, int = 54, mnd = 82, chr = 71, dex = 96, def = 351,
                         attack_skill = 287 },
                [82] = { acc = 361, eva = 333, agi = 60, int = 54, mnd = 82, chr = 71, dex = 96, def = 356,
                         attack_skill = 293 },
                [83] = { acc = 367, eva = 338, agi = 60, int = 54, mnd = 82, chr = 71, dex = 96, def = 362,
                         attack_skill = 299 },
            },
            spawn_levels = { [199] = { 78, 82 }, [256] = { 78, 82 }, [268] = { 78, 82 }, [319] = { 78, 82 },
                             [334] = { 78, 82 }, [353] = { 78, 82 }, [370] = { 78, 82 }, [381] = { 78, 82 },
                             [393] = { 81, 83 }, [394] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 7741, [79] = 7869, [80] = 7998, [81] = 8125, [82] = 8254, [83] = 8382 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0, [83] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Targeteer',
            ids    = { 200, 238, 251, 252, 307, 315, 323, 326, 350, 364, 378, 385, 395, 396 },
            job    = 'pld/pld',
            levels = {
                [78] = { acc = 327, eva = 301, agi = 51, int = 51, mnd = 85, chr = 80, dex = 73, def = 383,
                         attack_skill = 271 },
                [79] = { acc = 333, eva = 306, agi = 51, int = 51, mnd = 87, chr = 82, dex = 74, def = 389,
                         attack_skill = 276 },
                [80] = { acc = 338, eva = 311, agi = 51, int = 51, mnd = 87, chr = 82, dex = 74, def = 394,
                         attack_skill = 281 },
                [81] = { acc = 345, eva = 317, agi = 54, int = 54, mnd = 90, chr = 85, dex = 76, def = 399,
                         attack_skill = 287 },
                [82] = { acc = 351, eva = 322, agi = 54, int = 54, mnd = 90, chr = 85, dex = 76, def = 404,
                         attack_skill = 293 },
                [83] = { acc = 357, eva = 327, agi = 54, int = 54, mnd = 90, chr = 85, dex = 76, def = 410,
                         attack_skill = 299 },
            },
            spawn_levels = { [200] = { 78, 82 }, [238] = { 78, 82 }, [251] = { 78, 82 }, [252] = { 78, 82 },
                             [307] = { 78, 82 }, [315] = { 78, 82 }, [323] = { 78, 82 }, [326] = { 78, 82 },
                             [350] = { 78, 82 }, [364] = { 78, 82 }, [378] = { 78, 82 }, [385] = { 78, 82 },
                             [395] = { 81, 83 }, [396] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 150, item = 18409 },  -- jadagna -1
                { rate = 100, item = 16166 },  -- januwiyah -1
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 7122, [79] = 7245, [80] = 7369, [81] = 7492, [82] = 7617, [83] = 7740 }, mp = { [78] = 2277, [79] = 2309, [80] = 2342, [81] = 2374, [82] = 2406, [83] = 2439 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[31],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Friars Lantern Grow',
            ids    = { 201, 298, 299 },
            job    = 'war/blm',
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 63, mnd = 58, chr = 69, dex = 80, def = 296,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 64, mnd = 60, chr = 70, dex = 80, def = 303,
                         attack_skill = 246 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 64, mnd = 60, chr = 71, dex = 82, def = 308,
                         attack_skill = 251 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 66, mnd = 60, chr = 72, dex = 82, def = 313,
                         attack_skill = 256 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 66, mnd = 61, chr = 73, dex = 85, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 67, mnd = 62, chr = 73, dex = 85, def = 323,
                         attack_skill = 266 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 68, mnd = 63, chr = 74, dex = 85, def = 328,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 69, mnd = 64, chr = 76, dex = 87, def = 334,
                         attack_skill = 276 },
            },
            spawn_levels = { [201] = { 72, 76 }, [298] = { 77, 79 }, [299] = { 77, 79 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 50, item = 2384 },  -- smoke-filled flask
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4202, [73] = 4284, [74] = 4365, [75] = 4447, [76] = 4529, [77] = 4611, [78] = 4692, [79] = 4774 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149, [75] = 2181, [76] = 2213, [77] = 2245, [78] = 2277, [79] = 2309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Heat Wave: Burn; Flare: Water magic evasion down; Burn: Burn', notes = { 'Heat Wave: Burn. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Burn: Burn.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 595, name = 'Heat Wave', summary = 'Heat Wave: Burn', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[141] } }, danger[131], danger[143] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Ebony Pudding',
            ids    = { 208, 209, 210, 214, 215, 225, 226, 243, 244, 245, 246, 247, 248, 255, 260, 262, 283, 284,
                       285, 288, 289, 291, 292, 293, 339, 341, 342, 344, 347, 348 },
            job    = 'blm/blm',
            levels = {
                [77] = { acc = 326, eva = 287, agi = 80, int = 98, mnd = 62, chr = 77, dex = 80, def = 309,
                         attack_skill = 266 },
                [78] = { acc = 331, eva = 292, agi = 80, int = 98, mnd = 65, chr = 77, dex = 80, def = 314,
                         attack_skill = 271 },
                [79] = { acc = 337, eva = 297, agi = 82, int = 101, mnd = 65, chr = 80, dex = 82, def = 319,
                         attack_skill = 276 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -37.5 },
            drops  = {
                { rate = 240, item = 2175 },  -- chunk of flan meat
            },
            aggro  = true,
            detects = { 'sight', 'ability' },
            info = {
                family = { value = 'Flan / Amorph', notes = { 'Source species: Flan (ID 5); family ID 3.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4255, [78] = 4331, [79] = 4408 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Boiling Point: Magic defense down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleepga: area sleep; Sleepga II: area sleep', notes = { 'Boiling Point: Magic defense down. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleepga: area sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[130], danger[131], danger[132], danger[133], danger[125], danger[134], danger[135], danger[143], danger[148], danger[153], danger[158], danger[163], danger[168], danger[169], danger[170], danger[171], danger[172], danger[173], { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[176], level_ranges = { { 31, 255 } } }, danger[177] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] },
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Friars Lantern Grow',
            ids    = { 230, 231, 241, 242, 266, 267 },
            job    = 'war/blm',
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 67, mnd = 62, chr = 73, dex = 85, def = 323,
                         attack_skill = 266 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 68, mnd = 63, chr = 74, dex = 85, def = 328,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 69, mnd = 64, chr = 76, dex = 87, def = 334,
                         attack_skill = 276 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 50, item = 2384 },  -- smoke-filled flask
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4611, [78] = 4692, [79] = 4774 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flare: Water magic evasion down; Burn: Burn', notes = { 'Flare: Water magic evasion down.', 'Burn: Burn.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted choice table has conflicting or unreadable definitions.' }, entries = { danger[131], danger[143] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted choice table has conflicting or unreadable definitions.' }, general_notes = danger[30] },
                blue = { value = 'Unknown', notes = { 'A scripted choice table has conflicting or unreadable definitions.' }, incomplete = true },
            },
        },
        {
            name   = 'Big Bomb',
            ids    = { 233 },
            nm     = true,
            job    = 'war/blm',
            levels = {
                [83] = { acc = 364, eva = 342, agi = 85, int = 72, mnd = 66, chr = 78, dex = 90, def = 354,
                         attack_skill = 299 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 9, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 17471 },  -- horrent mace
                { rate = 100, item = 18707 },  -- fire bomblet
            },
            steal  = { 17316 },  -- bomb arm
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [83] = 12500 }, mp = { [83] = 2439 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Smoke Filled Flask to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted choice table has conflicting or unreadable definitions.', 'A scripted move chooser return is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted choice table has conflicting or unreadable definitions.', 'A scripted move chooser return is not resolved.' }, general_notes = danger[11] },
                blue = { value = 'Unknown', notes = { 'A scripted choice table has conflicting or unreadable definitions.' }, incomplete = true },
            },
        },
        {
            name   = 'Troll Machinist',
            ids    = { 234, 257, 270, 303, 310, 335, 345, 357, 372, 382 },
            job    = 'pup/pup',
            levels = {
                [78] = { acc = 336, eva = 370, agi = 77, int = 65, mnd = 65, chr = 80, dex = 91, def = 324,
                         attack_skill = 271 },
                [79] = { acc = 342, eva = 376, agi = 78, int = 65, mnd = 66, chr = 82, dex = 93, def = 331,
                         attack_skill = 276 },
                [80] = { acc = 347, eva = 381, agi = 78, int = 65, mnd = 66, chr = 82, dex = 93, def = 336,
                         attack_skill = 281 },
                [81] = { acc = 355, eva = 386, agi = 81, int = 67, mnd = 69, chr = 85, dex = 96, def = 341,
                         attack_skill = 287 },
                [82] = { acc = 361, eva = 391, agi = 81, int = 67, mnd = 69, chr = 85, dex = 96, def = 346,
                         attack_skill = 293 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
                { rate = 50, group = {  -- one of
                    { 2263, 1 },  -- flashbulb
                    { 2244, 1 },  -- scanner
                    { 2248, 1 },  -- pattern reader
                    { 2259, 1 },  -- heatsink
                    { 2267, 1 },  -- mana converter
                    { 2238, 1 },  -- strobe
                    { 2252, 1 },  -- analyzer
                    { 2256, 1 },  -- heat seeker
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 6847, [79] = 6967, [80] = 7087, [81] = 7207, [82] = 7326 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 380', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Scrimer',
            ids    = { 236, 259, 269, 305, 316, 330, 361, 376, 384, 389, 390 },
            levels = {
                [78] = { acc = 333, eva = 314, agi = 77, int = 57, mnd = 65, chr = 68, dex = 85, def = 334,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 320, agi = 78, int = 57, mnd = 66, chr = 69, dex = 87, def = 341,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 325, agi = 78, int = 57, mnd = 66, chr = 69, dex = 87, def = 346,
                         attack_skill = 281 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 60, mnd = 69, chr = 71, dex = 90, def = 351,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 60, mnd = 69, chr = 71, dex = 90, def = 356,
                         attack_skill = 293 },
                [83] = { acc = 364, eva = 340, agi = 81, int = 60, mnd = 69, chr = 71, dex = 90, def = 361,
                         attack_skill = 299 },
            },
            spawn_levels = { [236] = { 78, 82 }, [259] = { 78, 82 }, [269] = { 78, 82 }, [305] = { 78, 82 },
                             [316] = { 78, 82 }, [330] = { 78, 82 }, [361] = { 78, 82 }, [376] = { 78, 82 },
                             [384] = { 78, 82 }, [389] = { 81, 83 }, [390] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 7294, [79] = 7420, [80] = 7546, [81] = 7672, [82] = 7798, [83] = 7924 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0, [83] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[124],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Grenadier',
            ids    = { 237, 261, 275, 317, 322, 327, 362, 377 },
            job    = 'rng/rng',
            levels = {
                [78] = { acc = 377, eva = 297, agi = 90, int = 65, mnd = 77, chr = 68, dex = 77, def = 324,
                         attack_skill = 271, resist = { poison = 20 } },
                [79] = { acc = 384, eva = 302, agi = 92, int = 65, mnd = 80, chr = 69, dex = 80, def = 331,
                         attack_skill = 276, resist = { poison = 20 } },
                [80] = { acc = 389, eva = 307, agi = 92, int = 65, mnd = 80, chr = 69, dex = 80, def = 336,
                         attack_skill = 281, resist = { poison = 20 } },
                [81] = { acc = 396, eva = 312, agi = 94, int = 67, mnd = 82, chr = 71, dex = 82, def = 341,
                         attack_skill = 287, resist = { poison = 25 } },
                [82] = { acc = 402, eva = 317, agi = 94, int = 67, mnd = 82, chr = 71, dex = 82, def = 346,
                         attack_skill = 293, resist = { poison = 25 } },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 6673, [79] = 6790, [80] = 6907, [81] = 7026, [82] = 7143 }, mp = { [78] = 0, [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[36],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Cuirasser',
            ids    = { 239, 253, 280, 301, 324, 332, 352, 367, 379, 386, 391, 392 },
            job    = 'rdm/rdm',
            levels = {
                [78] = { acc = 329, eva = 299, agi = 65, int = 77, mnd = 85, chr = 72, dex = 77, def = 322,
                         attack_skill = 271 },
                [79] = { acc = 336, eva = 304, agi = 65, int = 78, mnd = 87, chr = 75, dex = 80, def = 328,
                         attack_skill = 276 },
                [80] = { acc = 341, eva = 309, agi = 65, int = 78, mnd = 87, chr = 75, dex = 80, def = 333,
                         attack_skill = 281 },
                [81] = { acc = 348, eva = 314, agi = 67, int = 81, mnd = 90, chr = 77, dex = 82, def = 338,
                         attack_skill = 287 },
                [82] = { acc = 354, eva = 319, agi = 67, int = 81, mnd = 90, chr = 77, dex = 82, def = 343,
                         attack_skill = 293 },
                [83] = { acc = 360, eva = 324, agi = 67, int = 81, mnd = 90, chr = 77, dex = 82, def = 348,
                         attack_skill = 299 },
            },
            spawn_levels = { [239] = { 78, 82 }, [253] = { 78, 82 }, [280] = { 78, 82 }, [301] = { 78, 82 },
                             [324] = { 78, 82 }, [332] = { 78, 82 }, [352] = { 78, 82 }, [367] = { 78, 82 },
                             [379] = { 78, 82 }, [386] = { 81, 83 }, [391] = { 81, 83 }, [392] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [78] = 6847, [79] = 6967, [80] = 7087, [81] = 7207, [82] = 7326, [83] = 7446 }, mp = { [78] = 2277, [79] = 2309, [80] = 2342, [81] = 2374, [82] = 2406, [83] = 2439 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[122],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antares H',
            ids    = { 249, 250, 263, 264, 276, 277, 279, 281, 286, 290, 302, 306, 354, 356, 360, 368, 374 },
            levels = {
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66, dex = 76, def = 325,
                         attack_skill = 266 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68, dex = 77, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 335, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69, dex = 78, def = 336,
                         attack_skill = 276 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 1473 },  -- high-quality scorpion shell
            },
            steal  = { 1616 },  -- antlion jaw
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4779, [78] = 4863, [79] = 4947 }, mp = { [77] = 0, [78] = 0, [79] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Numbing Breath: Paralysis; Cold Breath: Bind; Mandible Bite: can crit; Poison Sting: Poison; Death Scissors: can crit; Wild Rage: Poison; Earth Pounder: DEX down', notes = { 'Numbing Breath: Paralysis. Random effects may not all happen on the same use. Source targeting: cone.', 'Cold Breath: Bind. Source targeting: cone.', 'Mandible Bite: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Poison Sting: Poison. Source targeting: single target.', 'Death Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wild Rage: Poison. Source targeting: area around the monster.', 'Earth Pounder: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 348, name = 'Numbing Breath', summary = 'Numbing Breath: Paralysis', notes = { 'Random effects may not all happen on the same use. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 349, name = 'Cold Breath', summary = 'Cold Breath: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[51] } }, { kind = 'skill', id = 350, name = 'Mandible Bite', summary = 'Mandible Bite: can crit', notes = danger[213], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 351, name = 'Poison Sting', summary = 'Poison Sting: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 353, name = 'Death Scissors', summary = 'Death Scissors: can crit', notes = danger[213], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 354, name = 'Wild Rage', summary = 'Wild Rage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 355, name = 'Earth Pounder', summary = 'Earth Pounder: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[62] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] },
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Mythril Guard',
            ids    = { 273, 274 },
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 358, eva = 331, agi = 73, int = 81, mnd = 63, chr = 58, dex = 90, def = 350,
                         attack_skill = 293 },
                [83] = { acc = 364, eva = 336, agi = 73, int = 81, mnd = 63, chr = 58, dex = 90, def = 355,
                         attack_skill = 299 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [82] = 7617, [83] = 7740 }, mp = { [82] = 2406, [83] = 2439 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[92],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dahak',
            ids    = { 365 },
            levels = {
                [79] = { acc = 339, eva = 324, agi = 87, int = 66, mnd = 66, chr = 69, dex = 87, def = 339,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 329, agi = 87, int = 66, mnd = 66, chr = 69, dex = 87, def = 344,
                         attack_skill = 281 },
                [81] = { acc = 352, eva = 335, agi = 90, int = 69, mnd = 69, chr = 71, dex = 90, def = 349,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 340, agi = 90, int = 69, mnd = 69, chr = 71, dex = 90, def = 354,
                         attack_skill = 293 },
            },
            ranks  = { fire = 4, ice = 2, wind = 2, earth = 2, thunder = 2, water = 1, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 1, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dahak (ID 218); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [79] = 4947, [80] = 5031, [81] = 5115, [82] = 5199 }, mp = { [79] = 0, [80] = 0, [81] = 0, [82] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Body Slam: can crit; Petro Eyes: Petrification; Nullsong: Buff removal', notes = { 'Body Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Petro Eyes: Petrification. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Nullsong: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 645, name = 'Body Slam', summary = 'Body Slam: can crit', notes = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' }, categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 648, name = 'Petro Eyes', summary = 'Petro Eyes: Petrification', notes = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 9.5 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 9.5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 9.5, shape = 'front cone', cone_length = 9.5, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 1792, name = 'Nullsong', summary = 'Nullsong: Buff removal', notes = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] },
                blue = { value = 'Body Slam', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 564, name = 'Body Slam', level = 62, min_skill = 181, skill_ids = { 645 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Archaic Mirror',
            ids    = { 400, 401, 402, 403, 404, 405, 406, 407 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70, dex = 82, def = 322,
                         attack_skill = 0 },
            },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 1000, item = 2174 },  -- archaic mirror
            },
            info = {
                family = { value = 'Structures / Structures', notes = { 'Source species: Mirrors (ID 376); family ID 154.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4611 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[11] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Hilltroll Mirror Guard',
            ids    = { 408, 410, 412, 414, 416, 418, 420, 422 },
            job    = 'rdm/rdm',
            levels = {
                [81] = { acc = 348, eva = 314, agi = 67, int = 81, mnd = 90, chr = 77, dex = 82, def = 338,
                         attack_skill = 287 },
                [82] = { acc = 354, eva = 319, agi = 67, int = 81, mnd = 90, chr = 77, dex = 82, def = 343,
                         attack_skill = 293 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 7207, [82] = 7326 }, mp = { [81] = 2374, [82] = 2406 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[122],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Woodtroll Mirror Guard',
            ids    = { 409, 411, 413, 415, 417, 419, 421, 423 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [81] = { acc = 352, eva = 326, agi = 73, int = 81, mnd = 63, chr = 58, dex = 90, def = 345,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 331, agi = 73, int = 81, mnd = 63, chr = 58, dex = 90, def = 350,
                         attack_skill = 293 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 7492, [82] = 7617 }, mp = { [81] = 2374, [82] = 2406 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[92],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dextrose',
            ids    = { 430 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [80] = { acc = 341, eva = 316, agi = 78, int = 96, mnd = 69, chr = 80, dex = 80, def = 326,
                         attack_skill = 281 },
                [81] = { acc = 348, eva = 321, agi = 80, int = 99, mnd = 72, chr = 82, dex = 82, def = 331,
                         attack_skill = 287 },
                [82] = { acc = 354, eva = 326, agi = 80, int = 99, mnd = 72, chr = 82, dex = 82, def = 336,
                         attack_skill = 293 },
            },
            ranks  = { ice = 2, wind = 2, earth = 2, water = 4, dark = 3, paralyze = 2, bind = 2, silence = 2,
                       slow = 2, poison = 4, dark_sleep = 3, blind = 3, gravity = 2 },
            magic_dmg = { all = 25 },
            weapon_dmg = { slashing = -12.5, piercing = -25, blunt = -25, hand_to_hand = -25 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2625 },  -- blob of dextroses blubber
                { rate = 150, item = 18127 },  -- achilles spear
                { rate = 150, item = 16338 },  -- ruby seraweels
            },
            aggro  = true,
            detects = { 'sight', 'ability' },
            info = {
                family = { value = 'Flan / Amorph', notes = { 'Source species: Gold Flan (ID 6); family ID 3.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 26000, [81] = 26000, [82] = 26000 }, mp = { [80] = 2342, [81] = 2374, [82] = 2406 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Pinch Of Granulated Sugar to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 15 minutes', notes = { 'Source idle-despawn delay: 15 minutes. This is not its remaining lifetime.' } },
                dangers = danger[179],
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Reacton',
            ids    = { 431 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [81] = { acc = 352, eva = 307, agi = 85, int = 94, mnd = 71, chr = 82, dex = 90, def = 330,
                         attack_skill = 287 },
                [82] = { acc = 358, eva = 312, agi = 85, int = 94, mnd = 71, chr = 82, dex = 90, def = 335,
                         attack_skill = 293 },
                [83] = { acc = 364, eva = 316, agi = 85, int = 96, mnd = 71, chr = 82, dex = 90, def = 340,
                         attack_skill = 299 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun' },
            drops  = {
                { rate = 1000, item = 2624 },  -- pile of reactons ashes
                { rate = 150, item = 19028 },  -- magic strap
                { rate = 150, item = 19211 },  -- reacton arm
            },
            steal  = { 17316 },  -- bomb arm
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [81] = 25000, [82] = 25000, [83] = 25000 }, mp = { [81] = 2374, [82] = 2406, [83] = 2439 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Lump Of Bone Charcoal to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Self-Destruct: explosion; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Self-Destruct: explosion. Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[202], danger[131], danger[132], danger[133], danger[125], danger[134], danger[135], danger[138], danger[143], danger[148], danger[153], danger[158], danger[163], danger[168], danger[169], danger[170], danger[171], danger[172], danger[173], danger[174], danger[177] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[30] },
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Achamoth',
            ids    = { 432 },
            nm     = true,
            levels = {
                [86] = { acc = 379, eva = 356, agi = 85, int = 62, mnd = 62, chr = 70, dex = 85, def = 379,
                         attack_skill = 317 },
                [87] = { acc = 385, eva = 361, agi = 85, int = 62, mnd = 62, chr = 70, dex = 85, def = 385,
                         attack_skill = 323 },
                [88] = { acc = 392, eva = 367, agi = 86, int = 63, mnd = 63, chr = 72, dex = 86, def = 390,
                         attack_skill = 329 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            weapon_dmg = { piercing = 12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2622 },  -- achamoths antenna
                { rate = 240, item = 19034 },  -- ice grip
                { rate = 240, item = 19035 },  -- thunder grip
                { rate = 1000, group = {  -- one of
                    { 17753, 1 },  -- organics
                    { 11376, 1 },  -- aurum sabatons
                    { 16342, 1 },  -- oracles braconi
                } },
                { rate = 100, group = {  -- one of
                    { 17753, 1 },  -- organics
                    { 11376, 1 },  -- aurum sabatons
                    { 16342, 1 },  -- oracles braconi
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Wamoura / Vermin', notes = { 'Source species: Wamoura (ID 470); family ID 197.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [86] = 38000, [87] = 38000, [88] = 38000 }, mp = { [86] = 1273, [87] = 1289, [88] = 1305 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Jar Of Rock Juice to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[212],
                blue = { value = 'Exuviation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 645, name = 'Exuviation', level = 75, min_skill = 245, skill_ids = { 1955 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Achamothcampa',
            ids    = { 433, 434 },
            nm     = true,
            levels = {
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60, dex = 72, def = 311,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60, dex = 73, def = 316,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62, dex = 74, def = 322,
                         attack_skill = 256 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 2, slow = -1, poison = -2, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = -1 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Wamouracampa / Vermin', notes = { 'Source species: Wamouracampa (ID 471); family ID 198.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 8000, [74] = 8000, [75] = 8000 }, mp = { [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 24.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[189],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Achamoth Nympha',
            ids    = { 435, 436 },
            levels = {
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60, dex = 72, def = 311,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60, dex = 73, def = 316,
                         attack_skill = 251 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62, dex = 74, def = 322,
                         attack_skill = 256 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            weapon_dmg = { piercing = 12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Wamoura / Vermin', notes = { 'Source species: Wamoura (ID 470); family ID 197.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 12000, [74] = 12000, [75] = 12000 }, mp = { [73] = 1063, [74] = 1079, [75] = 1095 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[212],
                blue = { value = 'Exuviation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 645, name = 'Exuviation', level = 75, min_skill = 245, skill_ids = { 1955 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
