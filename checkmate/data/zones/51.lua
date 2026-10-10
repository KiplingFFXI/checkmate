-- Wajaom Woodlands (zone 51).
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
danger[29] = { 'Intimidate: Slow. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Aqua Ball: STR down. Source targeting: area around the target.', 'Screwdriver: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[30] = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[31] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[32] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[33] = { danger[32] };
danger[34] = { notes = danger[31], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[33] };
danger[35] = { kind = 'skill', id = 449, name = 'Intimidate', summary = 'Intimidate: Slow', notes = danger[30], categories = { 'debuff' }, effects = { 'Slow' }, details = danger[34] };
danger[36] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[37] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[38] = { danger[37] };
danger[39] = { notes = danger[36], unknown = {  }, activation_range = 12.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[38] };
danger[40] = { kind = 'skill', id = 450, name = 'Aqua Ball', summary = 'Aqua Ball: STR down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[39] };
danger[41] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[42] = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[43] = { notes = danger[42], unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[44] = { kind = 'skill', id = 452, name = 'Screwdriver', summary = 'Screwdriver: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[43] };
danger[45] = { danger[35], danger[40], danger[44] };
danger[46] = { value = 'Intimidate: Slow; Aqua Ball: STR down; Screwdriver: can crit', notes = danger[29], entries = danger[45], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[47] = { 'Normal attacks: Plague. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.' };
danger[48] = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' };
danger[49] = { 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[50] = { notes = danger[49], unknown = {  }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[51] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Plague', notes = danger[48], categories = { 'debuff' }, effects = { 'Plague' }, details = danger[50] };
danger[52] = { danger[51] };
danger[53] = { value = 'Normal attacks: Plague', notes = danger[47], entries = danger[52], coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[27] };
danger[54] = { 'Snatch Morsel: Buff removal. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[55] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[56] = { notes = danger[55], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[57] = { kind = 'skill', id = 1700, name = 'Snatch Morsel', summary = 'Snatch Morsel: Buff removal', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[56] };
danger[58] = { danger[57] };
danger[59] = { value = 'Snatch Morsel: Buff removal', notes = danger[54], entries = danger[58], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[60] = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[61] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[62] = { notes = danger[61], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[3] };
danger[63] = { kind = 'skill', id = 247, name = 'Foxfire', summary = 'Foxfire: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[62] };
danger[64] = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' };
danger[65] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[66] = { notes = danger[65], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[67] = { kind = 'skill', id = 248, name = 'Grim Halo', summary = 'Grim Halo: can crit', notes = danger[64], categories = { 'crit' }, effects = {  }, details = danger[66] };
danger[68] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[69] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[70] = { danger[69] };
danger[71] = { notes = danger[68], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[70] };
danger[72] = { kind = 'skill', id = 249, name = 'Netherspikes', summary = 'Netherspikes: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[71] };
danger[73] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[74] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[75] = { danger[74] };
danger[76] = { notes = danger[73], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[75] };
danger[77] = { kind = 'skill', id = 251, name = 'Aegis Schism', summary = 'Aegis Schism: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[76] };
danger[78] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[79] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[80] = { danger[79] };
danger[81] = { notes = danger[78], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[80] };
danger[82] = { kind = 'skill', id = 252, name = 'Dancing Chains', summary = 'Dancing Chains: Drown', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[81] };
danger[83] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[84] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[85] = { danger[84] };
danger[86] = { notes = danger[83], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[85] };
danger[87] = { kind = 'skill', id = 253, name = 'Barbed Crescent', summary = 'Barbed Crescent: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[86] };
danger[88] = { danger[63], danger[67], danger[72], danger[77], danger[82], danger[87] };
danger[89] = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down', notes = danger[60], entries = danger[88], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[90] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[91] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[92] = { notes = danger[90], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[91] };
danger[93] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[92], level_ranges = { { 37, 255 } } };
danger[94] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[95] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[96] = { notes = danger[95], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[97] = { 'Final Sting: heavy damage. Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[98] = { 'Phoenix permits this at 33% HP or lower. Damage uses the HP captured when the move starts and ignores shadows. Source targeting: single target.' };
danger[99] = { kind = 'skill', id = 336, name = 'Final Sting', summary = 'Final Sting: heavy damage', notes = danger[98], categories = { 'other' }, effects = {  }, details = danger[18] };
danger[100] = { danger[99] };
danger[101] = { value = 'Final Sting: heavy damage', notes = danger[97], entries = danger[100], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[102] = { 'Onrush: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Flailing Trunk: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Voracious Trunk: Buff theft. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[103] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[104] = { notes = danger[103], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[105] = { kind = 'skill', id = 1704, name = 'Onrush', summary = 'Onrush: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[104] };
danger[106] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[107] = { notes = danger[106], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[108] = { kind = 'skill', id = 1706, name = 'Flailing Trunk', summary = 'Flailing Trunk: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[107] };
danger[109] = { kind = 'skill', id = 1707, name = 'Voracious Trunk', summary = 'Voracious Trunk: Buff theft', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[56] };
danger[110] = { danger[105], danger[108], danger[109] };
danger[111] = { value = 'Onrush: can crit; Flailing Trunk: can crit; Voracious Trunk: Buff theft', notes = danger[102], entries = danger[110], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[112] = { 'Normal attacks: HP drain. Normal hits drain HP when this Morbol is outside its spawn area. The source checks a 25-yalm distance from its spawn point; current position relative to that point is not established.', 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[113] = { 'Normal hits drain HP when this Morbol is outside its spawn area. The source checks a 25-yalm distance from its spawn point; current position relative to that point is not established.' };
danger[114] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = danger[113], categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } };
danger[115] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[116] = { notes = danger[115], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[70] };
danger[117] = { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[116] };
danger[118] = { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[104] };
danger[119] = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' };
danger[120] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[121] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[122] = { danger[69], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[32], danger[121] };
danger[123] = { notes = danger[120], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[122] };
danger[124] = { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = danger[119], categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = danger[123] };
danger[125] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[126] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[127] = { notes = danger[126], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[128] = { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = danger[125], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[127] };
danger[129] = { danger[114], danger[117], danger[118], danger[124], danger[128] };
danger[130] = { value = 'Normal attacks: HP drain; Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = danger[112], entries = danger[129], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[131] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[132] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[133] = { notes = danger[132], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 4 } } };
danger[134] = { kind = 'skill', id = 1737, name = 'Vorpal Blade', summary = 'Vorpal Blade: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[133] };
danger[135] = { danger[134] };
danger[136] = { value = 'Vorpal Blade: can crit', notes = danger[131], entries = danger[135], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[137] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[138] = { notes = danger[137], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[139] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' };
danger[140] = { notes = danger[139], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } };
danger[141] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[96], level_ranges = { { 50, 255 } } };
danger[142] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[96], level_ranges = { { 54, 255 } } };
danger[143] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[144] = { danger[121] };
danger[145] = { notes = danger[143], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[144] };
danger[146] = { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[145], level_ranges = { { 21, 255 } } };
danger[147] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[148] = { notes = danger[147], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[149] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[96], level_ranges = { { 12, 255 } } };
danger[150] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[151] = { notes = danger[150], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[3] };
danger[152] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[151], level_ranges = { { 45, 255 } } };
danger[153] = { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[96], level_ranges = { { 20, 255 } } };
danger[154] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[155] = { notes = danger[154], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[156] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[155], level_ranges = { { 4, 255 } } };
danger[157] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[158] = { notes = danger[157], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[70] };
danger[159] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[158], level_ranges = { { 7, 255 } } };
danger[160] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[96], level_ranges = { { 41, 255 } } };
danger[161] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[162] = { notes = danger[161], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[163] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[162], level_ranges = { { 56, 255 } } };
danger[164] = { 'Obfuscate: Flash. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[165] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[166] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[167] = { notes = danger[166], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[91] };
danger[168] = { kind = 'skill', id = 1721, name = 'Obfuscate', summary = 'Obfuscate: Flash', notes = danger[165], categories = { 'debuff' }, effects = { 'Flash' }, details = danger[167] };
danger[169] = { danger[168] };
danger[170] = { value = 'Obfuscate: Flash', notes = danger[164], entries = danger[169], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[171] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Mp Drainkiss: MP drain.', 'Sandspin: Accuracy down.', 'Terror Touch: Attack down.', 'Digest: HP drain.', 'Filamented Hold: Slow.', 'Radiant Breath: Silence, Slow.', 'Sound Blast: INT down.', 'Yawn: Sleep.', 'Voracious Trunk: Buff theft.', 'Pinecone Bomb: Sleep.', 'Sprout Smack: Slow.', 'Soporific: Sleep.', 'Wild Oats: VIT down.', 'Bad Breath: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Awful Eye: STR down.', 'Infrasonics: Evasion down.', 'Sandspray: Blindness.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[172] = { 'Base casting range: 3 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'This Blue Magic effect bypasses Utsusemi and Blink.' };
danger[173] = { notes = danger[172], unknown = {  }, activation_range = 3.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[174] = { kind = 'spell', id = 521, name = 'Mp Drainkiss', summary = 'Mp Drainkiss: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[173], level_ranges = { { 42, 255 } } };
danger[175] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 5 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[176] = { notes = danger[175], unknown = {  }, activation_range = 5.0, shape = 'area around the target', effect_radius = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[85] };
danger[177] = { kind = 'spell', id = 524, name = 'Sandspin', summary = 'Sandspin: Accuracy down', notes = {  }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[176], level_ranges = { { 1, 255 } } };
danger[178] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[179] = { notes = danger[178], unknown = {  }, activation_range = 5.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[8] };
danger[180] = { kind = 'spell', id = 539, name = 'Terror Touch', summary = 'Terror Touch: Attack down', notes = {  }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[179], level_ranges = { { 40, 255 } } };
danger[181] = { kind = 'spell', id = 542, name = 'Digest', summary = 'Digest: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[173], level_ranges = { { 36, 255 } } };
danger[182] = { 'Base casting range: 8 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[183] = { notes = danger[182], unknown = {  }, activation_range = 8.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[33] };
danger[184] = { kind = 'spell', id = 548, name = 'Filamented Hold', summary = 'Filamented Hold: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[183], level_ranges = { { 52, 255 } } };
danger[185] = { 'Base casting range: 12 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[186] = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[32] };
danger[187] = { notes = danger[185], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[186] };
danger[188] = { kind = 'spell', id = 565, name = 'Radiant Breath', summary = 'Radiant Breath: Silence, Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Silence', 'Slow' }, details = danger[187], level_ranges = { { 54, 255 } } };
danger[189] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 5 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[190] = { notes = danger[189], unknown = {  }, activation_range = 5.0, shape = 'area around the target', effect_radius = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[23] };
danger[191] = { kind = 'spell', id = 572, name = 'Sound Blast', summary = 'Sound Blast: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[190], level_ranges = { { 32, 255 } } };
danger[192] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 5 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[193] = { notes = danger[192], unknown = {  }, activation_range = 5.0, shape = 'area around the target', effect_radius = 5.0, shadows = { { mode = 'wipe' } } };
danger[194] = { kind = 'spell', id = 576, name = 'Yawn', summary = 'Yawn: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[193], level_ranges = { { 64, 255 } } };
danger[195] = { 'Base casting range: 10 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[196] = { notes = danger[195], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[197] = { kind = 'spell', id = 579, name = 'Voracious Trunk', summary = 'Voracious Trunk: Buff theft', notes = {  }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[196], level_ranges = { { 64, 255 } } };
danger[198] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[199] = { notes = danger[198], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[200] = { kind = 'spell', id = 596, name = 'Pinecone Bomb', summary = 'Pinecone Bomb: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[199], level_ranges = { { 36, 255 } } };
danger[201] = { 'Base casting range: 3 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[202] = { notes = danger[201], unknown = {  }, activation_range = 3.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[33] };
danger[203] = { kind = 'spell', id = 597, name = 'Sprout Smack', summary = 'Sprout Smack: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[202], level_ranges = { { 4, 255 } } };
danger[204] = { kind = 'spell', id = 598, name = 'Soporific', summary = 'Soporific: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[193], level_ranges = { { 24, 255 } } };
danger[205] = { 'Base casting range: 12 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[206] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[207] = { danger[206] };
danger[208] = { notes = danger[205], unknown = {  }, activation_range = 12.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[207] };
danger[209] = { kind = 'spell', id = 603, name = 'Wild Oats', summary = 'Wild Oats: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[208], level_ranges = { { 4, 255 } } };
danger[210] = { 'Base casting range: 12 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[211] = { notes = danger[210], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[122] };
danger[212] = { kind = 'spell', id = 604, name = 'Bad Breath', summary = 'Bad Breath: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = danger[211], level_ranges = { { 61, 255 } } };
danger[213] = { 'Base casting range: 8 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[214] = { notes = danger[213], unknown = {  }, activation_range = 8.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[38] };
danger[215] = { kind = 'spell', id = 606, name = 'Awful Eye', summary = 'Awful Eye: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[214], level_ranges = { { 46, 255 } } };
danger[216] = { 'Base casting range: 3 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[217] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[218] = { danger[217] };
danger[219] = { notes = danger[216], unknown = {  }, activation_range = 3.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = danger[218] };
danger[220] = { kind = 'spell', id = 610, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[219], level_ranges = { { 65, 255 } } };
danger[221] = { 'Base casting range: 5 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: front cone, 5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[222] = { notes = danger[221], unknown = {  }, activation_range = 5.0, shape = 'front cone', cone_length = 5.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[223] = { kind = 'spell', id = 621, name = 'Sandspray', summary = 'Sandspray: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[222], level_ranges = { { 66, 255 } } };
danger[224] = { danger[134], danger[174], danger[177], danger[180], danger[181], danger[184], danger[188], danger[191], danger[194], danger[197], danger[200], danger[203], danger[204], danger[209], danger[212], danger[215], danger[220], danger[223] };
danger[225] = { value = 'Vorpal Blade: can crit; Mp Drainkiss: MP drain; Sandspin: Accuracy down; Terror Touch: Attack down; Digest: HP drain; Filamented Hold: Slow; Radiant Breath: Silence, Slow; Sound Blast: INT down; Yawn: Sleep; Voracious Trunk: Buff theft; Pinecone Bomb: Sleep; Sprout Smack: Slow; Soporific: Sleep; Wild Oats: VIT down; Bad Breath: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight; Awful Eye: STR down; Infrasonics: Evasion down; Sandspray: Blindness', notes = danger[171], entries = danger[224], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[226] = { 'Foul Breath: Disease. Source targeting: cone.', 'Chomp Rush: Slow. Source targeting: single target.', 'Scythe Tail: Stun. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[227] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[228] = { notes = danger[227], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } };
danger[229] = { kind = 'skill', id = 376, name = 'Foul Breath', summary = 'Foul Breath: Disease', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = danger[228] };
danger[230] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[231] = { notes = danger[230], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[33] };
danger[232] = { kind = 'skill', id = 379, name = 'Chomp Rush', summary = 'Chomp Rush: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[231] };
danger[233] = { kind = 'skill', id = 380, name = 'Scythe Tail', summary = 'Scythe Tail: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[4] };
danger[234] = { danger[229], danger[232], danger[233] };
danger[235] = { value = 'Foul Breath: Disease; Chomp Rush: Slow; Scythe Tail: Stun', notes = danger[226], entries = danger[234], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[236] = { 'Drill Branch: Blindness. Source targeting: cone.', 'Pinecone Bomb: Sleep. Source targeting: area around the target.', 'Entangle: Bind. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[237] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[238] = { notes = danger[237], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[239] = { kind = 'skill', id = 328, name = 'Drill Branch', summary = 'Drill Branch: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[238] };
danger[240] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[241] = { notes = danger[240], unknown = {  }, activation_range = 15.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[242] = { kind = 'skill', id = 329, name = 'Pinecone Bomb', summary = 'Pinecone Bomb: Sleep', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[241] };
danger[243] = { kind = 'skill', id = 332, name = 'Entangle', summary = 'Entangle: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[116] };
danger[244] = { danger[239], danger[242], danger[243] };
danger[245] = { value = 'Drill Branch: Blindness; Pinecone Bomb: Sleep; Entangle: Bind', notes = danger[236], entries = danger[244], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[246] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[247] = { notes = danger[246], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } };
danger[248] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[249] = { notes = danger[248], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore' } }, removals = danger[33] };
danger[250] = { kind = 'skill', id = 344, name = 'Sticky Thread', summary = 'Sticky Thread: Slow', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[249] };
danger[251] = { danger[250] };
danger[252] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[253] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[254] = { notes = danger[253], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[255] = { kind = 'skill', id = 1896, name = 'Rock Smash', summary = 'Rock Smash: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[254] };
danger[256] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down, Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[257] = { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[258] = { danger[74], danger[257] };
danger[259] = { notes = danger[256], unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'ignore' } }, removals = danger[258] };
danger[260] = { kind = 'skill', id = 1898, name = 'Enervation', summary = 'Enervation: Defense down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down', 'Magic defense down' }, details = danger[259] };
danger[261] = { danger[255], danger[260] };
danger[262] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down', notes = danger[252], entries = danger[261], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[263] = { kind = 'skill', id = 1743, name = 'Rock Smash', summary = 'Rock Smash: Petrification', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[254] };
danger[264] = { kind = 'skill', id = 1745, name = 'Enervation', summary = 'Enervation: Defense down, Magic defense down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Defense down', 'Magic defense down' }, details = danger[259] };
danger[265] = { danger[263], danger[264] };
danger[266] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down', notes = danger[252], entries = danger[265], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[267] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[268] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[269] = { notes = danger[268], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[270] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[269], level_ranges = { { 46, 255 } } };
danger[271] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[96], level_ranges = { { 10, 255 } } };
danger[272] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[96], level_ranges = { { 20, 255 } } };
danger[273] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[151], level_ranges = { { 37, 255 } } };
danger[274] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[158], level_ranges = { { 20, 255 } } };
danger[275] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[96], level_ranges = { { 56, 255 } } };
danger[276] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[277] = { notes = danger[276], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[38] };
danger[278] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[277], level_ranges = { { 43, 255 } } };
danger[279] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[280] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[281] = { danger[280] };
danger[282] = { notes = danger[279], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[281] };
danger[283] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[282], level_ranges = { { 41, 255 } } };
danger[284] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[285] = { notes = danger[284], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[207] };
danger[286] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[285], level_ranges = { { 35, 255 } } };
danger[287] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[288] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[289] = { danger[288] };
danger[290] = { notes = danger[287], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[289] };
danger[291] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[290], level_ranges = { { 37, 255 } } };
danger[292] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[293] = { notes = danger[292], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[23] };
danger[294] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[293], level_ranges = { { 39, 255 } } };
danger[295] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[296] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[297] = { danger[296] };
danger[298] = { notes = danger[295], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[297] };
danger[299] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[298], level_ranges = { { 31, 255 } } };
danger[300] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[301] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[302] = { danger[301] };
danger[303] = { notes = danger[300], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[302] };
danger[304] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[303], level_ranges = { { 33, 255 } } };
danger[305] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[96], level_ranges = { { 45, 255 } } };
danger[306] = { danger[255], danger[260], danger[270], danger[271], danger[272], danger[273], danger[274], danger[275], danger[278], danger[283], danger[286], danger[291], danger[294], danger[299], danger[304], danger[305] };
danger[307] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[267], entries = danger[306], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[308] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[309] = { notes = danger[308], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[310] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[309], level_ranges = { { 15, 255 } } };
danger[311] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[96], level_ranges = { { 52, 255 } } };
danger[312] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[96], level_ranges = { { 60, 255 } } };
danger[313] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[96], level_ranges = { { 56, 255 } } };
danger[314] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[96], level_ranges = { { 58, 255 } } };
danger[315] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[148], level_ranges = { { 72, 255 } } };
danger[316] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[317] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[318] = { danger[317] };
danger[319] = { notes = danger[316], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[318] };
danger[320] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[319], level_ranges = { { 24, 255 } } };
danger[321] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[322] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[323] = { danger[322] };
danger[324] = { notes = danger[321], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[323] };
danger[325] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[324], level_ranges = { { 22, 255 } } };
danger[326] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[327] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[328] = { danger[327] };
danger[329] = { notes = danger[326], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[328] };
danger[330] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[329], level_ranges = { { 20, 255 } } };
danger[331] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[332] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[333] = { danger[332] };
danger[334] = { notes = danger[331], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[333] };
danger[335] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[334], level_ranges = { { 18, 255 } } };
danger[336] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[337] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[338] = { danger[337] };
danger[339] = { notes = danger[336], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[338] };
danger[340] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[339], level_ranges = { { 16, 255 } } };
danger[341] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[342] = { notes = danger[341], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[80] };
danger[343] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[342], level_ranges = { { 27, 255 } } };
danger[344] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[96], level_ranges = { { 25, 255 } } };
danger[345] = { danger[312], danger[141], danger[311], danger[142], danger[313], danger[314], danger[315], danger[320], danger[325], danger[330], danger[335], danger[340], danger[343], danger[149], danger[344], danger[152], danger[156], danger[159], danger[160], danger[163] };
danger[346] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[347] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[348] = { danger[347] };
danger[349] = { notes = danger[346], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = danger[348] };
danger[350] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[349], level_ranges = { { 60, 255 } } };
danger[351] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[352] = { notes = danger[351], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[33] };
danger[353] = { kind = 'spell', id = 56, name = 'Slow', summary = 'Slow: slow', notes = { 'Possible effects: Slow.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[352], level_ranges = { { 13, 255 } } };
danger[354] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[355] = { notes = danger[354], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[356] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[355], level_ranges = { { 4, 255 } } };
danger[357] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[92], level_ranges = { { 45, 255 } } };
danger[358] = { danger[350], danger[353], danger[356], danger[310], danger[357] };
danger[359] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[360] = { notes = danger[359], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[361] = { kind = 'spell', id = 321, name = 'Katon Ni', summary = 'Katon Ni: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[360], level_ranges = { { 40, 255 } } };
danger[362] = { kind = 'spell', id = 324, name = 'Hyoton Ni', summary = 'Hyoton Ni: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[360], level_ranges = { { 40, 255 } } };
danger[363] = { kind = 'spell', id = 327, name = 'Huton Ni', summary = 'Huton Ni: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[360], level_ranges = { { 40, 255 } } };
danger[364] = { kind = 'spell', id = 330, name = 'Doton Ni', summary = 'Doton Ni: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[360], level_ranges = { { 40, 255 } } };
danger[365] = { kind = 'spell', id = 333, name = 'Raiton Ni', summary = 'Raiton Ni: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[360], level_ranges = { { 40, 255 } } };
danger[366] = { kind = 'spell', id = 336, name = 'Suiton Ni', summary = 'Suiton Ni: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[360], level_ranges = { { 40, 255 } } };
danger[367] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[368] = { notes = danger[367], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[369] = { kind = 'spell', id = 342, name = 'Jubaku Ni', summary = 'Jubaku Ni: Paralysis', notes = {  }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[368], level_ranges = { { 65, 255 } } };
danger[370] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[371] = { notes = danger[370], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[33] };
danger[372] = { kind = 'spell', id = 345, name = 'Hojo Ni', summary = 'Hojo Ni: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[371], level_ranges = { { 48, 255 } } };
danger[373] = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[374] = { notes = danger[373], unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[375] = { kind = 'spell', id = 351, name = 'Dokumori Ni', summary = 'Dokumori Ni: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[374], level_ranges = { { 56, 255 } } };
danger[376] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[377] = { notes = danger[376], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[144] };
danger[378] = { 'Possible effects: Sleep.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' };
danger[379] = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } };
danger[380] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[381] = { danger[134], danger[350], danger[353], danger[356], danger[310], danger[357] };
danger[382] = { value = 'Vorpal Blade: can crit; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = danger[380], entries = danger[381], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[383] = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[384] = { danger[134], danger[312], danger[141], danger[311], danger[142], danger[313], danger[314], danger[315], danger[320], danger[325], danger[330], danger[335], danger[340], danger[343], danger[149], danger[344], danger[152], danger[156], danger[159], danger[160], danger[163] };
danger[385] = { value = 'Vorpal Blade: can crit; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[383], entries = danger[384], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[386] = { 'Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.' };
danger[387] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[388] = { notes = danger[387], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[389] = { 'Poison Pick: Poison. Source targeting: single target.', 'Sound Vacuum Cockatrice: Silence. Source targeting: cone.', 'Sound Blast: INT down. Source targeting: area around the monster.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[390] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[391] = { notes = danger[390], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[392] = { kind = 'skill', id = 407, name = 'Poison Pick', summary = 'Poison Pick: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[391] };
danger[393] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[394] = { notes = danger[393], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[395] = { kind = 'skill', id = 408, name = 'Sound Vacuum Cockatrice', summary = 'Sound Vacuum Cockatrice: Silence', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[394] };
danger[396] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[397] = { notes = danger[396], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[23] };
danger[398] = { kind = 'skill', id = 410, name = 'Sound Blast', summary = 'Sound Blast: INT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[397] };
danger[399] = { kind = 'skill', id = 411, name = 'Baleful Gaze Cockatrice', summary = 'Baleful Gaze: petrification gaze', notes = danger[386], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[388] };
danger[400] = { danger[392], danger[395], danger[398], danger[399] };
danger[401] = { value = 'Poison Pick: Poison; Sound Vacuum Cockatrice: Silence; Sound Blast: INT down; Baleful Gaze: petrification gaze', notes = danger[389], entries = danger[400], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[402] = { 'Bone Crunch: Plague. Source targeting: single target.', 'Awful Eye: STR down. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Heavy Bellow: Stun. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[403] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[404] = { notes = danger[403], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[405] = { kind = 'skill', id = 385, name = 'Bone Crunch', summary = 'Bone Crunch: Plague', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = danger[404] };
danger[406] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[407] = { notes = danger[406], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[38] };
danger[408] = { kind = 'skill', id = 386, name = 'Awful Eye', summary = 'Awful Eye: STR down', notes = danger[30], categories = { 'debuff' }, effects = { 'STR down' }, details = danger[407] };
danger[409] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[410] = { notes = danger[409], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[3] };
danger[411] = { kind = 'skill', id = 387, name = 'Heavy Bellow', summary = 'Heavy Bellow: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[410] };
danger[412] = { danger[405], danger[408], danger[411] };
danger[413] = { value = 'Bone Crunch: Plague; Awful Eye: STR down; Heavy Bellow: Stun', notes = danger[402], entries = danger[412], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[414] = { 'Dispelling Wind: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Deadly Drive: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fang Rush: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dread Shriek: Paralysis. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Tail Crush: Poison, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Radiant Breath: silence and slow. Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[415] = { 'Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[416] = { kind = 'skill', id = 813, name = 'Dispelling Wind', summary = 'Dispelling Wind: Buff removal', notes = danger[415], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[247] };
danger[417] = { kind = 'skill', id = 814, name = 'Deadly Drive', summary = 'Deadly Drive: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[104] };
danger[418] = { kind = 'skill', id = 816, name = 'Fang Rush', summary = 'Fang Rush: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[107] };
danger[419] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[420] = { notes = danger[419], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[421] = { kind = 'skill', id = 817, name = 'Dread Shriek', summary = 'Dread Shriek: Paralysis', notes = danger[165], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[420] };
danger[422] = { kind = 'skill', id = 818, name = 'Tail Crush', summary = 'Tail Crush: Poison, can crit', notes = danger[41], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[391] };
danger[423] = { 'Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.' };
danger[424] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[425] = { notes = danger[424], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[186] };
danger[426] = { kind = 'skill', id = 821, name = 'Radiant Breath', summary = 'Radiant Breath: silence and slow', notes = danger[423], categories = { 'debuff' }, effects = { 'Silence', 'Slow' }, details = danger[425] };
danger[427] = { danger[416], danger[417], danger[418], danger[421], danger[422], danger[426] };
danger[428] = { value = 'Dispelling Wind: Buff removal; Deadly Drive: can crit; Fang Rush: can crit; Dread Shriek: Paralysis; Tail Crush: Poison, can crit; Radiant Breath: silence and slow', notes = danger[414], entries = danger[427], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[429] = { 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[430] = { danger[93] };
danger[431] = { value = 'Flash: Flash', notes = danger[429], entries = danger[430], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[432] = { 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[433] = { danger[117], danger[118], danger[124], danger[128] };
danger[434] = { value = 'Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = danger[432], entries = danger[433], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[435] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Poison II: Poison.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Dispel: removes a buff. Possible effects: Buff removal.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[436] = { kind = 'spell', id = 34, name = 'Diaga II', summary = 'Diaga II: Dia', notes = {  }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[349], level_ranges = { { 55, 255 } } };
danger[437] = { kind = 'spell', id = 58, name = 'Paralyze', summary = 'Paralyze: paralysis', notes = { 'Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[355], level_ranges = { { 6, 255 } } };
danger[438] = { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[309], level_ranges = { { 18, 255 } } };
danger[439] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[155], level_ranges = { { 8, 255 } } };
danger[440] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[158], level_ranges = { { 11, 255 } } };
danger[441] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[96], level_ranges = { { 46, 255 } } };
danger[442] = { kind = 'spell', id = 260, name = 'Dispel', summary = 'Dispel: removes a buff', notes = { 'Possible effects: Buff removal.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[96], level_ranges = { { 32, 255 } } };
danger[443] = { danger[263], danger[264], danger[436], danger[353], danger[437], danger[438], danger[146], danger[270], danger[439], danger[440], danger[441], danger[442] };
danger[444] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Gravity: Weight; Poison II: Poison; Blind: Blindness; Bind: bind; Sleep II: sleep; Dispel: removes a buff', notes = danger[435], entries = danger[443], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[445] = { 'Rock Smash: Petrification. Source targeting: single target.', 'Enervation: Defense down, Magic defense down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[446] = { danger[255], danger[260], danger[93] };
danger[447] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Flash: Flash', notes = danger[445], entries = danger[446], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[448] = { 'Sticky Thread: Slow. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[449] = { value = 'Sticky Thread: Slow', notes = danger[448], entries = danger[251], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[450] = { 'Vitriolic Spray: Burn. Source targeting: cone.', 'Thermal Pulse: Blindness. Source targeting: area around the monster.', 'Vitriolic Shower: Burn. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[451] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[452] = { notes = danger[451], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[318] };
danger[453] = { kind = 'skill', id = 1816, name = 'Vitriolic Spray', summary = 'Vitriolic Spray: Burn', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[452] };
danger[454] = { 'Normal activation range: 12.5 yalms. This is the move selection limit, not its affected area.', 'Area: 12.5 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[455] = { notes = danger[454], unknown = {  }, activation_range = 12.5, shape = 'area around the monster', effect_radius = 12.5, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[456] = { kind = 'skill', id = 1817, name = 'Thermal Pulse', summary = 'Thermal Pulse: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[455] };
danger[457] = { kind = 'skill', id = 1820, name = 'Vitriolic Shower', summary = 'Vitriolic Shower: Burn', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[452] };
danger[458] = { danger[453], danger[456], danger[457] };
danger[459] = { value = 'Vitriolic Spray: Burn; Thermal Pulse: Blindness; Vitriolic Shower: Burn', notes = danger[450], entries = danger[458], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[460] = { 'Circle Of Flames: Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[461] = { kind = 'skill', id = 570, name = 'Circle Of Flames', summary = 'Circle Of Flames: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[377] };
danger[462] = { danger[461] };
danger[463] = { value = 'Circle Of Flames: Weight', notes = danger[460], entries = danger[462], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[464] = { 'Boiling Point: Magic defense down. Source targeting: cone.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[465] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Magic defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[466] = { danger[257] };
danger[467] = { notes = danger[465], unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[466] };
danger[468] = { kind = 'skill', id = 1822, name = 'Boiling Point', summary = 'Boiling Point: Magic defense down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Magic defense down' }, details = danger[467] };
danger[469] = { danger[468], danger[312], danger[141], danger[311], danger[142], danger[313], danger[314], danger[315], danger[320], danger[325], danger[330], danger[335], danger[340], danger[343], danger[149], danger[344], danger[152], danger[156], danger[159], danger[160], danger[163] };
danger[470] = { value = 'Boiling Point: Magic defense down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[464], entries = danger[469], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[471] = { 'Numbing Breath: Paralysis. Random effects may not all happen on the same use. Source targeting: cone.', 'Cold Breath: Bind. Source targeting: cone.', 'Mandible Bite: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Poison Sting: Poison. Source targeting: single target.', 'Death Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wild Rage: Poison. Source targeting: area around the monster.', 'Earth Pounder: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[472] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[473] = { notes = danger[472], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[474] = { kind = 'skill', id = 348, name = 'Numbing Breath', summary = 'Numbing Breath: Paralysis', notes = danger[125], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[473] };
danger[475] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[476] = { notes = danger[475], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[70] };
danger[477] = { kind = 'skill', id = 349, name = 'Cold Breath', summary = 'Cold Breath: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[476] };
danger[478] = { kind = 'skill', id = 350, name = 'Mandible Bite', summary = 'Mandible Bite: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[104] };
danger[479] = { kind = 'skill', id = 351, name = 'Poison Sting', summary = 'Poison Sting: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[391] };
danger[480] = { kind = 'skill', id = 353, name = 'Death Scissors', summary = 'Death Scissors: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[43] };
danger[481] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[482] = { notes = danger[481], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[483] = { kind = 'skill', id = 354, name = 'Wild Rage', summary = 'Wild Rage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[482] };
danger[484] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[485] = { notes = danger[484], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[281] };
danger[486] = { kind = 'skill', id = 355, name = 'Earth Pounder', summary = 'Earth Pounder: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[485] };
danger[487] = { danger[474], danger[477], danger[478], danger[479], danger[480], danger[483], danger[486] };
danger[488] = { value = 'Numbing Breath: Paralysis; Cold Breath: Bind; Mandible Bite: can crit; Poison Sting: Poison; Death Scissors: can crit; Wild Rage: Poison; Earth Pounder: DEX down', notes = danger[471], entries = danger[487], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
danger[489] = { danger[263], danger[264], danger[270], danger[271], danger[272], danger[273], danger[274], danger[275], danger[278], danger[283], danger[286], danger[291], danger[294], danger[299], danger[304], danger[305] };
danger[490] = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = danger[267], entries = danger[489], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] };
danger[491] = { 'Body Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Petro Eyes: Petrification. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Nullsong: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[492] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[493] = { notes = danger[492], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[494] = { kind = 'skill', id = 645, name = 'Body Slam', summary = 'Body Slam: can crit', notes = danger[64], categories = { 'crit' }, effects = {  }, details = danger[493] };
danger[495] = { 'Normal activation range: 9.5 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 9.5 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[496] = { notes = danger[495], unknown = {  }, activation_range = 9.5, shape = 'front cone', cone_length = 9.5, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[497] = { kind = 'skill', id = 648, name = 'Petro Eyes', summary = 'Petro Eyes: Petrification', notes = danger[30], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[496] };
danger[498] = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.' };
danger[499] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' };
danger[500] = { notes = danger[499], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore', per_hit = false } } };
danger[501] = { kind = 'skill', id = 1792, name = 'Nullsong', summary = 'Nullsong: Buff removal', notes = danger[498], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[500] };
danger[502] = { danger[494], danger[497], danger[501] };
danger[503] = { value = 'Body Slam: can crit; Petro Eyes: Petrification; Nullsong: Buff removal', notes = danger[491], entries = danger[502], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Red Kisser', 'Red Osculator' } },
        [2] = { sound = { 'Red Kisser', 'Red Smoocher' } },
        [3] = { sight = { 'Soldier Pephredo', 'Worker Pephredo' } },
        [4] = { sound = { 'Red Kisser', 'Red Osculator', 'Red Smoocher' } },
        [5] = { sight = { 'Grand Marid' } },
        [6] = {
            sight = { 'Mamool Ja Bounder', 'Mamool Ja Mimicker', 'Mamool Ja Savant', 'Mamool Ja Sophist',
                      'Mamool Ja Zenist' },
        },
        [7] = { sound = { 'Aht Urhgan Attercop' } },
        [8] = { sound = { 'Colorful Treant', 'Defoliate Treant', 'Treant Sapling' } },
        [9] = { sound = { 'Carmine Eruca' } },
        [10] = { sight = { 'Woodtroll Dark Knight', 'Woodtroll Monk', 'Woodtroll Ranger' } },
        [11] = { sight = { 'Woodtroll Dark Knight', 'Woodtroll Ranger', 'Woodtroll Warrior' } },
        [12] = { sight = { 'Woodtroll Monk', 'Woodtroll Ranger', 'Woodtroll Warrior' } },
        [13] = { sight = { 'Woodtroll Dark Knight', 'Woodtroll Monk', 'Woodtroll Warrior' } },
        [14] = { sight = { 'Mamool Ja Bounder', 'Mamool Ja Mimicker', 'Mamool Ja Savant', 'Mamool Ja Sophist' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Aht Urhgan Attercop'] = { id = 195, name = 'Spider' },
        ['Carmine Eruca'] = { id = 186, name = 'Crawler' },
        ['Colorful Treant'] = { id = 152, name = 'Treant' },
        ['Defoliate Treant'] = { id = 152, name = 'Treant' },
        ['Grand Marid'] = { id = 47, name = 'Marid' },
        ['Mamool Ja Bounder'] = { id = 60, name = 'Mamool Ja' },
        ['Mamool Ja Mimicker'] = { id = 60, name = 'Mamool Ja' },
        ['Mamool Ja Savant'] = { id = 60, name = 'Mamool Ja' },
        ['Mamool Ja Sophist'] = { id = 60, name = 'Mamool Ja' },
        ['Mamool Ja Zenist'] = { id = 60, name = 'Mamool Ja' },
        ['Red Kisser'] = { id = 5, name = 'Leech' },
        ['Red Osculator'] = { id = 5, name = 'Leech' },
        ['Red Smoocher'] = { id = 5, name = 'Leech' },
        ['Soldier Pephredo'] = { id = 181, name = 'Bee' },
        ['Treant Sapling'] = { id = 150, name = 'Sapling' },
        ['Woodtroll Dark Knight'] = { id = 72, name = 'Troll' },
        ['Woodtroll Monk'] = { id = 72, name = 'Troll' },
        ['Woodtroll Ranger'] = { id = 72, name = 'Troll' },
        ['Woodtroll Warrior'] = { id = 72, name = 'Troll' },
        ['Worker Pephredo'] = { id = 181, name = 'Bee' },
    },
    monsters = {
        {
            name   = 'Red Smoocher',
            ids    = { 1 },
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58, dex = 68, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58, dex = 70, def = 265,
                         attack_skill = 218 },
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
            links  = 1,
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774, [66] = 3857 }, mp = { [65] = 0, [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Azoth Apsaras',
            ids    = { 2 },
            levels = {
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 57, dex = 71, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 57, dex = 72, def = 283,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57, dex = 73, def = 289,
                         attack_skill = 233 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[46],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Red Osculator',
            ids    = { 3 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 59, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 60, mnd = 55, chr = 63, dex = 75, def = 292,
                         attack_skill = 237 },
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
            links  = 2,
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275 }, mp = { [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Kissing Leech',
            ids    = { 4 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 59, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 60, mnd = 55, chr = 63, dex = 75, def = 292,
                         attack_skill = 237 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275 }, mp = { [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
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
            name   = 'Mercurial Makara',
            ids    = { 5 },
            levels = {
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 57, dex = 71, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 57, dex = 72, def = 283,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57, dex = 73, def = 289,
                         attack_skill = 233 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            steal  = { 864 },  -- handful of fish scales
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[46],
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Chigoe',
            ids    = { 6, 7, 8 },
            job    = 'thf/thf',
            levels = {
                [71] = { acc = 306, eva = 352, agi = 92, int = 88, mnd = 40, chr = 40, dex = 100, def = 278,
                         attack_skill = 237 },
                [72] = { acc = 311, eva = 357, agi = 92, int = 88, mnd = 40, chr = 40, dex = 100, def = 283,
                         attack_skill = 241 },
                [73] = { acc = 317, eva = 363, agi = 95, int = 89, mnd = 40, chr = 40, dex = 102, def = 289,
                         attack_skill = 246 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 1202, [72] = 1226, [73] = 1250 }, mp = { [71] = 0, [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 150 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[53],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Chigoe',
            ids    = { 9, 10 },
            job    = 'thf/thf',
            levels = {
                [71] = { acc = 306, eva = 352, agi = 92, int = 88, mnd = 40, chr = 40, dex = 100, def = 278,
                         attack_skill = 237 },
                [72] = { acc = 311, eva = 357, agi = 92, int = 88, mnd = 40, chr = 40, dex = 100, def = 283,
                         attack_skill = 241 },
                [73] = { acc = 317, eva = 363, agi = 95, int = 89, mnd = 40, chr = 40, dex = 102, def = 289,
                         attack_skill = 246 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 1202, [72] = 1226, [73] = 1250 }, mp = { [71] = 0, [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 150 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[53],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Lesser Colibri',
            ids    = { 11, 12, 13, 14, 15, 16, 17, 18, 19, 23, 26, 27, 40, 41, 42, 43, 44, 45, 63, 64, 67, 68, 79,
                       80, 81, 82, 83, 84, 98, 99, 100, 101, 221, 222, 223, 224, 227, 228, 229, 230, 231, 232, 233,
                       234, 235, 236, 237, 238, 239, 240 },
            job    = 'rdm/rdm',
            levels = {
                [63] = { acc = 245, eva = 243, agi = 52, int = 78, mnd = 78, chr = 72, dex = 57, def = 238,
                         attack_skill = 207 },
                [64] = { acc = 251, eva = 247, agi = 52, int = 79, mnd = 79, chr = 73, dex = 58, def = 243,
                         attack_skill = 210 },
                [65] = { acc = 256, eva = 253, agi = 55, int = 80, mnd = 80, chr = 74, dex = 59, def = 249,
                         attack_skill = 214 },
            },
            spawn_levels = { [221] = { 64, 65 }, [222] = { 64, 65 }, [223] = { 64, 65 }, [224] = { 64, 65 },
                             [227] = { 64, 65 }, [228] = { 64, 65 }, [229] = { 64, 65 }, [230] = { 64, 65 },
                             [231] = { 64, 65 }, [232] = { 64, 65 }, [233] = { 64, 65 }, [234] = { 64, 65 },
                             [235] = { 64, 65 }, [236] = { 64, 65 }, [237] = { 64, 65 }, [238] = { 64, 65 },
                             [239] = { 64, 65 }, [240] = { 64, 65 } },
            ph_for = { [84] = { 85 } },
            ph_rules = {
                [84] = {
                    [85] = { chance = 15, cooldown_min = 1800, cooldown_max = 1800, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 240, item = 2150 },  -- colibri feather
                { rate = 150, item = 2171 },  -- colibri beak
            },
            steal  = { 2150 },  -- colibri feather
            info = {
                family = { value = 'Colibri / Bird', notes = { 'Source species: Colibri (ID 179); family ID 80.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3373, [64] = 3452, [65] = 3531 }, mp = { [63] = 904, [64] = 920, [65] = 936 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[59],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fomor Thief',
            ids    = { 20, 46, 48 },
            job    = 'thf/thf',
            levels = {
                [63] = { acc = 256, eva = 288, agi = 70, int = 66, mnd = 45, chr = 49, dex = 78, def = 242,
                         attack_skill = 207 },
                [64] = { acc = 261, eva = 294, agi = 73, int = 68, mnd = 46, chr = 50, dex = 79, def = 248,
                         attack_skill = 210 },
                [65] = { acc = 267, eva = 299, agi = 73, int = 68, mnd = 46, chr = 50, dex = 80, def = 253,
                         attack_skill = 214 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3373, [64] = 3452, [65] = 3531 }, mp = { [63] = 0, [64] = 0, [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[89],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Beastmaster WW BT',
            ids    = { 21, 52 },
            job    = 'bst/bst',
            levels = {
                [63] = { acc = 250, eva = 228, agi = 49, int = 55, mnd = 55, chr = 82, dex = 66, def = 242,
                         attack_skill = 207 },
                [64] = { acc = 256, eva = 234, agi = 50, int = 56, mnd = 56, chr = 83, dex = 68, def = 248,
                         attack_skill = 210 },
                [65] = { acc = 261, eva = 240, agi = 52, int = 58, mnd = 58, chr = 84, dex = 68, def = 253,
                         attack_skill = 214 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3514, [64] = 3596, [65] = 3678 }, mp = { [63] = 0, [64] = 0, [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[89],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomors Bats',
            ids    = { 22, 53 },
            levels = {
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52, dex = 61, def = 224,
                         attack_skill = 186 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53, dex = 63, def = 230,
                         attack_skill = 191 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53, dex = 63, def = 235,
                         attack_skill = 196 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [58] = 956, [59] = 981, [60] = 1006 }, mp = { [58] = 0, [59] = 0, [60] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Sonic Boom: Attack down; Slipstream: Accuracy down', notes = { 'Sonic Boom: Attack down. Source targeting: area around the target.', 'Slipstream: Accuracy down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 393, name = 'Sonic Boom', summary = 'Sonic Boom: Attack down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[8] } }, { kind = 'skill', id = 1157, name = 'Slipstream', summary = 'Slipstream: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: 7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'area around the monster', effect_radius = 7.0, shadows = { { mode = 'ignore' } }, removals = danger[85] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Jet Stream', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 569, name = 'Jet Stream', level = 38, min_skill = 86, skill_ids = { 395 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fomor Paladin WW BT',
            ids    = { 24, 47, 49 },
            job    = 'pld/pld',
            levels = {
                [63] = { acc = 244, eva = 226, agi = 45, int = 45, mnd = 66, chr = 70, dex = 55, def = 286,
                         attack_skill = 207 },
                [64] = { acc = 250, eva = 232, agi = 46, int = 46, mnd = 68, chr = 72, dex = 56, def = 291,
                         attack_skill = 210 },
                [65] = { acc = 256, eva = 237, agi = 46, int = 46, mnd = 68, chr = 72, dex = 58, def = 297,
                         attack_skill = 214 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3514, [64] = 3596, [65] = 3678 }, mp = { [63] = 1799, [64] = 1831, [65] = 1862 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Flash: Flash', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[63], danger[67], danger[72], danger[77], danger[82], danger[87], danger[93] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Fomor Bard WW BT',
            ids    = { 25, 50, 51 },
            job    = 'brd/brd',
            levels = {
                [63] = { acc = 247, eva = 221, agi = 49, int = 60, mnd = 60, chr = 74, dex = 60, def = 242,
                         attack_skill = 207 },
                [64] = { acc = 253, eva = 226, agi = 50, int = 62, mnd = 62, chr = 77, dex = 62, def = 248,
                         attack_skill = 210 },
                [65] = { acc = 258, eva = 232, agi = 52, int = 62, mnd = 62, chr = 77, dex = 62, def = 253,
                         attack_skill = 214 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3373, [64] = 3452, [65] = 3531 }, mp = { [63] = 0, [64] = 0, [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Foe Requiem V: Requiem; Horde Lullaby: Sleep; Carnage Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Foe Requiem V: Requiem.', 'Horde Lullaby: Sleep.', 'Carnage Elegy: Elegy.', 'Magic Finale: Buff removal.', 'Foe Lullaby: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[63], danger[67], danger[72], danger[77], danger[82], danger[87], { kind = 'spell', id = 372, name = 'Foe Requiem V', summary = 'Foe Requiem V: Requiem', notes = {  }, categories = { 'debuff' }, effects = { 'Requiem' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 57, 66 } } }, { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 422, name = 'Carnage Elegy', summary = 'Carnage Elegy: Elegy', notes = {  }, categories = { 'debuff' }, effects = { 'Elegy' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 59, 255 } } }, { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = {  }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[96], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[96], level_ranges = { { 16, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Soldier Pephredo',
            ids    = { 28, 54, 57, 104, 142, 154, 157, 160, 244, 247, 286 },
            levels = {
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56, dex = 68, def = 258,
                         attack_skill = 210 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58, dex = 68, def = 263,
                         attack_skill = 214 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58, dex = 70, def = 267,
                         attack_skill = 218 },
            },
            spawn_levels = { [28] = { 64, 65 }, [54] = { 64, 65 }, [57] = { 64, 65 }, [104] = { 65, 65 },
                             [142] = { 64, 65 }, [154] = { 64, 65 }, [157] = { 64, 65 }, [160] = { 64, 65 } },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 2164 },  -- pephredo hive chip
                { rate = 100, item = 5562 },  -- pot of white honey
                { rate = 50, item = 925 },  -- giant stinger
                { rate = 10, item = 4508 },  -- serving of royal jelly
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [64] = 3690, [65] = 3774, [66] = 3857 }, mp = { [64] = 0, [65] = 0, [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[101],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Worker Pephredo',
            ids    = { 29, 30, 31, 55, 56, 58, 59, 105, 106, 107, 143, 144, 145, 155, 156, 158, 159, 161, 162, 245,
                       246, 248, 249, 287, 288, 289 },
            levels = {
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55, dex = 66, def = 247,
                         attack_skill = 203 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55, dex = 66, def = 252,
                         attack_skill = 207 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56, dex = 68, def = 258,
                         attack_skill = 210 },
            },
            spawn_levels = { [29] = { 62, 63 }, [30] = { 62, 63 }, [31] = { 62, 63 }, [55] = { 62, 63 },
                             [56] = { 62, 63 }, [58] = { 62, 63 }, [59] = { 62, 63 }, [105] = { 62, 63 },
                             [106] = { 62, 63 }, [107] = { 62, 63 }, [143] = { 63, 64 }, [144] = { 63, 64 },
                             [145] = { 63, 64 }, [155] = { 62, 63 }, [156] = { 62, 63 }, [158] = { 62, 63 },
                             [159] = { 62, 63 }, [161] = { 62, 63 }, [162] = { 62, 63 }, [245] = { 63, 64 },
                             [246] = { 63, 64 }, [248] = { 63, 64 }, [249] = { 63, 64 }, [287] = { 63, 64 },
                             [288] = { 63, 64 }, [289] = { 63, 64 } },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 2164 },  -- pephredo hive chip
                { rate = 100, item = 5562 },  -- pot of white honey
                { rate = 50, item = 925 },  -- giant stinger
                { rate = 10, item = 4508 },  -- serving of royal jelly
            },
            links  = 3,
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3523, [63] = 3607, [64] = 3690 }, mp = { [62] = 0, [63] = 0, [64] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[101],
                blue = { value = 'Pollen', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 549, name = 'Pollen', level = 1, min_skill = 0, skill_ids = { 335 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Marid',
            ids    = { 32, 33, 38, 39, 60, 61, 65, 66 },
            levels = {
                [77] = { acc = 324, eva = 307, agi = 72, int = 65, mnd = 65, chr = 66, dex = 76, def = 398,
                         attack_skill = 266 },
                [78] = { acc = 329, eva = 312, agi = 72, int = 65, mnd = 65, chr = 68, dex = 77, def = 404,
                         attack_skill = 271 },
            },
            ranks  = { ice = -1, wind = -1, earth = 2, thunder = -1, light = -1, dark = -1, paralyze = -1,
                       bind = -1, silence = -1, slow = 2, light_sleep = -1, dark_sleep = -1, blind = -1, stun = -1,
                       gravity = -1 },
            drops  = {
                { rate = 150, item = 2151 },  -- marid hide
                { rate = 50, item = 2166 },  -- lock of marid hair
            },
            steal  = { 2155 },  -- lesser chigoe
            flags  = { scripted_drops = true },
            info = {
                family = { value = 'Marid / Beast', notes = { 'Source species: Marid (ID 99); family ID 47.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4779, [78] = 4863 }, mp = { [77] = 0, [78] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +10%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[111],
                blue = { value = 'Voracious Trunk', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 579, name = 'Voracious Trunk', level = 64, min_skill = 191, skill_ids = { 1707 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Red Kisser',
            ids    = { 34, 35, 36, 69, 70, 148, 149, 150, 151, 152, 153 },
            levels = {
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 59, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61, dex = 73, def = 287,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 60, mnd = 55, chr = 63, dex = 75, def = 292,
                         attack_skill = 237 },
            },
            spawn_levels = { [34] = { 68, 69 }, [35] = { 68, 69 }, [36] = { 68, 69 }, [69] = { 68, 69 },
                             [70] = { 68, 69 }, [148] = { 70, 71 }, [149] = { 70, 71 }, [150] = { 70, 71 },
                             [151] = { 70, 71 }, [152] = { 70, 71 }, [153] = { 70, 71 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275 }, mp = { [68] = 0, [69] = 0, [70] = 0, [71] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[28],
                blue = { value = 'Mp Drainkiss', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 521, name = 'Mp Drainkiss', level = 42, min_skill = 98, skill_ids = { 421 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Grand Marid',
            ids    = { 37, 62 },
            levels = {
                [79] = { acc = 335, eva = 317, agi = 73, int = 66, mnd = 66, chr = 69, dex = 78, def = 411,
                         attack_skill = 276 },
                [80] = { acc = 340, eva = 322, agi = 73, int = 66, mnd = 66, chr = 69, dex = 78, def = 417,
                         attack_skill = 281 },
            },
            ranks  = { ice = -1, wind = -1, earth = 2, thunder = -1, light = -1, dark = -1, paralyze = -1,
                       bind = -1, silence = -1, slow = 2, light_sleep = -1, dark_sleep = -1, blind = -1, stun = -1,
                       gravity = -1 },
            drops  = {
                { rate = 150, item = 2151 },  -- marid hide
                { rate = 50, item = 2166 },  -- lock of marid hair
            },
            steal  = { 2155 },  -- lesser chigoe
            links  = 5,
            flags  = { scripted_drops = true },
            info = {
                family = { value = 'Marid / Beast', notes = { 'Source species: Marid (ID 99); family ID 47.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [79] = 4947, [80] = 5031 }, mp = { [79] = 0, [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +10%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[111],
                blue = { value = 'Voracious Trunk', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 579, name = 'Voracious Trunk', level = 64, min_skill = 191, skill_ids = { 1707 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ameretat',
            ids    = { 71, 72, 73, 91, 92, 95, 103, 108, 116 },
            levels = {
                [66] = { acc = 271, eva = 253, agi = 70, int = 52, mnd = 49, chr = 58, dex = 78, def = 267,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 258, agi = 71, int = 53, mnd = 49, chr = 59, dex = 78, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 280, eva = 263, agi = 71, int = 53, mnd = 50, chr = 60, dex = 79, def = 278,
                         attack_skill = 225 },
            },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857, [67] = 3941, [68] = 4024 }, mp = { [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[130],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wajaom Tiger',
            ids    = { 74, 75, 77, 78, 179, 180, 182, 184, 185, 186, 187, 188, 191, 202, 203, 206, 207, 217, 218,
                       219, 220, 279, 280, 281 },
            levels = {
                [67] = { acc = 273, eva = 258, agi = 71, int = 45, mnd = 53, chr = 59, dex = 75, def = 273,
                         attack_skill = 221 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 45, mnd = 53, chr = 60, dex = 75, def = 278,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 47, mnd = 54, chr = 60, dex = 77, def = 283,
                         attack_skill = 229 },
            },
            spawn_levels = { [74] = { 67, 68 }, [75] = { 67, 68 }, [77] = { 67, 68 }, [78] = { 67, 68 },
                             [179] = { 67, 68 }, [180] = { 67, 68 }, [182] = { 67, 68 }, [184] = { 67, 68 },
                             [185] = { 67, 68 }, [186] = { 67, 68 }, [187] = { 67, 68 }, [188] = { 67, 68 },
                             [191] = { 67, 68 }, [202] = { 67, 68 }, [203] = { 67, 68 }, [206] = { 67, 68 },
                             [207] = { 67, 68 }, [217] = { 67, 68 }, [218] = { 67, 68 }, [219] = { 67, 68 },
                             [220] = { 67, 68 }, [279] = { 68, 69 }, [280] = { 68, 69 }, [281] = { 68, 69 } },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 50, item = 2461 },  -- rusty medal
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Tiger / Beast', notes = { 'Source species: Tiger (ID 114); family ID 53.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [67] = 3941, [68] = 4024, [69] = 4108 }, mp = { [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 68', notes = { 'Source base speed is 68; the ordinary monster default is 40. Animation speed is 68.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Roar: paralysis', notes = { 'Roar: paralysis. Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 270, name = 'Roar', summary = 'Roar: paralysis', notes = { 'Attempts Paralysis on its targets. Source targeting: area around the monster. Possible effects: Paralysis.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Claw Cyclone', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 587, name = 'Claw Cyclone', level = 20, min_skill = 32, skill_ids = { 273 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Zoraal Jas Pkuucha',
            ids    = { 85 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 309, eva = 304, agi = 62, int = 91, mnd = 91, chr = 84, dex = 67, def = 301,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            drops  = {
                { rate = 150, item = 15979 },  -- fowling earring
                { rate = 150, item = 17953 },  -- zoraal jas axe
            },
            steal  = { 2150 },  -- colibri feather
            info = {
                family = { value = 'Colibri / Bird', notes = { 'Source species: Colibri (ID 179); family ID 80.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.' }, hp = { [75] = 8300 }, mp = { [75] = 8300 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Snatch Morsel: Buff removal', notes = { 'Snatch Morsel: Buff removal. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.' }, entries = danger[58], coverage = 'partial', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[27] },
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Percipient Zoraal Ja',
            ids    = { 86 },
            job    = 'bst/war',
            levels = {
                [75] = { acc = 319, eva = 296, agi = 69, int = 63, mnd = 63, chr = 82, dex = 86, def = 315,
                         attack_skill = 256 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { virus = 25, slow = 25 },
            immune = { 'dark_sleep', 'petrify' },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 8300 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Aht Urhgan Attercop',
            ids    = { 87, 88, 89, 90, 93, 94, 96, 97, 109, 110, 117, 118, 119, 120, 123, 124, 125, 126, 128, 129,
                       130, 131, 132, 170, 171, 172, 173, 174, 175, 176, 189, 190, 192 },
            levels = {
                [65] = { acc = 264, eva = 248, agi = 68, int = 56, mnd = 56, chr = 51, dex = 75, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 253, agi = 70, int = 57, mnd = 57, chr = 51, dex = 78, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 258, agi = 71, int = 57, mnd = 57, chr = 51, dex = 78, def = 271,
                         attack_skill = 221 },
            },
            spawn_levels = { [109] = { 66, 67 }, [110] = { 66, 67 }, [117] = { 66, 67 }, [118] = { 66, 67 },
                             [119] = { 66, 67 }, [120] = { 66, 67 }, [123] = { 66, 67 }, [124] = { 66, 67 },
                             [125] = { 66, 67 }, [126] = { 66, 67 }, [128] = { 66, 67 }, [129] = { 66, 67 },
                             [130] = { 66, 67 }, [131] = { 66, 67 }, [132] = { 66, 67 }, [170] = { 66, 67 },
                             [171] = { 66, 67 }, [172] = { 66, 67 }, [173] = { 66, 67 }, [174] = { 66, 67 },
                             [175] = { 66, 67 }, [176] = { 66, 67 }, [189] = { 66, 67 }, [190] = { 66, 67 },
                             [192] = { 66, 67 } },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 150, item = 838 },  -- spider web
                { rate = 50, item = 2462 },  -- frayed arrow
            },
            steal  = { 838 },  -- spider web
            links  = 7,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774, [66] = 3857, [67] = 3941 }, mp = { [65] = 0, [66] = 0, [67] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sickle Slash: can crit; Acid Spray: Poison; Spider Web: Slow', notes = { 'Sickle Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Spray: Poison. Source targeting: cone.', 'Spider Web: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 810, name = 'Sickle Slash', summary = 'Sickle Slash: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[104] }, { kind = 'skill', id = 811, name = 'Acid Spray', summary = 'Acid Spray: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[138] }, { kind = 'skill', id = 812, name = 'Spider Web', summary = 'Spider Web: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[33] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Haunt',
            ids    = { 102, 135, 137 },
            job    = 'war/blm',
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 65, mnd = 51, chr = 63, dex = 68, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 66, mnd = 51, chr = 64, dex = 70, def = 265,
                         attack_skill = 218 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
            },
            steal  = { 825 },  -- square of cotton cloth
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3632, [66] = 3713 }, mp = { [65] = 1862, [66] = 1894 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = '20:00-04:00; Respawn 5 minutes', notes = { 'Source spawn window: 20:00-04:00 Vana\'diel time. The end hour is excluded.', 'The source despawns this monster outside its time window.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 472, name = 'Grave Reel', summary = 'Grave Reel: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } } }, { kind = 'skill', id = 473, name = 'Ectosmash', summary = 'Ectosmash: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 474, name = 'Fear Touch', summary = 'Fear Touch: can crit', notes = danger[41], categories = { 'crit' }, effects = {  }, details = danger[104] }, { kind = 'skill', id = 475, name = 'Terror Touch', summary = 'Terror Touch: Attack down, can crit', notes = danger[41], categories = { 'crit', 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[8] } }, { kind = 'skill', id = 476, name = 'Curse', summary = 'Curse: curse', notes = { 'Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[140] }, { kind = 'skill', id = 477, name = 'Dark Sphere', summary = 'Dark Sphere: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, danger[141], danger[142], danger[146], { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[148], level_ranges = { { 24, 69 } } }, danger[149], { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[96], level_ranges = { { 25, 82 } } }, danger[152], danger[153], danger[156], danger[159], danger[160], danger[163] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Puk WW',
            ids    = { 111, 112, 113, 114, 115, 127, 133, 134, 136, 138, 139, 140, 141, 146, 147, 255, 256, 259,
                       260, 261, 262, 267, 277, 282, 283, 284, 290, 291, 292, 293, 294, 295 },
            levels = {
                [68] = { acc = 278, eva = 267, agi = 79, int = 61, mnd = 57, chr = 57, dex = 75, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 284, eva = 273, agi = 80, int = 62, mnd = 59, chr = 57, dex = 77, def = 282,
                         attack_skill = 229 },
                [70] = { acc = 289, eva = 278, agi = 81, int = 63, mnd = 59, chr = 57, dex = 77, def = 287,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            absorb = { wind = 100 },
            weapon_dmg = { piercing = 12.5 },
            drops  = {
                { rate = 240, item = 2148 },  -- puk wing
                { rate = 100, item = 5569 },  -- puk egg
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            steal  = { 2148 },  -- puk wing
            aggro  = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Puk / Dragon', notes = { 'Source species: Puk (ID 224); family ID 97.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [68] = 4024, [69] = 4108, [70] = 4191 }, mp = { [68] = 0, [69] = 0, [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 56', notes = { 'Source base speed is 56; the ordinary monster default is 40. Animation speed is 56.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Mimicker',
            ids    = { 121, 252, 300 },
            job    = 'blu/blu',
            levels = {
                [72] = { acc = 296, eva = 281, agi = 68, int = 63, mnd = 63, chr = 63, dex = 71, def = 286,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 286, agi = 68, int = 64, mnd = 64, chr = 64, dex = 72, def = 292,
                         attack_skill = 246 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2331 },  -- blue mages testimony
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4087, [73] = 4167 }, mp = { [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +6%; Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[225],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Woodland Runner',
            ids    = { 122, 270, 271, 274, 297, 298 },
            job    = 'thf/thf',
            levels = {
                [71] = { acc = 299, eva = 348, agi = 84, int = 75, mnd = 51, chr = 51, dex = 87, def = 282,
                         attack_skill = 237 },
                [72] = { acc = 304, eva = 353, agi = 84, int = 75, mnd = 51, chr = 51, dex = 87, def = 287,
                         attack_skill = 241 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Raptor / Lizard', notes = { 'Source species: Raptor (ID 315); family ID 129.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 4007, [72] = 4087 }, mp = { [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[235],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Defoliate Treant',
            ids    = { 163, 167, 168, 169, 178, 181, 183, 201, 212, 213, 225, 226 },
            levels = {
                [71] = { acc = 293, eva = 279, agi = 75, int = 55, mnd = 55, chr = 60, dex = 75, def = 355,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 55, mnd = 55, chr = 60, dex = 75, def = 361,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 58, chr = 60, dex = 76, def = 368,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 60, dex = 77, def = 374,
                         attack_skill = 251 },
            },
            spawn_levels = { [163] = { 71, 73 }, [167] = { 71, 73 }, [168] = { 71, 73 }, [169] = { 71, 73 },
                             [178] = { 71, 73 }, [181] = { 71, 73 }, [183] = { 71, 73 }, [201] = { 72, 74 },
                             [212] = { 72, 74 }, [213] = { 72, 74 }, [225] = { 72, 74 }, [226] = { 72, 74 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 923 },  -- dryad root
                { rate = 150, item = 918 },  -- sprig of mistletoe
                { rate = 100, item = 4448 },  -- puffball
                { rate = 50, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3000 },  -- mahogany log
                    { 702, 1500 },  -- ebony log
                    { 703, 1000 },  -- petrified log
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
            info = {
                family = { value = 'Treant / Plantoid', notes = { 'Source species: Treant (ID 366); family ID 152.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 4275, [72] = 4359, [73] = 4443, [74] = 4527 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +5%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[245],
                blue = { value = 'Pinecone Bomb', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 596, name = 'Pinecone Bomb', level = 36, min_skill = 80, skill_ids = { 329 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Treant Sapling WW BT',
            ids    = { 164, 165, 166, 200, 204, 205, 210, 211, 214, 215, 216 },
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 52, chr = 55, dex = 70, def = 269,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 55, dex = 71, def = 275,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 57, dex = 71, def = 280,
                         attack_skill = 225 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
                { rate = 10, item = 575 },  -- bag of grain seeds
            },
            links  = 8,
            info = {
                family = { value = 'Sapling / Plantoid', notes = { 'Source species: Sapling (ID 360); family ID 150.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857, [67] = 3941, [68] = 4024 }, mp = { [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Slumber Powder: Sleep; Sprout Smack: Slow', notes = { 'Slumber Powder: Sleep. Source targeting: area around the monster.', 'Sprout Smack: Slow. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 686, name = 'Slumber Powder', summary = 'Slumber Powder: Sleep', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[247] }, { kind = 'skill', id = 687, name = 'Sprout Smack', summary = 'Sprout Smack: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[33] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Sprout Smack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 597, name = 'Sprout Smack', level = 4, min_skill = 0, skill_ids = { 687 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Colorful Treant',
            ids    = { 177, 209 },
            levels = {
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 60, dex = 77, def = 374,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 62, dex = 77, def = 380,
                         attack_skill = 256 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
            info = {
                family = { value = 'Treant / Plantoid', notes = { 'Source species: Treant (ID 366); family ID 152.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [74] = 4527, [75] = 4611 }, mp = { [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +5%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[245],
                blue = { value = 'Pinecone Bomb', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 596, name = 'Pinecone Bomb', level = 36, min_skill = 80, skill_ids = { 329 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Carmine Eruca',
            ids    = { 193, 194, 195 },
            levels = {
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 55, chr = 61, dex = 73, def = 269,
                         attack_skill = 233 },
            },
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
            links  = 9,
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Eruca (ID 439); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4191 }, mp = { [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sticky Thread: Slow', notes = { 'Sticky Thread: Slow. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A helper used by the monster could not be read: xi.data.element.getWeatherElement.' }, entries = danger[251], coverage = 'partial', incomplete = true, reasons = { 'A helper used by the monster could not be read: xi.data.element.getWeatherElement.' }, general_notes = danger[27] },
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A helper used by the monster could not be read: xi.data.element.getWeatherElement.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Woodtroll Warrior',
            ids    = { 196 },
            levels = {
                [72] = { acc = 301, eva = 283, agi = 72, int = 52, mnd = 60, chr = 63, dex = 80, def = 302,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 288, agi = 72, int = 54, mnd = 62, chr = 64, dex = 80, def = 309,
                         attack_skill = 246 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 6538, [73] = 6664 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[262],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Woodtroll Monk',
            ids    = { 197 },
            job    = 'mnk/mnk',
            levels = {
                [72] = { acc = 303, eva = 280, agi = 52, int = 48, mnd = 72, chr = 63, dex = 84, def = 302,
                         attack_skill = 241 },
                [73] = { acc = 309, eva = 286, agi = 54, int = 48, mnd = 74, chr = 64, dex = 86, def = 308,
                         attack_skill = 246 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 6972, [73] = 7099 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Woodtroll Dark Knight',
            ids    = { 198 },
            job    = 'drk/drk',
            levels = {
                [72] = { acc = 301, eva = 279, agi = 64, int = 72, mnd = 56, chr = 51, dex = 80, def = 296,
                         attack_skill = 241 },
                [73] = { acc = 306, eva = 285, agi = 66, int = 72, mnd = 56, chr = 52, dex = 80, def = 302,
                         attack_skill = 246 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 20 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Heavy Troll (ID 486); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 6379, [73] = 6502 }, mp = { [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[307],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Woodtroll Ranger',
            ids    = { 199 },
            job    = 'rng/rng',
            levels = {
                [72] = { acc = 345, eva = 267, agi = 84, int = 60, mnd = 72, chr = 63, dex = 72, def = 292,
                         attack_skill = 241 },
                [73] = { acc = 351, eva = 271, agi = 85, int = 60, mnd = 74, chr = 64, dex = 74, def = 299,
                         attack_skill = 246 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
            info = {
                family = { value = 'Troll / Beastmen', notes = { 'Source species: Light Troll (ID 485); family ID 72.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 5968, [73] = 6087 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 230', notes = { 'Base attack delay 230 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 241, 242, 257, 285, 301, 302 },
            job    = 'blm/rdm',
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70, dex = 75, def = 300,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4175 }, mp = { [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Wind weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence: silence; Tornado: Ice magic evasion down; Gravity: Weight', notes = { 'Silence: silence. Possible effects: Silence.', 'Tornado: Ice magic evasion down.', 'Gravity: Weight.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[310], danger[311], danger[146] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[94] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra',
            ids    = { 243 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 331, agi = 91, int = 75, mnd = 57, chr = 74, dex = 87, def = 630,
                         attack_skill = 281 },
            },
            ranks  = { fire = 9, ice = 9, wind = 9, earth = 6, thunder = 6, water = 6, light = 6, dark = 6,
                       paralyze = 9, bind = 9, silence = 9, slow = 6, poison = 6, light_sleep = 6, dark_sleep = 6,
                       blind = 6, stun = 6, gravity = 9 },
            magic_dmg = { all = -25 },
            weapon_dmg = { piercing = -50, blunt = -50, hand_to_hand = -50 },
            weapon_guard = { ranged = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'paralyze', 'petrify', 'terror', 'plague',
                       'curse' },
            drops  = {
                { rate = 1000, item = 2172 },  -- hydra scale
                { rate = 150, item = 2172 },  -- hydra scale
                { rate = 1000, item = 5564 },  -- chunk of hydra meat
                { rate = 1000, item = 2158 },  -- hydra fang
                { rate = 1000, item = 5564 },  -- chunk of hydra meat
                { rate = 150, item = 2158 },  -- hydra fang
                { rate = 150, item = 15530 },  -- berserkers torque
                { rate = 150, item = 17952 },  -- sirius axe
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Hydra / Dragon', notes = { 'Source species: Hydra (ID 222); family ID 96.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 75000 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 20000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 15', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                fight = { value = 'Conditional draw-in', notes = { 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted choice table has conflicting or unreadable definitions.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted choice table has conflicting or unreadable definitions.' }, general_notes = danger[27] },
                blue = { value = 'Unknown', notes = { 'A scripted choice table has conflicting or unreadable definitions.' }, incomplete = true },
            },
        },
        {
            name   = 'Mamool Ja Sophist',
            ids    = { 250, 275, 296 },
            job    = 'blm/blm',
            levels = {
                [72] = { acc = 302, eva = 265, agi = 80, int = 87, mnd = 63, chr = 67, dex = 83, def = 282,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 269, agi = 80, int = 89, mnd = 64, chr = 70, dex = 84, def = 289,
                         attack_skill = 246 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3871, [73] = 3948 }, mp = { [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +6%; Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = danger[345], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Mamool Ja Bounder',
            ids    = { 251, 276, 299 },
            job    = 'thf/thf',
            levels = {
                [72] = { acc = 308, eva = 353, agi = 84, int = 75, mnd = 51, chr = 51, dex = 95, def = 288,
                         attack_skill = 241 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 76, mnd = 52, chr = 52, dex = 97, def = 295,
                         attack_skill = 246 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 100, item = 2331 },  -- blue mages testimony
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4087, [73] = 4167 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +6%; Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Savant',
            ids    = { 253, 273 },
            job    = 'whm/whm',
            levels = {
                [72] = { acc = 292, eva = 259, agi = 68, int = 63, mnd = 87, chr = 75, dex = 63, def = 288,
                         attack_skill = 241 },
                [73] = { acc = 299, eva = 263, agi = 68, int = 64, mnd = 89, chr = 76, dex = 66, def = 295,
                         attack_skill = 246 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3979, [73] = 4058 }, mp = { [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +6%; Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = danger[358], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Great Ameretat',
            ids    = { 254, 258, 263, 264, 265, 268, 269, 278 },
            levels = {
                [73] = { acc = 308, eva = 290, agi = 76, int = 58, mnd = 54, chr = 64, dex = 84, def = 305,
                         attack_skill = 246 },
                [74] = { acc = 313, eva = 295, agi = 77, int = 58, mnd = 54, chr = 64, dex = 85, def = 310,
                         attack_skill = 251 },
            },
            ph_for = { [265] = { 266 } },
            ph_rules = {
                [265] = {
                    [266] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [73] = 4443, [74] = 4527 }, mp = { [73] = 0, [74] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[130],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Jaded Jody',
            ids    = { 266 },
            nm     = true,
            levels = {
                [80] = { acc = 346, eva = 327, agi = 82, int = 61, mnd = 57, chr = 69, dex = 91, def = 341,
                         attack_skill = 281 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 18741 },  -- scogans knuckles
                { rate = 100, item = 15613 },  -- jet seraweels
                { rate = 100, item = 2307 },  -- vial of jodys acid
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 14000 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[130],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Zenist',
            ids    = { 272 },
            job    = 'nin/nin',
            levels = {
                [72] = { acc = 304, eva = 305, agi = 84, int = 67, mnd = 51, chr = 55, dex = 87, def = 292,
                         attack_skill = 241 },
                [73] = { acc = 311, eva = 311, agi = 86, int = 70, mnd = 52, chr = 58, dex = 90, def = 298,
                         attack_skill = 246 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 14,
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Warrior (ID 135); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4087, [73] = 4167 }, mp = { [72] = 0, [73] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +6%; Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Vorpal Blade: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Kurayami Ni: Blindness; Dokumori Ni: Poison', notes = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Kurayami Ni: Blindness.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[134], danger[361], danger[362], danger[363], danger[364], danger[365], danger[366], danger[369], danger[372], { kind = 'spell', id = 348, name = 'Kurayami Ni', summary = 'Kurayami Ni: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } }, level_ranges = { { 44, 72 } } }, danger[375] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dark Rider',
            ids    = { 309 },
            nm     = true,
            job    = 'drk/bst',
            levels = {
                [95] = { acc = 444, eva = 399, agi = 82, int = 91, mnd = 70, chr = 81, dex = 96, def = 401,
                         attack_skill = 376 },
            },
            ranks  = { fire = 5, ice = 7, wind = 5, earth = 7, thunder = 5, water = 7, light = 4, dark = 11,
                       paralyze = 7, bind = 7, silence = 5, slow = 7, poison = 7, light_sleep = 4, dark_sleep = 11,
                       blind = 11, stun = 5, gravity = 5 },
            weapon_dmg = { slashing = -12.5, piercing = -12.5, blunt = -12.5 },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Odin (ID 250); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [95] = 6150 }, mp = { [95] = 2830 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { danger[270], danger[271], danger[272], danger[273], danger[274], danger[275], danger[278], danger[283], danger[286], danger[291], danger[294], danger[299], danger[304], danger[305] }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[94] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Dark Bugler',
            ids    = { 310, 311, 312 },
            job    = 'blm/blm',
            levels = {
                [76] = { acc = 323, eva = 285, agi = 85, int = 97, mnd = 54, chr = 77, dex = 85, def = 303,
                         attack_skill = 261 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            weapon_dmg = { piercing = 12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            info = {
                family = { value = 'Imp / Demon', notes = { 'Source species: Imp (ID 212); family ID 92.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [76] = 2924 }, mp = { [76] = 2213 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Abrasive Tantara: Amnesia; Deafening Tantara: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Abrasive Tantara: Amnesia. Source targeting: area around the monster.', 'Deafening Tantara: Silence. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1709, name = 'Abrasive Tantara', summary = 'Abrasive Tantara: Amnesia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Amnesia' }, details = danger[247] }, { kind = 'skill', id = 1710, name = 'Deafening Tantara', summary = 'Deafening Tantara: Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, danger[312], danger[141], danger[311], danger[142], danger[313], danger[314], danger[315], danger[320], danger[325], danger[330], danger[335], danger[340], danger[343], danger[149], danger[344], danger[152], danger[156], danger[159], danger[160], danger[163] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Frenetic Rip', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 560, name = 'Frenetic Rip', level = 63, min_skill = 186, skill_ids = { 1711 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dark Esquire',
            ids    = { 313, 314, 315 },
            levels = {
                [76] = { acc = 323, eva = 306, agi = 80, int = 64, mnd = 50, chr = 71, dex = 85, def = 320,
                         attack_skill = 261 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Kindred (ID 201); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [76] = 4695 }, mp = { [76] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 120% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Soul Drain: HP drain; Hecatomb Wave: blindness; Demonic Howl: Slow', notes = { 'Soul Drain: HP drain. Source targeting: single target.', 'Hecatomb Wave: blindness. Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.', 'Demonic Howl: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 559, name = 'Soul Drain', summary = 'Soul Drain: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] }, { kind = 'skill', id = 560, name = 'Hecatomb Wave', summary = 'Hecatomb Wave: blindness', notes = { 'Wind breath damage that ignores shadows. On a successful damage result it attempts Blindness. Source targeting: cone. Possible effects: Blindness. Random effects may not all happen on the same use.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[12] }, { kind = 'skill', id = 563, name = 'Demonic Howl', summary = 'Demonic Howl: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[33] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Hecatomb Wave', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 563, name = 'Hecatomb Wave', level = 54, min_skill = 142, skill_ids = { 560 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vulpangue',
            ids    = { 316 },
            nm     = true,
            levels = {
                [78] = { acc = 333, eva = 320, agi = 89, int = 69, mnd = 65, chr = 65, dex = 85, def = 328,
                         attack_skill = 271 },
                [79] = { acc = 339, eva = 326, agi = 91, int = 70, mnd = 66, chr = 65, dex = 87, def = 334,
                         attack_skill = 276 },
                [80] = { acc = 344, eva = 331, agi = 91, int = 70, mnd = 66, chr = 65, dex = 87, def = 339,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            absorb = { wind = 100 },
            weapon_dmg = { slashing = 200, piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity' },
            drops  = {
                { rate = 1000, item = 2616 },  -- vulpangues wing
                { rate = 150, item = 16154 },  -- karura hachigane
                { rate = 150, item = 17754 },  -- sylphid epee
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Puk / Dragon', notes = { 'Source species: Puk (ID 224); family ID 97.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 15000, [79] = 15000, [80] = 15000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 56', notes = { 'Source base speed is 56; the ordinary monster default is 40. Animation speed is 56.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Hellcage Butterfly to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 5 minutes', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Obfuscate: Flash; Wind Shear Znm: Weight', notes = { 'Obfuscate: Flash. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Wind Shear Znm: Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[168], { kind = 'skill', id = 2360, name = 'Wind Shear Znm', summary = 'Wind Shear Znm: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[377] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Iriz Ima',
            ids    = { 317 },
            nm     = true,
            levels = {
                [87] = { acc = 385, eva = 359, agi = 80, int = 72, mnd = 72, chr = 75, dex = 85, def = 462,
                         attack_skill = 323 },
                [88] = { acc = 392, eva = 364, agi = 80, int = 72, mnd = 72, chr = 76, dex = 86, def = 468,
                         attack_skill = 329 },
            },
            ranks  = { ice = -1, wind = -1, earth = 2, thunder = -1, light = -1, dark = -1, paralyze = -1,
                       bind = -1, silence = -1, slow = 2, light_sleep = -1, dark_sleep = -1, blind = -1, stun = -1,
                       gravity = -1 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 2613 },  -- iriz imas hide
                { rate = 150, item = 19154 },  -- ferrara
                { rate = 150, item = 11366 },  -- avocat pigaches
            },
            aggro  = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Marid / Beast', notes = { 'Source species: Marid (ID 99); family ID 47.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [87] = 28000, [88] = 28000 }, mp = { [87] = 0, [88] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Bunch Of Senorita Pamamas to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 5 minutes', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = danger[111],
                blue = { value = 'Voracious Trunk', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 579, name = 'Voracious Trunk', level = 64, min_skill = 191, skill_ids = { 1707 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gotoh Zha the Redolent',
            ids    = { 318 },
            nm     = true,
            job    = 'blm/whm',
            levels = {
                [83] = { acc = 362, eva = 316, agi = 85, int = 90, mnd = 81, chr = 80, dex = 87, def = 342,
                         attack_skill = 299 },
                [84] = { acc = 369, eva = 322, agi = 87, int = 91, mnd = 82, chr = 82, dex = 89, def = 348,
                         attack_skill = 305 },
                [85] = { acc = 375, eva = 327, agi = 88, int = 93, mnd = 83, chr = 82, dex = 89, def = 353,
                         attack_skill = 311 },
            },
            ranks  = { fire = 1, ice = -1, wind = 4, earth = 1, thunder = -1, water = 1, light = 1, dark = -1,
                       paralyze = -1, bind = -1, silence = 4, slow = 1, poison = 1, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            immune = { 'silence' },
            drops  = {
                { rate = 1000, item = 2611 },  -- gotoh zhas necklace
                { rate = 240, item = 19032 },  -- water grip
                { rate = 240, item = 19037 },  -- light grip
                { rate = 1000, group = {  -- one of
                    { 19153, 1 },  -- naglering
                    { 15023, 1 },  -- enkidus mittens
                    { 16341, 1 },  -- aurum cuisses
                } },
                { rate = 100, group = {  -- one of
                    { 19153, 1 },  -- naglering
                    { 15023, 1 },  -- enkidus mittens
                    { 16341, 1 },  -- aurum cuisses
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Mamool Ja / Beastmen', notes = { 'Source species: Sage (ID 133); family ID 60.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [83] = 35000, [84] = 35000, [85] = 35000 }, mp = { [83] = 2439, [84] = 2471, [85] = 2504 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Bagged Sheep Botfly to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 5 minutes', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Silence: silence; Flash: Flash; Sleepga: area sleep; Sleepga II: area sleep', notes = { 'Silence: silence. Possible effects: Silence. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Flash: Flash. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'Sleepga II: area sleep. Possible effects: Sleep. The monster switches spell lists during the fight. These are possible source spells, not its current phase.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Some job-special buff choices depend on script values that could not be resolved.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.', 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[309], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = { 'The monster switches spell lists during the fight. These are possible source spells, not its current phase.' }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[92], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = danger[378], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[162], level_ranges = { { 1, 255 } } }, { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = danger[378], categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[162], level_ranges = { { 1, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'Some job-special buff choices depend on script values that could not be resolved.' }, general_notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'Some job-special buff choices depend on script values that could not be resolved.' } },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Tinnin',
            ids    = { 319 },
            nm     = true,
            levels = {
                [88] = { acc = 396, eva = 374, agi = 100, int = 82, mnd = 63, chr = 81, dex = 95, def = 390,
                         attack_skill = 329 },
                [89] = { acc = 403, eva = 379, agi = 101, int = 85, mnd = 65, chr = 82, dex = 97, def = 396,
                         attack_skill = 335 },
            },
            ranks  = { fire = 3, ice = 3, wind = 3, earth = 6, thunder = 6, water = 6, light = 6, dark = 6,
                       paralyze = 3, bind = 3, silence = 3, slow = 6, poison = 6, light_sleep = 6, dark_sleep = 6,
                       blind = 6, stun = 6, gravity = 9 },
            magic_dmg = { all = -25 },
            weapon_dmg = { piercing = -50, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'stun' },
            drops  = {
                { rate = 1000, item = 5564 },  -- chunk of hydra meat
                { rate = 1000, item = 2172 },  -- hydra scale
                { rate = 100, item = 2172 },  -- hydra scale
                { rate = 1000, item = 2158 },  -- hydra fang
                { rate = 1000, item = 2609 },  -- tinnins fang
                { rate = 1000, group = {  -- one of
                    { 11284, 1 },  -- enkidus harness
                    { 16157, 1 },  -- enkidus cap
                    { 16156, 1 },  -- oracles cap
                } },
                { rate = 150, group = {  -- one of
                    { 18429, 1 },  -- shusui
                    { 18593, 1 },  -- alkalurops
                    { 11364, 1 },  -- hachiryu sune-ate
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Hydra / Dragon', notes = { 'Source species: Hydra (ID 222); family ID 96.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [88] = 46000, [89] = 46000 }, mp = { [88] = 0, [89] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 32', notes = { 'Source base speed is 32; the ordinary monster default is 40. Animation speed is 32.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10; Regen 50', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Jug Of Monkey Wine to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 5 minutes; Conditional draw-in', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 5 minutes. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Pyric Blast: Plague; Polar Blast: Paralysis; Barofield: Weight; Nerve Gas: Curse, Poison', notes = { 'Pyric Blast: Plague. Source targeting: cone.', 'Polar Blast: Paralysis. Source targeting: cone.', 'Barofield: Weight. Source targeting: cone.', 'Nerve Gas: Curse, Poison. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.' }, entries = { { kind = 'skill', id = 1828, name = 'Pyric Blast', summary = 'Pyric Blast: Plague', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } }, forced = true }, { kind = 'skill', id = 1830, name = 'Polar Blast', summary = 'Polar Blast: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } }, forced = true }, { kind = 'skill', id = 1832, name = 'Barofield', summary = 'Barofield: Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[144] }, forced = true }, { kind = 'skill', id = 1836, name = 'Nerve Gas', summary = 'Nerve Gas: Curse, Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Curse', 'Poison' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'A scripted use can bypass normal move selection range.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Curse: Cursna, Holy Water; Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[379] }, forced = true } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.' }, general_notes = danger[27] },
                blue = { value = 'Unknown', notes = { 'A scripted move argument is not resolved.', 'A scripted choice table has conflicting or unreadable definitions.' }, incomplete = true },
            },
        },
        {
            name   = 'Mamool Ja Sapper',
            ids    = { 320 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Hospitaler',
            ids    = { 321 },
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
                dangers = danger[382],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Fetial',
            ids    = { 322, 331, 340 },
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
                dangers = danger[385],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Spotter',
            ids    = { 323 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Handler',
            ids    = { 324, 333, 342 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Jas Lizard',
            ids    = { 325, 334, 343 },
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
                dangers = { value = 'Tail Blow: Stun; Brain Crush: Silence; Baleful Gaze: petrification gaze; Plague Breath: Poison; Infrasonics: Evasion down', notes = { 'Tail Blow: Stun. Source targeting: single target.', 'Brain Crush: Silence. Source targeting: single target.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'Plague Breath: Poison. Random effects may not all happen on the same use. Source targeting: cone.', 'Infrasonics: Evasion down. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 366, name = 'Tail Blow', summary = 'Tail Blow: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[4] }, { kind = 'skill', id = 369, name = 'Brain Crush', summary = 'Brain Crush: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, { kind = 'skill', id = 370, name = 'Baleful Gaze Lizard', summary = 'Baleful Gaze: petrification gaze', notes = danger[386], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[388] }, { kind = 'skill', id = 371, name = 'Plague Breath', summary = 'Plague Breath: Poison', notes = danger[125], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[138] }, { kind = 'skill', id = 372, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[218] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Cataphract',
            ids    = { 326 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Jas Wyvern',
            ids    = { 327, 336, 345, 384, 385, 386 },
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
                dangers = { value = 'No listed threats', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
            info_by_index = {
                [384] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
                [385] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
                [386] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 1458 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } } },
            },
        },
        {
            name   = 'Mamool Ja Entrancer',
            ids    = { 328, 337, 346 },
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
                dangers = danger[225],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Sapper',
            ids    = { 329, 338 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Hospitaler',
            ids    = { 330, 339 },
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
                dangers = danger[382],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Spotter',
            ids    = { 332, 341 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Cataphract',
            ids    = { 335, 344 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Scout Puk',
            ids    = { 347 },
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
                dangers = danger[170],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Scout Puk',
            ids    = { 348, 349, 350, 351 },
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
                dangers = danger[170],
                blue = { value = 'Zephyr Mantle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 647, name = 'Zephyr Mantle', level = 65, min_skill = 196, skill_ids = { 1722 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Raid Raptor',
            ids    = { 352 },
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
                dangers = danger[235],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Raid Raptor',
            ids    = { 353, 354, 355, 356 },
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
                dangers = danger[235],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Attack Ziz',
            ids    = { 357 },
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
                dangers = danger[401],
                blue = { value = 'Sound Blast', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 572, name = 'Sound Blast', level = 32, min_skill = 68, skill_ids = { 410 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Attack Ziz',
            ids    = { 358, 359, 360, 361 },
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
                dangers = danger[401],
                blue = { value = 'Sound Blast', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 572, name = 'Sound Blast', level = 32, min_skill = 68, skill_ids = { 410 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Battering Bugard',
            ids    = { 362, 363, 365, 366 },
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
                dangers = danger[413],
                blue = { value = 'Awful Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 606, name = 'Awful Eye', level = 46, min_skill = 110, skill_ids = { 386 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Battering Bugard',
            ids    = { 364 },
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
                dangers = danger[413],
                blue = { value = 'Awful Eye', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 606, name = 'Awful Eye', level = 46, min_skill = 110, skill_ids = { 386 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wyvern',
            ids    = { 367, 368, 369 },
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
                dangers = danger[428],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wyvern',
            ids    = { 370, 371 },
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
                dangers = danger[428],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Poroggo Charmer',
            ids    = { 372, 373, 374, 375, 376 },
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
                dangers = { value = 'Frog Song: Charm; Magic Hammer: MP drain; Water Bomb: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Frog Song: Charm. Source targeting: single target.', 'Magic Hammer: MP drain. Source targeting: single target.', 'Water Bomb: Silence. Source targeting: area around the target.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1957, name = 'Frog Song', summary = 'Frog Song: Charm', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Charm' }, details = danger[56] }, { kind = 'skill', id = 1958, name = 'Magic Hammer', summary = 'Magic Hammer: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = { notes = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 1959, name = 'Water Bomb', summary = 'Water Bomb: Silence', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } } }, danger[312], danger[141], danger[311], danger[142], danger[313], danger[314], danger[315], danger[320], danger[325], danger[330], danger[335], danger[340], danger[343], danger[149], danger[344], danger[152], danger[156], danger[159], danger[160], danger[163] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Magic Hammer', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 646, name = 'Magic Hammer', level = 74, min_skill = 240, skill_ids = { 1958 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gulool Ja Ja',
            ids    = { 377 },
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
                dangers = { value = 'Miasma: Plague, Poison, Slow; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Miasma: Plague, Poison, Slow. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1800, name = 'Miasma', summary = 'Miasma: Plague, Poison, Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague', 'Poison', 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna; Poison: Poisona, Antidote, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, danger[32] } } }, danger[361], danger[362], danger[363], danger[364], danger[365], danger[366], danger[369], danger[372], danger[375] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Decimator Mabel Ja',
            ids    = { 378 },
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
                dangers = danger[385],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunderclap Sareel Ja',
            ids    = { 379 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunderbolt Piraal Ja',
            ids    = { 380 },
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
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 7835 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[235],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Panurgic Ryubool Ja',
            ids    = { 381 },
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
                dangers = danger[225],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sagelord Molaal Ja',
            ids    = { 382 },
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
                dangers = danger[385],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Strifelord Bakool Ja',
            ids    = { 383 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Eidolic Qufeel Ja',
            ids    = { 387 },
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
                dangers = { value = 'Vorpal Blade: can crit; Katon Ni: Water magic evasion down; Hyoton Ni: Fire magic evasion down; Huton Ni: Ice magic evasion down; Doton Ni: Wind magic evasion down; Raiton Ni: Earth magic evasion down; Suiton Ni: Thunder magic evasion down; Jubaku Ni: Paralysis; Hojo Ni: Slow; Dokumori Ni: Poison', notes = { 'Vorpal Blade: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Katon Ni: Water magic evasion down.', 'Hyoton Ni: Fire magic evasion down.', 'Huton Ni: Ice magic evasion down.', 'Doton Ni: Wind magic evasion down.', 'Raiton Ni: Earth magic evasion down.', 'Suiton Ni: Thunder magic evasion down.', 'Jubaku Ni: Paralysis.', 'Hojo Ni: Slow.', 'Dokumori Ni: Poison.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[134], danger[361], danger[362], danger[363], danger[364], danger[365], danger[366], danger[369], danger[372], danger[375] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Searing Vogaal Ja',
            ids    = { 388 },
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
                dangers = danger[431],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Scalding Fafool Ja',
            ids    = { 389 },
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
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gandaberunda',
            ids    = { 390 },
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
                dangers = danger[59],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ravenous Colibri',
            ids    = { 391, 392, 393 },
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
                dangers = danger[59],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Devoted Darla',
            ids    = { 394 },
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
                dangers = danger[434],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Anguished Ameretat',
            ids    = { 395, 396, 397 },
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
                dangers = danger[434],
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mamool Ja Hussar',
            ids    = { 398, 399, 404, 405 },
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
                dangers = danger[431],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Mamool Ja Hussar',
            ids    = { 400, 401, 402, 403, 406 },
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
                dangers = danger[431],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Troll Paviser',
            ids    = { 407, 415, 423 },
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
                dangers = danger[262],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Stormer',
            ids    = { 408 },
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
                dangers = danger[444],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Hoplite',
            ids    = { 409 },
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
                dangers = danger[447],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Pezhetairoi',
            ids    = { 410, 418, 426 },
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
                dangers = danger[307],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Cannoneer',
            ids    = { 411 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Velites',
            ids    = { 412, 420, 428 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Speculator',
            ids    = { 413 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Trolls Automaton',
            ids    = { 414, 422, 430 },
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
                dangers = { value = 'Knockout: Evasion down', notes = { 'Knockout: Evasion down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 2067, name = 'Knockout', summary = 'Knockout: Evasion down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[218] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Troll Stormer',
            ids    = { 416, 424 },
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
                dangers = danger[444],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Hoplite',
            ids    = { 417, 425 },
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
                dangers = danger[447],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Cannoneer',
            ids    = { 419, 427 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Speculator',
            ids    = { 421, 429 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flame Eruca',
            ids    = { 431, 435 },
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
                dangers = danger[449],
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Flame Eruca',
            ids    = { 432, 433, 434 },
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
                dangers = danger[449],
                blue = { value = 'Cocoon', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 547, name = 'Cocoon', level = 8, min_skill = 0, skill_ids = { 346 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wamouracampa',
            ids    = { 436, 440 },
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
                dangers = danger[459],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'War Wamouracampa',
            ids    = { 437, 438, 439 },
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
                dangers = danger[459],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Incendiary Bombs',
            ids    = { 441, 443, 444, 445 },
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
                dangers = danger[463],
                blue = { value = 'Refueling', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 530, name = 'Refueling', level = 48, min_skill = 116, skill_ids = { 569 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Incendiary Bombs',
            ids    = { 442 },
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
                dangers = danger[463],
                blue = { value = 'Refueling', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 530, name = 'Refueling', level = 48, min_skill = 116, skill_ids = { 569 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fighting Flan',
            ids    = { 446, 450 },
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
                dangers = danger[470],
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fighting Flan',
            ids    = { 447, 448, 449 },
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
                dangers = danger[470],
                blue = { value = 'Amplification', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 642, name = 'Amplification', level = 70, min_skill = 220, skill_ids = { 1821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Siege Scorpion',
            ids    = { 451, 455 },
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
                dangers = danger[488],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Siege Scorpion',
            ids    = { 452, 453, 454 },
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
                dangers = danger[488],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'War Wamoura',
            ids    = { 456, 457, 458, 459, 460 },
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
                dangers = { value = 'Proboscis: Buff removal, MP drain; Erosion Dust: Dia', notes = { 'Proboscis: Buff removal, MP drain. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: cone.', 'Erosion Dust: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1953, name = 'Proboscis', summary = 'Proboscis: Buff removal, MP drain', notes = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: cone.' }, categories = { 'dispel', 'drain' }, effects = { 'Buff removal', 'MP drain' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 1954, name = 'Erosion Dust', summary = 'Erosion Dust: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[348] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'Exuviation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 645, name = 'Exuviation', level = 75, min_skill = 245, skill_ids = { 1955 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Gurfurlur the Menacing',
            ids    = { 461 },
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
                dangers = { value = 'Sledgehammer: Petrification; Haymaker: Amnesia; Pleiades Ray: Bind, Blindness, Paralysis, Plague, Poison, Silence, Slow', notes = { 'Sledgehammer: Petrification. Source targeting: cone.', 'Haymaker: Amnesia. Source targeting: cone.', 'Pleiades Ray: Bind, Blindness, Paralysis, Plague, Poison, Silence, Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1802, name = 'Sledgehammer', summary = 'Sledgehammer: Petrification', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Petrification' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } } }, { kind = 'skill', id = 1804, name = 'Haymaker', summary = 'Haymaker: Amnesia', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Amnesia' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 1807, name = 'Pleiades Ray', summary = 'Pleiades Ray: Bind, Blindness, Paralysis, Plague, Poison, Silence, Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Plague', 'Poison', 'Silence', 'Slow' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Plague: Viruna; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { danger[69], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[32] } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Girzorhor the Imprudent',
            ids    = { 462 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Surmerdar the Unbridled',
            ids    = { 463 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Dartorgor the Austere',
            ids    = { 464 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vorporlor the Barbaric',
            ids    = { 465 },
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
                dangers = danger[490],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vorjirzur the Valiant',
            ids    = { 466 },
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
                dangers = { value = 'Rock Smash: Petrification; Enervation: Defense down, Magic defense down; Flash: Flash', notes = danger[445], entries = { danger[263], danger[264], danger[93] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wordorbor the Artificer',
            ids    = { 467 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cobalt Sentinel',
            ids    = { 468 },
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
                dangers = { value = 'Diaga II: Dia; Slow: slow; Paralyze: paralysis; Silence: silence; Flash: Flash', notes = { 'Diaga II: Dia.', 'Slow: slow. Possible effects: Slow.', 'Paralyze: paralysis. Possible effects: Paralysis.', 'Silence: silence. Possible effects: Silence.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = danger[358], coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[94] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'White Sentinel',
            ids    = { 469 },
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
                dangers = { value = 'Flash: Flash', notes = { 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = danger[430], coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[94] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Hazel Sentinel',
            ids    = { 470 },
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
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[27] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Carmine Sentinel',
            ids    = { 471 },
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
                dangers = { value = 'Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = danger[345], coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[94] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Xarhorkur the Claviger',
            ids    = { 472 },
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
                dangers = danger[266],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Zurmurwur the Ruthless',
            ids    = { 473 },
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
                dangers = danger[490],
                blue = { value = 'Enervation', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 633, name = 'Enervation', level = 67, min_skill = 205, skill_ids = { 1745 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Garma',
            ids    = { 474 },
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
                dangers = danger[503],
                blue = { value = 'Body Slam', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 564, name = 'Body Slam', level = 62, min_skill = 181, skill_ids = { 645 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wicked Dahak',
            ids    = { 475, 476, 477 },
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
                dangers = danger[503],
                blue = { value = 'Body Slam', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 564, name = 'Body Slam', level = 62, min_skill = 181, skill_ids = { 645 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Ravenous Colibri',
            ids    = { 478 },
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
                dangers = danger[59],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Wicked Dahak',
            ids    = { 479, 480, 481 },
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
                dangers = danger[503],
                blue = { value = 'Body Slam', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 564, name = 'Body Slam', level = 62, min_skill = 181, skill_ids = { 645 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Destroyer',
            ids    = { 482, 483, 486, 489, 490 },
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
                dangers = danger[262],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Troll Destroyer',
            ids    = { 484, 485, 487, 488 },
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
                dangers = danger[262],
                blue = { value = 'Diamondhide', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 632, name = 'Diamondhide', level = 67, min_skill = 205, skill_ids = { 1897 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Kubool Jas Mhuufya',
            ids    = { 491, 492, 493 },
            job    = 'rdm/rdm',
            levels = {
                [99] = { acc = 467, eva = 426, agi = 80, int = 118, mnd = 118, chr = 109, dex = 87, def = 425,
                         attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            weapon_dmg = { piercing = 25 },
            info = {
                family = { value = 'Colibri / Bird', notes = { 'Source species: Colibri (ID 179); family ID 80.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [99] = 6240 }, mp = { [99] = 1486 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 64', notes = { 'Source base speed is 64; the ordinary monster default is 40. Animation speed is 64.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 220', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[59],
                blue = { value = 'Feather Tickle', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 573, name = 'Feather Tickle', level = 64, min_skill = 191, skill_ids = { 1701 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Vigilant Kubool Ja',
            ids    = { 494, 495, 496 },
            job    = 'bst/bst',
            levels = {
                [99] = { acc = 480, eva = 418, agi = 82, int = 85, mnd = 85, chr = 118, dex = 112, def = 431,
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [99] = 6480 }, mp = { [99] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[136],
                blue = { value = 'Warm-Up, Firespit', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 636, name = 'Warm-Up', level = 68, min_skill = 210, skill_ids = { 1734 } }, { id = 637, name = 'Firespit', level = 68, min_skill = 210, skill_ids = { 1733 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thuban',
            ids    = { 497, 498, 499 },
            nm     = true,
            levels = {
                [99] = { acc = 477, eva = 433, agi = 112, int = 93, mnd = 71, chr = 91, dex = 107, def = 449,
                         attack_skill = 404 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 6, bind = 6, silence = 6, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 6, gravity = 9 },
            magic_dmg = { all = -25 },
            weapon_dmg = { piercing = -50, blunt = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Hydra / Dragon', notes = { 'Source species: Hydra (ID 222); family ID 96.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [99] = 6627 }, mp = { [99] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 50', notes = { 'Source base speed is 50; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Pyric Blast: Plague; Polar Blast: Paralysis; Barofield: Weight; Trembling: Buff removal; Nerve Gas: Curse, Poison', notes = { 'Pyric Blast: Plague. Source targeting: cone.', 'Polar Blast: Paralysis. Source targeting: cone.', 'Barofield: Weight. Source targeting: cone.', 'Trembling: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'Nerve Gas: Curse, Poison. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1828, name = 'Pyric Blast', summary = 'Pyric Blast: Plague', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } } }, { kind = 'skill', id = 1830, name = 'Polar Blast', summary = 'Polar Blast: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 1832, name = 'Barofield', summary = 'Barofield: Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 18 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 18.0, shape = 'front cone', cone_length = 18.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[144] } }, { kind = 'skill', id = 1834, name = 'Trembling', summary = 'Trembling: Buff removal', notes = danger[498], categories = { 'dispel' }, effects = { 'Buff removal' }, details = { notes = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: 18 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 18.0, shape = 'area around the monster', effect_radius = 18.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 1836, name = 'Nerve Gas', summary = 'Nerve Gas: Curse, Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Curse', 'Poison' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Curse: Cursna, Holy Water; Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[379] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[27] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Awoken Hildesvini',
            ids    = { 500 },
            nm     = true,
            levels = {
                [119] = { acc = 481, eva = 526, agi = 107, int = 97, mnd = 97, chr = 101, dex = 114, def = 667,
                          attack_skill = 404 },
            },
            ranks  = { ice = -1, wind = -1, earth = 2, thunder = -1, light = -1, dark = -1, paralyze = -1,
                       bind = -1, silence = -1, slow = 2, light_sleep = -1, dark_sleep = -1, blind = -1, stun = -1,
                       gravity = -1 },
            info = {
                family = { value = 'Marid / Beast', notes = { 'Source species: Marid (ID 99); family ID 47.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [119] = 8307 }, mp = { [119] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 24', notes = { 'Source base speed is 24; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[111],
                blue = { value = 'Voracious Trunk', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 579, name = 'Voracious Trunk', level = 64, min_skill = 191, skill_ids = { 1707 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Returned Soulflayer',
            ids    = { 501 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [139] = { acc = 497, eva = 588, agi = 124, int = 185, mnd = 140, chr = 120, dex = 147, def = 626,
                          attack_skill = 404 },
            },
            ranks  = { ice = 2, water = 9, light = -1, dark = 11, paralyze = 2, bind = 2, poison = 9,
                       light_sleep = -1, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
            info = {
                family = { value = 'Soulflayer / Demon', notes = { 'Source species: Soulflayer (ID 215); family ID 93.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 9013 }, mp = { [139] = 4309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Mind Blast: Paralysis; Mind Purge: Buff removal; Tribulation: Bio, Blindness; Immortal Anathema: Curse; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poisonga II: area poison; Drain: HP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Mind Blast: Paralysis. Source targeting: cone.', 'Mind Purge: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.', 'Tribulation: Bio, Blindness. Source targeting: area around the monster.', 'Immortal Anathema: Curse. Source targeting: area around the monster.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poisonga II: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 1963, name = 'Mind Blast', summary = 'Mind Blast: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 1966, name = 'Mind Purge', summary = 'Mind Purge: Buff removal', notes = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[56] }, { kind = 'skill', id = 1967, name = 'Tribulation', summary = 'Tribulation: Bio, Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Bio', 'Blindness' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bio: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Bio', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 1968, name = 'Immortal Anathema', summary = 'Immortal Anathema: Curse', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = danger[140] }, danger[141], danger[142], danger[146], { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[148], level_ranges = { { 70, 255 } } }, danger[149], danger[152], danger[153], danger[156], danger[159], danger[160], danger[163] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[94] },
                blue = { value = 'Mind Blast', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 644, name = 'Mind Blast', level = 73, min_skill = 235, skill_ids = { 1963 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
