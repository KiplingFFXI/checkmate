-- Temple of Uggalepih (zone 159).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Suction: Stun. Source targeting: single target.', 'Acid Mist: Attack down. Source targeting: area around the monster.', 'Sand Breath: Blindness. Source targeting: cone.', 'Drainkiss: HP drain. Source targeting: single target.', 'Tp Drainkiss: TP drain. Source targeting: single target.', 'Mp Drainkiss: MP drain. Source targeting: single target.', 'Brain Drain: INT down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[3] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[4] = { notes = danger[2], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[3] };
danger[5] = { kind = 'skill', id = 414, name = 'Suction', summary = 'Suction: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[4] };
danger[6] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[7] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[8] = { danger[7] };
danger[9] = { notes = danger[6], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[8] };
danger[10] = { kind = 'skill', id = 415, name = 'Acid Mist', summary = 'Acid Mist: Attack down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[9] };
danger[11] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[12] = { notes = danger[11], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[13] = { kind = 'skill', id = 416, name = 'Sand Breath', summary = 'Sand Breath: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[12] };
danger[14] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[16] = { kind = 'skill', id = 417, name = 'Drainkiss', summary = 'Drainkiss: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] };
danger[17] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[18] = { notes = danger[17], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[19] = { kind = 'skill', id = 420, name = 'Tp Drainkiss', summary = 'Tp Drainkiss: TP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[18] };
danger[20] = { kind = 'skill', id = 421, name = 'Mp Drainkiss', summary = 'Mp Drainkiss: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[18] };
danger[21] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[22] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[23] = { danger[22] };
danger[24] = { notes = danger[21], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[23] };
danger[25] = { kind = 'skill', id = 423, name = 'Brain Drain', summary = 'Brain Drain: INT down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[24] };
danger[26] = { danger[5], danger[10], danger[13], danger[16], danger[19], danger[20], danger[25] };
danger[27] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[28] = { value = 'Suction: Stun; Acid Mist: Attack down; Sand Breath: Blindness; Drainkiss: HP drain; Tp Drainkiss: TP drain; Mp Drainkiss: MP drain; Brain Drain: INT down', notes = danger[1], entries = danger[26], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[29] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[30] = { notes = danger[29], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[31] = { kind = 'skill', id = 783, name = 'Words Of Bane', summary = 'Words Of Bane: Curse', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[30] };
danger[32] = { 'The gaze effect requires the target to face the monster. Source targeting: single target.' };
danger[33] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[34] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[35] = { danger[34], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } };
danger[36] = { notes = danger[33], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[35] };
danger[37] = { kind = 'skill', id = 785, name = 'Light Of Penance', summary = 'Light Of Penance: Bind, Blindness', notes = danger[32], categories = { 'debuff' }, effects = { 'Bind', 'Blindness' }, details = danger[36] };
danger[38] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[39] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[40] = { danger[39] };
danger[41] = { notes = danger[38], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[40] };
danger[42] = { kind = 'skill', id = 786, name = 'Lateral Slash', summary = 'Lateral Slash: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[41] };
danger[43] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[44] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[45] = { danger[44] };
danger[46] = { notes = danger[43], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[45] };
danger[47] = { kind = 'skill', id = 787, name = 'Vertical Slash', summary = 'Vertical Slash: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[46] };
danger[48] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[49] = { notes = danger[48], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[50] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[49], level_ranges = { { 60, 255 } } };
danger[51] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[49], level_ranges = { { 50, 255 } } };
danger[52] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[49], level_ranges = { { 52, 255 } } };
danger[53] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[49], level_ranges = { { 54, 255 } } };
danger[54] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[49], level_ranges = { { 56, 255 } } };
danger[55] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[49], level_ranges = { { 58, 255 } } };
danger[56] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[57] = { notes = danger[56], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[58] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[57], level_ranges = { { 24, 71 } } };
danger[59] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[60] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[61] = { danger[60] };
danger[62] = { notes = danger[59], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[61] };
danger[63] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[62], level_ranges = { { 24, 255 } } };
danger[64] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[65] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[66] = { danger[65] };
danger[67] = { notes = danger[64], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[66] };
danger[68] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[67], level_ranges = { { 22, 255 } } };
danger[69] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[70] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[71] = { danger[70] };
danger[72] = { notes = danger[69], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[71] };
danger[73] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[72], level_ranges = { { 20, 255 } } };
danger[74] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[75] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[76] = { danger[75] };
danger[77] = { notes = danger[74], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[76] };
danger[78] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[77], level_ranges = { { 18, 255 } } };
danger[79] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[80] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[81] = { danger[80] };
danger[82] = { notes = danger[79], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[81] };
danger[83] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[82], level_ranges = { { 16, 255 } } };
danger[84] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[85] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[86] = { danger[85] };
danger[87] = { notes = danger[84], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[86] };
danger[88] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[87], level_ranges = { { 27, 255 } } };
danger[89] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[49], level_ranges = { { 12, 255 } } };
danger[90] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[49], level_ranges = { { 25, 255 } } };
danger[91] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[92] = { notes = danger[91], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[3] };
danger[93] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[92], level_ranges = { { 45, 255 } } };
danger[94] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[95] = { notes = danger[94], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[96] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[95], level_ranges = { { 4, 255 } } };
danger[97] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[98] = { danger[34] };
danger[99] = { notes = danger[97], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[98] };
danger[100] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[99], level_ranges = { { 7, 255 } } };
danger[101] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[49], level_ranges = { { 41, 255 } } };
danger[102] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[103] = { notes = danger[102], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[104] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[103], level_ranges = { { 56, 255 } } };
danger[105] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[106] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[107] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[108] = { notes = danger[107], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[109] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[110] = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[111] = { danger[31], danger[37], danger[42], danger[47] };
danger[112] = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down', notes = danger[110], entries = danger[111], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[27] };
danger[113] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[114] = { notes = danger[113], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[115] = { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[114], level_ranges = { { 40, 255 } } };
danger[116] = { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[114], level_ranges = { { 40, 255 } } };
danger[117] = { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[114], level_ranges = { { 40, 255 } } };
danger[118] = { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[114], level_ranges = { { 40, 255 } } };
danger[119] = { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[114], level_ranges = { { 40, 255 } } };
danger[120] = { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[114], level_ranges = { { 40, 255 } } };
danger[121] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[122] = { notes = danger[121], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[123] = { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[122], level_ranges = { { 65, 255 } } };
danger[124] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[125] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[126] = { danger[125] };
danger[127] = { notes = danger[124], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[126] };
danger[128] = { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[127], level_ranges = { { 48, 255 } } };
danger[129] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[130] = { notes = danger[129], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[131] = { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[130], level_ranges = { { 56, 255 } } };
danger[132] = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[133] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[134] = { notes = danger[133], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[135] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[136] = { 'Kartstrahl: Sleep. Source targeting: single target.', 'Blitzstrahl: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Panzerschreck: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Gravity Field: Slow. Random effects may not all happen on the same use. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[137] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[138] = { notes = danger[137], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[139] = { kind = 'skill', id = 534, name = 'Kartstrahl', summary = 'Kartstrahl: Sleep', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[138] };
danger[140] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[141] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[142] = { notes = danger[141], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[3] };
danger[143] = { kind = 'skill', id = 535, name = 'Blitzstrahl', summary = 'Blitzstrahl: Stun', notes = danger[140], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[142] };
danger[144] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[145] = { notes = danger[144], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[146] = { kind = 'skill', id = 538, name = 'Panzerschreck', summary = 'Panzerschreck: can crit', notes = danger[106], categories = { 'crit' }, effects = {  }, details = danger[145] };
danger[147] = { 'Random effects may not all happen on the same use. Source targeting: area around the target.' };
danger[148] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[149] = { notes = danger[148], unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore' } }, removals = danger[126] };
danger[150] = { kind = 'skill', id = 541, name = 'Gravity Field', summary = 'Gravity Field: Slow', notes = danger[147], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[149] };
danger[151] = { danger[139], danger[143], danger[146], danger[150] };
danger[152] = { value = 'Kartstrahl: Sleep; Blitzstrahl: Stun; Panzerschreck: can crit; Gravity Field: Slow', notes = danger[136], entries = danger[151], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[153] = { 'Kartstrahl: Sleep. Source targeting: single target.', 'Blitzstrahl: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Panzerfaust: can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Panzerschreck: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Typhoon: can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: area around the monster.', 'Gravity Field: Slow. Random effects may not all happen on the same use. Source targeting: area around the target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[154] = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' };
danger[155] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 2 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[156] = { notes = danger[155], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 2 } } };
danger[157] = { kind = 'skill', id = 536, name = 'Panzerfaust', summary = 'Panzerfaust: can crit during Mighty Strikes', notes = danger[154], categories = { 'crit' }, effects = {  }, details = danger[156] };
danger[158] = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: area around the monster.' };
danger[159] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[160] = { notes = danger[159], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 4 } } };
danger[161] = { kind = 'skill', id = 539, name = 'Typhoon', summary = 'Typhoon: can crit during Mighty Strikes', notes = danger[158], categories = { 'crit' }, effects = {  }, details = danger[160] };
danger[162] = { danger[139], danger[143], danger[157], danger[146], danger[161], danger[150] };
danger[163] = { value = 'Kartstrahl: Sleep; Blitzstrahl: Stun; Panzerfaust: can crit during Mighty Strikes; Panzerschreck: can crit; Typhoon: can crit during Mighty Strikes; Gravity Field: Slow', notes = danger[153], entries = danger[162], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[27] };
danger[164] = { 'Final Sting: heavy damage. Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[165] = { 'Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.' };
danger[166] = { kind = 'skill', id = 336, name = 'Final Sting', summary = 'Final Sting: heavy damage', notes = danger[165], categories = { 'other' }, effects = {  }, details = danger[18] };
danger[167] = { danger[166] };
danger[168] = { value = 'Final Sting: heavy damage', notes = danger[164], entries = danger[167], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[169] = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[170] = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down', notes = danger[169], entries = danger[111], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[171] = { kind = 'spell', id = 341, name = 'Jubaku Ichi', summary = 'Jubaku Ichi: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[122], level_ranges = { { 30, 64 } } };
danger[172] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[173] = { notes = danger[172], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[174] = { kind = 'spell', id = 348, name = 'Kurayami Ni', summary = 'Kurayami Ni: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[173], level_ranges = { { 44, 72 } } };
danger[175] = { 'Sticky Thread: Slow. Source targeting: cone.', 'Poison Breath: poison. Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[176] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[177] = { notes = danger[176], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = danger[126] };
danger[178] = { kind = 'skill', id = 344, name = 'Sticky Thread', summary = 'Sticky Thread: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[177] };
danger[179] = { 'Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.' };
danger[180] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[181] = { notes = danger[180], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[182] = { kind = 'skill', id = 345, name = 'Poison Breath Crawler', summary = 'Poison Breath: poison', notes = danger[179], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[181] };
danger[183] = { danger[178], danger[182] };
danger[184] = { value = 'Sticky Thread: Slow; Poison Breath: poison', notes = danger[175], entries = danger[183], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[185] = { 'Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.' };
danger[186] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[187] = { notes = danger[186], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[188] = { kind = 'skill', id = 652, name = 'Blaster', summary = 'Blaster: paralysis', notes = danger[185], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[187] };
danger[189] = { 'Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.' };
danger[190] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[191] = { notes = danger[190], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[192] = { kind = 'skill', id = 653, name = 'Chaotic Eye', summary = 'Chaotic Eye: silence gaze', notes = danger[189], categories = { 'debuff' }, effects = { 'Silence' }, details = danger[191] };
danger[193] = { danger[188], danger[192] };
danger[194] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[134], level_ranges = { { 43, 64 } } };
danger[195] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[196] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[197] = { danger[196] };
danger[198] = { notes = danger[195], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[197] };
danger[199] = { kind = 'skill', id = 523, name = 'Mysterious Light', summary = 'Mysterious Light: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[198] };
danger[200] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[201] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[202] = { danger[201] };
danger[203] = { notes = danger[200], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[202] };
danger[204] = { kind = 'skill', id = 524, name = 'Mind Drain', summary = 'Mind Drain: MND down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[203] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Beryl-footed Molberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry', 'Cook Solberry',
                      'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [2] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [3] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Solberry',
                      'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [4] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Nalberry', 'Cook Solberry',
                      'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [5] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Minberry', 'Cook Nalberry', 'Cook Solberry',
                      'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [6] = { sight = { 'Death from Above', 'Temple Bee', 'Wespe' } },
        [7] = { sight = { 'Temple Opo-opo' } },
        [8] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Cook Solberry', 'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry',
                      'Sozu Terberry', 'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier',
                      'Tonberry Maledictor', 'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [9] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Cook Solberry', 'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [10] = { sound = { 'Habetrot', 'Rumble Crawler' } },
        [11] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Cook Solberry', 'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [12] = { sight = { 'Tonberrys Avatar' } },
        [13] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Cook Solberry', 'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry',
                      'Sozu Terberry', 'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier',
                      'Tonberry Maledictor', 'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
        },
        [14] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Cook Solberry', 'Crimson-toothed Pawberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [15] = { sound = { 'Rompaulion S Citalle' } },
        [16] = { sound = { 'Cleuvarion M Resoaix' } },
        [17] = {
            sight = { 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry', 'Cook Solberry',
                      'Crimson-toothed Pawberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry',
                      'Tonberry Cutter', 'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor',
                      'Tonberry Pursuer', 'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
        [18] = { sight = { 'Temple Bee', 'Wespe' } },
        [19] = { sound = { 'Rumble Crawler' } },
        [20] = {
            sight = { 'Beryl-footed Molberry', 'Bonze Marberry', 'Cook Fulberry', 'Cook Minberry', 'Cook Nalberry',
                      'Cook Solberry', 'Sozu Rogberry', 'Sozu Sarberry', 'Sozu Terberry', 'Tonberry Cutter',
                      'Tonberry Dismayer', 'Tonberry Harrier', 'Tonberry Maledictor', 'Tonberry Pursuer',
                      'Tonberry Stabber', 'Tonberry Stalker' },
            true_sight = { 'Tonberry Kinq' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Beryl-footed Molberry'] = { id = 71, name = 'Tonberry' },
        ['Bonze Marberry'] = { id = 71, name = 'Tonberry' },
        ['Cleuvarion M Resoaix'] = { id = 177, name = 'Shadow' },
        ['Cook Fulberry'] = { id = 71, name = 'Tonberry' },
        ['Cook Minberry'] = { id = 71, name = 'Tonberry' },
        ['Cook Nalberry'] = { id = 71, name = 'Tonberry' },
        ['Cook Solberry'] = { id = 71, name = 'Tonberry' },
        ['Crimson-toothed Pawberry'] = { id = 71, name = 'Tonberry' },
        ['Death from Above'] = { id = 181, name = 'Bee' },
        ['Habetrot'] = { id = 186, name = 'Crawler' },
        ['Rompaulion S Citalle'] = { id = 177, name = 'Shadow' },
        ['Rumble Crawler'] = { id = 186, name = 'Crawler' },
        ['Sozu Rogberry'] = { id = 71, name = 'Tonberry' },
        ['Sozu Sarberry'] = { id = 71, name = 'Tonberry' },
        ['Sozu Terberry'] = { id = 71, name = 'Tonberry' },
        ['Temple Bee'] = { id = 181, name = 'Bee' },
        ['Temple Opo-opo'] = { id = 48, name = 'Opo Opo' },
        ['Tonberry Cutter'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Dismayer'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Harrier'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Kinq'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Maledictor'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Pursuer'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Stabber'] = { id = 71, name = 'Tonberry' },
        ['Tonberry Stalker'] = { id = 71, name = 'Tonberry' },
        ['Tonberrys Avatar'] = { id = 102, name = 'Avatar' },
        ['Wespe'] = { id = 181, name = 'Bee' },
    },
    monsters = {
        {
            name   = 'Uggalepih Leech',
            ids    = { 1, 2 },
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 44, mnd = 41, chr = 45, dex = 54, def = 183,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 45, mnd = 41, chr = 47, dex = 56, def = 188,
                         attack_skill = 151 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 45, mnd = 41, chr = 47, dex = 56, def = 193,
                         attack_skill = 156 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 2521, [51] = 2605, [52] = 2688 }, mp = { [50] = 0, [51] = 0, [52] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bloodsucker',
            ids    = { 3, 4 },
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 47, mnd = 43, chr = 49, dex = 58, def = 209,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 48, mnd = 44, chr = 50, dex = 61, def = 214,
                         attack_skill = 176 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 50, mnd = 46, chr = 50, dex = 61, def = 219,
                         attack_skill = 181 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 50, mnd = 46, chr = 52, dex = 61, def = 224,
                         attack_skill = 186 },
                [59] = { acc = 229, eva = 216, agi = 63, int = 51, mnd = 47, chr = 53, dex = 63, def = 230,
                         attack_skill = 191 },
                [60] = { acc = 234, eva = 221, agi = 63, int = 51, mnd = 47, chr = 53, dex = 63, def = 235,
                         attack_skill = 196 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 53, mnd = 49, chr = 55, dex = 66, def = 240,
                         attack_skill = 199 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 53, mnd = 49, chr = 55, dex = 66, def = 245,
                         attack_skill = 203 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2939, [56] = 3022, [57] = 3106, [58] = 3189, [59] = 3273, [60] = 3356, [61] = 3440, [62] = 3523 }, mp = { [55] = 0, [56] = 0, [57] = 0, [58] = 0, [59] = 0, [60] = 0, [61] = 0, [62] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bouncing Ball',
            ids    = { 5 },
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58, dex = 68, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58, dex = 70, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59, dex = 71, def = 271,
                         attack_skill = 221 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774, [66] = 3857, [67] = 3941 }, mp = { [65] = 0, [66] = 0, [67] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[28],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bonze Marberry',
            ids    = { 6 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [66] = { acc = 269, eva = 237, agi = 78, int = 77, mnd = 55, chr = 62, dex = 75, def = 250,
                         attack_skill = 218 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1143 },  -- cursed key
                { rate = 1000, item = 1143 },  -- cursed key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 6800 }, mp = { [66] = 1894 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[50], danger[51], danger[52], danger[53], danger[54], danger[55], danger[58], danger[63], danger[68], danger[73], danger[78], danger[83], danger[88], danger[89], danger[90], danger[93], danger[96], danger[100], danger[101], danger[104] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Trompe LOeil',
            ids    = { 7 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 220, agi = 60, int = 51, mnd = 51, chr = 57, dex = 67, def = 238,
                         attack_skill = 196 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Golem / Arcana', notes = { 'Source species: Golem (ID 63); family ID 28.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 17000 }, mp = { [60] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Heavy Strike: can crit; Ice Break: Bind; Thunder Break: Stun', notes = { 'Heavy Strike: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ice Break: Bind. Source targeting: area around the monster.', 'Thunder Break: Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 675, name = 'Heavy Strike', summary = 'Heavy Strike: can crit', notes = danger[106], categories = { 'crit' }, effects = {  }, details = danger[108] }, { kind = 'skill', id = 676, name = 'Ice Break', summary = 'Ice Break: Bind', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[98] } }, { kind = 'skill', id = 677, name = 'Thunder Break', summary = 'Thunder Break: Stun', notes = danger[109], categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[3] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Ice Break', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 531, name = 'Ice Break', level = 50, min_skill = 122, skill_ids = { 676 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cook Solberry',
            ids    = { 8 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 317, eva = 281, agi = 86, int = 88, mnd = 62, chr = 70, dex = 82, def = 297,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4101 }, mp = { [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 2 minutes', notes = { 'Source idle-despawn delay: 2 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[50], danger[51], danger[52], danger[53], danger[54], danger[55], { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[57], level_ranges = { { 72, 255 } } }, danger[63], danger[68], danger[73], danger[78], danger[83], danger[88], danger[89], danger[90], danger[93], danger[96], danger[100], danger[101], danger[104] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Cook Nalberry',
            ids    = { 9 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 324, eva = 372, agi = 92, int = 74, mnd = 49, chr = 52, dex = 96, def = 303,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4326 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 2 minutes', notes = { 'Source idle-despawn delay: 2 minutes. This is not its remaining lifetime.' } },
                dangers = danger[112],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Cook Minberry',
            ids    = { 10 },
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 320, eva = 324, agi = 92, int = 67, mnd = 49, chr = 58, dex = 88, def = 307,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4326 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                fight = { value = 'Idle despawn 2 minutes', notes = { 'Source idle-despawn delay: 2 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[115], danger[116], danger[117], danger[118], danger[119], danger[120], danger[123], danger[128], danger[131] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Cook Fulberry',
            ids    = { 11 },
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 311, eva = 277, agi = 79, int = 80, mnd = 80, chr = 83, dex = 70, def = 297,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 3989 }, mp = { [75] = 2241 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 2 minutes', notes = { 'Source idle-despawn delay: 2 minutes. This is not its remaining lifetime.' } },
                dangers = danger[112],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 12, 26, 36, 49, 64, 73, 77, 80, 83, 91, 110, 117, 122, 129, 132, 146, 155, 162, 164, 177,
                       180, 183, 185, 194, 196, 198, 201, 204, 212, 219, 228, 242, 252, 256, 263, 288, 294, 299,
                       313, 322, 334 },
            job    = 'blm/rdm',
            levels = {
                [43] = { acc = 153, eva = 138, agi = 43, int = 50, mnd = 39, chr = 40, dex = 43, def = 147,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 142, agi = 45, int = 52, mnd = 41, chr = 43, dex = 46, def = 151,
                         attack_skill = 129 },
                [45] = { acc = 161, eva = 144, agi = 45, int = 53, mnd = 42, chr = 43, dex = 46, def = 154,
                         attack_skill = 132 },
                [46] = { acc = 164, eva = 148, agi = 46, int = 53, mnd = 42, chr = 42, dex = 46, def = 157,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 151, agi = 47, int = 55, mnd = 43, chr = 45, dex = 48, def = 160,
                         attack_skill = 138 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45, dex = 48, def = 163,
                         attack_skill = 141 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45, dex = 49, def = 166,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50, dex = 54, def = 175,
                         attack_skill = 151 },
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50, dex = 54, def = 180,
                         attack_skill = 156 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52, dex = 55, def = 186,
                         attack_skill = 161 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52, dex = 56, def = 191,
                         attack_skill = 166 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52, dex = 56, def = 196,
                         attack_skill = 171 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Fire Elemental (ID 261); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 1663, [44] = 1740, [45] = 1813, [46] = 1889, [47] = 1966, [48] = 2043, [49] = 2116, [50] = 2241, [51] = 2319, [52] = 2396, [53] = 2473, [54] = 2550, [55] = 2628 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep', notes = { 'Freeze: Fire magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Tornado: Ice magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Quake: Wind magic evasion down. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poison II: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Poisonga: area poison. Possible effects: Poison. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Burn: Burn. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Frost: Frost. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Choke: Choke. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Rasp: Rasp. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Shock: Shock. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drown: Drown. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Drain: HP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Aspir: MP drain. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Stun: stun. Possible effects: Stun. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Blind: Blindness. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Bind: bind. Possible effects: Bind. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleep II: sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, entries = { { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = danger[132], categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[49], level_ranges = { { 50, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = danger[132], categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[49], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = danger[132], categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[49], level_ranges = { { 54, 255 } } }, { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = danger[132], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[134], level_ranges = { { 43, 64 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[57], level_ranges = { { 24, 71 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = danger[132], categories = { 'debuff' }, effects = { 'Burn' }, details = danger[62], level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = danger[132], categories = { 'debuff' }, effects = { 'Frost' }, details = danger[67], level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = danger[132], categories = { 'debuff' }, effects = { 'Choke' }, details = danger[72], level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = danger[132], categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[77], level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = danger[132], categories = { 'debuff' }, effects = { 'Shock' }, details = danger[82], level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = danger[132], categories = { 'debuff' }, effects = { 'Drown' }, details = danger[87], level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = danger[132], categories = { 'drain' }, effects = { 'HP drain' }, details = danger[49], level_ranges = { { 12, 255 } } }, { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = danger[132], categories = { 'drain' }, effects = { 'MP drain' }, details = danger[49], level_ranges = { { 25, 255 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[92], level_ranges = { { 45, 255 } } }, { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = danger[132], categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[95], level_ranges = { { 4, 255 } } }, { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[99], level_ranges = { { 7, 255 } } }, { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = danger[135], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[49], level_ranges = { { 41, 255 } } }, { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = danger[135], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[103], level_ranges = { { 31, 55 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.', 'A scripted spell-list replacement is not resolved.' }, general_notes = danger[105] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
            info_by_index = {
                [26] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [36] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [49] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [64] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [73] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [77] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [80] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [83] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [91] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [110] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [117] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [122] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [129] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [132] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [146] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [155] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [162] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [164] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [177] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [180] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [183] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [185] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [194] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [196] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [198] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [201] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [204] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [212] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [219] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [228] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [242] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [252] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [256] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [263] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [288] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [294] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [299] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [313] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [322] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
                [334] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 498, [44] = 522, [45] = 543, [46] = 566, [47] = 589, [48] = 612, [49] = 634, [50] = 672, [51] = 695, [52] = 718, [53] = 741, [54] = 765, [55] = 788 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.', 'Scripted encounter or loaded module rules can change rewards.' } } },
            },
        },
        {
            name   = 'Temple Guardian',
            ids    = { 14 },
            levels = {
                [65] = { acc = 263, eva = 246, agi = 65, int = 52, mnd = 52, chr = 62, dex = 72, def = 265,
                         attack_skill = 214 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1049 },  -- uggalepih coffer key
            },
            info = {
                family = { value = 'Doll / Arcana', notes = { 'Source species: Doll (ID 60); family ID 26.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774 }, mp = { [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[152],
                blue = { value = 'Blitzstrahl', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 532, name = 'Blitzstrahl', level = 44, min_skill = 104, skill_ids = { 535 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nio-A',
            ids    = { 15 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 283, agi = 72, int = 55, mnd = 55, chr = 68, dex = 80, def = 301,
                         attack_skill = 241 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'paralyze', 'slow', 'elegy', 'blind' },
            aggro  = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Doll / Arcana', notes = { 'Source species: Doll (ID 60); family ID 26.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 6700 }, mp = { [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[163],
                blue = { value = 'Blitzstrahl', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 532, name = 'Blitzstrahl', level = 44, min_skill = 104, skill_ids = { 535 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Nio-Hum',
            ids    = { 16 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 283, agi = 72, int = 55, mnd = 55, chr = 68, dex = 80, def = 301,
                         attack_skill = 241 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'paralyze', 'slow', 'elegy', 'blind' },
            aggro  = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Doll / Arcana', notes = { 'Source species: Doll (ID 60); family ID 26.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 6700 }, mp = { [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[163],
                blue = { value = 'Blitzstrahl', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 532, name = 'Blitzstrahl', level = 44, min_skill = 104, skill_ids = { 535 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Mimic',
            ids    = { 17 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46, dex = 67, def = 240,
                         attack_skill = 196 },
            },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            drops  = {
                { rate = 1000, item = 1049 },  -- uggalepih coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Mimic / Arcana', notes = { 'Source species: Mimic (ID 73); family ID 33.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3356 }, mp = { [60] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 170 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 1 minute; Conditional draw-in', notes = { 'Source idle-despawn delay: 1 minute. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Death Trap: Poison, Stun', notes = { 'Death Trap: Poison, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 729, name = 'Death Trap', summary = 'Death Trap: Poison, Stun', notes = danger[109], categories = { 'debuff' }, effects = { 'Poison', 'Stun' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Wespe TU',
            ids    = { 18, 20, 21, 22, 30, 56, 57, 86, 87, 96, 98, 101, 113, 114, 118, 120, 130, 135, 136, 139, 140,
                       142 },
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, dex = 56, def = 194,
                         attack_skill = 156 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, dex = 57, def = 200,
                         attack_skill = 161 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48, dex = 58, def = 205,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49, dex = 58, def = 210,
                         attack_skill = 171 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 1267 },  -- bag of bee larvae
            },
            steal  = { 4370 },  -- pot of honey
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[168],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Temple Opo-opo',
            ids    = { 19, 29, 31, 32, 39, 40, 41, 42, 43, 45, 46, 47, 50, 51, 52, 55, 58, 59, 66, 67, 68, 69 },
            levels = {
                [51] = { acc = 189, eva = 177, agi = 62, int = 35, mnd = 35, chr = 53, dex = 62, def = 188,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 182, agi = 62, int = 35, mnd = 35, chr = 53, dex = 62, def = 193,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 187, agi = 63, int = 37, mnd = 37, chr = 54, dex = 63, def = 198,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 193, agi = 64, int = 37, mnd = 37, chr = 54, dex = 64, def = 203,
                         attack_skill = 166 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            drops  = {
                { rate = 100, item = 4468 },  -- bunch of pamamas
                { rate = 150, item = 17296 },  -- pebble
                { rate = 50, item = 4432 },  -- kazham pineapple
                { rate = 10, item = 4412 },  -- thundermelon
            },
            steal  = { 4468 },  -- bunch of pamamas
            links  = 7,
            info = {
                family = { value = 'Opo Opo / Beast', notes = { 'Source species: Opo Opo (ID 100); family ID 48.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Stone Throw: Paralysis; Spinning Claw: can crit; Claw Storm: Poison; Blank Gaze: dispel gaze; Eye Scratch: Blindness', notes = { 'Stone Throw: Paralysis. Source targeting: single target.', 'Spinning Claw: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Claw Storm: Poison. Source targeting: single target.', 'Blank Gaze: dispel gaze. Attempts to remove one dispellable status effect when the target faces the monster. Source targeting: cone. Possible effects: Buff removal. Only effects allowed by the move\'s dispel checks can be removed.', 'Eye Scratch: Blindness. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 289, name = 'Stone Throw', summary = 'Stone Throw: Paralysis', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 25 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 25.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 290, name = 'Spinning Claw', summary = 'Spinning Claw: can crit', notes = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' }, categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 291, name = 'Claw Storm', summary = 'Claw Storm: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 292, name = 'Blank Gaze Dispel', summary = 'Blank Gaze: dispel gaze', notes = { 'Attempts to remove one dispellable status effect when the target faces the monster. Source targeting: cone. Possible effects: Buff removal. Only effects allowed by the move\'s dispel checks can be removed.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 294, name = 'Eye Scratch', summary = 'Eye Scratch: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Blank Gaze, Magic Fruit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 592, name = 'Blank Gaze', level = 38, min_skill = 86, skill_ids = { 292 } }, { id = 593, name = 'Magic Fruit', level = 58, min_skill = 162, skill_ids = { 295 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Stalker',
            ids    = { 23, 27, 33, 37, 53, 60, 61, 65, 70, 78, 88, 103, 106, 108, 112, 115, 126, 143, 144, 148, 149,
                       153, 159, 160, 169, 170, 175, 181, 186, 189, 205, 249, 253, 258, 265 },
            job    = 'thf/thf',
            levels = {
                [51] = { acc = 192, eva = 225, agi = 65, int = 54, mnd = 36, chr = 38, dex = 69, def = 178,
                         attack_skill = 151 },
                [52] = { acc = 197, eva = 230, agi = 65, int = 54, mnd = 36, chr = 38, dex = 69, def = 183,
                         attack_skill = 156 },
                [53] = { acc = 203, eva = 236, agi = 67, int = 54, mnd = 36, chr = 39, dex = 70, def = 188,
                         attack_skill = 161 },
                [54] = { acc = 208, eva = 241, agi = 67, int = 55, mnd = 36, chr = 39, dex = 71, def = 193,
                         attack_skill = 166 },
                [55] = { acc = 214, eva = 248, agi = 70, int = 56, mnd = 37, chr = 39, dex = 73, def = 199,
                         attack_skill = 171 },
                [56] = { acc = 220, eva = 253, agi = 70, int = 58, mnd = 38, chr = 41, dex = 74, def = 204,
                         attack_skill = 176 },
                [57] = { acc = 225, eva = 259, agi = 72, int = 58, mnd = 38, chr = 41, dex = 75, def = 209,
                         attack_skill = 181 },
                [58] = { acc = 230, eva = 264, agi = 72, int = 59, mnd = 39, chr = 41, dex = 75, def = 214,
                         attack_skill = 186 },
                [59] = { acc = 237, eva = 270, agi = 75, int = 60, mnd = 39, chr = 42, dex = 78, def = 220,
                         attack_skill = 191 },
            },
            spawn_levels = { [23] = { 51, 54 }, [27] = { 51, 54 }, [33] = { 51, 54 }, [37] = { 51, 54 },
                             [53] = { 52, 55 }, [60] = { 52, 55 }, [61] = { 52, 55 }, [65] = { 52, 55 },
                             [70] = { 53, 55 }, [78] = { 52, 55 }, [88] = { 53, 57 }, [103] = { 53, 57 },
                             [106] = { 54, 58 }, [108] = { 54, 58 }, [112] = { 54, 58 }, [115] = { 54, 58 },
                             [126] = { 54, 58 }, [143] = { 55, 59 }, [144] = { 55, 59 }, [148] = { 55, 59 },
                             [149] = { 55, 59 }, [153] = { 56, 59 }, [159] = { 56, 59 }, [160] = { 56, 59 },
                             [169] = { 56, 59 }, [170] = { 56, 59 }, [175] = { 56, 59 }, [181] = { 56, 59 },
                             [186] = { 56, 59 }, [189] = { 56, 59 }, [205] = { 56, 59 }, [249] = { 56, 59 },
                             [253] = { 56, 59 }, [258] = { 56, 59 }, [265] = { 56, 59 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 100, item = 4171 },  -- flask of vitriol
                { rate = 50, item = 904 },  -- set of giant fish bones
                { rate = 50, item = 1543 },  -- coeurl leather missive
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2422, [52] = 2501, [53] = 2580, [54] = 2659, [55] = 2739, [56] = 2818, [57] = 2897, [58] = 2976, [59] = 3056 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 0-5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Cutter',
            ids    = { 24, 28, 34, 38, 44, 54, 62, 71, 75, 81, 89, 97, 100, 107, 111, 119, 125, 127, 137, 147, 150,
                       151, 156, 157, 158, 165, 166, 167, 168, 173, 178, 187, 188, 202, 250, 254, 259, 266 },
            job    = 'nin/nin',
            levels = {
                [51] = { acc = 189, eva = 190, agi = 65, int = 48, mnd = 36, chr = 41, dex = 63, def = 181,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 195, agi = 65, int = 48, mnd = 36, chr = 41, dex = 63, def = 186,
                         attack_skill = 156 },
                [53] = { acc = 200, eva = 201, agi = 67, int = 49, mnd = 36, chr = 43, dex = 64, def = 191,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 206, agi = 67, int = 49, mnd = 36, chr = 43, dex = 65, def = 196,
                         attack_skill = 166 },
                [55] = { acc = 211, eva = 213, agi = 70, int = 50, mnd = 37, chr = 43, dex = 67, def = 202,
                         attack_skill = 171 },
                [56] = { acc = 217, eva = 218, agi = 70, int = 52, mnd = 38, chr = 44, dex = 68, def = 207,
                         attack_skill = 176 },
                [57] = { acc = 222, eva = 224, agi = 72, int = 52, mnd = 38, chr = 46, dex = 69, def = 212,
                         attack_skill = 181 },
                [58] = { acc = 227, eva = 229, agi = 72, int = 53, mnd = 39, chr = 46, dex = 69, def = 217,
                         attack_skill = 186 },
                [59] = { acc = 234, eva = 235, agi = 75, int = 54, mnd = 39, chr = 47, dex = 72, def = 223,
                         attack_skill = 191 },
            },
            spawn_levels = { [24] = { 51, 54 }, [28] = { 51, 54 }, [34] = { 51, 54 }, [38] = { 51, 54 },
                             [44] = { 52, 55 }, [54] = { 52, 55 }, [62] = { 52, 55 }, [71] = { 52, 55 },
                             [75] = { 52, 55 }, [81] = { 52, 55 }, [89] = { 53, 57 }, [97] = { 53, 57 },
                             [100] = { 53, 57 }, [107] = { 54, 58 }, [111] = { 54, 58 }, [119] = { 54, 58 },
                             [125] = { 54, 58 }, [127] = { 54, 58 }, [137] = { 55, 59 }, [147] = { 55, 59 },
                             [150] = { 55, 59 }, [151] = { 55, 59 }, [156] = { 56, 59 }, [157] = { 56, 59 },
                             [158] = { 56, 59 }, [165] = { 56, 59 }, [166] = { 56, 59 }, [167] = { 56, 59 },
                             [168] = { 56, 59 }, [173] = { 56, 59 }, [178] = { 56, 59 }, [187] = { 56, 59 },
                             [188] = { 56, 59 }, [202] = { 56, 59 }, [250] = { 56, 59 }, [254] = { 56, 59 },
                             [259] = { 56, 59 }, [266] = { 56, 59 } },
            ph_for = { [71] = { 74 } },
            ph_rules = {
                [71] = {
                    [74] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            drops  = {
                { rate = 100, item = 1136 },  -- uggalepih key
                { rate = 50, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1543 },  -- coeurl leather missive
                { rate = 50, item = 17303 },  -- manji shuriken
                { rate = 10, item = 1484 },  -- rancor mantle
                { rate = 1, item = 4953 },  -- scroll of hojo ni
                { rate = 10, item = 4962 },  -- scroll of tonko ni
                { rate = 5, item = 4956 },  -- scroll of kurayami ni
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2422, [52] = 2501, [53] = 2580, [54] = 2659, [55] = 2739, [56] = 2818, [57] = 2897, [58] = 2976, [59] = 3056 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ichi: Poison; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ichi: Poison.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[115], danger[116], danger[117], danger[118], danger[119], danger[120], danger[171], danger[128], danger[174], { kind = 'spell', id = 350, name = 'Dokumori Ichi', summary = 'Dokumori Ichi: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[130], level_ranges = { { 27, 55 } } }, danger[131] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Harrier',
            ids    = { 25, 35, 48, 63, 72, 76, 79, 82, 90, 109, 116, 121, 128, 145, 154, 161, 163, 176, 179, 182,
                       184, 200, 203, 251, 255, 262 },
            job    = 'smn/smn',
            levels = {
                [51] = { acc = 183, eva = 158, agi = 56, int = 57, mnd = 57, chr = 59, dex = 51, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 188, eva = 163, agi = 56, int = 57, mnd = 57, chr = 59, dex = 51, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 193, eva = 168, agi = 58, int = 58, mnd = 58, chr = 61, dex = 51, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 199, eva = 173, agi = 58, int = 58, mnd = 58, chr = 61, dex = 52, def = 189,
                         attack_skill = 166 },
                [55] = { acc = 204, eva = 177, agi = 59, int = 61, mnd = 61, chr = 63, dex = 53, def = 194,
                         attack_skill = 171 },
                [56] = { acc = 210, eva = 183, agi = 61, int = 61, mnd = 61, chr = 64, dex = 54, def = 198,
                         attack_skill = 176 },
                [57] = { acc = 215, eva = 188, agi = 62, int = 62, mnd = 62, chr = 65, dex = 54, def = 204,
                         attack_skill = 181 },
                [58] = { acc = 221, eva = 193, agi = 62, int = 63, mnd = 63, chr = 65, dex = 56, def = 210,
                         attack_skill = 186 },
                [59] = { acc = 226, eva = 198, agi = 64, int = 65, mnd = 65, chr = 68, dex = 57, def = 215,
                         attack_skill = 191 },
            },
            spawn_levels = { [25] = { 51, 54 }, [35] = { 51, 54 }, [48] = { 52, 55 }, [63] = { 52, 55 },
                             [72] = { 52, 55 }, [76] = { 52, 55 }, [79] = { 52, 55 }, [82] = { 52, 55 },
                             [90] = { 53, 57 }, [109] = { 54, 58 }, [116] = { 54, 58 }, [121] = { 54, 58 },
                             [128] = { 54, 58 }, [145] = { 55, 59 }, [154] = { 56, 59 }, [161] = { 56, 59 },
                             [163] = { 56, 59 }, [176] = { 56, 59 }, [179] = { 56, 59 }, [182] = { 56, 59 },
                             [184] = { 56, 59 }, [200] = { 56, 59 }, [203] = { 56, 59 }, [251] = { 56, 59 },
                             [255] = { 56, 59 }, [262] = { 56, 59 } },
            ph_for = { [128] = { 131 } },
            ph_rules = {
                [128] = {
                    [131] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 4171 },  -- flask of vitriol
                { rate = 10, item = 4901 },  -- water spirit pact
                { rate = 10, item = 1485 },  -- rancor globe
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2193, [52] = 2267, [53] = 2342, [54] = 2417, [55] = 2492, [56] = 2566, [57] = 2641, [58] = 2716, [59] = 2791 }, mp = { [51] = 1466, [52] = 1497, [53] = 1528, [54] = 1559, [55] = 1590, [56] = 1621, [57] = 1652, [58] = 1683, [59] = 1714 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sozu Sarberry',
            ids    = { 74 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [66] = { acc = 271, eva = 274, agi = 82, int = 59, mnd = 44, chr = 52, dex = 79, def = 259,
                         attack_skill = 218 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 150, item = 1162 },  -- tonberry lantern
                { rate = 240, item = 17303 },  -- manji shuriken
                { rate = 100, item = 4962 },  -- scroll of tonko ni
                { rate = 100, item = 4953 },  -- scroll of hojo ni
                { rate = 50, item = 4956 },  -- scroll of kurayami ni
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
                { rate = 10, item = 16924 },  -- hocho
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 7500 }, mp = { [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[115], danger[116], danger[117], danger[118], danger[119], danger[120], danger[123], danger[128], danger[174], danger[131] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Rumble Crawler',
            ids    = { 84, 85, 93, 94, 95, 99, 102, 104, 105, 123, 152 },
            levels = {
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 43, chr = 48, dex = 57, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 43, chr = 48, dex = 58, def = 190,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 194, agi = 56, int = 43, mnd = 43, chr = 49, dex = 58, def = 194,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 199, agi = 58, int = 44, mnd = 44, chr = 50, dex = 61, def = 200,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
                { rate = 10, item = 4357 },  -- crawler egg
            },
            links  = 10,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Crawler (ID 437); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [53] = 2772, [54] = 2855, [55] = 2939, [56] = 3022 }, mp = { [53] = 0, [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[184],
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Branding Iron',
            ids    = { 92, 134 },
            levels = {
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53, dex = 62, def = 212,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 199, agi = 58, int = 44, mnd = 44, chr = 54, dex = 65, def = 217,
                         attack_skill = 176 },
                [57] = { acc = 220, eva = 204, agi = 58, int = 46, mnd = 46, chr = 54, dex = 65, def = 222,
                         attack_skill = 181 },
                [58] = { acc = 225, eva = 209, agi = 59, int = 46, mnd = 46, chr = 56, dex = 65, def = 227,
                         attack_skill = 186 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Doll / Arcana', notes = { 'Source species: Doll (ID 60); family ID 26.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2939, [56] = 3022, [57] = 3106, [58] = 3189 }, mp = { [55] = 0, [56] = 0, [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[152],
                blue = { value = 'Blitzstrahl', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 532, name = 'Blitzstrahl', level = 44, min_skill = 104, skill_ids = { 535 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Torama',
            ids    = { 124, 138, 141, 172, 174, 248, 260, 261, 264 },
            levels = {
                [55] = { acc = 209, eva = 195, agi = 58, int = 47, mnd = 41, chr = 49, dex = 62, def = 209,
                         attack_skill = 171 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 48, mnd = 41, chr = 50, dex = 65, def = 214,
                         attack_skill = 176 },
                [57] = { acc = 220, eva = 205, agi = 61, int = 50, mnd = 43, chr = 50, dex = 65, def = 219,
                         attack_skill = 181 },
                [58] = { acc = 225, eva = 210, agi = 61, int = 50, mnd = 44, chr = 52, dex = 65, def = 224,
                         attack_skill = 186 },
            },
            ph_for = { [261] = { 257 } },
            ph_rules = {
                [261] = {
                    [257] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 927 },  -- coeurl whisker
                { rate = 50, item = 1591 },  -- high-quality coeurl hide
            },
            steal  = { 927 },  -- coeurl whisker
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Coeurl / Beast', notes = { 'Source species: Coeurl (ID 92); family ID 43.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2939, [56] = 3022, [57] = 3106, [58] = 3189 }, mp = { [55] = 0, [56] = 0, [57] = 0, [58] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Blaster: paralysis; Chaotic Eye: silence gaze', notes = { 'Blaster: paralysis. Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.', 'Chaotic Eye: silence gaze. Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = danger[193], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Chaotic Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 582, name = 'Chaotic Eye', level = 32, min_skill = 68, skill_ids = { 653 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sozu Terberry',
            ids    = { 131 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [65] = { acc = 258, eva = 227, agi = 69, int = 70, mnd = 70, chr = 73, dex = 62, def = 246,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 6300 }, mp = { [65] = 6340 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[112],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Tonberrys Avatar',
            ids    = { 133, 199, 335 },
            job    = 'blm/blm',
            levels = {
                [43] = { acc = 154, eva = 131, agi = 44, int = 53, mnd = 38, chr = 40, dex = 44, def = 141,
                         attack_skill = 126 },
                [44] = { acc = 158, eva = 134, agi = 47, int = 54, mnd = 39, chr = 43, dex = 47, def = 145,
                         attack_skill = 129 },
                [45] = { acc = 161, eva = 137, agi = 47, int = 55, mnd = 40, chr = 43, dex = 47, def = 148,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 140, agi = 48, int = 55, mnd = 40, chr = 42, dex = 48, def = 151,
                         attack_skill = 135 },
                [47] = { acc = 168, eva = 143, agi = 49, int = 57, mnd = 41, chr = 45, dex = 49, def = 154,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 146, agi = 50, int = 57, mnd = 42, chr = 45, dex = 50, def = 156,
                         attack_skill = 141 },
                [49] = { acc = 176, eva = 150, agi = 52, int = 58, mnd = 42, chr = 45, dex = 52, def = 160,
                         attack_skill = 144 },
                [50] = { acc = 180, eva = 153, agi = 54, int = 63, mnd = 45, chr = 50, dex = 54, def = 164,
                         attack_skill = 147 },
                [51] = { acc = 186, eva = 158, agi = 56, int = 65, mnd = 47, chr = 50, dex = 56, def = 168,
                         attack_skill = 151 },
                [52] = { acc = 191, eva = 163, agi = 56, int = 65, mnd = 47, chr = 50, dex = 56, def = 173,
                         attack_skill = 156 },
                [53] = { acc = 196, eva = 167, agi = 57, int = 67, mnd = 48, chr = 52, dex = 57, def = 179,
                         attack_skill = 161 },
                [54] = { acc = 202, eva = 173, agi = 58, int = 67, mnd = 48, chr = 52, dex = 58, def = 183,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 177, agi = 58, int = 69, mnd = 49, chr = 52, dex = 58, def = 188,
                         attack_skill = 171 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            aggro  = true,
            detects = { 'sight', 'magic' },
            links  = 12,
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [43] = 1632, [44] = 1708, [45] = 1781, [46] = 1856, [47] = 1932, [48] = 2008, [49] = 2081, [50] = 2192, [51] = 2269, [52] = 2345, [53] = 2421, [54] = 2497, [55] = 2574 }, mp = { [43] = 1182, [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, general_notes = danger[27] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Manipulator',
            ids    = { 171 },
            nm     = true,
            levels = {
                [59] = { acc = 231, eva = 215, agi = 60, int = 47, mnd = 47, chr = 57, dex = 67, def = 233,
                         attack_skill = 191 },
                [60] = { acc = 236, eva = 220, agi = 60, int = 47, mnd = 47, chr = 57, dex = 67, def = 238,
                         attack_skill = 196 },
                [61] = { acc = 242, eva = 225, agi = 63, int = 49, mnd = 49, chr = 59, dex = 70, def = 244,
                         attack_skill = 199 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            magic_dmg = { all = -75 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'paralyze', 'slow', 'elegy', 'blind' },
            drops  = {
                { rate = 1000, item = 12378 },  -- hard shield
                { rate = 240, item = 1165 },  -- doll shard
                { rate = 240, item = 914 },  -- vial of mercury
                { rate = 240, item = 1165 },  -- doll shard
            },
            steal  = { 1268 },  -- doll gizmo
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Doll / Arcana', notes = { 'Source species: Doll (ID 60); family ID 26.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [59] = 10150, [60] = 10150, [61] = 10150 }, mp = { [59] = 0, [60] = 0, [61] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 180 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[152],
                blue = { value = 'Blitzstrahl', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 532, name = 'Blitzstrahl', level = 44, min_skill = 104, skill_ids = { 535 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Maledictor',
            ids    = { 190, 208, 215, 224, 238, 275, 284, 291, 296, 311, 315, 319, 324 },
            job    = 'blm/blm',
            levels = {
                [61] = { acc = 242, eva = 211, agi = 73, int = 73, mnd = 52, chr = 60, dex = 70, def = 225,
                         attack_skill = 199 },
                [62] = { acc = 247, eva = 216, agi = 73, int = 73, mnd = 52, chr = 60, dex = 70, def = 230,
                         attack_skill = 203 },
                [63] = { acc = 252, eva = 220, agi = 73, int = 75, mnd = 52, chr = 60, dex = 70, def = 235,
                         attack_skill = 207 },
                [64] = { acc = 258, eva = 226, agi = 75, int = 75, mnd = 52, chr = 62, dex = 72, def = 240,
                         attack_skill = 210 },
                [65] = { acc = 263, eva = 230, agi = 75, int = 77, mnd = 55, chr = 62, dex = 72, def = 246,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 237, agi = 78, int = 77, mnd = 55, chr = 62, dex = 75, def = 250,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 241, agi = 78, int = 79, mnd = 55, chr = 65, dex = 75, def = 255,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 246, agi = 79, int = 80, mnd = 57, chr = 65, dex = 75, def = 261,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 251, agi = 80, int = 81, mnd = 57, chr = 65, dex = 77, def = 266,
                         attack_skill = 229 },
            },
            spawn_levels = { [190] = { 64, 67 }, [208] = { 64, 67 }, [215] = { 64, 67 }, [224] = { 64, 67 },
                             [238] = { 67, 69 }, [275] = { 61, 64 }, [284] = { 61, 64 }, [291] = { 64, 67 },
                             [296] = { 61, 64 }, [311] = { 61, 64 }, [315] = { 61, 64 }, [319] = { 61, 64 },
                             [324] = { 61, 64 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 100, item = 1429 },  -- black mages testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 1138 },  -- unlit lantern
                { rate = 50, item = 1049 },  -- uggalepih coffer key
                { rate = 50, item = 4803 },  -- scroll of thundaga ii
                { rate = 10, item = 4774 },  -- scroll of thunder iii
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3031, [62] = 3107, [63] = 3184, [64] = 3260, [65] = 3336, [66] = 3412, [67] = 3489, [68] = 3565, [69] = 3641 }, mp = { [61] = 1737, [62] = 1768, [63] = 1799, [64] = 1831, [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[50], danger[51], danger[52], danger[53], danger[54], danger[55], danger[194], danger[58], danger[63], danger[68], danger[73], danger[78], danger[83], danger[88], danger[89], danger[90], danger[93], danger[96], danger[100], danger[101], danger[104] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Pursuer',
            ids    = { 191, 209, 216, 225, 239, 267, 279, 285, 290, 295, 307, 314, 318, 323 },
            job    = 'thf/thf',
            levels = {
                [61] = { acc = 247, eva = 281, agi = 77, int = 63, mnd = 42, chr = 45, dex = 80, def = 230,
                         attack_skill = 199, resist = { gravity = 15 } },
                [62] = { acc = 252, eva = 286, agi = 77, int = 63, mnd = 42, chr = 45, dex = 80, def = 235,
                         attack_skill = 203, resist = { gravity = 15 } },
                [63] = { acc = 258, eva = 291, agi = 77, int = 63, mnd = 42, chr = 45, dex = 82, def = 240,
                         attack_skill = 207, resist = { gravity = 15 } },
                [64] = { acc = 263, eva = 298, agi = 80, int = 64, mnd = 42, chr = 46, dex = 83, def = 246,
                         attack_skill = 210, resist = { gravity = 15 } },
                [65] = { acc = 269, eva = 303, agi = 80, int = 65, mnd = 43, chr = 46, dex = 84, def = 251,
                         attack_skill = 214, resist = { gravity = 15 } },
                [66] = { acc = 274, eva = 309, agi = 82, int = 67, mnd = 44, chr = 47, dex = 85, def = 255,
                         attack_skill = 218, resist = { gravity = 20 } },
                [67] = { acc = 279, eva = 314, agi = 82, int = 67, mnd = 44, chr = 48, dex = 87, def = 261,
                         attack_skill = 221, resist = { gravity = 20 } },
                [68] = { acc = 284, eva = 320, agi = 85, int = 68, mnd = 45, chr = 48, dex = 87, def = 267,
                         attack_skill = 225, resist = { gravity = 20 } },
                [69] = { acc = 290, eva = 325, agi = 85, int = 69, mnd = 45, chr = 48, dex = 89, def = 272,
                         attack_skill = 229, resist = { gravity = 20 } },
            },
            spawn_levels = { [191] = { 64, 67 }, [209] = { 64, 67 }, [216] = { 64, 67 }, [225] = { 64, 67 },
                             [239] = { 67, 69 }, [267] = { 61, 64 }, [279] = { 61, 64 }, [285] = { 61, 64 },
                             [290] = { 64, 67 }, [295] = { 61, 64 }, [307] = { 61, 64 }, [314] = { 61, 64 },
                             [318] = { 61, 64 }, [323] = { 61, 64 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 1049 },  -- uggalepih coffer key
                { rate = 50, item = 1145 },  -- tonberry board
                { rate = 10, item = 2387 },  -- flickering lantern
            },
            steal  = { 1431 },  -- thiefs testimony
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3214, [62] = 3293, [63] = 3373, [64] = 3452, [65] = 3531, [66] = 3610, [67] = 3690, [68] = 3769, [69] = 3848 }, mp = { [61] = 0, [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Stabber',
            ids    = { 192, 210, 217, 226, 240, 268, 286, 292, 297, 320 },
            job    = 'nin/nin',
            levels = {
                [61] = { acc = 244, eva = 246, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 233,
                         attack_skill = 199 },
                [62] = { acc = 249, eva = 251, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 238,
                         attack_skill = 203 },
                [63] = { acc = 254, eva = 256, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 243,
                         attack_skill = 207 },
                [64] = { acc = 260, eva = 263, agi = 80, int = 58, mnd = 42, chr = 50, dex = 77, def = 249,
                         attack_skill = 210 },
                [65] = { acc = 265, eva = 268, agi = 80, int = 59, mnd = 43, chr = 52, dex = 77, def = 254,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 274, agi = 82, int = 59, mnd = 44, chr = 52, dex = 79, def = 259,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 279, agi = 82, int = 61, mnd = 44, chr = 53, dex = 79, def = 264,
                         attack_skill = 221 },
                [68] = { acc = 281, eva = 285, agi = 85, int = 62, mnd = 45, chr = 53, dex = 81, def = 270,
                         attack_skill = 225 },
                [69] = { acc = 287, eva = 290, agi = 85, int = 62, mnd = 45, chr = 54, dex = 82, def = 275,
                         attack_skill = 229 },
            },
            spawn_levels = { [192] = { 64, 67 }, [210] = { 64, 67 }, [217] = { 64, 67 }, [226] = { 64, 67 },
                             [240] = { 67, 69 }, [268] = { 61, 64 }, [286] = { 61, 64 }, [292] = { 64, 67 },
                             [297] = { 61, 64 }, [320] = { 61, 64 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            drops  = {
                { rate = 100, item = 1438 },  -- ninjas testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1049 },  -- uggalepih coffer key
                { rate = 50, item = 1137 },  -- prelate key
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 677 },  -- chunk of white steel
                { rate = 10, item = 17303 },  -- manji shuriken
                { rate = 5, item = 4962 },  -- scroll of tonko ni
                { rate = 1, item = 4956 },  -- scroll of kurayami ni
                { rate = 1, item = 4953 },  -- scroll of hojo ni
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3214, [62] = 3293, [63] = 3373, [64] = 3452, [65] = 3531, [66] = 3610, [67] = 3690, [68] = 3769, [69] = 3848 }, mp = { [61] = 0, [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25-30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Jubaku Ni: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[115], danger[116], danger[117], danger[118], danger[119], danger[120], danger[171], danger[123], danger[128], danger[174], danger[131] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Dismayer',
            ids    = { 193, 195, 211, 218, 227, 241, 287, 293, 298, 312, 321 },
            job    = 'smn/smn',
            levels = {
                [61] = { acc = 236, eva = 208, agi = 67, int = 67, mnd = 67, chr = 70, dex = 59, def = 225,
                         attack_skill = 199 },
                [62] = { acc = 241, eva = 213, agi = 67, int = 67, mnd = 67, chr = 70, dex = 59, def = 230,
                         attack_skill = 203 },
                [63] = { acc = 246, eva = 217, agi = 67, int = 67, mnd = 67, chr = 70, dex = 59, def = 235,
                         attack_skill = 207 },
                [64] = { acc = 252, eva = 223, agi = 69, int = 69, mnd = 69, chr = 73, dex = 60, def = 240,
                         attack_skill = 210 },
                [65] = { acc = 258, eva = 227, agi = 69, int = 70, mnd = 70, chr = 73, dex = 62, def = 246,
                         attack_skill = 214 },
                [66] = { acc = 263, eva = 233, agi = 70, int = 71, mnd = 71, chr = 74, dex = 63, def = 250,
                         attack_skill = 218 },
                [67] = { acc = 267, eva = 238, agi = 72, int = 71, mnd = 71, chr = 75, dex = 63, def = 255,
                         attack_skill = 221 },
                [68] = { acc = 273, eva = 243, agi = 73, int = 74, mnd = 74, chr = 77, dex = 64, def = 261,
                         attack_skill = 225 },
                [69] = { acc = 278, eva = 247, agi = 73, int = 74, mnd = 74, chr = 77, dex = 65, def = 266,
                         attack_skill = 229 },
            },
            spawn_levels = { [193] = { 64, 67 }, [195] = { 64, 67 }, [211] = { 64, 67 }, [218] = { 64, 67 },
                             [227] = { 67, 69 }, [241] = { 67, 69 }, [287] = { 61, 64 }, [293] = { 64, 67 },
                             [298] = { 61, 64 }, [312] = { 61, 64 }, [321] = { 61, 64 } },
            ph_for = { [195] = { 197 } },
            ph_rules = {
                [195] = {
                    [197] = { chance = 10, cooldown_min = 21600, cooldown_max = 21600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 1440 },  -- summoners testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1049 },  -- uggalepih coffer key
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 4901 },  -- water spirit pact
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 2940, [62] = 3015, [63] = 3090, [64] = 3164, [65] = 3239, [66] = 3314, [67] = 3389, [68] = 3463, [69] = 3538 }, mp = { [61] = 1777, [62] = 1808, [63] = 1839, [64] = 1871, [65] = 1902, [66] = 1934, [67] = 1966, [68] = 1997, [69] = 2029 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tonberry Kinq',
            ids    = { 197 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [65] = { acc = 258, eva = 227, agi = 69, int = 70, mnd = 70, chr = 73, dex = 62, def = 246,
                         attack_skill = 214 },
                [66] = { acc = 263, eva = 233, agi = 70, int = 71, mnd = 71, chr = 74, dex = 63, def = 250,
                         attack_skill = 218 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1119 },  -- tonberry coat
                { rate = 150, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 4901 },  -- water spirit pact
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
                { rate = 50, item = 4902 },  -- light spirit pact
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 13,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3100, [66] = 3100 }, mp = { [65] = 3140, [66] = 3140 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'Movement is disabled in the stored spawn setup.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 18000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[112],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Hover Tank',
            ids    = { 206, 207, 214, 221, 230, 233, 234, 246, 247, 269, 270, 276, 280, 289, 300 },
            job    = 'rdm/war',
            levels = {
                [64] = { acc = 256, eva = 237, agi = 56, int = 69, mnd = 66, chr = 64, dex = 68, def = 256,
                         attack_skill = 210 },
                [65] = { acc = 261, eva = 243, agi = 58, int = 70, mnd = 67, chr = 65, dex = 68, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 267, eva = 247, agi = 59, int = 72, mnd = 69, chr = 66, dex = 70, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 252, agi = 59, int = 72, mnd = 69, chr = 67, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 258, agi = 61, int = 73, mnd = 69, chr = 67, dex = 71, def = 277,
                         attack_skill = 225 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            weapon_dmg = { blunt = 50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 100, item = 1430 },  -- red mages testimony
                { rate = 50, item = 1049 },  -- uggalepih coffer key
                { rate = 50, group = {  -- one of
                    { 4774, 3500 },  -- scroll of thunder iii
                    { 4659, 2000 },  -- scroll of shell iv
                    { 4804, 2000 },  -- scroll of thundaga iii
                    { 4775, 1500 },  -- scroll of thunder iv
                    { 4820, 1000 },  -- scroll of burst
                } },
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Magic Pot / Arcana', notes = { 'Source species: Magic Pot (ID 69); family ID 31.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [64] = 3528, [65] = 3609, [66] = 3689, [67] = 3770, [68] = 3850 }, mp = { [64] = 1831, [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Mysterious Light: Weight; Mind Drain: MND down; Flare: Water magic evasion down; Tornado: Ice magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Mysterious Light: Weight. Source targeting: area around the monster.', 'Mind Drain: MND down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Tornado: Ice magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[199], danger[204], danger[50], danger[52], danger[55], danger[194], danger[58], danger[90], danger[93], danger[96], danger[100], danger[101], danger[104] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[105] },
                blue = { value = 'Mysterious Light', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 534, name = 'Mysterious Light', level = 40, min_skill = 92, skill_ids = { 523 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 213, 220, 229, 237, 245 },
            job    = 'blm/rdm',
            levels = {
                [65] = { acc = 260, eva = 238, agi = 65, int = 76, mnd = 61, chr = 62, dex = 66, def = 249,
                         attack_skill = 214 },
                [66] = { acc = 265, eva = 244, agi = 66, int = 77, mnd = 62, chr = 62, dex = 67, def = 253,
                         attack_skill = 218 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65, dex = 69, def = 258,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65, dex = 69, def = 263,
                         attack_skill = 225 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3400, [66] = 3477, [67] = 3555, [68] = 3632 }, mp = { [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fire weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flare: Water magic evasion down', notes = { 'Flare: Water magic evasion down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[50] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[105] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Iron Maiden',
            ids    = { 222, 223, 231, 232, 235, 236, 243, 244, 283, 301, 310, 316, 317, 325 },
            levels = {
                [64] = { acc = 258, eva = 241, agi = 64, int = 50, mnd = 50, chr = 60, dex = 72, def = 260,
                         attack_skill = 210 },
                [65] = { acc = 263, eva = 246, agi = 65, int = 52, mnd = 52, chr = 62, dex = 72, def = 265,
                         attack_skill = 214 },
                [66] = { acc = 269, eva = 251, agi = 67, int = 52, mnd = 52, chr = 63, dex = 75, def = 269,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 256, agi = 67, int = 53, mnd = 53, chr = 63, dex = 75, def = 275,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 262, agi = 68, int = 53, mnd = 53, chr = 64, dex = 75, def = 280,
                         attack_skill = 225 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 10, item = 1049 },  -- uggalepih coffer key
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Doll / Arcana', notes = { 'Source species: Doll (ID 60); family ID 26.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [64] = 3690, [65] = 3774, [66] = 3857, [67] = 3941, [68] = 4024 }, mp = { [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[152],
                blue = { value = 'Blitzstrahl', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 532, name = 'Blitzstrahl', level = 44, min_skill = 104, skill_ids = { 535 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flauros',
            ids    = { 257 },
            nm     = true,
            levels = {
                [59] = { acc = 231, eva = 216, agi = 63, int = 51, mnd = 44, chr = 53, dex = 67, def = 230,
                         attack_skill = 191 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 51, mnd = 44, chr = 53, dex = 67, def = 235,
                         attack_skill = 196 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 53, mnd = 46, chr = 55, dex = 70, def = 240,
                         attack_skill = 199 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 1282 },  -- flauros whisker
                { rate = 150, item = 1591 },  -- high-quality coeurl hide
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 863 },  -- coeurl hide
                { rate = 50, item = 927 },  -- coeurl whisker
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Coeurl / Beast', notes = { 'Source species: Coeurl (ID 92); family ID 43.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [59] = 6800, [60] = 6800, [61] = 6800 }, mp = { [59] = 0, [60] = 0, [61] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Blaster: paralysis; Chaotic Eye: silence gaze', notes = { 'Blaster: paralysis. Attempts Paralysis. This move does not use the gaze-facing check. Source targeting: single target. Possible effects: Paralysis.', 'Chaotic Eye: silence gaze. Attempts Silence when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Silence. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = danger[193], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[27] },
                blue = { value = 'Chaotic Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 582, name = 'Chaotic Eye', level = 32, min_skill = 68, skill_ids = { 653 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Sozu Rogberry',
            ids    = { 271 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [65] = { acc = 269, eva = 303, agi = 80, int = 65, mnd = 43, chr = 46, dex = 84, def = 251,
                         attack_skill = 214, resist = { gravity = 15 } },
                [66] = { acc = 274, eva = 309, agi = 82, int = 67, mnd = 44, chr = 47, dex = 85, def = 255,
                         attack_skill = 218, resist = { gravity = 20 } },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 150, item = 1162 },  -- tonberry lantern
                { rate = 1000, item = 16480 },  -- thiefs knife
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 14,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 6800, [66] = 6800 }, mp = { [65] = 0, [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Flickering Lantern to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[112],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Temple Bee',
            ids    = { 272, 273, 274, 277, 278, 281, 282, 304, 305, 308, 309, 326 },
            levels = {
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53, dex = 63, def = 236,
                         attack_skill = 196 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55, dex = 66, def = 242,
                         attack_skill = 199 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55, dex = 66, def = 247,
                         attack_skill = 203 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55, dex = 66, def = 252,
                         attack_skill = 207 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 50, item = 1049 },  -- uggalepih coffer key
                { rate = 10, item = 925 },  -- giant stinger
            },
            steal  = { 4370 },  -- pot of honey
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 3356, [61] = 3440, [62] = 3523, [63] = 3607 }, mp = { [60] = 0, [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[168],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 302, 303, 306 },
            job    = 'blm/rdm',
            levels = {
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 227,
                         attack_skill = 199 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60, dex = 64, def = 232,
                         attack_skill = 203 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 74, mnd = 59, chr = 60, dex = 64, def = 237,
                         attack_skill = 207 },
                [64] = { acc = 255, eva = 233, agi = 64, int = 75, mnd = 60, chr = 62, dex = 66, def = 243,
                         attack_skill = 210 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 3091, [62] = 3168, [63] = 3246, [64] = 3323 }, mp = { [61] = 1737, [62] = 1768, [63] = 1799, [64] = 1831 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Water weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flood: Thunder magic evasion down; Poison II: Poison', notes = { 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[55], { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[134], level_ranges = { { 43, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[105] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Cleuvarion M Resoaix',
            ids    = { 327 },
            nm     = true,
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 59, dex = 66, def = 254,
                         attack_skill = 207 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = 10,
                       dark_sleep = 10, blind = 4 },
            undead = true,
            immune = { 'silence' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 15,
            info = {
                family = { value = 'Shadow / Undead', notes = { 'Source species: Shadow (ID 415); family ID 177.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 5300 }, mp = { [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Dimensional Death: can crit during Mighty Strikes', notes = { 'Dimensional Death: can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'skill', id = 255, name = 'Dimensional Death', summary = 'Dimensional Death: can crit during Mighty Strikes', notes = danger[154], categories = { 'crit' }, effects = {  }, details = danger[108] } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[27] },
                blue = { value = 'Dimensional Death', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 589, name = 'Dimensional Death', level = 60, min_skill = 172, skill_ids = { 255 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Rompaulion S Citalle',
            ids    = { 328 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [63] = { acc = 256, eva = 290, agi = 74, int = 66, mnd = 45, chr = 49, dex = 78, def = 244,
                         attack_skill = 207 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = 10,
                       dark_sleep = 10, blind = 4 },
            undead = true,
            immune = { 'silence' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 16,
            info = {
                family = { value = 'Shadow / Undead', notes = { 'Source species: Shadow (ID 415); family ID 177.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 5000 }, mp = { [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 150 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[27] },
                blue = { value = 'Dimensional Death', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 589, name = 'Dimensional Death', level = 60, min_skill = 172, skill_ids = { 255 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Beryl-footed Molberry',
            ids    = { 329 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [61] = { acc = 244, eva = 246, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 233,
                         attack_skill = 199 },
                [62] = { acc = 249, eva = 251, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 238,
                         attack_skill = 203 },
                [63] = { acc = 254, eva = 256, agi = 77, int = 57, mnd = 42, chr = 49, dex = 74, def = 243,
                         attack_skill = 207 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 240, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 16899 },  -- hototogisu
                { rate = 10, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 17,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [61] = 6400, [62] = 6400, [63] = 6400 }, mp = { [61] = 0, [62] = 0, [63] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Tonberry Rattle to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Words Of Bane: Curse; Light Of Penance: Bind, Blindness; Lateral Slash: Defense down; Vertical Slash: Accuracy down; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ichi: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Words Of Bane: Curse. Source targeting: single target.', 'Light Of Penance: Bind, Blindness. The gaze effect requires the target to face the monster. Source targeting: single target.', 'Lateral Slash: Defense down. Source targeting: single target.', 'Vertical Slash: Accuracy down. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ichi: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[31], danger[37], danger[42], danger[47], danger[115], danger[116], danger[117], danger[118], danger[119], danger[120], danger[171], danger[128], danger[174], danger[131] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[105] },
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Death from Above',
            ids    = { 330 },
            nm     = true,
            levels = {
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50, dex = 61, def = 220,
                         attack_skill = 181 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52, dex = 61, def = 225,
                         attack_skill = 186 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53, dex = 63, def = 231,
                         attack_skill = 191 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 17980 },  -- hornetneedle
                { rate = 1000, item = 4370 },  -- pot of honey
                { rate = 1000, item = 4370 },  -- pot of honey
                { rate = 150, item = 4508 },  -- serving of royal jelly
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 18,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 4100, [58] = 4100, [59] = 4100 }, mp = { [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 1200; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 78', notes = { 'Base attack delay 78 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Bag Of Bee Larvae to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: Poison; Final Sting: heavy damage', notes = { 'Normal attacks: Poison. These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Final Sting: heavy damage. Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Poison', notes = { 'These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, danger[166] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Habetrot',
            ids    = { 331 },
            nm     = true,
            levels = {
                [57] = { acc = 218, eva = 204, agi = 58, int = 46, mnd = 46, chr = 50, dex = 61, def = 204,
                         attack_skill = 181 },
                [58] = { acc = 223, eva = 209, agi = 59, int = 46, mnd = 46, chr = 52, dex = 61, def = 209,
                         attack_skill = 186 },
                [59] = { acc = 229, eva = 215, agi = 60, int = 47, mnd = 47, chr = 53, dex = 63, def = 214,
                         attack_skill = 191 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 1295 },  -- twincoon
                { rate = 240, item = 1295 },  -- twincoon
                { rate = 150, item = 1295 },  -- twincoon
                { rate = 150, item = 1295 },  -- twincoon
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 19,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Crawler (ID 437); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [57] = 6000, [58] = 6000, [59] = 6000 }, mp = { [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3600; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 15 minutes', notes = { 'Source idle-despawn delay: 15 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: Slow; Sticky Thread: Slow; Poison Breath: poison', notes = { 'Normal attacks: Slow. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Sticky Thread: Slow. Source targeting: cone.', 'Poison Breath: poison. Water breath damage that ignores shadows. On a successful damage result it attempts Poison; Phoenix uses the pre-WotG poison duration. Source targeting: cone. Possible effects: Poison. Random effects may not all happen on the same use.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Slow', notes = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, removals = danger[126] } }, danger[178], danger[182] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Rumble Crawler',
            ids    = { 332 },
            levels = {
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 43, chr = 48, dex = 57, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 43, chr = 48, dex = 58, def = 190,
                         attack_skill = 166 },
                [55] = { acc = 207, eva = 194, agi = 56, int = 43, mnd = 43, chr = 49, dex = 58, def = 194,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 199, agi = 58, int = 44, mnd = 44, chr = 50, dex = 61, def = 200,
                         attack_skill = 176 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
                { rate = 10, item = 4357 },  -- crawler egg
            },
            links  = 10,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Crawler (ID 437); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [53] = 2772, [54] = 2855, [55] = 2939, [56] = 3022 }, mp = { [53] = 0, [54] = 0, [55] = 0, [56] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[184],
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Crimson-toothed Pawberry',
            ids    = { 333 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [70] = { acc = 283, eva = 253, agi = 75, int = 75, mnd = 75, chr = 79, dex = 65, def = 271,
                         attack_skill = 233 },
                [71] = { acc = 290, eva = 257, agi = 75, int = 76, mnd = 76, chr = 79, dex = 68, def = 276,
                         attack_skill = 237 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 240, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
                { rate = 100, item = 4902 },  -- light spirit pact
                { rate = 1000, item = 14062 },  -- carbuncle mitts
                { rate = 10, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 20,
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 18300, [71] = 18300 }, mp = { [70] = 18360, [71] = 18360 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 18000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[170],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sacrificial Goblet',
            ids    = { 336 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [66] = { acc = 269, eva = 231, agi = 67, int = 88, mnd = 63, chr = 67, dex = 75, def = 252,
                         attack_skill = 218 },
                [67] = { acc = 273, eva = 235, agi = 67, int = 90, mnd = 63, chr = 69, dex = 75, def = 257,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 241, agi = 68, int = 91, mnd = 64, chr = 69, dex = 75, def = 262,
                         attack_skill = 225 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 7, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            weapon_dmg = { blunt = 50, hand_to_hand = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 12381 },  -- charging shield
                { rate = 240, item = 954 },  -- magic pot shard
                { rate = 240, item = 954 },  -- magic pot shard
                { rate = 150, item = 914 },  -- vial of mercury
            },
            steal  = { 1269 },  -- mana barrel
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Magic Pot / Arcana', notes = { 'Source species: Magic Pot (ID 69); family ID 31.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 12000, [67] = 12000, [68] = 12000 }, mp = { [66] = 12000, [67] = 12000, [68] = 12000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Uggalepih Whistle to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 5 minutes', notes = { 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Mysterious Light: Weight; Mind Drain: MND down; Flare: Water magic evasion down; Tornado: Ice magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Mysterious Light: Weight. Source targeting: area around the monster.', 'Mind Drain: MND down. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Tornado: Ice magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[199], danger[204], danger[50], danger[52], danger[55], danger[58], danger[90], danger[93], danger[96], danger[100], danger[101], danger[104] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[105] },
                blue = { value = 'Mysterious Light', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 534, name = 'Mysterious Light', level = 40, min_skill = 92, skill_ids = { 523 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Yallery Brown',
            ids    = { 337 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 65, dex = 82, def = 344,
                         attack_skill = 281 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sapling / Plantoid', notes = { 'Source species: Sapling (ID 360); family ID 150.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 7200 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Slumber Powder: Sleep; Sprout Smack: Slow', notes = { 'Slumber Powder: Sleep. Source targeting: area around the monster.', 'Sprout Smack: Slow. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 686, name = 'Slumber Powder', summary = 'Slumber Powder: Sleep', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 687, name = 'Sprout Smack', summary = 'Sprout Smack: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[126] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Sprout Smack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 597, name = 'Sprout Smack', level = 4, min_skill = 0, skill_ids = { 687 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Neith',
            ids    = { 338, 344, 350 },
            nm     = true,
            job    = 'sam/sam',
            levels = {},
            ranks  = { water = -2, light = -1, dark = 4, poison = -2, light_sleep = -1, dark_sleep = 4, blind = 4 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Diremite / Vermin', notes = { 'Source species: Arundimite (ID 441); family ID 187.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Neiths Bobbin',
            ids    = { 339, 340, 341, 342, 343, 345, 346, 347, 348, 349, 351, 352, 353, 354, 355 },
            levels = {},
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Sickle Slash: can crit; Acid Spray: Poison; Spider Web: Slow', notes = { 'Sickle Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Spray: Poison. Source targeting: cone.', 'Spider Web: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 810, name = 'Sickle Slash', summary = 'Sickle Slash: can crit', notes = danger[106], categories = { 'crit' }, effects = {  }, details = danger[108] }, { kind = 'skill', id = 811, name = 'Acid Spray', summary = 'Acid Spray: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } }, { kind = 'skill', id = 812, name = 'Spider Web', summary = 'Spider Web: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[126] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Azure-toothed Clawberry',
            ids    = { 363, 370 },
            nm     = true,
            job    = 'smn/smn',
            levels = {},
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Tonberry / Beastmen', notes = { 'Source species: Tonberry (ID 159); family ID 71.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[170],
                blue = { value = 'Light Of Penance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 634, name = 'Light Of Penance', level = 58, min_skill = 162, skill_ids = { 785 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Clawberrys Elemental',
            ids    = { 364, 365, 366, 371, 372, 373 },
            job    = 'drk/rdm',
            levels = {},
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[27] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Clawberrys Avatar',
            ids    = { 367, 368, 369, 374, 375, 376 },
            job    = 'blm/blm',
            levels = {},
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison Nails: Poison', notes = { 'Poison Nails: Poison. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 907, name = 'Poison Nails', summary = 'Poison Nails: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
