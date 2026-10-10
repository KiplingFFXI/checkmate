-- Al Zahbi (zone 48).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[3] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[4] = { notes = danger[3], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 4 } } };
danger[5] = { kind = 'skill', id = 1737, name = 'Vorpal Blade', summary = 'Vorpal Blade: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[6] = { danger[5] };
danger[7] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[8] = { value = 'Vorpal Blade: can crit', notes = danger[1], entries = danger[6], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[9] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[10] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[11] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[12] = { danger[11] };
danger[13] = { notes = danger[10], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[12] };
danger[14] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[13], level_ranges = { { 60, 255 } } };
danger[15] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[16] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[17] = { danger[16] };
danger[18] = { notes = danger[15], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[17] };
danger[19] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[18], level_ranges = { { 13, 255 } } };
danger[20] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[21] = { notes = danger[20], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[22] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[21], level_ranges = { { 4, 255 } } };
danger[23] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[24] = { notes = danger[23], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[25] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[24], level_ranges = { { 15, 255 } } };
danger[26] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[27] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[28] = { notes = danger[26], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[27] };
danger[29] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[28], level_ranges = { { 45, 255 } } };
danger[30] = { danger[5], danger[14], danger[19], danger[22], danger[25], danger[29] };
danger[31] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[32] = { value = 'Vorpal Blade: can crit; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = danger[9], entries = danger[30], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[33] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[34] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[35] = { notes = danger[34], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[36] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[35], level_ranges = { { 60, 255 } } };
danger[37] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[35], level_ranges = { { 50, 255 } } };
danger[38] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[35], level_ranges = { { 52, 255 } } };
danger[39] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[35], level_ranges = { { 54, 255 } } };
danger[40] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[35], level_ranges = { { 56, 255 } } };
danger[41] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[35], level_ranges = { { 58, 255 } } };
danger[42] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[43] = { notes = danger[42], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[44] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[43], level_ranges = { { 72, 255 } } };
danger[45] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[46] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[47] = { danger[46] };
danger[48] = { notes = danger[45], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[47] };
danger[49] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[48], level_ranges = { { 24, 255 } } };
danger[50] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[51] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[52] = { danger[51] };
danger[53] = { notes = danger[50], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[52] };
danger[54] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[53], level_ranges = { { 22, 255 } } };
danger[55] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[57] = { danger[56] };
danger[58] = { notes = danger[55], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[57] };
danger[59] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[58], level_ranges = { { 20, 255 } } };
danger[60] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { danger[61] };
danger[63] = { notes = danger[60], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[62] };
danger[64] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[63], level_ranges = { { 18, 255 } } };
danger[65] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[66] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[67] = { danger[66] };
danger[68] = { notes = danger[65], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[67] };
danger[69] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[68], level_ranges = { { 16, 255 } } };
danger[70] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[71] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[72] = { danger[71] };
danger[73] = { notes = danger[70], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[72] };
danger[74] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[73], level_ranges = { { 27, 255 } } };
danger[75] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[35], level_ranges = { { 12, 255 } } };
danger[76] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[35], level_ranges = { { 25, 255 } } };
danger[77] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[78] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[79] = { notes = danger[77], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[78] };
danger[80] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[79], level_ranges = { { 45, 255 } } };
danger[81] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[82] = { notes = danger[81], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[83] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[82], level_ranges = { { 4, 255 } } };
danger[84] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[85] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[86] = { danger[85] };
danger[87] = { notes = danger[84], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[86] };
danger[88] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[87], level_ranges = { { 7, 255 } } };
danger[89] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[35], level_ranges = { { 41, 255 } } };
danger[90] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[91] = { notes = danger[90], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[92] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[91], level_ranges = { { 56, 255 } } };
danger[93] = { danger[5], danger[36], danger[37], danger[38], danger[39], danger[40], danger[41], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75], danger[76], danger[80], danger[83], danger[88], danger[89], danger[92] };
danger[94] = { value = 'Vorpal Blade: can crit; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[33], entries = danger[93], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[95] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[96] = { notes = danger[95], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[78] };
danger[97] = { 'Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.' };
danger[98] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[99] = { notes = danger[98], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[100] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[101] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[102] = { danger[101] };
danger[103] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' };
danger[104] = { value = 'No listed threats', notes = danger[103], entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[105] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Mp Drainkiss: MP drain.', 'Sandspin: Accuracy down.', 'Terror Touch: Attack down.', 'Digest: HP drain.', 'Filamented Hold: Slow.', 'Radiant Breath: Silence, Slow.', 'Sound Blast: INT down.', 'Yawn: Sleep.', 'Voracious Trunk: Buff theft.', 'Pinecone Bomb: Sleep.', 'Sprout Smack: Slow.', 'Soporific: Sleep.', 'Wild Oats: VIT down.', 'Bad Breath: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Awful Eye: STR down.', 'Infrasonics: Evasion down.', 'Sandspray: Blindness.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[106] = { 'Base casting range: 3 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'This Blue Magic effect bypasses Utsusemi and Blink.' };
danger[107] = { notes = danger[106], unknown = {  }, activation_range = 3.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[108] = { kind = 'spell', id = 521, name = 'Mp Drainkiss', summary = 'Mp Drainkiss: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[107], level_ranges = { { 42, 255 } } };
danger[109] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 5 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[110] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[111] = { danger[110] };
danger[112] = { notes = danger[109], unknown = {  }, activation_range = 5.0, shape = 'area around the target', effect_radius = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[111] };
danger[113] = { kind = 'spell', id = 524, name = 'Sandspin', summary = 'Sandspin: Accuracy down', notes = {  }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[112], level_ranges = { { 1, 255 } } };
danger[114] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[115] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[116] = { danger[115] };
danger[117] = { notes = danger[114], unknown = {  }, activation_range = 5.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[116] };
danger[118] = { kind = 'spell', id = 539, name = 'Terror Touch', summary = 'Terror Touch: Attack down', notes = {  }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[117], level_ranges = { { 40, 255 } } };
danger[119] = { kind = 'spell', id = 542, name = 'Digest', summary = 'Digest: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[107], level_ranges = { { 36, 255 } } };
danger[120] = { 'Base casting range: 8 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[121] = { notes = danger[120], unknown = {  }, activation_range = 8.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[17] };
danger[122] = { kind = 'spell', id = 548, name = 'Filamented Hold', summary = 'Filamented Hold: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[121], level_ranges = { { 52, 255 } } };
danger[123] = { 'Base casting range: 12 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[124] = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[16] };
danger[125] = { notes = danger[123], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[124] };
danger[126] = { kind = 'spell', id = 565, name = 'Radiant Breath', summary = 'Radiant Breath: Silence, Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Silence', 'Slow' }, details = danger[125], level_ranges = { { 54, 255 } } };
danger[127] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 5 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[128] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[129] = { danger[128] };
danger[130] = { notes = danger[127], unknown = {  }, activation_range = 5.0, shape = 'area around the target', effect_radius = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[129] };
danger[131] = { kind = 'spell', id = 572, name = 'Sound Blast', summary = 'Sound Blast: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[130], level_ranges = { { 32, 255 } } };
danger[132] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 5 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[133] = { notes = danger[132], unknown = {  }, activation_range = 5.0, shape = 'area around the target', effect_radius = 5.0, shadows = { { mode = 'wipe' } } };
danger[134] = { kind = 'spell', id = 576, name = 'Yawn', summary = 'Yawn: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[133], level_ranges = { { 64, 255 } } };
danger[135] = { 'Base casting range: 10 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[136] = { notes = danger[135], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[137] = { kind = 'spell', id = 579, name = 'Voracious Trunk', summary = 'Voracious Trunk: Buff theft', notes = {  }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[136], level_ranges = { { 64, 255 } } };
danger[138] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[139] = { notes = danger[138], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[140] = { kind = 'spell', id = 596, name = 'Pinecone Bomb', summary = 'Pinecone Bomb: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[139], level_ranges = { { 36, 255 } } };
danger[141] = { 'Base casting range: 3 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[142] = { notes = danger[141], unknown = {  }, activation_range = 3.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[17] };
danger[143] = { kind = 'spell', id = 597, name = 'Sprout Smack', summary = 'Sprout Smack: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[142], level_ranges = { { 4, 255 } } };
danger[144] = { kind = 'spell', id = 598, name = 'Soporific', summary = 'Soporific: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[133], level_ranges = { { 24, 255 } } };
danger[145] = { 'Base casting range: 12 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[146] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[147] = { danger[146] };
danger[148] = { notes = danger[145], unknown = {  }, activation_range = 12.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[147] };
danger[149] = { kind = 'spell', id = 603, name = 'Wild Oats', summary = 'Wild Oats: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[148], level_ranges = { { 4, 255 } } };
danger[150] = { 'Base casting range: 12 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[151] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[152] = { danger[85], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[16], danger[151] };
danger[153] = { notes = danger[150], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[152] };
danger[154] = { kind = 'spell', id = 604, name = 'Bad Breath', summary = 'Bad Breath: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = danger[153], level_ranges = { { 61, 255 } } };
danger[155] = { 'Base casting range: 8 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[156] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[157] = { danger[156] };
danger[158] = { notes = danger[155], unknown = {  }, activation_range = 8.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[157] };
danger[159] = { kind = 'spell', id = 606, name = 'Awful Eye', summary = 'Awful Eye: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[158], level_ranges = { { 46, 255 } } };
danger[160] = { 'Base casting range: 3 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[161] = { notes = danger[160], unknown = {  }, activation_range = 3.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[102] };
danger[162] = { kind = 'spell', id = 610, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[161], level_ranges = { { 65, 255 } } };
danger[163] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[164] = { notes = danger[163], unknown = {  }, activation_range = 5.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[165] = { kind = 'spell', id = 621, name = 'Sandspray', summary = 'Sandspray: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[164], level_ranges = { { 66, 255 } } };
danger[166] = { danger[5], danger[108], danger[113], danger[118], danger[119], danger[122], danger[126], danger[131], danger[134], danger[137], danger[140], danger[143], danger[144], danger[149], danger[154], danger[159], danger[162], danger[165] };
danger[167] = { value = 'Vorpal Blade: can crit; Mp Drainkiss: MP drain; Sandspin: Accuracy down; Terror Touch: Attack down; Digest: HP drain; Filamented Hold: Slow; Radiant Breath: Silence, Slow; Sound Blast: INT down; Yawn: Sleep; Voracious Trunk: Buff theft; Pinecone Bomb: Sleep; Sprout Smack: Slow; Soporific: Sleep; Wild Oats: VIT down; Bad Breath: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight; Awful Eye: STR down; Infrasonics: Evasion down; Sandspray: Blindness', notes = danger[105], entries = danger[166], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[168] = { 'Obfuscate: Flash. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[169] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[170] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[171] = { notes = danger[170], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[27] };
danger[172] = { kind = 'skill', id = 1721, name = 'Obfuscate', summary = 'Obfuscate: Flash', notes = danger[169], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[171] };
danger[173] = { danger[172] };
danger[174] = { value = 'Obfuscate: Flash', notes = danger[168], entries = danger[173], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[175] = { 'Foul Breath: Disease. Source targeting: cone.', 'Chomp Rush: Slow. Source targeting: single target.', 'Scythe Tail: Stun. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[176] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[177] = { notes = danger[176], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } };
danger[178] = { kind = 'skill', id = 376, name = 'Foul Breath', summary = 'Foul Breath: Disease', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = danger[177] };
danger[179] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[180] = { notes = danger[179], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[17] };
danger[181] = { kind = 'skill', id = 379, name = 'Chomp Rush', summary = 'Chomp Rush: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[180] };
danger[182] = { kind = 'skill', id = 380, name = 'Scythe Tail', summary = 'Scythe Tail: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[96] };
danger[183] = { danger[178], danger[181], danger[182] };
danger[184] = { value = 'Foul Breath: Disease; Chomp Rush: Slow; Scythe Tail: Stun', notes = danger[175], entries = danger[183], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[185] = { 'Poison Pick: Poison. Source targeting: single target.', 'Sound Vacuum Cockatrice: Silence. Source targeting: cone.', 'Sound Blast: INT down. Source targeting: area around the monster.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[186] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[187] = { notes = danger[186], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[188] = { kind = 'skill', id = 407, name = 'Poison Pick', summary = 'Poison Pick: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[187] };
danger[189] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[190] = { notes = danger[189], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[191] = { kind = 'skill', id = 408, name = 'Sound Vacuum Cockatrice', summary = 'Sound Vacuum Cockatrice: Silence', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[190] };
danger[192] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[193] = { notes = danger[192], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[129] };
danger[194] = { kind = 'skill', id = 410, name = 'Sound Blast', summary = 'Sound Blast: INT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[193] };
danger[195] = { kind = 'skill', id = 411, name = 'Baleful Gaze Cockatrice', summary = 'Baleful Gaze: petrification gaze', notes = danger[97], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[99] };
danger[196] = { danger[188], danger[191], danger[194], danger[195] };
danger[197] = { value = 'Poison Pick: Poison; Sound Vacuum Cockatrice: Silence; Sound Blast: INT down; Baleful Gaze: petrification gaze', notes = danger[185], entries = danger[196], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[198] = { 'Bone Crunch: Plague. Source targeting: single target.', 'Awful Eye: STR down. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Heavy Bellow: Stun. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[199] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[200] = { notes = danger[199], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[201] = { kind = 'skill', id = 385, name = 'Bone Crunch', summary = 'Bone Crunch: Plague', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = danger[200] };
danger[202] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[203] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[204] = { notes = danger[203], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[157] };
danger[205] = { kind = 'skill', id = 386, name = 'Awful Eye', summary = 'Awful Eye: STR down', notes = danger[202], categories = { 'debuff' }, effects = { 'STR down' }, details = danger[204] };
danger[206] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[207] = { notes = danger[206], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[78] };
danger[208] = { kind = 'skill', id = 387, name = 'Heavy Bellow', summary = 'Heavy Bellow: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[207] };
danger[209] = { danger[201], danger[205], danger[208] };
danger[210] = { value = 'Bone Crunch: Plague; Awful Eye: STR down; Heavy Bellow: Stun', notes = danger[198], entries = danger[209], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[211] = { 'Dispelling Wind: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Deadly Drive: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fang Rush: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dread Shriek: Paralysis. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Tail Crush: Poison, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Radiant Breath: silence and slow. Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[212] = { 'Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[213] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[214] = { notes = danger[213], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } };
danger[215] = { kind = 'skill', id = 813, name = 'Dispelling Wind', summary = 'Dispelling Wind: Buff removal', notes = danger[212], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[214] };
danger[216] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[217] = { notes = danger[216], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[218] = { kind = 'skill', id = 814, name = 'Deadly Drive', summary = 'Deadly Drive: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[217] };
danger[219] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[220] = { notes = danger[219], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[221] = { kind = 'skill', id = 816, name = 'Fang Rush', summary = 'Fang Rush: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[220] };
danger[222] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[223] = { notes = danger[222], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[224] = { kind = 'skill', id = 817, name = 'Dread Shriek', summary = 'Dread Shriek: Paralysis', notes = danger[169], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[223] };
danger[225] = { kind = 'skill', id = 818, name = 'Tail Crush', summary = 'Tail Crush: Poison, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[187] };
danger[226] = { 'Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.' };
danger[227] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[228] = { notes = danger[227], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[124] };
danger[229] = { kind = 'skill', id = 821, name = 'Radiant Breath', summary = 'Radiant Breath: silence and slow', notes = danger[226], categories = { 'debuff' }, effects = { 'Silence', 'Slow' }, details = danger[228] };
danger[230] = { danger[215], danger[218], danger[221], danger[224], danger[225], danger[229] };
danger[231] = { value = 'Dispelling Wind: Buff removal; Deadly Drive: can crit; Fang Rush: can crit; Dread Shriek: Paralysis; Tail Crush: Poison, can crit; Radiant Breath: silence and slow', notes = danger[211], entries = danger[230], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[232] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[233] = { notes = danger[232], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[234] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[235] = { notes = danger[234], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[236] = { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[235], level_ranges = { { 40, 255 } } };
danger[237] = { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[235], level_ranges = { { 40, 255 } } };
danger[238] = { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[235], level_ranges = { { 40, 255 } } };
danger[239] = { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[235], level_ranges = { { 40, 255 } } };
danger[240] = { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[235], level_ranges = { { 40, 255 } } };
danger[241] = { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[235], level_ranges = { { 40, 255 } } };
danger[242] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[243] = { notes = danger[242], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[244] = { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[243], level_ranges = { { 65, 255 } } };
danger[245] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[246] = { notes = danger[245], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[17] };
danger[247] = { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[246], level_ranges = { { 48, 255 } } };
danger[248] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[249] = { notes = danger[248], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[250] = { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[249], level_ranges = { { 56, 255 } } };
danger[251] = { danger[151] };
danger[252] = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.' };
danger[253] = { 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[254] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[28], level_ranges = { { 37, 255 } } };
danger[255] = { danger[254] };
danger[256] = { value = 'Flash: Flash', notes = danger[253], entries = danger[255], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[257] = { 'Snatch Morsel: Buff removal. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[258] = { kind = 'skill', id = 1700, name = 'Snatch Morsel', summary = 'Snatch Morsel: Buff removal', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[233] };
danger[259] = { danger[258] };
danger[260] = { value = 'Snatch Morsel: Buff removal', notes = danger[257], entries = danger[259], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[261] = { 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[262] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[263] = { notes = danger[262], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[86] };
danger[264] = { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[263] };
danger[265] = { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[217] };
danger[266] = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' };
danger[267] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[268] = { notes = danger[267], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[152] };
danger[269] = { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = danger[266], categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = danger[268] };
danger[270] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[271] = { notes = danger[270], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[272] = { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = danger[100], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[271] };
danger[273] = { danger[264], danger[265], danger[269], danger[272] };
danger[274] = { value = 'Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = danger[261], entries = danger[273], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[275] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[276] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[277] = { notes = danger[276], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[278] = { kind = 'skill', id = 1896, name = 'Rock Smash', summary = 'Rock Smash: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[277] };
danger[279] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down, Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[280] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[281] = { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[282] = { danger[280], danger[281] };
danger[283] = { notes = danger[279], unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'ignore' } }, removals = danger[282] };
danger[284] = { kind = 'skill', id = 1898, name = 'Enervation', summary = 'Enervation: Defense down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down', 'Magic defense down' }, details = danger[283] };
danger[285] = { danger[278], danger[284] };
danger[286] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down', notes = danger[275], entries = danger[285], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[287] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[288] = { kind = 'skill', id = 1743, name = 'Rock Smash', summary = 'Rock Smash: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[277] };
danger[289] = { kind = 'skill', id = 1745, name = 'Enervation', summary = 'Enervation: Defense down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down', 'Magic defense down' }, details = danger[283] };
danger[290] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[13], level_ranges = { { 55, 255 } } };
danger[291] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[21], level_ranges = { { 6, 255 } } };
danger[292] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[24], level_ranges = { { 18, 255 } } };
danger[293] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[294] = { notes = danger[293], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[251] };
danger[295] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[294], level_ranges = { { 21, 255 } } };
danger[296] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[297] = { notes = danger[296], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[298] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[297], level_ranges = { { 46, 255 } } };
danger[299] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[82], level_ranges = { { 8, 255 } } };
danger[300] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[87], level_ranges = { { 11, 255 } } };
danger[301] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[35], level_ranges = { { 46, 255 } } };
danger[302] = { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[35], level_ranges = { { 32, 255 } } };
danger[303] = { danger[288], danger[289], danger[290], danger[19], danger[291], danger[292], danger[295], danger[298], danger[299], danger[300], danger[301], danger[302] };
danger[304] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = danger[287], entries = danger[303], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[305] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[306] = { danger[278], danger[284], danger[254] };
danger[307] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Flash: Flash', notes = danger[305], entries = danger[306], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[308] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[309] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[35], level_ranges = { { 10, 255 } } };
danger[310] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[35], level_ranges = { { 20, 255 } } };
danger[311] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[79], level_ranges = { { 37, 255 } } };
danger[312] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[87], level_ranges = { { 20, 255 } } };
danger[313] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[35], level_ranges = { { 56, 255 } } };
danger[314] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[315] = { notes = danger[314], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[157] };
danger[316] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[315], level_ranges = { { 43, 255 } } };
danger[317] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[318] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[319] = { danger[318] };
danger[320] = { notes = danger[317], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[319] };
danger[321] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[320], level_ranges = { { 41, 255 } } };
danger[322] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[323] = { notes = danger[322], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[147] };
danger[324] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[323], level_ranges = { { 35, 255 } } };
danger[325] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[326] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[327] = { danger[326] };
danger[328] = { notes = danger[325], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[327] };
danger[329] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[328], level_ranges = { { 37, 255 } } };
danger[330] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[331] = { notes = danger[330], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[129] };
danger[332] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[331], level_ranges = { { 39, 255 } } };
danger[333] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[334] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[335] = { danger[334] };
danger[336] = { notes = danger[333], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[335] };
danger[337] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[336], level_ranges = { { 31, 255 } } };
danger[338] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[339] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[340] = { danger[339] };
danger[341] = { notes = danger[338], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[340] };
danger[342] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[341], level_ranges = { { 33, 255 } } };
danger[343] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[35], level_ranges = { { 45, 255 } } };
danger[344] = { danger[288], danger[289] };
danger[345] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down', notes = danger[275], entries = danger[344], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[346] = { 'Sticky Thread: Slow. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[347] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[348] = { notes = danger[347], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = danger[17] };
danger[349] = { kind = 'skill', id = 344, name = 'Sticky Thread', summary = 'Sticky Thread: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[348] };
danger[350] = { danger[349] };
danger[351] = { value = 'Sticky Thread: Slow', notes = danger[346], entries = danger[350], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[352] = { 'Vitriolic Spray: Burn. Source targeting: cone.', 'Thermal Pulse: Blindness. Source targeting: area around the monster.', 'Vitriolic Shower: Burn. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[353] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[354] = { notes = danger[353], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[47] };
danger[355] = { kind = 'skill', id = 1816, name = 'Vitriolic Spray', summary = 'Vitriolic Spray: Burn', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[354] };
danger[356] = { 'Normal activation range: 12.5 yalms. This is the move selection limit, not its affected area.', 'Area: 12.5 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[357] = { notes = danger[356], unknown = {  }, activation_range = 12.5, shape = 'area around the monster', effect_radius = 12.5, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[358] = { kind = 'skill', id = 1817, name = 'Thermal Pulse', summary = 'Thermal Pulse: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[357] };
danger[359] = { kind = 'skill', id = 1820, name = 'Vitriolic Shower', summary = 'Vitriolic Shower: Burn', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[354] };
danger[360] = { danger[355], danger[358], danger[359] };
danger[361] = { value = 'Vitriolic Spray: Burn; Thermal Pulse: Blindness; Vitriolic Shower: Burn', notes = danger[352], entries = danger[360], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[362] = { 'Circle Of Flames: Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[363] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[364] = { notes = danger[363], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[251] };
danger[365] = { kind = 'skill', id = 570, name = 'Circle Of Flames', summary = 'Circle Of Flames: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[364] };
danger[366] = { danger[365] };
danger[367] = { value = 'Circle Of Flames: Weight', notes = danger[362], entries = danger[366], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[368] = { 'Boiling Point: Magic defense down. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[369] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[370] = { danger[281] };
danger[371] = { notes = danger[369], unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[370] };
danger[372] = { kind = 'skill', id = 1822, name = 'Boiling Point', summary = 'Boiling Point: Magic defense down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Magic defense down' }, details = danger[371] };
danger[373] = { danger[372], danger[36], danger[37], danger[38], danger[39], danger[40], danger[41], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75], danger[76], danger[80], danger[83], danger[88], danger[89], danger[92] };
danger[374] = { value = 'Boiling Point: Magic defense down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[368], entries = danger[373], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[375] = { 'Numbing Breath: Paralysis. Random effects may not all happen on the same use. Source targeting: cone.', 'Cold Breath: Bind. Source targeting: cone.', 'Mandible Bite: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Poison Sting: Poison. Source targeting: single target.', 'Death Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wild Rage: Poison. Source targeting: area around the monster.', 'Earth Pounder: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[376] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[377] = { notes = danger[376], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[378] = { kind = 'skill', id = 348, name = 'Numbing Breath', summary = 'Numbing Breath: Paralysis', notes = danger[100], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[377] };
danger[379] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[380] = { notes = danger[379], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[86] };
danger[381] = { kind = 'skill', id = 349, name = 'Cold Breath', summary = 'Cold Breath: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[380] };
danger[382] = { kind = 'skill', id = 350, name = 'Mandible Bite', summary = 'Mandible Bite: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[217] };
danger[383] = { kind = 'skill', id = 351, name = 'Poison Sting', summary = 'Poison Sting: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[187] };
danger[384] = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[385] = { notes = danger[384], unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[386] = { kind = 'skill', id = 353, name = 'Death Scissors', summary = 'Death Scissors: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[385] };
danger[387] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[388] = { notes = danger[387], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[389] = { kind = 'skill', id = 354, name = 'Wild Rage', summary = 'Wild Rage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[388] };
danger[390] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[391] = { notes = danger[390], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[319] };
danger[392] = { kind = 'skill', id = 355, name = 'Earth Pounder', summary = 'Earth Pounder: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[391] };
danger[393] = { danger[378], danger[381], danger[382], danger[383], danger[386], danger[389], danger[392] };
danger[394] = { value = 'Numbing Breath: Paralysis; Cold Breath: Bind; Mandible Bite: can crit; Poison Sting: Poison; Death Scissors: can crit; Wild Rage: Poison; Earth Pounder: DEX down', notes = danger[375], entries = danger[393], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[395] = { danger[288], danger[289], danger[298], danger[309], danger[310], danger[311], danger[312], danger[313], danger[316], danger[321], danger[324], danger[329], danger[332], danger[337], danger[342], danger[343] };
danger[396] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[308], entries = danger[395], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[397] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'An empty list does not mean this monster is safe.' };
danger[398] = { value = 'Move list unresolved', notes = danger[397], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[7] };
danger[399] = { 'Yawn: Sleep. Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[400] = { 'Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: area around the monster.' };
danger[401] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[402] = { notes = danger[401], unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'ignore' } } };
danger[403] = { kind = 'skill', id = 1713, name = 'Yawn', summary = 'Yawn: Sleep', notes = danger[400], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[402] };
danger[404] = { danger[403] };
danger[405] = { value = 'Yawn: Sleep', notes = danger[399], entries = danger[404], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[406] = { 'Body Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Petro Eyes: Petrification. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Nullsong: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[407] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[408] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[409] = { notes = danger[408], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[410] = { kind = 'skill', id = 645, name = 'Body Slam', summary = 'Body Slam: can crit', notes = danger[407], categories = { 'crit' }, effects = {  }, details = danger[409] };
danger[411] = { 'Normal activation range: 9.5 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 9.5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[412] = { notes = danger[411], unknown = {  }, activation_range = 9.5, shape = 'front cone', cone_length = 9.5, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[413] = { kind = 'skill', id = 648, name = 'Petro Eyes', summary = 'Petro Eyes: Petrification', notes = danger[202], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[412] };
danger[414] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[415] = { notes = danger[414], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[416] = { kind = 'skill', id = 1792, name = 'Nullsong', summary = 'Nullsong: Buff removal', notes = danger[252], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[415] };
danger[417] = { danger[410], danger[413], danger[416] };
danger[418] = { value = 'Body Slam: can crit; Petro Eyes: Petrification; Nullsong: Buff removal', notes = danger[406], entries = danger[417], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[419] = { 'Hysteric Barrage: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dukkeripen Para: Paralysis. Source targeting: area around the monster.', 'Tail Slap: Stun. Source targeting: cone.', 'Hypnotic Sway: Amnesia. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[420] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 5 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[421] = { notes = danger[420], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 5 } } };
danger[422] = { kind = 'skill', id = 1753, name = 'Hysteric Barrage', summary = 'Hysteric Barrage: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[421] };
danger[423] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[424] = { notes = danger[423], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[425] = { kind = 'skill', id = 1756, name = 'Dukkeripen Para', summary = 'Dukkeripen Para: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[424] };
danger[426] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[427] = { notes = danger[426], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[78] };
danger[428] = { kind = 'skill', id = 1758, name = 'Tail Slap', summary = 'Tail Slap: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[427] };
danger[429] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[430] = { notes = danger[429], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } } };
danger[431] = { kind = 'skill', id = 1759, name = 'Hypnotic Sway', summary = 'Hypnotic Sway: Amnesia', notes = danger[202], categories = { 'debuff' }, effects = { 'Amnesia' }, details = danger[430] };
danger[432] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[43], level_ranges = { { 70, 255 } } };
danger[433] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[35], level_ranges = { { 20, 255 } } };
danger[434] = { danger[422], danger[425], danger[428], danger[431], danger[37], danger[39], danger[295], danger[432], danger[75], danger[80], danger[433], danger[83], danger[88], danger[89], danger[92] };
danger[435] = { value = 'Hysteric Barrage: can crit; Dukkeripen Para: Paralysis; Tail Slap: Stun; Hypnotic Sway: Amnesia; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga II: area poison; Drain: HP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[419], entries = danger[434], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[436] = { 'Hysteric Barrage: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dukkeripen Para: Paralysis. Source targeting: area around the monster.', 'Tail Slap: Stun. Source targeting: cone.', 'Hypnotic Sway: Amnesia. The gaze effect requires the target to face the monster. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[437] = { danger[422], danger[425], danger[428], danger[431] };
danger[438] = { value = 'Hysteric Barrage: can crit; Dukkeripen Para: Paralysis; Tail Slap: Stun; Hypnotic Sway: Amnesia', notes = danger[436], entries = danger[437], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[439] = { 'Hysteric Barrage: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dukkeripen Para: Paralysis. Source targeting: area around the monster.', 'Tail Slap: Stun. Source targeting: cone.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[440] = { kind = 'skill', id = 1766, name = 'Hysteric Barrage', summary = 'Hysteric Barrage: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[421] };
danger[441] = { kind = 'skill', id = 1769, name = 'Dukkeripen Para', summary = 'Dukkeripen Para: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[424] };
danger[442] = { kind = 'skill', id = 1771, name = 'Tail Slap', summary = 'Tail Slap: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[427] };
danger[443] = { danger[440], danger[441], danger[442], danger[290], danger[19], danger[291], danger[292], danger[295], danger[298], danger[299], danger[300], danger[301], danger[302] };
danger[444] = { value = 'Hysteric Barrage: can crit; Dukkeripen Para: Paralysis; Tail Slap: Stun; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = danger[439], entries = danger[443], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[445] = { 'Hysteric Barrage: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dukkeripen Para: Paralysis. Source targeting: area around the monster.', 'Tail Slap: Stun. Source targeting: cone.', 'Foe Requiem VI: Requiem.', 'Horde Lullaby: Sleep.', 'Carnage Elegy: Elegy.', 'Magic Finale: Buff removal.', 'Foe Lullaby: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[446] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[447] = { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } };
danger[448] = { danger[447] };
danger[449] = { notes = danger[446], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[448] };
danger[450] = { kind = 'spell', id = 373, name = 'Foe Requiem VI', summary = 'Foe Requiem VI: Requiem', notes = {  }, categories = { 'debuff' }, effects = { 'Requiem' }, details = danger[449], level_ranges = { { 67, 255 } } };
danger[451] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[452] = { notes = danger[451], unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } };
danger[453] = { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[452], level_ranges = { { 27, 255 } } };
danger[454] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[455] = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } };
danger[456] = { notes = danger[454], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[455] };
danger[457] = { kind = 'spell', id = 422, name = 'Carnage Elegy', summary = 'Carnage Elegy: Elegy', notes = {  }, categories = { 'debuff' }, effects = { 'Elegy' }, details = danger[456], level_ranges = { { 59, 255 } } };
danger[458] = { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = {  }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[35], level_ranges = { { 33, 255 } } };
danger[459] = { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[35], level_ranges = { { 16, 255 } } };
danger[460] = { danger[440], danger[441], danger[442], danger[450], danger[453], danger[457], danger[458], danger[459] };
danger[461] = { value = 'Hysteric Barrage: can crit; Dukkeripen Para: Paralysis; Tail Slap: Stun; Foe Requiem VI: Requiem; Horde Lullaby: Sleep; Carnage Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = danger[445], entries = danger[460], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[462] = { 'Hysteric Barrage: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dukkeripen Para: Paralysis. Source targeting: area around the monster.', 'Tail Slap: Stun. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[463] = { danger[440], danger[441], danger[442] };
danger[464] = { value = 'Hysteric Barrage: can crit; Dukkeripen Para: Paralysis; Tail Slap: Stun', notes = danger[462], entries = danger[463], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[465] = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[466] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[467] = { notes = danger[466], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[468] = { kind = 'skill', id = 472, name = 'Grave Reel', summary = 'Grave Reel: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[467] };
danger[469] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[470] = { notes = danger[469], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[471] = { kind = 'skill', id = 473, name = 'Ectosmash', summary = 'Ectosmash: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[470] };
danger[472] = { kind = 'skill', id = 474, name = 'Fear Touch', summary = 'Fear Touch: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[217] };
danger[473] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[474] = { notes = danger[473], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[116] };
danger[475] = { kind = 'skill', id = 475, name = 'Terror Touch', summary = 'Terror Touch: Attack down, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Attack down' }, details = danger[474] };
danger[476] = { 'Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.' };
danger[477] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[478] = { notes = danger[477], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[479] = { kind = 'skill', id = 476, name = 'Curse', summary = 'Curse: curse', notes = danger[476], categories = { 'debuff' }, effects = { 'Curse' }, details = danger[478] };
danger[480] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[481] = { notes = danger[480], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[482] = { kind = 'skill', id = 477, name = 'Dark Sphere', summary = 'Dark Sphere: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[481] };
danger[483] = { danger[468], danger[471], danger[472], danger[475], danger[479], danger[482], danger[37], danger[39], danger[295], danger[432], danger[75], danger[80], danger[433], danger[83], danger[88], danger[89], danger[92] };
danger[484] = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga II: area poison; Drain: HP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[465], entries = danger[483], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[485] = { 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Malediction: HP drain. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[486] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[487] = { notes = danger[486], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[17] };
danger[488] = { kind = 'skill', id = 479, name = 'Horror Cloud', summary = 'Horror Cloud: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[487] };
danger[489] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[490] = { notes = danger[489], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[491] = { kind = 'skill', id = 484, name = 'Black Cloud', summary = 'Black Cloud: Blindness', notes = danger[169], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[490] };
danger[492] = { 'Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.' };
danger[493] = { kind = 'skill', id = 485, name = 'Blood Saber', summary = 'Blood Saber: HP drain', notes = danger[492], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[467] };
danger[494] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[495] = { notes = danger[494], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[496] = { kind = 'skill', id = 1795, name = 'Malediction', summary = 'Malediction: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[495] };
danger[497] = { danger[488], danger[491], danger[493], danger[496] };
danger[498] = { value = 'Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Malediction: HP drain', notes = danger[485], entries = danger[497], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[499] = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Perdition: Instant KO. Random effects may not all happen on the same use. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[500] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[501] = { kind = 'skill', id = 1794, name = 'Perdition', summary = 'Perdition: Instant KO', notes = danger[500], categories = { 'other' }, effects = { 'Instant KO' }, details = danger[233] };
danger[502] = { danger[468], danger[471], danger[472], danger[475], danger[479], danger[482], danger[501], danger[37], danger[39], danger[295], danger[432], danger[75], danger[80], danger[433], danger[83], danger[88], danger[89], danger[92] };
danger[503] = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Perdition: Instant KO; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga II: area poison; Drain: HP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[499], entries = danger[502], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[504] = { 'Spinal Cleave: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Leaping Cleave: Stun. Source targeting: single target.', 'Hex Palm: HP drain. Source targeting: cone.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[505] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[506] = { notes = danger[505], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = true } } };
danger[507] = { kind = 'skill', id = 1778, name = 'Spinal Cleave', summary = 'Spinal Cleave: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[506] };
danger[508] = { kind = 'skill', id = 1780, name = 'Leaping Cleave', summary = 'Leaping Cleave: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[96] };
danger[509] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 7 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[510] = { notes = danger[509], unknown = {  }, activation_range = 7.0, shape = 'front cone', cone_length = 7.0, shadows = { { mode = 'wipe', per_hit = false } } };
danger[511] = { kind = 'skill', id = 1781, name = 'Hex Palm', summary = 'Hex Palm: HP drain', notes = { 'Source targeting: cone.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[510] };
danger[512] = { danger[507], danger[508], danger[511], danger[298], danger[309], danger[310], danger[311], danger[312], danger[313], danger[316], danger[321], danger[324], danger[329], danger[332], danger[337], danger[342], danger[343] };
danger[513] = { value = 'Spinal Cleave: can crit; Leaping Cleave: Stun; Hex Palm: HP drain; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[504], entries = danger[512], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[514] = { 'Spinal Cleave: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Leaping Cleave: Stun. Source targeting: single target.', 'Hex Palm: HP drain. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[515] = { danger[507], danger[508], danger[511], danger[36], danger[37], danger[38], danger[39], danger[40], danger[41], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75], danger[76], danger[80], danger[83], danger[88], danger[89], danger[92] };
danger[516] = { value = 'Spinal Cleave: can crit; Leaping Cleave: Stun; Hex Palm: HP drain; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[514], entries = danger[515], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] };
danger[517] = { 'Whip Tongue: Stun, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Breath: STR down. Source targeting: cone.', 'Stinking Gas: vitality down. Attempts Vitality Down on its targets. Source targeting: area around the monster. Possible effects: VIT down.', 'Undead Mold: Disease. Source targeting: cone.', 'Call Of The Grave: INT down. Source targeting: area around the monster.', 'Abyss Blast: Blindness. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[518] = { kind = 'skill', id = 486, name = 'Whip Tongue', summary = 'Whip Tongue: Stun, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Stun' }, details = danger[96] };
danger[519] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[520] = { notes = danger[519], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[157] };
danger[521] = { kind = 'skill', id = 488, name = 'Acid Breath', summary = 'Acid Breath: STR down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[520] };
danger[522] = { 'Attempts Vitality Down on its targets. Source targeting: area around the monster. Possible effects: VIT down.' };
danger[523] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[524] = { notes = danger[523], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[147] };
danger[525] = { kind = 'skill', id = 489, name = 'Stinking Gas', summary = 'Stinking Gas: vitality down', notes = danger[522], categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[524] };
danger[526] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[527] = { notes = danger[526], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } };
danger[528] = { kind = 'skill', id = 490, name = 'Undead Mold', summary = 'Undead Mold: Disease', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = danger[527] };
danger[529] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[530] = { notes = danger[529], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[129] };
danger[531] = { kind = 'skill', id = 491, name = 'Call Of The Grave', summary = 'Call Of The Grave: INT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[530] };
danger[532] = { kind = 'skill', id = 492, name = 'Abyss Blast', summary = 'Abyss Blast: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[481] };
danger[533] = { danger[518], danger[521], danger[525], danger[528], danger[531], danger[532] };
danger[534] = { value = 'Whip Tongue: Stun, can crit; Acid Breath: STR down; Stinking Gas: vitality down; Undead Mold: Disease; Call Of The Grave: INT down; Abyss Blast: Blindness', notes = danger[517], entries = danger[533], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
danger[535] = { 'Vile Belch: Plague, Silence. Source targeting: area around the monster.', 'Hypnic Lamp: Sleep. The gaze effect requires the target to face the monster. Source targeting: area around the monster.', 'Seismic Tail: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Seaspray: Slow. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[536] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Plague: Viruna; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[537] = { { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } };
danger[538] = { notes = danger[536], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[537] };
danger[539] = { kind = 'skill', id = 1694, name = 'Vile Belch', summary = 'Vile Belch: Plague, Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Plague', 'Silence' }, details = danger[538] };
danger[540] = { 'The gaze effect requires the target to face the monster. Source targeting: area around the monster.' };
danger[541] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[542] = { notes = danger[541], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } } };
danger[543] = { kind = 'skill', id = 1695, name = 'Hypnic Lamp', summary = 'Hypnic Lamp: Sleep', notes = danger[540], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[542] };
danger[544] = { kind = 'skill', id = 1696, name = 'Seismic Tail', summary = 'Seismic Tail: can crit', notes = danger[407], categories = { 'crit' }, effects = {  }, details = danger[409] };
danger[545] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[546] = { notes = danger[545], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[17] };
danger[547] = { kind = 'skill', id = 1697, name = 'Seaspray', summary = 'Seaspray: Slow', notes = danger[100], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[546] };
danger[548] = { danger[539], danger[543], danger[544], danger[547] };
danger[549] = { value = 'Vile Belch: Plague, Silence; Hypnic Lamp: Sleep; Seismic Tail: can crit; Seaspray: Slow', notes = danger[535], entries = danger[548], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Mamool Ja Sapper',
            ids    = { 1 },
            job    = 'thf/nin',
            levels = {
                [119] = { acc = 498, eva = 614, agi = 136, int = 117, mnd = 81, chr = 84, dex = 149, def = 537,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25, gravity = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5; Dual Wield 30', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Hospitaler',
            ids    = { 2 },
            job    = 'whm/whm',
            levels = {
                [119] = { acc = 475, eva = 490, agi = 108, int = 101, mnd = 140, chr = 120, dex = 103, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7657 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[32],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Fetial',
            ids    = { 3, 12, 21 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 490, eva = 499, agi = 127, int = 140, mnd = 101, chr = 110, dex = 133, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[94],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Spotter',
            ids    = { 4 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 500, eva = 614, agi = 136, int = 120, mnd = 81, chr = 81, dex = 153, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Handler',
            ids    = { 5, 14, 23 },
            job    = 'bst/bst',
            levels = {
                [119] = { acc = 490, eva = 521, agi = 97, int = 101, mnd = 101, chr = 140, dex = 133, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { slow = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Jas Lizard',
            ids    = { 6, 15, 24 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 127, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Hill Lizard (ID 307); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [119] = 2492 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Tail Blow: Stun; Brain Crush: Silence; Baleful Gaze: petrification gaze; Plague Breath: Poison; Infrasonics: Evasion down', notes = { 'Tail Blow: Stun. Source targeting: single target.', 'Brain Crush: Silence. Source targeting: single target.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'Plague Breath: Poison. Random effects may not all happen on the same use. Source targeting: cone.', 'Infrasonics: Evasion down. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 366, name = 'Tail Blow', summary = 'Tail Blow: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[96] }, { kind = 'skill', id = 369, name = 'Brain Crush', summary = 'Brain Crush: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, { kind = 'skill', id = 370, name = 'Baleful Gaze Lizard', summary = 'Baleful Gaze: petrification gaze', notes = danger[97], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[99] }, { kind = 'skill', id = 371, name = 'Plague Breath', summary = 'Plague Breath: Poison', notes = danger[100], categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 372, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[102] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Cataphract',
            ids    = { 7 },
            job    = 'drg/drg',
            levels = {
                [119] = { acc = 507, eva = 543, agi = 117, int = 90, mnd = 101, chr = 120, dex = 123, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Jas Wyvern',
            ids    = { 8, 17, 26, 84, 85, 86 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Blue Wyvern (ID 236); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [119] = 2492 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[104],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
            info_by_index = {
                [84] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
                [85] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
                [86] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
            },
        },
        {
            name   = 'Mamool Ja Entrancer',
            ids    = { 9, 18, 27 },
            job    = 'blu/blu',
            levels = {
                [119] = { acc = 481, eva = 527, agi = 108, int = 101, mnd = 101, chr = 101, dex = 114, def = 531,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[167],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Sapper',
            ids    = { 10, 19 },
            job    = 'thf/nin',
            levels = {
                [119] = { acc = 498, eva = 614, agi = 136, int = 117, mnd = 81, chr = 84, dex = 149, def = 537,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25, gravity = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5; Dual Wield 30', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Hospitaler',
            ids    = { 11, 20 },
            job    = 'whm/whm',
            levels = {
                [119] = { acc = 475, eva = 490, agi = 108, int = 101, mnd = 140, chr = 120, dex = 103, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7657 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[32],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Spotter',
            ids    = { 13, 22 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 500, eva = 614, agi = 136, int = 120, mnd = 81, chr = 81, dex = 153, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Cataphract',
            ids    = { 16, 25 },
            job    = 'drg/drg',
            levels = {
                [119] = { acc = 507, eva = 543, agi = 117, int = 90, mnd = 101, chr = 120, dex = 123, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Scout Puk',
            ids    = { 28 },
            levels = {
                [119] = { acc = 487, eva = 539, agi = 133, int = 103, mnd = 97, chr = 95, dex = 127, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            weapon_dmg = { piercing = 12.5 },
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Puk / Dragon', notes = { 'Source species: Puk (ID 224); family ID 97.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 56', notes = { 'Source base speed is 56; the ordinary monster default is 40. Animation speed is 56.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Scout Puk',
            ids    = { 29, 30, 31, 32 },
            levels = {
                [119] = { acc = 487, eva = 539, agi = 133, int = 103, mnd = 97, chr = 95, dex = 127, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            weapon_dmg = { piercing = 12.5 },
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Puk / Dragon', notes = { 'Source species: Puk (ID 224); family ID 97.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 56', notes = { 'Source base speed is 56; the ordinary monster default is 40. Animation speed is 56.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Raid Raptor',
            ids    = { 33 },
            levels = {
                [119] = { acc = 484, eva = 536, agi = 127, int = 90, mnd = 90, chr = 101, dex = 120, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Raptor / Lizard', notes = { 'Source species: Raptor (ID 315); family ID 129.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[184],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Raid Raptor',
            ids    = { 34, 35, 36, 37 },
            levels = {
                [119] = { acc = 484, eva = 536, agi = 127, int = 90, mnd = 90, chr = 101, dex = 120, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Raptor / Lizard', notes = { 'Source species: Raptor (ID 315); family ID 129.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[184],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Attack Ziz',
            ids    = { 38 },
            levels = {
                [119] = { acc = 481, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 114, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Cockatrice / Bird', notes = { 'Source species: Cockatrice (ID 177); family ID 79.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[197],
                blue = { value = 'Sound Blast', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 572, name = 'Sound Blast', level = 32, min_skill = 68, skill_ids = { 410 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Attack Ziz',
            ids    = { 39, 40, 41, 42 },
            levels = {
                [119] = { acc = 481, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 114, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Cockatrice / Bird', notes = { 'Source species: Cockatrice (ID 177); family ID 79.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[197],
                blue = { value = 'Sound Blast', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 572, name = 'Sound Blast', level = 32, min_skill = 68, skill_ids = { 410 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Battering Bugard',
            ids    = { 43, 44, 46, 47 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 655,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Bugard / Lizard', notes = { 'Source species: Bugard (ID 302); family ID 123.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[210],
                blue = { value = 'Awful Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 606, name = 'Awful Eye', level = 46, min_skill = 110, skill_ids = { 386 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Battering Bugard',
            ids    = { 45 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 655,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Bugard / Lizard', notes = { 'Source species: Bugard (ID 302); family ID 123.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[210],
                blue = { value = 'Awful Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 606, name = 'Awful Eye', level = 46, min_skill = 110, skill_ids = { 386 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wyvern',
            ids    = { 48, 49, 50 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 103, mnd = 84, chr = 95, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[231],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wyvern',
            ids    = { 51, 52 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 103, mnd = 84, chr = 95, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[231],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Poroggo Charmer',
            ids    = { 53, 54, 55, 56, 57 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 481, eva = 496, agi = 120, int = 153, mnd = 95, chr = 91, dex = 114, def = 557,
                          attack_skill = 404 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Poroggo / Beastmen', notes = { 'Source species: Green Poroggo (ID 145); family ID 65.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 150', notes = { 'Base attack delay 150 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Frog Song: Charm; Magic Hammer: MP drain; Water Bomb: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Frog Song: Charm. Source targeting: single target.', 'Magic Hammer: MP drain. Source targeting: single target.', 'Water Bomb: Silence. Source targeting: area around the target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1957, name = 'Frog Song', summary = 'Frog Song: Charm', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Charm' }, details = danger[233] }, { kind = 'skill', id = 1958, name = 'Magic Hammer', summary = 'Magic Hammer: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 1959, name = 'Water Bomb', summary = 'Water Bomb: Silence', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, danger[36], danger[37], danger[38], danger[39], danger[40], danger[41], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75], danger[76], danger[80], danger[83], danger[88], danger[89], danger[92] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Magic Hammer', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 646, name = 'Magic Hammer', level = 74, min_skill = 240, skill_ids = { 1958 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Phantasmal Puk',
            ids    = { 58, 63 },
            levels = {
                [119] = { acc = 487, eva = 539, agi = 133, int = 103, mnd = 97, chr = 95, dex = 127, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            weapon_dmg = { piercing = 12.5 },
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Puk / Dragon', notes = { 'Source species: Puk (ID 224); family ID 97.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 56', notes = { 'Source base speed is 56; the ordinary monster default is 40. Animation speed is 56.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dive-Puk',
            ids    = { 59, 60, 61, 62, 64, 65, 66, 67 },
            levels = {
                [119] = { acc = 487, eva = 539, agi = 133, int = 103, mnd = 97, chr = 95, dex = 127, def = 543,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            weapon_dmg = { piercing = 12.5 },
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Puk / Dragon', notes = { 'Source species: Puk (ID 224); family ID 97.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 56', notes = { 'Source base speed is 56; the ordinary monster default is 40. Animation speed is 56.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[174],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fleetfingered Mobel Ja',
            ids    = { 68 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 500, eva = 614, agi = 136, int = 120, mnd = 81, chr = 81, dex = 153, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Ravager',
            ids    = { 69, 70, 71 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 500, eva = 614, agi = 136, int = 120, mnd = 81, chr = 81, dex = 153, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Brontobugard',
            ids    = { 72 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 655,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Bugard / Lizard', notes = { 'Source species: Bugard (ID 302); family ID 123.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[210],
                blue = { value = 'Awful Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 606, name = 'Awful Eye', level = 46, min_skill = 110, skill_ids = { 386 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bull Bugard',
            ids    = { 73, 74, 75 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 655,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Bugard / Lizard', notes = { 'Source species: Bugard (ID 302); family ID 123.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[210],
                blue = { value = 'Awful Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 606, name = 'Awful Eye', level = 46, min_skill = 110, skill_ids = { 386 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gulool Ja Ja',
            ids    = { 76 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [119] = { acc = 495, eva = 566, agi = 136, int = 110, mnd = 81, chr = 90, dex = 142, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { fire = 4, ice = 2, wind = 9, earth = 9, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 2, bind = 2, silence = 9, slow = 9, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = -1, gravity = 2 },
            resist = { bind = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = { value = 'Miasma: Plague, Poison, Slow; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Miasma: Plague, Poison, Slow. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1800, name = 'Miasma', summary = 'Miasma: Plague, Poison, Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague', 'Poison', 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna; Poison: Poisona, Antidote, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, danger[16] } } }, danger[236], danger[237], danger[238], danger[239], danger[240], danger[241], danger[244], danger[247], danger[250] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Illuyankas',
            ids    = { 77 },
            levels = {
                [119] = { acc = 487, eva = 539, agi = 133, int = 110, mnd = 84, chr = 108, dex = 127, def = 556,
                          attack_skill = 404 },
            },
            ranks  = { fire = 9, ice = 9, wind = 9, earth = 6, thunder = 6, water = 6, light = 6, dark = 6,
                       paralyze = 9, bind = 9, silence = 9, slow = 6, poison = 6, light_sleep = 6, dark_sleep = 6,
                       blind = 6, stun = 6, gravity = 9 },
            magic_dmg = { all = -25 },
            weapon_dmg = { piercing = -50, blunt = -50 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Hydra / Dragon', notes = { 'Source species: Hydra (ID 222); family ID 96.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Pyric Blast: Plague; Polar Blast: Paralysis; Barofield: Weight; Trembling: Buff removal; Nerve Gas: Curse, Poison', notes = { 'Pyric Blast: Plague. Source targeting: cone.', 'Polar Blast: Paralysis. Source targeting: cone.', 'Barofield: Weight. Source targeting: cone.', 'Trembling: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'Nerve Gas: Curse, Poison. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1828, name = 'Pyric Blast', summary = 'Pyric Blast: Plague', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } } }, { kind = 'skill', id = 1830, name = 'Polar Blast', summary = 'Polar Blast: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 1832, name = 'Barofield', summary = 'Barofield: Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[251] } }, { kind = 'skill', id = 1834, name = 'Trembling', summary = 'Trembling: Buff removal', notes = danger[252], categories = { 'dispel' }, effects = { 'Buff removal' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 1836, name = 'Nerve Gas', summary = 'Nerve Gas: Curse, Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Curse', 'Poison' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Curse: Cursna, Holy Water; Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Decimator Mabel Ja',
            ids    = { 78 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 490, eva = 499, agi = 127, int = 140, mnd = 101, chr = 110, dex = 133, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[94],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunderclap Sareel Ja',
            ids    = { 79 },
            job    = 'bst/bst',
            levels = {
                [119] = { acc = 490, eva = 521, agi = 97, int = 101, mnd = 101, chr = 140, dex = 133, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { slow = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunderbolt Piraal Ja',
            ids    = { 80 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 494, eva = 614, agi = 136, int = 120, mnd = 81, chr = 81, dex = 140, def = 533,
                          attack_skill = 404 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            info = {
                family = { value = 'Raptor / Lizard', notes = { 'Source species: Raptor (ID 315); family ID 129.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [119] = 2350 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[184],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Panurgic Ryubool Ja',
            ids    = { 81 },
            job    = 'blu/blu',
            levels = {
                [119] = { acc = 481, eva = 527, agi = 108, int = 101, mnd = 101, chr = 101, dex = 114, def = 531,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[167],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sagelord Molaal Ja',
            ids    = { 82 },
            job    = 'blm/whm',
            levels = {
                [119] = { acc = 485, eva = 496, agi = 121, int = 127, mnd = 114, chr = 113, dex = 123, def = 529,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7537 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[94],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Strifelord Bakool Ja',
            ids    = { 83 },
            job    = 'drg/drg',
            levels = {
                [119] = { acc = 507, eva = 543, agi = 117, int = 90, mnd = 101, chr = 120, dex = 123, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eidolic Qufeel Ja',
            ids    = { 87, 88, 89, 90, 91, 92, 93, 94 },
            job    = 'nin/nin',
            levels = {
                [119] = { acc = 495, eva = 566, agi = 136, int = 110, mnd = 81, chr = 90, dex = 142, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = { value = 'Vorpal Blade: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[5], danger[236], danger[237], danger[238], danger[239], danger[240], danger[241], danger[244], danger[247], danger[250] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Searing Vogaal Ja',
            ids    = { 95 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 481, eva = 527, agi = 88, int = 81, mnd = 120, chr = 120, dex = 114, def = 599,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, ice = -1, wind = 4, earth = 5, thunder = 3, water = 1, light = 1, paralyze = -1,
                       bind = -1, silence = 4, slow = 5, poison = 1, light_sleep = 1, stun = 3, gravity = 4 },
            resist = { sleep = 25 },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Knight Ja (ID 132); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7317 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[256],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Scalding Fafool Ja',
            ids    = { 96 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 500, eva = 614, agi = 136, int = 120, mnd = 81, chr = 81, dex = 153, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 260 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[8],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gandaberunda',
            ids    = { 97 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 476, eva = 527, agi = 95, int = 140, mnd = 140, chr = 130, dex = 104, def = 528,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            weapon_dmg = { piercing = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Colibri / Bird', notes = { 'Source species: Colibri (ID 179); family ID 80.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 1820 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[260],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ravenous Colibri',
            ids    = { 98, 99, 100 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 476, eva = 527, agi = 95, int = 140, mnd = 140, chr = 130, dex = 104, def = 528,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            weapon_dmg = { piercing = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Colibri / Bird', notes = { 'Source species: Colibri (ID 179); family ID 80.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 1820 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[260],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Devoted Darla',
            ids    = { 101 },
            nm     = true,
            levels = {
                [119] = { acc = 490, eva = 533, agi = 120, int = 90, mnd = 84, chr = 101, dex = 133, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = 3, thunder = -1, water = 3, light = -1, dark = 4,
                       paralyze = -1, bind = -1, silence = -1, slow = 3, poison = 3, light_sleep = -1,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Ameretat (ID 352); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[274],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Anguished Ameretat',
            ids    = { 102, 103, 104 },
            nm     = true,
            levels = {
                [119] = { acc = 490, eva = 533, agi = 120, int = 90, mnd = 84, chr = 101, dex = 133, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = 3, thunder = -1, water = 3, light = -1, dark = 4,
                       paralyze = -1, bind = -1, silence = -1, slow = 3, poison = 3, light_sleep = -1,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Ameretat (ID 352); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[274],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Hussar',
            ids    = { 105, 106, 111, 112 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 481, eva = 527, agi = 88, int = 81, mnd = 120, chr = 120, dex = 114, def = 599,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, ice = -1, wind = 4, earth = 5, thunder = 3, water = 1, light = 1, paralyze = -1,
                       bind = -1, silence = 4, slow = 5, poison = 1, light_sleep = 1, stun = 3, gravity = 4 },
            resist = { sleep = 25 },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Knight Ja (ID 132); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7317 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[256],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Mamool Ja Hussar',
            ids    = { 107, 108, 109, 110, 113 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 481, eva = 527, agi = 88, int = 81, mnd = 120, chr = 120, dex = 114, def = 599,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, ice = -1, wind = 4, earth = 5, thunder = 3, water = 1, light = 1, paralyze = -1,
                       bind = -1, silence = 4, slow = 5, poison = 1, light_sleep = 1, stun = 3, gravity = 4 },
            resist = { sleep = 25 },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Knight Ja (ID 132); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7317 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[256],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Troll Paviser',
            ids    = { 114, 122, 130 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[286],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Stormer',
            ids    = { 115 },
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 482, eva = 507, agi = 95, int = 114, mnd = 127, chr = 110, dex = 117, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11752 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[304],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Hoplite',
            ids    = { 116 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 478, eva = 510, agi = 75, int = 75, mnd = 127, chr = 120, dex = 108, def = 605,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12195 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[307],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Pezhetairoi',
            ids    = { 117, 125, 133 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 114, mnd = 88, chr = 81, dex = 127, def = 547,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12195 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[308], entries = { danger[278], danger[284], danger[298], danger[309], danger[310], danger[311], danger[312], danger[313], danger[316], danger[321], danger[324], danger[329], danger[332], danger[337], danger[342], danger[343] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Cannoneer',
            ids    = { 118 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 530, eva = 503, agi = 134, int = 95, mnd = 117, chr = 101, dex = 117, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11485 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Velites',
            ids    = { 119, 127, 135 },
            job    = 'mnk/mnk',
            levels = {
                [119] = { acc = 492, eva = 527, agi = 84, int = 75, mnd = 117, chr = 101, dex = 136, def = 557,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12999 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Speculator',
            ids    = { 120 },
            job    = 'pup/pup',
            levels = {
                [119] = { acc = 492, eva = 590, agi = 114, int = 95, mnd = 97, chr = 120, dex = 136, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11752 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Trolls Automaton',
            ids    = { 121, 129, 137 },
            job    = 'whm/whm',
            levels = {
                [119] = { acc = 469, eva = 486, agi = 101, int = 101, mnd = 140, chr = 120, dex = 90, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            info = {
                family = { value = 'Automaton / Supreme Beings', notes = { 'Source species: Automaton (ID 382); family ID 158.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7657 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Knockout: Evasion down', notes = { 'Knockout: Evasion down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 2067, name = 'Knockout', summary = 'Knockout: Evasion down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[102] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Troll Stormer',
            ids    = { 123, 131 },
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 482, eva = 507, agi = 95, int = 114, mnd = 127, chr = 110, dex = 117, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11752 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[304],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Hoplite',
            ids    = { 124, 132 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 478, eva = 510, agi = 75, int = 75, mnd = 127, chr = 120, dex = 108, def = 605,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12195 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[307],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Cannoneer',
            ids    = { 126, 134 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 530, eva = 503, agi = 134, int = 95, mnd = 117, chr = 101, dex = 117, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11485 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Speculator',
            ids    = { 128, 136 },
            job    = 'pup/pup',
            levels = {
                [119] = { acc = 492, eva = 590, agi = 114, int = 95, mnd = 97, chr = 120, dex = 136, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11752 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flame Eruca',
            ids    = { 138, 142 },
            levels = {
                [119] = { acc = 484, eva = 530, agi = 114, int = 90, mnd = 90, chr = 101, dex = 120, def = 512,
                          attack_skill = 404 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, thunder = -1, water = -2, dark = -1, paralyze = -1, bind = -1,
                       silence = -1, poison = -2, dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Eruca (ID 439); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[351],
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flame Eruca',
            ids    = { 139, 140, 141 },
            levels = {
                [119] = { acc = 484, eva = 530, agi = 114, int = 90, mnd = 90, chr = 101, dex = 120, def = 512,
                          attack_skill = 404 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, thunder = -1, water = -2, dark = -1, paralyze = -1, bind = -1,
                       silence = -1, poison = -2, dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Eruca (ID 439); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[351],
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wamouracampa',
            ids    = { 143, 147 },
            levels = {
                [119] = { acc = 481, eva = 530, agi = 114, int = 84, mnd = 84, chr = 95, dex = 114, def = 556,
                          attack_skill = 404 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Wamouracampa / Vermin', notes = { 'Source species: Wamouracampa (ID 471); family ID 198.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 24.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[361],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'War Wamouracampa',
            ids    = { 144, 145, 146 },
            levels = {
                [119] = { acc = 481, eva = 530, agi = 114, int = 84, mnd = 84, chr = 95, dex = 114, def = 556,
                          attack_skill = 404 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Wamouracampa / Vermin', notes = { 'Source species: Wamouracampa (ID 471); family ID 198.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 24.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[361],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Incendiary Bombs',
            ids    = { 148, 150, 151, 152 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 90, mnd = 90, chr = 108, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Cluster / Arcana', notes = { 'Source species: Cluster (ID 59); family ID 25.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[367],
                blue = { value = 'Refueling', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 530, name = 'Refueling', level = 48, min_skill = 116, skill_ids = { 569 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Incendiary Bombs',
            ids    = { 149 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 90, mnd = 90, chr = 108, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Cluster / Arcana', notes = { 'Source species: Cluster (ID 59); family ID 25.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[367],
                blue = { value = 'Refueling', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 530, name = 'Refueling', level = 48, min_skill = 116, skill_ids = { 569 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fighting Flan',
            ids    = { 153, 157 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -37.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'ability' },
            info = {
                family = { value = 'Flan / Amorph', notes = { 'Source species: Flan (ID 5); family ID 3.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[374],
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fighting Flan',
            ids    = { 154, 155, 156 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -37.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'ability' },
            info = {
                family = { value = 'Flan / Amorph', notes = { 'Source species: Flan (ID 5); family ID 3.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[374],
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Siege Scorpion',
            ids    = { 158, 162 },
            levels = {
                [119] = { acc = 481, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 114, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[394],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Siege Scorpion',
            ids    = { 159, 160, 161 },
            levels = {
                [119] = { acc = 481, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 114, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[394],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wamoura',
            ids    = { 163, 164, 165, 166, 167 },
            levels = {
                [119] = { acc = 481, eva = 530, agi = 114, int = 84, mnd = 84, chr = 95, dex = 114, def = 556,
                          attack_skill = 404 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            weapon_dmg = { piercing = 12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Wamoura / Vermin', notes = { 'Source species: Wamoura (ID 470); family ID 197.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1820 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Proboscis: Buff removal, MP drain; Erosion Dust: Dia', notes = { 'Proboscis: Buff removal, MP drain. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: cone.', 'Erosion Dust: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1953, name = 'Proboscis', summary = 'Proboscis: Buff removal, MP drain', notes = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: cone.' }, categories = { 'dispel', 'drain' }, effects = { 'Buff removal', 'MP drain' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 1954, name = 'Erosion Dust', summary = 'Erosion Dust: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[12] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'Exuviation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 645, name = 'Exuviation', level = 75, min_skill = 245, skill_ids = { 1955 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Aerial Torpedo',
            ids    = { 168, 173 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 487, eva = 496, agi = 120, int = 134, mnd = 101, chr = 117, dex = 127, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Bomb (ID 46); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Self-Destruct: explosion; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Self-Destruct: explosion. Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 509, name = 'Self-Destruct Bomb', summary = 'Self-Destruct: explosion', notes = { 'Area fire damage based on remaining HP; ignores shadows and defeats the bomb. Source targeting: area around the monster.' }, categories = { 'other' }, effects = {  }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore', per_hit = false } } } }, danger[36], danger[37], danger[38], danger[39], danger[40], danger[41], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75], danger[76], danger[80], danger[83], danger[88], danger[89], danger[92] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Self-Destruct', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 533, name = 'Self-Destruct', level = 50, min_skill = 122, skill_ids = { 509 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bombshells',
            ids    = { 169, 170, 171, 172, 174, 175, 176, 177 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 90, mnd = 90, chr = 108, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Cluster / Arcana', notes = { 'Source species: Cluster (ID 59); family ID 25.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[367],
                blue = { value = 'Refueling', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 530, name = 'Refueling', level = 48, min_skill = 116, skill_ids = { 569 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vyurvarjur the Nimble',
            ids    = { 178 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Forager',
            ids    = { 179, 180, 181 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[286],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Killing Claw',
            ids    = { 182 },
            levels = {
                [119] = { acc = 481, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 114, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[394],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Slaughterous Scorpion',
            ids    = { 183, 184, 185 },
            levels = {
                [119] = { acc = 481, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 114, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[394],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gurfurlur the Menacing',
            ids    = { 186 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [119] = { acc = 492, eva = 527, agi = 84, int = 75, mnd = 117, chr = 101, dex = 136, def = 557,
                          attack_skill = 404 },
            },
            ranks  = { fire = 7, ice = 7, wind = 2, earth = 7, thunder = 7, water = 2, light = 4, dark = 4,
                       paralyze = 7, bind = 7, silence = 2, slow = 7, poison = 2, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 7, gravity = 2 },
            weapon_dmg = { slashing = -50 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: General (ID 162); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12999 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = { value = 'Sledgehammer: Petrification; Haymaker: Amnesia; Pleiades Ray: Bind, Blindness, Paralysis, Plague, Poison, Silence, Slow', notes = { 'Sledgehammer: Petrification. Source targeting: cone.', 'Haymaker: Amnesia. Source targeting: cone.', 'Pleiades Ray: Bind, Blindness, Paralysis, Plague, Poison, Silence, Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1802, name = 'Sledgehammer', summary = 'Sledgehammer: Petrification', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 1804, name = 'Haymaker', summary = 'Haymaker: Amnesia', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Amnesia' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 1807, name = 'Pleiades Ray', summary = 'Pleiades Ray: Bind, Blindness, Paralysis, Plague, Poison, Silence, Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Plague', 'Poison', 'Silence', 'Slow' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Plague: Viruna; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { danger[85], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[16] } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Gere',
            ids    = { 187 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 494, eva = 538, agi = 130, int = 140, mnd = 101, chr = 94, dex = 140, def = 544,
                          attack_skill = 404 },
            },
            magic_dmg = { all = -50 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cerberus / Beast', notes = { 'Source species: Cerberus (ID 90); family ID 42.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 72', notes = { 'Source base speed is 72; the ordinary monster default is 40. Animation speed is 72.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 380', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Ululation: Paralysis; Gates Of Hades: Burn; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Ululation: Paralysis. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Gates Of Hades: Burn. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1788, name = 'Ululation', summary = 'Ululation: Paralysis', notes = danger[169], categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 1790, name = 'Gates Of Hades', summary = 'Gates Of Hades: Burn', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[47] } }, danger[298], danger[309], danger[310], danger[311], danger[312], danger[313], danger[316], danger[321], danger[324], danger[329], danger[332], danger[337], danger[342], danger[343] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Girzorhor the Imprudent',
            ids    = { 188 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Surmerdar the Unbridled',
            ids    = { 189 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 530, eva = 503, agi = 134, int = 95, mnd = 117, chr = 101, dex = 117, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11485 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dartorgor the Austere',
            ids    = { 190 },
            job    = 'mnk/mnk',
            levels = {
                [119] = { acc = 492, eva = 527, agi = 84, int = 75, mnd = 117, chr = 101, dex = 136, def = 557,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12999 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vorporlor the Barbaric',
            ids    = { 191 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 114, mnd = 88, chr = 81, dex = 127, def = 547,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12195 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[396],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vorjirzur the Valiant',
            ids    = { 192 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 478, eva = 510, agi = 75, int = 75, mnd = 127, chr = 120, dex = 108, def = 605,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12195 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Flash: Flash', notes = danger[305], entries = { danger[288], danger[289], danger[254] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wordorbor the Artificer',
            ids    = { 193 },
            job    = 'pup/pup',
            levels = {
                [119] = { acc = 492, eva = 590, agi = 114, int = 95, mnd = 97, chr = 120, dex = 136, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 11752 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cobalt Sentinel',
            ids    = { 194 },
            job    = 'whm/whm',
            levels = {
                [119] = { acc = 469, eva = 486, agi = 101, int = 101, mnd = 140, chr = 120, dex = 90, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            info = {
                family = { value = 'Automaton / Supreme Beings', notes = { 'Source species: Automaton (ID 382); family ID 158.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7657 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[14], danger[19], danger[22], danger[25], danger[29] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[31] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'White Sentinel',
            ids    = { 195 },
            job    = 'pld/pld',
            levels = {
                [119] = { acc = 474, eva = 513, agi = 81, int = 81, mnd = 120, chr = 120, dex = 101, def = 599,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            info = {
                family = { value = 'Automaton / Supreme Beings', notes = { 'Source species: Automaton (ID 382); family ID 158.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Flash: Flash', notes = { 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = danger[255], coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[31] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Hazel Sentinel',
            ids    = { 196 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 527, eva = 506, agi = 140, int = 101, mnd = 110, chr = 101, dex = 110, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            info = {
                family = { value = 'Automaton / Supreme Beings', notes = { 'Source species: Automaton (ID 382); family ID 158.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7657 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 400', notes = { 'Base attack delay 400 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[398],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Carmine Sentinel',
            ids    = { 197 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 140, mnd = 101, chr = 110, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            info = {
                family = { value = 'Automaton / Supreme Beings', notes = { 'Source species: Automaton (ID 382); family ID 158.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 400', notes = { 'Base attack delay 400 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[36], danger[37], danger[38], danger[39], danger[40], danger[41], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75], danger[76], danger[80], danger[83], danger[88], danger[89], danger[92] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[31] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Xarhorkur the Claviger',
            ids    = { 198 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Destroyer (ID 161); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[345],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Zurmurwur the Ruthless',
            ids    = { 199 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 114, mnd = 88, chr = 81, dex = 127, def = 547,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12195 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[396],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Restless Apkallu',
            ids    = { 200 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [119] = { acc = 492, eva = 530, agi = 90, int = 81, mnd = 110, chr = 101, dex = 136, def = 548,
                          attack_skill = 404 },
            },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 6932 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 28', notes = { 'Source base speed is 28; the ordinary monster default is 40. Animation speed is 28.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[405],
                blue = { value = 'Yawn', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 576, name = 'Yawn', level = 64, min_skill = 191, skill_ids = { 1713 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ravenous Colibri',
            ids    = { 201, 202, 203 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 476, eva = 527, agi = 95, int = 140, mnd = 140, chr = 130, dex = 104, def = 528,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            weapon_dmg = { piercing = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Colibri / Bird', notes = { 'Source species: Colibri (ID 179); family ID 80.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 1820 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[260],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wicked Dahak',
            ids    = { 204 },
            nm     = true,
            levels = {
                [119] = { acc = 487, eva = 536, agi = 127, int = 97, mnd = 97, chr = 101, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dahak (ID 218); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[418],
                blue = { value = 'Body Slam', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 564, name = 'Body Slam', level = 62, min_skill = 181, skill_ids = { 645 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Garma',
            ids    = { 205, 206, 207 },
            nm     = true,
            levels = {
                [119] = { acc = 487, eva = 536, agi = 127, int = 97, mnd = 97, chr = 101, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dahak (ID 218); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[418],
                blue = { value = 'Body Slam', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 564, name = 'Body Slam', level = 62, min_skill = 181, skill_ids = { 645 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Destroyer',
            ids    = { 208, 209, 212, 215, 216 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Destroyer (ID 161); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[286],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Destroyer',
            ids    = { 210, 211, 213, 214 },
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 84, mnd = 97, chr = 101, dex = 127, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Destroyer (ID 161); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 12460 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[286],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia Immolator',
            ids    = { 217, 226, 235 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 490, eva = 496, agi = 120, int = 153, mnd = 114, chr = 123, dex = 133, def = 532,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8225 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[435],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia Jaeger',
            ids    = { 218, 227, 236 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 533, eva = 506, agi = 140, int = 114, mnd = 123, chr = 114, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8422 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia Commandress',
            ids    = { 219 },
            job    = 'smn/smn',
            levels = {
                [119] = { acc = 481, eva = 491, agi = 110, int = 142, mnd = 142, chr = 142, dex = 114, def = 532,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8030 }, mp = { [119] = 3690 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamias Elemental',
            ids    = { 220, 229, 238, 301, 302, 303 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 484, eva = 528, agi = 110, int = 120, mnd = 81, chr = 81, dex = 120, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [119] = 2439 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[298], danger[309], danger[310], danger[311], danger[312], danger[313], danger[316], danger[321], danger[324], danger[329], danger[332], danger[337], danger[342], danger[343] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[31] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
            info_by_index = {
                [302] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
                [303] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
            },
        },
        {
            name   = 'Lamias Avatar',
            ids    = { 221, 230, 239, 304, 305, 306 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 140, mnd = 101, chr = 110, dex = 120, def = 513,
                          attack_skill = 404 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison Nails: Poison', notes = { 'Poison Nails: Poison. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 907, name = 'Poison Nails', summary = 'Poison Nails: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Lamia Rover',
            ids    = { 222 },
            job    = 'cor/cor',
            levels = {
                [119] = { acc = 490, eva = 524, agi = 129, int = 133, mnd = 114, chr = 114, dex = 133, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow Seafarer',
            ids    = { 223 },
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 485, eva = 510, agi = 101, int = 133, mnd = 133, chr = 123, dex = 123, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[444],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow Cantatrice',
            ids    = { 224 },
            job    = 'brd/brd',
            levels = {
                [119] = { acc = 485, eva = 505, agi = 90, int = 123, mnd = 123, chr = 142, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[461],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow Shiranuhi',
            ids    = { 225 },
            job    = 'sam/sam',
            levels = {
                [119] = { acc = 490, eva = 540, agi = 110, int = 114, mnd = 114, chr = 123, dex = 133, def = 547,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 9137 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[464],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia Commandress',
            ids    = { 228, 237 },
            job    = 'smn/smn',
            levels = {
                [119] = { acc = 481, eva = 491, agi = 110, int = 142, mnd = 142, chr = 142, dex = 114, def = 532,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8030 }, mp = { [119] = 3690 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia Rover',
            ids    = { 231, 240 },
            job    = 'cor/cor',
            levels = {
                [119] = { acc = 490, eva = 524, agi = 129, int = 133, mnd = 114, chr = 114, dex = 133, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow Seafarer',
            ids    = { 232, 241 },
            job    = 'rdm/rdm',
            levels = {
                [119] = { acc = 485, eva = 510, agi = 101, int = 133, mnd = 133, chr = 123, dex = 123, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[444],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow Cantatrice',
            ids    = { 233, 242 },
            job    = 'brd/brd',
            levels = {
                [119] = { acc = 485, eva = 505, agi = 90, int = 123, mnd = 123, chr = 142, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[461],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow Shiranuhi',
            ids    = { 234, 243 },
            job    = 'sam/sam',
            levels = {
                [119] = { acc = 490, eva = 540, agi = 110, int = 114, mnd = 114, chr = 123, dex = 133, def = 547,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 9137 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[464],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gespenst',
            ids    = { 244, 245 },
            job    = 'war/blm',
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 114, mnd = 88, chr = 111, dex = 120, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8044 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[484],
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gespenst',
            ids    = { 246, 247 },
            job    = 'war/blm',
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 114, mnd = 88, chr = 111, dex = 120, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8044 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[484],
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Assault Draugar',
            ids    = { 248, 249, 250, 256 },
            job    = 'drg/drg',
            levels = {
                [119] = { acc = 504, eva = 540, agi = 110, int = 90, mnd = 95, chr = 120, dex = 117, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Draugar (ID 416); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 360', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[498],
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Assault Draugar',
            ids    = { 251, 252 },
            job    = 'thf/thf',
            levels = {
                [119] = { acc = 497, eva = 610, agi = 129, int = 120, mnd = 75, chr = 81, dex = 147, def = 536,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Draugar (ID 416); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[498],
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Assault Draugar',
            ids    = { 253, 254 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 528, agi = 110, int = 120, mnd = 75, chr = 81, dex = 127, def = 541,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Skeleton / Undead', notes = { 'Source species: Draugar (ID 416); family ID 178.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8130 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Horror Cloud: Slow; Black Cloud: Blindness; Blood Saber: HP drain; Malediction: HP drain; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Horror Cloud: Slow. Source targeting: single target.', 'Black Cloud: Blindness. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Blood Saber: HP drain. Attempts to drain HP after a successful damage result and wipes shadows. Undead targets take damage without healing the monster. Source targeting: area around the monster. Possible effects: HP drain.', 'Malediction: HP drain. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[488], danger[491], danger[493], danger[496], danger[298], danger[309], danger[310], danger[311], danger[312], danger[313], danger[316], danger[321], danger[324], danger[329], danger[332], danger[337], danger[342], danger[343] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[31] },
                blue = { value = 'Blood Saber', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 541, name = 'Blood Saber', level = 48, min_skill = 116, skill_ids = { 485 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Draugars Wyvern',
            ids    = { 255, 257 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 546,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Shadow Wyvern (ID 237); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [119] = 2492 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[104],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Assault Bhoot',
            ids    = { 258 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 5, wind = -1, thunder = -2, water = -1, light = -2, dark = 5, paralyze = 5,
                       bind = 5, silence = -1, poison = -1, light_sleep = -2, dark_sleep = 5, blind = 5, stun = -2,
                       gravity = -1 },
            resist = { paralyze = 20 },
            magic_dmg = { all = -25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Bhoot (ID 407); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[503],
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Assault Bhoot',
            ids    = { 259, 260, 261, 262 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 5, wind = -1, thunder = -2, water = -1, light = -2, dark = 5, paralyze = 5,
                       bind = 5, silence = -1, poison = -1, light_sleep = -2, dark_sleep = 5, blind = 5, stun = -2,
                       gravity = -1 },
            resist = { paralyze = 20 },
            magic_dmg = { all = -25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Bhoot (ID 407); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[503],
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qutrub Extortionist',
            ids    = { 263, 264, 265 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 120, mnd = 75, chr = 68, dex = 127, def = 544,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Qutrub / Undead', notes = { 'Source species: Qutrub (ID 414); family ID 176.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 24390 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[513],
                blue = { value = 'Spinal Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 540, name = 'Spinal Cleave', level = 63, min_skill = 186, skill_ids = { 1778 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qutrub Extortionist',
            ids    = { 266 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 120, mnd = 75, chr = 68, dex = 127, def = 544,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Qutrub / Undead', notes = { 'Source species: Qutrub (ID 414); family ID 176.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 24390 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[513],
                blue = { value = 'Spinal Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 540, name = 'Spinal Cleave', level = 63, min_skill = 186, skill_ids = { 1778 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qutrub Wastrel',
            ids    = { 267, 268, 269 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 487, eva = 493, agi = 114, int = 140, mnd = 95, chr = 97, dex = 127, def = 529,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Qutrub / Undead', notes = { 'Source species: Qutrub (ID 414); family ID 176.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 22434 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[516],
                blue = { value = 'Spinal Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 540, name = 'Spinal Cleave', level = 63, min_skill = 186, skill_ids = { 1778 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qutrub Wastrel',
            ids    = { 270 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 487, eva = 493, agi = 114, int = 140, mnd = 95, chr = 97, dex = 127, def = 529,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Qutrub / Undead', notes = { 'Source species: Qutrub (ID 414); family ID 176.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 22434 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[516],
                blue = { value = 'Spinal Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 540, name = 'Spinal Cleave', level = 63, min_skill = 186, skill_ids = { 1778 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Expunger',
            ids    = { 271, 272, 273 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 84, chr = 108, dex = 120, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Doomed / Undead', notes = { 'Source species: Doomed (ID 398); family ID 170.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 270 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[534],
                blue = { value = 'Stinking Gas', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 537, name = 'Stinking Gas', level = 44, min_skill = 104, skill_ids = { 489 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Expunger',
            ids    = { 274, 275 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 84, chr = 108, dex = 120, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Doomed / Undead', notes = { 'Source species: Doomed (ID 398); family ID 170.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 270 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[534],
                blue = { value = 'Stinking Gas', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 537, name = 'Stinking Gas', level = 44, min_skill = 104, skill_ids = { 489 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bhoot Invader',
            ids    = { 276, 281 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 5, wind = -1, thunder = -2, water = -1, light = -2, dark = 5, paralyze = 5,
                       bind = 5, silence = -1, poison = -1, light_sleep = -2, dark_sleep = 5, blind = 5, stun = -2,
                       gravity = -1 },
            resist = { paralyze = 20 },
            magic_dmg = { all = -25 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Bhoot (ID 407); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[503],
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bhoot Intruder',
            ids    = { 277, 278, 279, 280, 282, 283, 284, 285 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117, dex = 120, def = 526,
                          attack_skill = 404 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7478 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[484],
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia No4',
            ids    = { 286 },
            job    = 'cor/cor',
            levels = {
                [119] = { acc = 490, eva = 524, agi = 129, int = 133, mnd = 114, chr = 114, dex = 133, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia Freebooter',
            ids    = { 287, 288, 289 },
            job    = 'cor/cor',
            levels = {
                [119] = { acc = 490, eva = 524, agi = 129, int = 133, mnd = 114, chr = 114, dex = 133, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Pining Abazohn',
            ids    = { 290 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 120, mnd = 75, chr = 68, dex = 127, def = 544,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Qutrub / Undead', notes = { 'Source species: Qutrub (ID 414); family ID 176.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 24390 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[513],
                blue = { value = 'Spinal Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 540, name = 'Spinal Cleave', level = 63, min_skill = 186, skill_ids = { 1778 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Qutrub Forayer',
            ids    = { 291, 292, 293 },
            job    = 'drk/drk',
            levels = {
                [119] = { acc = 487, eva = 525, agi = 104, int = 120, mnd = 75, chr = 68, dex = 127, def = 544,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            info = {
                family = { value = 'Qutrub / Undead', notes = { 'Source species: Qutrub (ID 414); family ID 176.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 24390 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[513],
                blue = { value = 'Spinal Cleave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 540, name = 'Spinal Cleave', level = 63, min_skill = 186, skill_ids = { 1778 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Medusa',
            ids    = { 294 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 533, eva = 506, agi = 140, int = 114, mnd = 123, chr = 114, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = 9, gravity = 4 },
            resist = { poison = 25 },
            weapon_dmg = { slashing = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'poison' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Medusa (ID 130); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7657 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Petrifaction: Petrification; Tail Slap: Stun; Pinning Shot: Bind; Calcifying Deluge: Petrification; Gorgon Dance: Petrification', notes = { 'Petrifaction: Petrification. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Tail Slap: Stun. Source targeting: cone.', 'Pinning Shot: Bind. Source targeting: area around the target.', 'Calcifying Deluge: Petrification. Source targeting: area around the target.', 'Gorgon Dance: Petrification. Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1808, name = 'Petrifaction', summary = 'Petrifaction: Petrification', notes = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 1810, name = 'Tail Slap', summary = 'Tail Slap: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[427] }, { kind = 'skill', id = 1812, name = 'Pinning Shot', summary = 'Pinning Shot: Bind', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[86] } }, { kind = 'skill', id = 1813, name = 'Calcifying Deluge', summary = 'Calcifying Deluge: Petrification', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 1814, name = 'Gorgon Dance', summary = 'Gorgon Dance: Petrification', notes = danger[400], categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Nemean Lion',
            ids    = { 295 },
            levels = {
                [119] = { acc = 487, eva = 536, agi = 127, int = 90, mnd = 97, chr = 108, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { fire = 8, ice = 5, wind = 8, earth = 7, thunder = 9, water = 5, light = 7, dark = 5,
                       paralyze = 7, bind = 7, silence = 7, slow = 7, poison = 7, light_sleep = 7, dark_sleep = 7,
                       blind = 7, stun = 9, gravity = 8 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Khimaira / Arcana', notes = { 'Source species: Khimaira (ID 67); family ID 30.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Thunderstrike: Stun; Dreadstorm: Terror; Fossilizing Breath: Petrification; Plague Swipe: Bio, Plague; Fulmination: Paralysis, Stun', notes = { 'Thunderstrike: Stun. Random effects may not all happen on the same use. Source targeting: area around the target.', 'Dreadstorm: Terror. Source targeting: area around the monster.', 'Fossilizing Breath: Petrification. Source targeting: cone.', 'Plague Swipe: Bio, Plague. Source targeting: area around the target.', 'Fulmination: Paralysis, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 2023, name = 'Thunderstrike', summary = 'Thunderstrike: Stun', notes = { 'Random effects may not all happen on the same use. Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[78] } }, { kind = 'skill', id = 2025, name = 'Dreadstorm', summary = 'Dreadstorm: Terror', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Terror' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } } } }, { kind = 'skill', id = 2026, name = 'Fossilizing Breath', summary = 'Fossilizing Breath: Petrification', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 2027, name = 'Plague Swipe', summary = 'Plague Swipe: Bio, Plague', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Bio', 'Plague' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bio: Erase (one random eligible timed ailment), Panacea; Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = { { effect = 'Bio', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Plague', options = { 'Viruna' } } } } }, { kind = 'skill', id = 2028, name = 'Fulmination', summary = 'Fulmination: Paralysis, Stun', notes = danger[169], categories = { 'debuff' }, effects = { 'Paralysis', 'Stun' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[7] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Lamia No34',
            ids    = { 296 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 533, eva = 506, agi = 140, int = 114, mnd = 123, chr = 114, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8422 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia No21',
            ids    = { 297 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 490, eva = 496, agi = 120, int = 153, mnd = 114, chr = 123, dex = 133, def = 532,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8225 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[435],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia No15',
            ids    = { 298 },
            job    = 'cor/cor',
            levels = {
                [119] = { acc = 490, eva = 524, agi = 129, int = 133, mnd = 114, chr = 114, dex = 133, def = 538,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow No11',
            ids    = { 299 },
            job    = 'sam/sam',
            levels = {
                [119] = { acc = 490, eva = 540, agi = 110, int = 114, mnd = 114, chr = 123, dex = 133, def = 547,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 9137 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[464],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia No9',
            ids    = { 300 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [119] = { acc = 481, eva = 491, agi = 110, int = 142, mnd = 142, chr = 142, dex = 114, def = 532,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8030 }, mp = { [119] = 3690 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Merrow No12',
            ids    = { 307 },
            job    = 'brd/brd',
            levels = {
                [119] = { acc = 485, eva = 505, agi = 90, int = 123, mnd = 123, chr = 142, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Merrow (ID 131); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8618 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[461],
                blue = { value = 'Tail Slap', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 640, name = 'Tail Slap', level = 69, min_skill = 215, skill_ids = { 1771 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia No3',
            ids    = { 308 },
            job    = 'blm/blm',
            levels = {
                [119] = { acc = 490, eva = 496, agi = 120, int = 153, mnd = 114, chr = 123, dex = 133, def = 532,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8225 }, mp = { [119] = 3630 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[435],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Lamia No2',
            ids    = { 309 },
            job    = 'rng/rng',
            levels = {
                [119] = { acc = 533, eva = 506, agi = 140, int = 114, mnd = 123, chr = 114, dex = 123, def = 542,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Lamiae / Beastmen', notes = { 'Source species: Lamiae (ID 129); family ID 59.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8422 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[438],
                blue = { value = 'Hysteric Barrage', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 641, name = 'Hysteric Barrage', level = 69, min_skill = 215, skill_ids = { 1753 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Akhty',
            ids    = { 310 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [119] = { acc = 492, eva = 530, agi = 90, int = 81, mnd = 110, chr = 101, dex = 136, def = 548,
                          attack_skill = 404 },
            },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 6932 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 28', notes = { 'Source base speed is 28; the ordinary monster default is 40. Animation speed is 28.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[405],
                blue = { value = 'Yawn', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 576, name = 'Yawn', level = 64, min_skill = 191, skill_ids = { 1713 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Restless Apkallu',
            ids    = { 311, 312, 313 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [119] = { acc = 492, eva = 530, agi = 90, int = 81, mnd = 110, chr = 101, dex = 136, def = 548,
                          attack_skill = 404 },
            },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 6932 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 28', notes = { 'Source base speed is 28; the ordinary monster default is 40. Animation speed is 28.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[405],
                blue = { value = 'Yawn', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 576, name = 'Yawn', level = 64, min_skill = 191, skill_ids = { 1713 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ikatere',
            ids    = { 314 },
            nm     = true,
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5, ranged = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Orobon / Aquan', notes = { 'Source species: Orobon (ID 34); family ID 14.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 270 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[549],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Festering Orobon',
            ids    = { 315, 316, 317 },
            levels = {
                [119] = { acc = 484, eva = 533, agi = 120, int = 90, mnd = 90, chr = 101, dex = 120, def = 552,
                          attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            weapon_guard = { physical = -12.5, ranged = -12.5 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Orobon / Aquan', notes = { 'Source species: Orobon (ID 34); family ID 14.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 270 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[549],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Acrolith',
            ids    = { 318, 319, 320, 321, 322, 323, 324, 325, 326 },
            levels = {
                [119] = { acc = 487, eva = 533, agi = 120, int = 103, mnd = 77, chr = 101, dex = 127, def = 549,
                          attack_skill = 404 },
            },
            ranks  = { ice = 3, wind = 3, earth = 3, thunder = 2, light = 6, dark = 11, paralyze = 3, bind = 3,
                       silence = 3, slow = 3, light_sleep = 6, dark_sleep = 11, blind = 11, stun = 2, gravity = 3 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Acrolith / Arcana', notes = { 'Source species: Acrolith (ID 45); family ID 21.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 28', notes = { 'Source base speed is 28; the ordinary monster default is 40. Animation speed is 28.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[398],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
