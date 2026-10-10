-- Davoi (zone 149).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Intimidate: Slow. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Aqua Ball: STR down. Source targeting: area around the target.', 'Screwdriver: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[3] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[4] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[5] = { danger[4] };
danger[6] = { notes = danger[3], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[5] };
danger[7] = { kind = 'skill', id = 449, name = 'Intimidate', summary = 'Intimidate: Slow', notes = danger[2], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[6] };
danger[8] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[9] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[10] = { danger[9] };
danger[11] = { notes = danger[8], unknown = {  }, activation_range = 12.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[10] };
danger[12] = { kind = 'skill', id = 450, name = 'Aqua Ball', summary = 'Aqua Ball: STR down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[11] };
danger[13] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[14] = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[16] = { kind = 'skill', id = 452, name = 'Screwdriver', summary = 'Screwdriver: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[15] };
danger[17] = { danger[7], danger[12], danger[16] };
danger[18] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[19] = { value = 'Intimidate: Slow; Aqua Ball: STR down; Screwdriver: can crit', notes = danger[1], entries = danger[17], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[20] = { 'Fluid Toss: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Digest: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[21] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[22] = { notes = danger[21], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[23] = { kind = 'skill', id = 432, name = 'Fluid Toss', summary = 'Fluid Toss: can crit', notes = danger[13], categories = { 'crit' }, effects = {  }, details = danger[22] };
danger[24] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[25] = { notes = danger[24], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[26] = { kind = 'skill', id = 433, name = 'Digest', summary = 'Digest: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[25] };
danger[27] = { danger[23], danger[26] };
danger[28] = { value = 'Fluid Toss: can crit; Digest: HP drain', notes = danger[20], entries = danger[27], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[29] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[30] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[31] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[32] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[33] = { notes = danger[31], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[32] };
danger[34] = { kind = 'skill', id = 605, name = 'Aerial Wheel', summary = 'Aerial Wheel: Stun', notes = danger[30], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[33] };
danger[35] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[36] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[37] = { danger[36] };
danger[38] = { notes = danger[35], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[37] };
danger[39] = { kind = 'skill', id = 607, name = 'Slam Dunk', summary = 'Slam Dunk: Bind', notes = danger[30], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[38] };
danger[40] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[41] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[42] = { danger[41] };
danger[43] = { notes = danger[40], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = danger[42] };
danger[44] = { kind = 'skill', id = 609, name = 'Battle Dance', summary = 'Battle Dance: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[43] };
danger[45] = { danger[34], danger[39], danger[44] };
danger[46] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down', notes = danger[29], entries = danger[45], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[47] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[48] = { notes = danger[47], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[49] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[48], level_ranges = { { 24, 71 } } };
danger[50] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[51] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[52] = { danger[51] };
danger[53] = { notes = danger[50], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[52] };
danger[54] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[53], level_ranges = { { 24, 255 } } };
danger[55] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[57] = { danger[56] };
danger[58] = { notes = danger[55], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[57] };
danger[59] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[58], level_ranges = { { 22, 255 } } };
danger[60] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { danger[61] };
danger[63] = { notes = danger[60], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[62] };
danger[64] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[63], level_ranges = { { 20, 255 } } };
danger[65] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[66] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[67] = { danger[66] };
danger[68] = { notes = danger[65], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[67] };
danger[69] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[68], level_ranges = { { 18, 255 } } };
danger[70] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[71] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[72] = { danger[71] };
danger[73] = { notes = danger[70], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[72] };
danger[74] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[73], level_ranges = { { 16, 255 } } };
danger[75] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[76] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[77] = { danger[76] };
danger[78] = { notes = danger[75], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[77] };
danger[79] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[78], level_ranges = { { 27, 255 } } };
danger[80] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[81] = { notes = danger[80], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[82] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[81], level_ranges = { { 12, 255 } } };
danger[83] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[81], level_ranges = { { 25, 255 } } };
danger[84] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[85] = { notes = danger[84], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[86] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[85], level_ranges = { { 4, 255 } } };
danger[87] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[88] = { notes = danger[87], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[37] };
danger[89] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[88], level_ranges = { { 7, 255 } } };
danger[90] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[91] = { 'Final Sting: heavy damage. Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[92] = { 'Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.' };
danger[93] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[94] = { notes = danger[93], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[95] = { kind = 'skill', id = 336, name = 'Final Sting', summary = 'Final Sting: heavy damage', notes = danger[92], categories = { 'other' }, effects = {  }, details = danger[94] };
danger[96] = { danger[95] };
danger[97] = { value = 'Final Sting: heavy damage', notes = danger[91], entries = danger[96], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[98] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[99] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down', notes = danger[98], entries = danger[45], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] };
danger[100] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[101] = { notes = danger[100], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[102] = { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[101], level_ranges = { { 6, 45 } } };
danger[103] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[48], level_ranges = { { 26, 50 } } };
danger[104] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[81], level_ranges = { { 10, 255 } } };
danger[105] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[81], level_ranges = { { 20, 255 } } };
danger[106] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[107] = { notes = danger[106], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[32] };
danger[108] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[107], level_ranges = { { 37, 255 } } };
danger[109] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[81], level_ranges = { { 30, 55 } } };
danger[110] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[88], level_ranges = { { 20, 255 } } };
danger[111] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[112] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[113] = { danger[112] };
danger[114] = { notes = danger[111], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[113] };
danger[115] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[114], level_ranges = { { 35, 255 } } };
danger[116] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[117] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[118] = { danger[117] };
danger[119] = { notes = danger[116], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[118] };
danger[120] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[119], level_ranges = { { 37, 255 } } };
danger[121] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[122] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[123] = { danger[122] };
danger[124] = { notes = danger[121], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[123] };
danger[125] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[124], level_ranges = { { 31, 255 } } };
danger[126] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[127] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[128] = { danger[127] };
danger[129] = { notes = danger[126], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[128] };
danger[130] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[129], level_ranges = { { 33, 255 } } };
danger[131] = { 'Tail Blow: Stun. Source targeting: single target.', 'Brain Crush: Silence. Source targeting: single target.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'Plague Breath: Poison. Random effects may not all happen on the same use. Source targeting: cone.', 'Infrasonics: Evasion down. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[132] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[133] = { notes = danger[132], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[32] };
danger[134] = { kind = 'skill', id = 366, name = 'Tail Blow', summary = 'Tail Blow: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[133] };
danger[135] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[136] = { notes = danger[135], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[137] = { kind = 'skill', id = 369, name = 'Brain Crush', summary = 'Brain Crush: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[136] };
danger[138] = { 'Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.' };
danger[139] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[140] = { notes = danger[139], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[141] = { kind = 'skill', id = 370, name = 'Baleful Gaze Lizard', summary = 'Baleful Gaze: petrification gaze', notes = danger[138], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[140] };
danger[142] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[143] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[144] = { notes = danger[143], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[145] = { kind = 'skill', id = 371, name = 'Plague Breath', summary = 'Plague Breath: Poison', notes = danger[142], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[144] };
danger[146] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[147] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[148] = { danger[147] };
danger[149] = { notes = danger[146], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[148] };
danger[150] = { kind = 'skill', id = 372, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[149] };
danger[151] = { danger[134], danger[137], danger[141], danger[145], danger[150] };
danger[152] = { value = 'Tail Blow: Stun; Brain Crush: Silence; Baleful Gaze: petrification gaze; Plague Breath: Poison; Infrasonics: Evasion down', notes = danger[131], entries = danger[151], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[153] = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' };
danger[154] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = danger[153], categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } };
danger[155] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[156] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[157] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[158] = { notes = danger[156], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[157] };
danger[159] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[158], level_ranges = { { 37, 255 } } };
danger[160] = { danger[34], danger[39], danger[44], danger[159] };
danger[161] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flash: Flash', notes = danger[155], entries = danger[160], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] };
danger[162] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[163] = { notes = danger[162], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[10] };
danger[164] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[163], level_ranges = { { 43, 255 } } };
danger[165] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[166] = { notes = danger[165], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[42] };
danger[167] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[166], level_ranges = { { 41, 255 } } };
danger[168] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[169] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[170] = { danger[169] };
danger[171] = { notes = danger[168], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[170] };
danger[172] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[171], level_ranges = { { 39, 255 } } };
danger[173] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[174] = { notes = danger[173], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[175] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[107], level_ranges = { { 45, 255 } } };
danger[176] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[81], level_ranges = { { 41, 255 } } };
danger[177] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[178] = { notes = danger[177], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[179] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' };
danger[180] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flash: Flash', notes = danger[179], entries = danger[160], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [2] = { sight = { 'Davoi Hornet', 'Davoi Wasp' } },
        [3] = { sound = { 'Wolf Bat', 'Wood Bats' } },
        [4] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'One-eyed Gwajboj', 'Orcish Beastrider',
                      'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion', 'Orcish Cursemaker',
                      'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller', 'Orcish Fighter',
                      'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Impaler',
                      'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant', 'Orcish Trooper',
                      'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [5] = { sound = { 'Geezard', 'War Lizard' } },
        [6] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [7] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [8] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Purpleflash Brukdok',
                      'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [9] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Three-eyed Prozpuz' },
        },
        [10] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [11] = {
            sight = { 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [12] = {
            sight = { 'Barakbok', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [13] = {
            sight = { 'Barakbok', 'Bilopdop', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [14] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [15] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'Orcish Beastrider',
                      'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion', 'Orcish Cursemaker',
                      'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller', 'Orcish Fighter',
                      'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Impaler',
                      'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant', 'Orcish Trooper',
                      'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk', 'Three-eyed Prozpuz' },
        },
        [16] = {
            sight = { 'Barakbok', 'Bilopdop', 'Deloknok', 'Gavotvut', 'Hawkeyed Dnatbat', 'One-eyed Gwajboj',
                      'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Champion',
                      'Orcish Cursemaker', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                      'Orcish Fighter', 'Orcish Firebelcher', 'Orcish Footsoldier', 'Orcish Gladiator',
                      'Orcish Impaler', 'Orcish Nightraider', 'Orcish Predator', 'Orcish Serjeant',
                      'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker', 'Poisonhand Gnadgad',
                      'Purpleflash Brukdok', 'Steelbiter Gudrud', 'Tigerbane Bakdak' },
            true_sight = { 'Dirtyhanded Gochakzuk' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Barakbok'] = { id = 63, name = 'Orc' },
        ['Bilopdop'] = { id = 63, name = 'Orc' },
        ['Davoi Hornet'] = { id = 181, name = 'Bee' },
        ['Davoi Wasp'] = { id = 181, name = 'Bee' },
        ['Deloknok'] = { id = 63, name = 'Orc' },
        ['Dirtyhanded Gochakzuk'] = { id = 63, name = 'Orc' },
        ['Gavotvut'] = { id = 63, name = 'Orc' },
        ['Geezard'] = { id = 126, name = 'Lizard' },
        ['Hawkeyed Dnatbat'] = { id = 63, name = 'Orc' },
        ['One-eyed Gwajboj'] = { id = 63, name = 'Orc' },
        ['Orcish Beastrider'] = { id = 63, name = 'Orc' },
        ['Orcish Bowshooter'] = { id = 63, name = 'Orc' },
        ['Orcish Brawler'] = { id = 63, name = 'Orc' },
        ['Orcish Champion'] = { id = 63, name = 'Orc' },
        ['Orcish Cursemaker'] = { id = 63, name = 'Orc' },
        ['Orcish Dragoon'] = { id = 63, name = 'Orc' },
        ['Orcish Dreadnought'] = { id = 63, name = 'Orc' },
        ['Orcish Farkiller'] = { id = 63, name = 'Orc' },
        ['Orcish Fighter'] = { id = 63, name = 'Orc' },
        ['Orcish Firebelcher'] = { id = 64, name = 'Orcish Warmachine' },
        ['Orcish Footsoldier'] = { id = 63, name = 'Orc' },
        ['Orcish Gladiator'] = { id = 63, name = 'Orc' },
        ['Orcish Impaler'] = { id = 63, name = 'Orc' },
        ['Orcish Nightraider'] = { id = 63, name = 'Orc' },
        ['Orcish Predator'] = { id = 63, name = 'Orc' },
        ['Orcish Serjeant'] = { id = 63, name = 'Orc' },
        ['Orcish Trooper'] = { id = 63, name = 'Orc' },
        ['Orcish Veteran'] = { id = 63, name = 'Orc' },
        ['Orcish Warchief'] = { id = 63, name = 'Orc' },
        ['Orcish Zerker'] = { id = 63, name = 'Orc' },
        ['Poisonhand Gnadgad'] = { id = 63, name = 'Orc' },
        ['Purpleflash Brukdok'] = { id = 63, name = 'Orc' },
        ['Steelbiter Gudrud'] = { id = 63, name = 'Orc' },
        ['Three-eyed Prozpuz'] = { id = 63, name = 'Orc' },
        ['Tigerbane Bakdak'] = { id = 63, name = 'Orc' },
        ['War Lizard'] = { id = 126, name = 'Lizard' },
        ['Wolf Bat'] = { id = 77, name = 'Bat' },
        ['Wood Bats'] = { id = 81, name = 'Flock Bat' },
    },
    monsters = {
        {
            name   = 'Ferocious Pugil',
            ids    = { 1, 2 },
            levels = {
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19, dex = 24, def = 92,
                         attack_skill = 65 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 19, dex = 24, def = 95,
                         attack_skill = 68 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 19, dex = 26, def = 99,
                         attack_skill = 71 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 473, [23] = 504, [24] = 536 }, mp = { [22] = 0, [23] = 0, [24] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3 },
            levels = {
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24, dex = 31, def = 118,
                         attack_skill = 89 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 27, dex = 33, def = 122,
                         attack_skill = 92 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 27, dex = 33, def = 124,
                         attack_skill = 94 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 773, [31] = 872, [32] = 954 }, mp = { [30] = 0, [31] = 0, [32] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gloop',
            ids    = { 4 },
            levels = {
                [38] = { acc = 136, eva = 126, agi = 37, int = 29, mnd = 32, chr = 33, dex = 38, def = 143,
                         attack_skill = 112 },
                [39] = { acc = 140, eva = 130, agi = 38, int = 31, mnd = 34, chr = 35, dex = 40, def = 147,
                         attack_skill = 115 },
                [40] = { acc = 143, eva = 133, agi = 38, int = 31, mnd = 34, chr = 35, dex = 40, def = 150,
                         attack_skill = 118 },
            },
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
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [38] = 1436, [39] = 1514, [40] = 1641 }, mp = { [38] = 0, [39] = 0, [40] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Oil Spill',
            ids    = { 5 },
            levels = {
                [45] = { acc = 161, eva = 150, agi = 45, int = 36, mnd = 39, chr = 40, dex = 47, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 154, agi = 46, int = 36, mnd = 40, chr = 40, dex = 48, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 156, agi = 46, int = 37, mnd = 40, chr = 41, dex = 49, def = 173,
                         attack_skill = 138 },
            },
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
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2046, [46] = 2129, [47] = 2212 }, mp = { [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 6, 7, 8, 12, 18, 25, 28, 37, 48, 87 },
            levels = {
                [22] = { acc = 82, eva = 75, agi = 24, int = 15, mnd = 17, chr = 22, dex = 27, def = 92,
                         attack_skill = 65 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 15, mnd = 17, chr = 22, dex = 27, def = 95,
                         attack_skill = 68 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 15, mnd = 17, chr = 23, dex = 29, def = 99,
                         attack_skill = 71 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 17, mnd = 19, chr = 25, dex = 29, def = 102,
                         attack_skill = 74 },
                [26] = { acc = 97, eva = 89, agi = 28, int = 17, mnd = 19, chr = 26, dex = 32, def = 105,
                         attack_skill = 77 },
            },
            spawn_levels = { [6] = { 22, 23 }, [7] = { 22, 23 }, [8] = { 22, 23 }, [12] = { 22, 23 },
                             [18] = { 22, 23 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12441 },  -- lizard helm
                { rate = 10, item = 12697 },  -- lizard gloves
                { rate = 10, item = 12825 },  -- lizard trousers
                { rate = 10, item = 12953 },  -- lizard ledelsens
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 496, [23] = 529, [24] = 562, [25] = 618, [26] = 654 }, mp = { [22] = 0, [23] = 0, [24] = 0, [25] = 0, [26] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 10 minutes', notes = { 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 9, 13, 14, 19, 26, 33, 38, 40, 43, 79 },
            job    = 'blm/war',
            levels = {
                [22] = { acc = 82, eva = 75, agi = 24, int = 23, mnd = 19, chr = 23, dex = 27, def = 90,
                         attack_skill = 65 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 24, mnd = 19, chr = 23, dex = 27, def = 93,
                         attack_skill = 68 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 24, mnd = 19, chr = 25, dex = 29, def = 97,
                         attack_skill = 71 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 26, mnd = 21, chr = 26, dex = 29, def = 100,
                         attack_skill = 74 },
                [26] = { acc = 97, eva = 89, agi = 28, int = 26, mnd = 21, chr = 27, dex = 32, def = 103,
                         attack_skill = 77 },
                [27] = { acc = 100, eva = 91, agi = 29, int = 27, mnd = 21, chr = 28, dex = 32, def = 106,
                         attack_skill = 80 },
            },
            spawn_levels = { [9] = { 22, 23 }, [13] = { 22, 23 }, [14] = { 22, 23 }, [19] = { 22, 23 },
                             [26] = { 23, 27 }, [33] = { 23, 27 }, [38] = { 23, 27 }, [40] = { 23, 27 },
                             [43] = { 23, 27 }, [79] = { 23, 27 } },
            ph_for = { [40] = { 47 }, [43] = { 47 } },
            ph_rules = {
                [40] = {
                    [47] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [43] = {
                    [47] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1018 },  -- bulb of shaman garlic
                { rate = 5, item = 12737 },  -- white mitts
                { rate = 5, item = 12865 },  -- black slacks
                { rate = 5, item = 12993 },  -- sandals
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 398, [23] = 427, [24] = 456, [25] = 508, [26] = 539, [27] = 572 }, mp = { [22] = 568, [23] = 596, [24] = 624, [25] = 653, [26] = 681, [27] = 710 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 10 minutes', notes = { 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Blind: Blindness; Bind: bind', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[34], danger[39], danger[44], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[79], danger[82], danger[83], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[81], level_ranges = { { 20, 40 } } }, danger[86], danger[89] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Davoi Hornet',
            ids    = { 10, 11, 16, 17, 22, 23, 24, 29, 30, 31, 41, 42, 80, 81, 89, 326, 327 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18, dex = 22, def = 85,
                         attack_skill = 60 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 20, dex = 24, def = 90,
                         attack_skill = 63 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20, dex = 24, def = 92,
                         attack_skill = 65 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20, dex = 24, def = 95,
                         attack_skill = 68 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            steal  = { 4370 },  -- pot of honey
            links  = 2,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [20] = 414, [21] = 443, [22] = 473, [23] = 504 }, mp = { [20] = 0, [21] = 0, [22] = 0, [23] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 10 minutes', notes = { 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[97],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Serjeant',
            ids    = { 15, 20, 21, 27, 34, 39, 44, 49, 88 },
            job    = 'pld/war',
            levels = {
                [22] = { acc = 81, eva = 72, agi = 18, int = 14, mnd = 22, chr = 25, dex = 24, def = 94,
                         attack_skill = 65 },
                [23] = { acc = 84, eva = 75, agi = 18, int = 14, mnd = 22, chr = 25, dex = 24, def = 98,
                         attack_skill = 68 },
                [24] = { acc = 87, eva = 78, agi = 19, int = 14, mnd = 23, chr = 27, dex = 25, def = 101,
                         attack_skill = 71 },
                [25] = { acc = 91, eva = 81, agi = 19, int = 15, mnd = 24, chr = 28, dex = 26, def = 105,
                         attack_skill = 74 },
                [26] = { acc = 95, eva = 85, agi = 21, int = 16, mnd = 25, chr = 30, dex = 28, def = 108,
                         attack_skill = 77 },
                [27] = { acc = 98, eva = 88, agi = 22, int = 16, mnd = 25, chr = 30, dex = 28, def = 111,
                         attack_skill = 80 },
                [28] = { acc = 102, eva = 91, agi = 22, int = 16, mnd = 26, chr = 30, dex = 30, def = 114,
                         attack_skill = 83 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 10, virus = 10 },
            drops  = {
                { rate = 100, item = 530 },  -- copy of the castle floor plans
                { rate = 10, item = 12441 },  -- lizard helm
                { rate = 10, item = 12825 },  -- lizard trousers
                { rate = 10, item = 12697 },  -- lizard gloves
                { rate = 10, item = 12953 },  -- lizard ledelsens
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [22] = 473, [23] = 505, [24] = 537, [25] = 592, [26] = 626, [27] = 662, [28] = 703 }, mp = { [22] = 568, [23] = 596, [24] = 624, [25] = 653, [26] = 681, [27] = 710, [28] = 739 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 0-10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 10 minutes', notes = { 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wood Bats',
            ids    = { 32, 35, 36, 45, 46 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18, dex = 22, def = 85,
                         attack_skill = 60 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 20, dex = 24, def = 89,
                         attack_skill = 63 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20, dex = 24, def = 91,
                         attack_skill = 65 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20, dex = 24, def = 94,
                         attack_skill = 68 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [20] = 414, [21] = 443, [22] = 473, [23] = 504 }, mp = { [20] = 0, [21] = 0, [22] = 0, [23] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-06:00; Respawn 10 minutes', notes = { 'Source spawn window: 20:00-06:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sonic Boom: Attack down', notes = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hawkeyed Dnatbat',
            ids    = { 47 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [26] = { acc = 105, eva = 81, agi = 31, int = 20, mnd = 23, chr = 26, dex = 28, def = 95,
                         attack_skill = 77 },
                [27] = { acc = 108, eva = 85, agi = 33, int = 20, mnd = 24, chr = 26, dex = 29, def = 98,
                         attack_skill = 80 },
                [28] = { acc = 112, eva = 88, agi = 34, int = 21, mnd = 25, chr = 27, dex = 30, def = 101,
                         attack_skill = 83 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 16755, 9000 },  -- archers knife
                    { 17184, 1000 },  -- assassins bow
                } },
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [26] = 1197, [27] = 1197, [28] = 1197 }, mp = { [26] = 0, [27] = 0, [28] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[99],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Orcish Impaler',
            ids    = { 50, 58, 67, 73, 90, 94, 98, 102, 114, 118, 125, 318, 322, 328, 332, 385, 389, 401, 407 },
            job    = 'drg/war',
            levels = {
                [32] = { acc = 126, eva = 109, agi = 30, int = 20, mnd = 26, chr = 35, dex = 34, def = 125,
                         attack_skill = 94, resist = { virus = 10 } },
                [33] = { acc = 130, eva = 113, agi = 32, int = 22, mnd = 26, chr = 35, dex = 36, def = 129,
                         attack_skill = 97, resist = { virus = 10 } },
                [34] = { acc = 133, eva = 116, agi = 33, int = 22, mnd = 26, chr = 37, dex = 37, def = 132,
                         attack_skill = 100, resist = { virus = 10 } },
                [35] = { acc = 137, eva = 119, agi = 33, int = 23, mnd = 29, chr = 37, dex = 38, def = 135,
                         attack_skill = 103, resist = { virus = 15 } },
                [36] = { acc = 140, eva = 123, agi = 35, int = 23, mnd = 29, chr = 40, dex = 39, def = 139,
                         attack_skill = 106, resist = { virus = 15 } },
            },
            ph_for = { [58] = { 65 }, [118] = { 124 } },
            ph_rules = {
                [58] = {
                    [65] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [118] = {
                    [124] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1532 },  -- jade cryptex
                { rate = 10, item = 12424 },  -- iron mask
                { rate = 10, item = 12808 },  -- chain hose
                { rate = 10, item = 12680 },  -- chain mittens
                { rate = 10, item = 12936 },  -- greaves
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [32] = 1001, [33] = 1083, [34] = 1170, [35] = 1252, [36] = 1338 }, mp = { [32] = 0, [33] = 0, [34] = 0, [35] = 0, [36] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Beastrider',
            ids    = { 51, 54, 59, 74, 91, 95, 99, 103, 115, 119, 126, 319, 323, 329, 333, 386, 390, 402, 408 },
            job    = 'drk/war',
            levels = {
                [33] = { acc = 121, eva = 110, agi = 32, int = 28, mnd = 22, chr = 27, dex = 38, def = 129,
                         attack_skill = 97, resist = { paralyze = 10, virus = 10 } },
                [34] = { acc = 125, eva = 113, agi = 33, int = 29, mnd = 22, chr = 28, dex = 40, def = 132,
                         attack_skill = 100, resist = { paralyze = 10, virus = 10 } },
                [35] = { acc = 128, eva = 116, agi = 33, int = 30, mnd = 24, chr = 28, dex = 41, def = 135,
                         attack_skill = 103, resist = { paralyze = 10, virus = 15 } },
                [36] = { acc = 132, eva = 120, agi = 35, int = 31, mnd = 25, chr = 31, dex = 42, def = 139,
                         attack_skill = 106, resist = { paralyze = 10, virus = 15 } },
                [37] = { acc = 135, eva = 122, agi = 35, int = 32, mnd = 25, chr = 31, dex = 43, def = 141,
                         attack_skill = 109, resist = { paralyze = 10, virus = 15 } },
            },
            ph_for = { [103] = { 124 } },
            ph_rules = {
                [103] = {
                    [124] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 12424 },  -- iron mask
                { rate = 10, item = 12808 },  -- chain hose
                { rate = 10, item = 12680 },  -- chain mittens
                { rate = 10, item = 12936 },  -- greaves
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 1050, [34] = 1136, [35] = 1216, [36] = 1302, [37] = 1382 }, mp = { [33] = 884, [34] = 914, [35] = 943, [36] = 973, [37] = 1002 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Mnd: MND down; Absorb-Chr: CHR down', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[34], danger[39], danger[44], danger[102], danger[103], danger[104], danger[105], danger[108], danger[109], danger[110], danger[115], danger[120], danger[125], danger[130] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Nightraider',
            ids    = { 52, 60, 68, 75, 92, 96, 100, 104, 116, 120, 127, 320, 324, 330, 334, 387, 391, 403, 409 },
            job    = 'rng/war',
            levels = {
                [34] = { acc = 145, eva = 117, agi = 40, int = 24, mnd = 28, chr = 32, dex = 37, def = 131,
                         attack_skill = 100, resist = { poison = 10, virus = 10 } },
                [35] = { acc = 149, eva = 120, agi = 41, int = 26, mnd = 30, chr = 33, dex = 38, def = 134,
                         attack_skill = 103, resist = { poison = 10, virus = 15 } },
                [36] = { acc = 152, eva = 124, agi = 42, int = 26, mnd = 31, chr = 35, dex = 39, def = 138,
                         attack_skill = 106, resist = { poison = 10, virus = 15 } },
                [37] = { acc = 156, eva = 126, agi = 43, int = 27, mnd = 31, chr = 35, dex = 40, def = 140,
                         attack_skill = 109, resist = { poison = 10, virus = 15 } },
                [38] = { acc = 159, eva = 129, agi = 43, int = 28, mnd = 32, chr = 36, dex = 40, def = 143,
                         attack_skill = 112, resist = { poison = 10, virus = 15 } },
            },
            spawn_levels = { [409] = { 38, 38 } },
            ph_for = { [104] = { 124 } },
            ph_rules = {
                [104] = {
                    [124] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1532 },  -- jade cryptex
                { rate = 5, item = 12442 },  -- studded bandana
                { rate = 5, item = 12698 },  -- studded gloves
                { rate = 5, item = 12826 },  -- studded trousers
                { rate = 5, item = 12954 },  -- studded boots
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [34] = 1059, [35] = 1137, [36] = 1219, [37] = 1296, [38] = 1379 }, mp = { [34] = 0, [35] = 0, [36] = 0, [37] = 0, [38] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Brawler',
            ids    = { 53, 61, 69, 76, 93, 97, 101, 105, 117, 128, 321, 325, 331, 335, 388, 392, 404, 410 },
            job    = 'mnk/war',
            levels = {
                [35] = { acc = 129, eva = 117, agi = 29, int = 21, mnd = 30, chr = 33, dex = 43, def = 138,
                         attack_skill = 103 },
                [36] = { acc = 132, eva = 121, agi = 30, int = 22, mnd = 31, chr = 35, dex = 43, def = 141,
                         attack_skill = 106 },
                [37] = { acc = 136, eva = 124, agi = 31, int = 23, mnd = 31, chr = 35, dex = 45, def = 144,
                         attack_skill = 109 },
                [38] = { acc = 139, eva = 127, agi = 31, int = 23, mnd = 32, chr = 36, dex = 45, def = 147,
                         attack_skill = 112 },
                [39] = { acc = 143, eva = 131, agi = 32, int = 24, mnd = 34, chr = 38, dex = 47, def = 151,
                         attack_skill = 115 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1532 },  -- jade cryptex
                { rate = 5, item = 12458 },  -- soil hachimaki
                { rate = 5, item = 12714 },  -- soil tekko
                { rate = 5, item = 12842 },  -- soil sitabaki
                { rate = 5, item = 12970 },  -- soil kyahan
            },
            steal  = { 750 },  -- silver beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [35] = 1353, [36] = 1440, [37] = 1523, [38] = 1611, [39] = 1694 }, mp = { [35] = 0, [36] = 0, [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Lizard',
            ids    = { 55, 56, 63, 64, 70, 71, 77, 78, 82, 83, 84, 85, 336, 337, 383, 384, 393, 394, 395, 396, 397,
                       398, 405, 406 },
            levels = {
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 22, chr = 25, dex = 33, def = 113,
                         attack_skill = 86 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 23, chr = 26, dex = 33, def = 117,
                         attack_skill = 89 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 24, chr = 28, dex = 36, def = 121,
                         attack_skill = 92 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 24, chr = 28, dex = 36, def = 123,
                         attack_skill = 94 },
            },
            spawn_levels = { [64] = { 30, 32 }, [337] = { 30, 32 } },
            ph_for = { [85] = { 86 } },
            ph_rules = {
                [85] = {
                    [86] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 1000, item = 926 },  -- lizard tail
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
            },
            steal  = { 4362 },  -- lizard egg
            links  = 5,
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Hill Lizard (ID 307); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [29] = 735, [30] = 773, [31] = 872, [32] = 954 }, mp = { [29] = 0, [30] = 0, [31] = 0, [32] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[152],
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 57, 72, 141, 152, 162, 172, 245, 256, 267 },
            job    = 'blm/rdm',
            levels = {
                [47] = { acc = 168, eva = 151, agi = 47, int = 55, mnd = 43, chr = 45, dex = 48, def = 160,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45, dex = 48, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45, dex = 49, def = 166,
                         attack_skill = 144 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 1966, [48] = 2043, [49] = 2116 }, mp = { [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Thunder weather; Respawn 14 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Shock: Shock; Stun: stun', notes = { 'Shock: Shock.', 'Stun: stun. Possible effects: Stun.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[73], level_ranges = { { 16, 50 } } }, danger[108] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[90] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Orcish Firebelcher',
            ids    = { 62, 121 },
            levels = {
                [39] = { acc = 142, eva = 132, agi = 43, int = 26, mnd = 29, chr = 35, dex = 45, def = 147,
                         attack_skill = 115 },
                [40] = { acc = 145, eva = 135, agi = 43, int = 26, mnd = 29, chr = 35, dex = 45, def = 150,
                         attack_skill = 118 },
                [41] = { acc = 150, eva = 140, agi = 47, int = 28, mnd = 31, chr = 37, dex = 49, def = 155,
                         attack_skill = 121 },
                [42] = { acc = 153, eva = 142, agi = 47, int = 28, mnd = 31, chr = 37, dex = 49, def = 157,
                         attack_skill = 123 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 17292 },  -- long boomerang
                { rate = 50, item = 17256 },  -- serpentine gun
                { rate = 50, item = 1033 },  -- davoi chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orcish Warmachine / Beastmen', notes = { 'Source species: Orcish Warmachine (ID 143); family ID 64.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [39] = 1589, [40] = 1723, [41] = 1804, [42] = 1892 }, mp = { [39] = 0, [40] = 0, [41] = 0, [42] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Blastbomb: Bind', notes = { 'Blastbomb: Bind. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 638, name = 'Blastbomb', summary = 'Blastbomb: Bind', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[37] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Blastbomb', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 618, name = 'Blastbomb', level = 18, min_skill = 26, skill_ids = { 638 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Steelbiter Gudrud',
            ids    = { 65 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [33] = { acc = 130, eva = 113, agi = 32, int = 22, mnd = 27, chr = 36, dex = 36, def = 119,
                         attack_skill = 97 },
                [34] = { acc = 133, eva = 116, agi = 32, int = 22, mnd = 27, chr = 39, dex = 36, def = 123,
                         attack_skill = 100 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 16853, 9000 },  -- lizard piercer
                    { 13615, 1000 },  -- sentinels mantle
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 2205, [34] = 2205 }, mp = { [33] = 0, [34] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[99],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Orcs Wyvern D',
            ids    = { 66 },
            levels = {
                [26] = { acc = 95, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23, dex = 28, def = 105,
                         attack_skill = 77 },
                [27] = { acc = 98, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24, dex = 29, def = 108,
                         attack_skill = 80 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25, dex = 29, def = 111,
                         attack_skill = 83 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Blue Wyvern (ID 236); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [26] = 475, [27] = 475, [28] = 475 }, mp = { [26] = 278, [27] = 290, [28] = 301 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Tigerbane Bakdak',
            ids    = { 86 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [31] = { acc = 114, eva = 104, agi = 30, int = 29, mnd = 22, chr = 26, dex = 37, def = 113,
                         attack_skill = 92 },
                [32] = { acc = 117, eva = 106, agi = 30, int = 29, mnd = 22, chr = 26, dex = 37, def = 115,
                         attack_skill = 94 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 10 },
            drops  = {
                { rate = 50, item = 4876 },  -- scroll of absorb-vit
                { rate = 50, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 1000, group = { { 16673, 9000 }, { 16672, 1000 } } },  -- one of warriors axe, tigerhunter
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [31] = 1732, [32] = 1732 }, mp = { [31] = 826, [32] = 855 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Normal attacks: HP drain; Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Sleep: sleep; Bind: bind; Absorb-Mnd: MND down', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Mnd: MND down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[154], danger[34], danger[39], danger[44], danger[102], danger[103], danger[104], danger[105], danger[109], danger[110], danger[125] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Wolf Bat',
            ids    = { 106, 107, 112, 113, 122, 123, 197, 198, 203, 204, 209, 210, 286, 287, 292, 293, 302, 303,
                       308, 309, 349, 350 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23, dex = 26, def = 101,
                         attack_skill = 74 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23, dex = 28, def = 104,
                         attack_skill = 77 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24, dex = 29, def = 107,
                         attack_skill = 80 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25, dex = 29, def = 110,
                         attack_skill = 83 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [25] = 589, [26] = 623, [27] = 658, [28] = 698 }, mp = { [25] = 0, [26] = 0, [27] = 0, [28] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-06:00; Respawn 10 minutes', notes = { 'Source spawn window: 20:00-06:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Ultrasonics: Evasion down; Blood Drain: HP drain', notes = { 'Ultrasonics: Evasion down. Source targeting: area around the monster.', 'Blood Drain: HP drain. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 392, name = 'Ultrasonics', summary = 'Ultrasonics: Evasion down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[148] } }, { kind = 'skill', id = 394, name = 'Blood Drain', summary = 'Blood Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow behavior changes with script conditions; the following are possible rules.', 'Utsusemi and Blink do not absorb the damage step.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false }, { mode = 'absorb', per_hit = false, count = 1 } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Blood Drain', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 570, name = 'Blood Drain', level = 20, min_skill = 32, skill_ids = { 394 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Bowshooter',
            ids    = { 108, 131, 135, 142, 146, 153, 157, 163, 167, 173, 183, 187, 193, 199, 205, 211, 216, 220,
                       278, 282, 288, 294, 298, 304, 310, 314 },
            job    = 'rng/war',
            levels = {
                [42] = { acc = 174, eva = 143, agi = 49, int = 31, mnd = 36, chr = 40, dex = 46, def = 157,
                         attack_skill = 123 },
                [43] = { acc = 177, eva = 147, agi = 50, int = 31, mnd = 36, chr = 41, dex = 46, def = 160,
                         attack_skill = 126 },
                [44] = { acc = 181, eva = 151, agi = 52, int = 31, mnd = 37, chr = 42, dex = 49, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 184, eva = 154, agi = 53, int = 34, mnd = 39, chr = 43, dex = 49, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 188, eva = 157, agi = 53, int = 34, mnd = 39, chr = 44, dex = 50, def = 170,
                         attack_skill = 135 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 1033 },  -- davoi chest key
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
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [42] = 1747, [43] = 1830, [44] = 1913, [45] = 1990, [46] = 2073 }, mp = { [42] = 0, [43] = 0, [44] = 0, [45] = 0, [46] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Footsoldier',
            ids    = { 109, 132, 136, 143, 147, 154, 158, 164, 168, 174, 184, 188, 194, 200, 206, 212, 217, 221,
                       279, 283, 289, 295, 299, 305, 311, 315 },
            levels = {
                [44] = { acc = 161, eva = 148, agi = 47, int = 28, mnd = 31, chr = 42, dex = 52, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 164, eva = 151, agi = 47, int = 31, mnd = 34, chr = 43, dex = 52, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 155, agi = 48, int = 31, mnd = 34, chr = 44, dex = 54, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 157, agi = 49, int = 31, mnd = 34, chr = 44, dex = 54, def = 173,
                         attack_skill = 138 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 1686 },  -- soiled letter
                { rate = 50, item = 1033 },  -- davoi chest key
                { rate = 5, item = 12425 },  -- silver mask
                { rate = 5, item = 12681 },  -- silver mittens
                { rate = 5, item = 12809 },  -- silver hose
                { rate = 5, item = 12937 },  -- silver greaves
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 2066, [45] = 2148, [46] = 2235, [47] = 2322 }, mp = { [44] = 0, [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Gladiator',
            ids    = { 110, 133, 137, 144, 148, 155, 159, 165, 169, 175, 185, 189, 195, 201, 207, 213, 218, 222,
                       280, 284, 290, 296, 300, 306, 312, 316 },
            job    = 'mnk/war',
            levels = {
                [44] = { acc = 162, eva = 148, agi = 38, int = 26, mnd = 37, chr = 42, dex = 54, def = 168,
                         attack_skill = 129 },
                [45] = { acc = 165, eva = 151, agi = 39, int = 28, mnd = 39, chr = 43, dex = 54, def = 172,
                         attack_skill = 132 },
                [46] = { acc = 169, eva = 154, agi = 39, int = 29, mnd = 39, chr = 44, dex = 56, def = 174,
                         attack_skill = 135 },
                [47] = { acc = 172, eva = 158, agi = 40, int = 29, mnd = 40, chr = 44, dex = 56, def = 178,
                         attack_skill = 138 },
                [48] = { acc = 176, eva = 161, agi = 41, int = 29, mnd = 41, chr = 45, dex = 59, def = 181,
                         attack_skill = 141 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1033 },  -- davoi chest key
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 2176, [45] = 2259, [46] = 2347, [47] = 2436, [48] = 2524 }, mp = { [44] = 0, [45] = 0, [46] = 0, [47] = 0, [48] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 250 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Trooper',
            ids    = { 111, 134, 138, 145, 149, 156, 160, 166, 170, 176, 186, 190, 196, 202, 208, 214, 219, 223,
                       281, 285, 291, 297, 301, 307, 313, 317 },
            job    = 'pld/war',
            levels = {
                [46] = { acc = 165, eva = 149, agi = 37, int = 29, mnd = 43, chr = 50, dex = 48, def = 186,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 152, agi = 38, int = 29, mnd = 43, chr = 50, dex = 48, def = 190,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 155, agi = 39, int = 29, mnd = 44, chr = 50, dex = 51, def = 193,
                         attack_skill = 141 },
                [49] = { acc = 176, eva = 159, agi = 40, int = 30, mnd = 45, chr = 52, dex = 52, def = 196,
                         attack_skill = 144 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            drops  = {
                { rate = 100, item = 554 },  -- gold orcmask
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 50, item = 1033 },  -- davoi chest key
                { rate = 1, item = 12416 },  -- sallet
                { rate = 1, item = 12672 },  -- gauntlets
                { rate = 1, item = 12800 },  -- cuisses
                { rate = 1, item = 12928 },  -- plate leggings
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [46] = 2188, [47] = 2274, [48] = 2360, [49] = 2441 }, mp = { [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[161],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Poisonhand Gnadgad',
            ids    = { 124 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [39] = { acc = 145, eva = 130, agi = 31, int = 23, mnd = 35, chr = 38, dex = 50, def = 143,
                         attack_skill = 115 },
                [40] = { acc = 148, eva = 133, agi = 31, int = 24, mnd = 35, chr = 38, dex = 50, def = 146,
                         attack_skill = 118 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 12923, 9000 },  -- jujitsu sitabaki
                    { 13728, 1000 },  -- jujitsu gi
                } },
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [39] = 1704, [40] = 1844 }, mp = { [39] = 0, [40] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[99],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Davoi Wasp',
            ids    = { 129, 130, 139, 140, 150, 151, 161, 171, 191, 192, 215, 224, 225, 347, 348 },
            levels = {
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, dex = 31, def = 118,
                         attack_skill = 89 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, dex = 33, def = 122,
                         attack_skill = 92 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, dex = 33, def = 124,
                         attack_skill = 94 },
                [33] = { acc = 119, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, dex = 34, def = 128,
                         attack_skill = 97 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            steal  = { 4370 },  -- pot of honey
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [30] = 773, [31] = 872, [32] = 954, [33] = 1032 }, mp = { [30] = 0, [31] = 0, [32] = 0, [33] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[97],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Geezard',
            ids    = { 177, 178, 179, 180, 181, 182, 242, 243, 244, 254, 255, 265, 266, 274, 275, 276, 277 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 36, int = 26, mnd = 26, chr = 29, dex = 39, def = 130,
                         attack_skill = 100 },
                [35] = { acc = 127, eva = 118, agi = 36, int = 27, mnd = 27, chr = 30, dex = 39, def = 133,
                         attack_skill = 103 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 28, mnd = 28, chr = 32, dex = 41, def = 137,
                         attack_skill = 106 },
                [37] = { acc = 134, eva = 124, agi = 38, int = 29, mnd = 29, chr = 32, dex = 41, def = 139,
                         attack_skill = 109 },
            },
            spawn_levels = { [180] = { 35, 37 }, [254] = { 35, 37 }, [276] = { 35, 37 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 1000, item = 926 },  -- lizard tail
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 240, item = 4362 },  -- lizard egg
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 240, item = 4362 },  -- lizard egg
            },
            steal  = { 4362 },  -- lizard egg
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Hill Lizard (ID 307); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [34] = 1115, [35] = 1193, [36] = 1275, [37] = 1353 }, mp = { [34] = 0, [35] = 0, [36] = 0, [37] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[152],
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Veteran',
            ids    = { 226, 230, 234, 238, 246, 250, 257, 261, 271 },
            levels = {
                [52] = { acc = 194, eva = 179, agi = 56, int = 35, mnd = 39, chr = 51, dex = 62, def = 194,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 37, mnd = 40, chr = 51, dex = 63, def = 200,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 37, mnd = 40, chr = 52, dex = 64, def = 205,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 37, mnd = 41, chr = 53, dex = 65, def = 210,
                         attack_skill = 171, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 200, agi = 61, int = 37, mnd = 41, chr = 54, dex = 67, def = 215,
                         attack_skill = 176, resist = { virus = 20 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
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
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [52] = 2822, [53] = 2910, [54] = 2997, [55] = 3085, [56] = 3173 }, mp = { [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Predator',
            ids    = { 227, 231, 235, 239, 247, 251, 258, 262, 272 },
            job    = 'rng/war',
            levels = {
                [54] = { acc = 238, eva = 193, agi = 64, int = 40, mnd = 46, chr = 52, dex = 60, def = 205,
                         attack_skill = 166, resist = { poison = 15, virus = 15 } },
                [55] = { acc = 243, eva = 198, agi = 65, int = 41, mnd = 47, chr = 53, dex = 61, def = 210,
                         attack_skill = 171, resist = { poison = 15, virus = 20 } },
                [56] = { acc = 249, eva = 203, agi = 67, int = 41, mnd = 48, chr = 54, dex = 63, def = 215,
                         attack_skill = 176, resist = { poison = 15, virus = 20 } },
                [57] = { acc = 255, eva = 209, agi = 68, int = 43, mnd = 49, chr = 54, dex = 64, def = 220,
                         attack_skill = 181, resist = { poison = 15, virus = 20 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
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
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2802, [55] = 2886, [56] = 2969, [57] = 3053 }, mp = { [54] = 0, [55] = 0, [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Zerker',
            ids    = { 228, 232, 236, 240, 248, 252, 259, 263, 273 },
            job    = 'drk/war',
            levels = {
                [54] = { acc = 205, eva = 188, agi = 54, int = 47, mnd = 37, chr = 46, dex = 64, def = 207,
                         attack_skill = 166, resist = { paralyze = 15, virus = 15 } },
                [55] = { acc = 210, eva = 193, agi = 54, int = 47, mnd = 38, chr = 46, dex = 65, def = 212,
                         attack_skill = 171, resist = { paralyze = 15, virus = 20 } },
                [56] = { acc = 216, eva = 198, agi = 57, int = 48, mnd = 39, chr = 48, dex = 67, def = 217,
                         attack_skill = 176, resist = { paralyze = 15, virus = 20 } },
                [57] = { acc = 222, eva = 203, agi = 57, int = 50, mnd = 40, chr = 48, dex = 68, def = 222,
                         attack_skill = 181, resist = { paralyze = 15, virus = 20 } },
                [58] = { acc = 227, eva = 208, agi = 57, int = 50, mnd = 41, chr = 49, dex = 68, def = 227,
                         attack_skill = 186, resist = { paralyze = 15, virus = 20 } },
            },
            spawn_levels = { [259] = { 56, 57 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4878 },  -- scroll of absorb-int
                { rate = 50, item = 4876 },  -- scroll of absorb-vit
                { rate = 50, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4860 },  -- scroll of stun
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
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [54] = 2942, [55] = 3029, [56] = 3115, [57] = 3202, [58] = 3288 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[34], danger[39], danger[44], { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[101], level_ranges = { { 46, 255 } } }, danger[104], danger[105], danger[108], danger[109], danger[110], { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[81], level_ranges = { { 56, 255 } } }, danger[164], danger[167], danger[115], danger[120], danger[172], danger[125], danger[130], { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[81], level_ranges = { { 45, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Warchief',
            ids    = { 229, 233, 237, 241, 249, 253, 260, 264, 423, 424, 443, 444 },
            job    = 'pld/war',
            levels = {
                [55] = { acc = 207, eva = 188, agi = 45, int = 34, mnd = 51, chr = 59, dex = 59, def = 240,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 194, agi = 48, int = 35, mnd = 52, chr = 61, dex = 60, def = 245,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 199, agi = 48, int = 37, mnd = 53, chr = 61, dex = 61, def = 251,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 204, agi = 48, int = 37, mnd = 54, chr = 62, dex = 62, def = 256,
                         attack_skill = 186 },
                [59] = { acc = 229, eva = 209, agi = 49, int = 37, mnd = 55, chr = 64, dex = 63, def = 262,
                         attack_skill = 191 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 20 },
            drops  = {
                { rate = 50, item = 4720 },  -- scroll of flash
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
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 3029, [56] = 3115, [57] = 3202, [58] = 3288, [59] = 3375 }, mp = { [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[161],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Dreadnought',
            ids    = { 268, 413, 417, 418, 427, 431, 435, 439, 442 },
            levels = {
                [63] = { acc = 253, eva = 237, agi = 66, int = 42, mnd = 46, chr = 59, dex = 73, def = 252,
                         attack_skill = 207 },
                [64] = { acc = 259, eva = 243, agi = 68, int = 42, mnd = 46, chr = 60, dex = 75, def = 258,
                         attack_skill = 210 },
                [65] = { acc = 264, eva = 248, agi = 68, int = 45, mnd = 49, chr = 62, dex = 75, def = 263,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 253, agi = 70, int = 45, mnd = 49, chr = 63, dex = 78, def = 267,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 258, agi = 71, int = 45, mnd = 49, chr = 63, dex = 78, def = 273,
                         attack_skill = 221 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 100, item = 1426 },  -- warriors testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3787, [64] = 3874, [65] = 3962, [66] = 4049, [67] = 4138 }, mp = { [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Farkiller',
            ids    = { 269, 411, 412, 415, 416, 426, 430, 434, 438 },
            job    = 'rng/war',
            levels = {
                [62] = { acc = 281, eva = 235, agi = 73, int = 46, mnd = 53, chr = 59, dex = 69, def = 247,
                         attack_skill = 203 },
                [63] = { acc = 286, eva = 241, agi = 74, int = 46, mnd = 53, chr = 59, dex = 69, def = 252,
                         attack_skill = 207 },
                [64] = { acc = 292, eva = 246, agi = 75, int = 46, mnd = 54, chr = 60, dex = 71, def = 258,
                         attack_skill = 210 },
                [65] = { acc = 297, eva = 252, agi = 76, int = 49, mnd = 56, chr = 62, dex = 71, def = 263,
                         attack_skill = 214 },
                [66] = { acc = 303, eva = 256, agi = 77, int = 49, mnd = 56, chr = 63, dex = 73, def = 267,
                         attack_skill = 218 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 20, virus = 20 },
            drops  = {
                { rate = 100, item = 1436 },  -- rangers testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
                { rate = 10, item = 5010 },  -- scroll of archers prelude
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3470, [63] = 3554, [64] = 3637, [65] = 3721, [66] = 3804 }, mp = { [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Champion',
            ids    = { 270, 414, 422, 428, 432, 436, 440 },
            job    = 'mnk/war',
            levels = {
                [64] = { acc = 261, eva = 243, agi = 56, int = 39, mnd = 54, chr = 60, dex = 78, def = 263,
                         attack_skill = 210 },
                [65] = { acc = 266, eva = 248, agi = 57, int = 41, mnd = 56, chr = 62, dex = 78, def = 269,
                         attack_skill = 214 },
                [66] = { acc = 272, eva = 254, agi = 58, int = 42, mnd = 56, chr = 63, dex = 81, def = 273,
                         attack_skill = 218 },
                [67] = { acc = 276, eva = 259, agi = 59, int = 42, mnd = 57, chr = 63, dex = 81, def = 279,
                         attack_skill = 221 },
                [68] = { acc = 282, eva = 264, agi = 59, int = 42, mnd = 58, chr = 64, dex = 83, def = 284,
                         attack_skill = 225 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 100, item = 1427 },  -- monks testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [64] = 4068, [65] = 4158, [66] = 4246, [67] = 4335, [68] = 4423 }, mp = { [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 250 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Davoi Pugil',
            ids    = { 338, 339, 340, 342, 343, 344, 351, 352, 353, 355, 356, 357, 359, 360, 361, 367, 368, 369,
                       371, 372, 373, 375, 376, 377, 379, 380, 381 },
            levels = {
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 22, dex = 28, def = 105,
                         attack_skill = 77 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 22, dex = 29, def = 108,
                         attack_skill = 80 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 24, dex = 29, def = 111,
                         attack_skill = 83 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24, dex = 30, def = 114,
                         attack_skill = 86 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 868 },  -- handful of pugil scales
            },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [26] = 623, [27] = 658, [28] = 698, [29] = 735 }, mp = { [26] = 0, [27] = 0, [28] = 0, [29] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 10 minutes', notes = { 'Base respawn delay: 10 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 341, 345, 354, 358, 362, 370, 374, 378, 382 },
            job    = 'blm/rdm',
            levels = {
                [47] = { acc = 168, eva = 151, agi = 47, int = 55, mnd = 43, chr = 45, dex = 48, def = 160,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45, dex = 48, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45, dex = 49, def = 166,
                         attack_skill = 144 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 1966, [48] = 2043, [49] = 2116 }, mp = { [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Water weather; Respawn 14 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Poison II: Poison; Poisonga: area poison; Drown: Drown', notes = { 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drown: Drown.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[101], level_ranges = { { 43, 255 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[48], level_ranges = { { 24, 59 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[78], level_ranges = { { 27, 50 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[90] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Morbol',
            ids    = { 346, 363, 365 },
            levels = {
                [37] = { acc = 135, eva = 124, agi = 38, int = 29, mnd = 27, chr = 32, dex = 43, def = 140,
                         attack_skill = 109 },
                [38] = { acc = 138, eva = 127, agi = 38, int = 29, mnd = 28, chr = 33, dex = 43, def = 143,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 131, agi = 40, int = 31, mnd = 29, chr = 35, dex = 45, def = 147,
                         attack_skill = 115 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 50, item = 16937 },  -- icicle sword
                { rate = 150, item = 920 },  -- malboro vine
            },
            steal  = { 920 },  -- malboro vine
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [37] = 1353, [38] = 1436, [39] = 1514 }, mp = { [37] = 0, [38] = 0, [39] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = { 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[37] } }, { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[174] }, { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { danger[36], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[4], { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = danger[142], categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Davoi Mush',
            ids    = { 364, 366, 399 },
            levels = {
                [33] = { acc = 119, eva = 110, agi = 32, int = 26, mnd = 28, chr = 29, dex = 34, def = 128,
                         attack_skill = 97 },
                [34] = { acc = 123, eva = 114, agi = 34, int = 26, mnd = 29, chr = 29, dex = 36, def = 131,
                         attack_skill = 100 },
                [35] = { acc = 126, eva = 117, agi = 35, int = 27, mnd = 30, chr = 30, dex = 36, def = 134,
                         attack_skill = 103 },
            },
            spawn_levels = { [364] = { 34, 35 }, [366] = { 33, 34 }, [399] = { 35, 35 } },
            ph_for = { [399] = { 400 } },
            ph_rules = {
                [399] = {
                    [400] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [33] = 1032, [34] = 1115, [35] = 1193 }, mp = { [33] = 0, [34] = 0, [35] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 12 minutes', notes = { 'Base respawn delay: 12 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[28],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Blubbery Bulge',
            ids    = { 400 },
            nm     = true,
            levels = {
                [45] = { acc = 161, eva = 150, agi = 45, int = 36, mnd = 39, chr = 40, dex = 47, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 154, agi = 46, int = 36, mnd = 40, chr = 40, dex = 48, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 156, agi = 46, int = 37, mnd = 40, chr = 41, dex = 49, def = 173,
                         attack_skill = 138 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2100, [46] = 2100, [47] = 2100 }, mp = { [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[28],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Dragoon',
            ids    = { 419, 420, 421, 429, 433, 437, 441 },
            job    = 'drg/war',
            levels = {
                [65] = { acc = 284, eva = 252, agi = 64, int = 45, mnd = 53, chr = 69, dex = 71, def = 265,
                         attack_skill = 214 },
                [66] = { acc = 290, eva = 257, agi = 65, int = 45, mnd = 53, chr = 71, dex = 73, def = 269,
                         attack_skill = 218 },
                [67] = { acc = 295, eva = 263, agi = 67, int = 45, mnd = 53, chr = 71, dex = 74, def = 275,
                         attack_skill = 221 },
                [68] = { acc = 300, eva = 268, agi = 67, int = 45, mnd = 55, chr = 71, dex = 75, def = 280,
                         attack_skill = 225 },
                [69] = { acc = 305, eva = 273, agi = 67, int = 47, mnd = 55, chr = 73, dex = 75, def = 286,
                         attack_skill = 229 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 100, item = 1439 },  -- dragoons testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3962, [66] = 4049, [67] = 4138, [68] = 4225, [69] = 4313 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dirtyhanded Gochakzuk',
            ids    = { 425 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [71] = { acc = 297, eva = 257, agi = 75, int = 79, mnd = 60, chr = 72, dex = 83, def = 277,
                         attack_skill = 237 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 10,
                       slow = -2, poison = -3, light_sleep = 10, dark_sleep = 10, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1000, item = 17437 },  -- curse wand
                { rate = 1000, item = 17437 },  -- curse wand
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 5984 }, mp = { [71] = 2053 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[34], danger[39], danger[44], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[81], level_ranges = { { 60, 255 } } }, { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[81], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[81], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[81], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[81], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[81], level_ranges = { { 58, 255 } } }, danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[79], danger[82], danger[83], danger[175], danger[86], danger[89], danger[176], { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[178], level_ranges = { { 56, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Gavotvut',
            ids    = { 445 },
            nm     = true,
            levels = {
                [45] = { acc = 164, eva = 151, agi = 47, int = 31, mnd = 34, chr = 43, dex = 52, def = 167,
                         attack_skill = 132 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 9,
                       slow = -2, poison = -3, light_sleep = 9, dark_sleep = 9, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 7139 }, mp = { [45] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Aerial Wheel: Stun; Shoulder Attack: can crit during Mighty Strikes; Slam Dunk: Bind, can crit during Mighty Strikes; Battle Dance: DEX down, can crit during Mighty Strikes', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Shoulder Attack: can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Slam Dunk: Bind, can crit during Mighty Strikes. Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Battle Dance: DEX down, can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { danger[34], { kind = 'skill', id = 606, name = 'Shoulder Attack', summary = 'Shoulder Attack: can crit during Mighty Strikes', notes = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' }, categories = { 'crit' }, effects = {  }, details = danger[174] }, { kind = 'skill', id = 607, name = 'Slam Dunk', summary = 'Slam Dunk: Bind, can crit during Mighty Strikes', notes = { 'Random effects may not all happen on the same use. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' }, categories = { 'crit', 'debuff' }, effects = { 'Bind' }, details = danger[38] }, { kind = 'skill', id = 609, name = 'Battle Dance', summary = 'Battle Dance: DEX down, can crit during Mighty Strikes', notes = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: area around the monster.' }, categories = { 'crit', 'debuff' }, effects = { 'DEX down' }, details = danger[43] } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[18] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Barakbok',
            ids    = { 446 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [43] = { acc = 156, eva = 142, agi = 40, int = 39, mnd = 29, chr = 34, dex = 49, def = 152,
                         attack_skill = 126 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 9,
                       slow = -2, poison = -3, light_sleep = 9, dark_sleep = 9, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [43] = 4278 }, mp = { [43] = 2000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: HP drain; Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[154], danger[34], danger[39], danger[44], danger[102], danger[103], danger[104], danger[105], danger[108], danger[109], danger[110], danger[164], danger[167], danger[115], danger[120], danger[172], danger[125], danger[130] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Bilopdop',
            ids    = { 447 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [55] = { acc = 213, eva = 192, agi = 43, int = 33, mnd = 50, chr = 53, dex = 70, def = 208,
                         attack_skill = 171 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 9,
                       slow = -2, poison = -3, light_sleep = 9, dark_sleep = 9, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 11465 }, mp = { [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[99],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Deloknok',
            ids    = { 448 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [53] = { acc = 195, eva = 175, agi = 39, int = 33, mnd = 54, chr = 60, dex = 54, def = 232,
                         attack_skill = 161 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 9,
                       slow = -2, poison = -3, light_sleep = 9, dark_sleep = 9, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [53] = 6299 }, mp = { [53] = 3000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[180],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Purpleflash Brukdok',
            ids    = { 449 },
            nm     = true,
            job    = 'blm/war',
            levels = {
                [45] = { acc = 164, eva = 151, agi = 47, int = 45, mnd = 37, chr = 45, dex = 52, def = 165,
                         attack_skill = 132 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 11,
                       slow = -2, poison = -3, light_sleep = 10, dark_sleep = 10, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 1000, item = 1103 },  -- davoi storage key
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            links  = 14,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 8295 }, mp = { [45] = 1243 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[34], danger[39], danger[44], { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[101], level_ranges = { { 43, 64 } } }, danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[79], danger[82], danger[83], danger[175], danger[86], danger[89], danger[176], { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[178], level_ranges = { { 31, 55 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[90] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'One-eyed Gwajboj',
            ids    = { 450 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [62] = { acc = 243, eva = 221, agi = 45, int = 38, mnd = 63, chr = 70, dex = 62, def = 280,
                         attack_skill = 203 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, bind = 4,
                       silence = 9, slow = -2, poison = -3, light_sleep = 9, dark_sleep = 9, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 20 },
            drops  = {
                { rate = 1000, item = 1095 },  -- well weight
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 15,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 11549 }, mp = { [62] = 6000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[180],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Three-eyed Prozpuz',
            ids    = { 451 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [60] = { acc = 270, eva = 208, agi = 74, int = 46, mnd = 54, chr = 57, dex = 64, def = 226,
                         attack_skill = 196 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = 9,
                       slow = -2, poison = -3, light_sleep = 9, dark_sleep = 9, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 20 },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 16,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 10500 }, mp = { [60] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Store TP 60', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[46],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hematic Cyst',
            ids    = { 452 },
            nm     = true,
            levels = {
                [40] = { acc = 143, eva = 133, agi = 38, int = 31, mnd = 34, chr = 35, dex = 40, def = 150,
                         attack_skill = 118 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Clot (ID 16); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [40] = 2400 }, mp = { [40] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Digest', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 542, name = 'Digest', level = 36, min_skill = 80, skill_ids = { 433 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
