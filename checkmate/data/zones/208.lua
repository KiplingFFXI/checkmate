-- Quicksand Caves (zone 208).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[2] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[3] = { notes = danger[2], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[4] = { kind = 'skill', id = 456, name = 'Tentacle', summary = 'Tentacle: can crit', notes = danger[1], categories = { 'crit' }, effects = {  }, details = danger[3] };
danger[5] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 12 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[6] = { notes = danger[5], unknown = {  }, activation_range = 12.0, shape = 'front cone', cone_length = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[7] = { kind = 'skill', id = 458, name = 'Ink Jet', summary = 'Ink Jet: Blindness', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[6] };
danger[8] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[9] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[10] = { danger[9] };
danger[11] = { notes = danger[8], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[10] };
danger[12] = { kind = 'skill', id = 462, name = 'Maelstrom', summary = 'Maelstrom: STR down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[11] };
danger[13] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[14] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[15] = { danger[14] };
danger[16] = { notes = danger[13], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[15] };
danger[17] = { kind = 'skill', id = 463, name = 'Whirlwind', summary = 'Whirlwind: VIT down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[16] };
danger[18] = { danger[4], danger[7], danger[12], danger[17] };
danger[19] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[20] = { 'Spikeball: Poison, can crit during Mighty Strikes. Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification, can crit during Mighty Strikes. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification. Requires Mighty Strikes to be active, with the move still usable.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[21] = { 'Requires Mighty Strikes to be active, with the move still usable. Source targeting: single target.' };
danger[22] = { 'Normal activation range: 13.5 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[23] = { notes = danger[22], unknown = {  }, activation_range = 13.5, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[24] = { kind = 'skill', id = 789, name = 'Spikeball', summary = 'Spikeball: Poison, can crit during Mighty Strikes', notes = danger[21], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[23] };
danger[25] = { kind = 'skill', id = 790, name = 'Shoulder Slam', summary = 'Shoulder Slam: can crit', notes = danger[1], categories = { 'crit' }, effects = {  }, details = danger[3] };
danger[26] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[27] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[28] = { danger[27] };
danger[29] = { notes = danger[26], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[28] };
danger[30] = { kind = 'skill', id = 791, name = 'Magnetite Cloud', summary = 'Magnetite Cloud: Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = danger[29] };
danger[31] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[32] = { notes = danger[31], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[33] = { kind = 'skill', id = 792, name = 'Sandstorm', summary = 'Sandstorm: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[32] };
danger[34] = { 'Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification. Requires Mighty Strikes to be active, with the move still usable.' };
danger[35] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[36] = { notes = danger[35], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = true } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[37] = { kind = 'skill', id = 795, name = 'Sand Trap', summary = 'Sand Trap: petrification, can crit during Mighty Strikes', notes = danger[34], categories = { 'crit', 'debuff' }, effects = { 'Petrification' }, details = danger[36] };
danger[38] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: 16 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[39] = { notes = danger[38], unknown = {  }, activation_range = 16.0, shape = 'area around the monster', effect_radius = 16.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[40] = { kind = 'skill', id = 796, name = 'Jamming Wave', summary = 'Jamming Wave: Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[39] };
danger[41] = { danger[24], danger[25], danger[30], danger[33], danger[37], danger[40] };
danger[42] = { value = 'Spikeball: Poison, can crit during Mighty Strikes; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification, can crit during Mighty Strikes; Jamming Wave: Silence', notes = danger[20], entries = danger[41], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[19] };
danger[43] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' };
danger[44] = { kind = 'skill', id = 789, name = 'Spikeball', summary = 'Spikeball: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[23] };
danger[45] = { 'Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.' };
danger[46] = { kind = 'skill', id = 795, name = 'Sand Trap', summary = 'Sand Trap: petrification', notes = danger[45], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[36] };
danger[47] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[48] = { notes = danger[47], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[49] = { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[48], level_ranges = { { 60, 255 } } };
danger[50] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[48], level_ranges = { { 50, 255 } } };
danger[51] = { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[48], level_ranges = { { 52, 255 } } };
danger[52] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[48], level_ranges = { { 54, 255 } } };
danger[53] = { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[48], level_ranges = { { 56, 255 } } };
danger[54] = { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[48], level_ranges = { { 58, 255 } } };
danger[55] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { notes = danger[55], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[57] = { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[56], level_ranges = { { 24, 71 } } };
danger[58] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[59] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[60] = { danger[59] };
danger[61] = { notes = danger[58], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[60] };
danger[62] = { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = danger[61], level_ranges = { { 24, 255 } } };
danger[63] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[64] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[65] = { danger[64] };
danger[66] = { notes = danger[63], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[65] };
danger[67] = { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = danger[66], level_ranges = { { 22, 255 } } };
danger[68] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[69] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[70] = { danger[69] };
danger[71] = { notes = danger[68], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[70] };
danger[72] = { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = danger[71], level_ranges = { { 20, 255 } } };
danger[73] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[74] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[75] = { danger[74] };
danger[76] = { notes = danger[73], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[75] };
danger[77] = { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = danger[76], level_ranges = { { 18, 255 } } };
danger[78] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[79] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[80] = { danger[79] };
danger[81] = { notes = danger[78], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[80] };
danger[82] = { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = danger[81], level_ranges = { { 16, 255 } } };
danger[83] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[84] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[85] = { danger[84] };
danger[86] = { notes = danger[83], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[85] };
danger[87] = { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = danger[86], level_ranges = { { 27, 255 } } };
danger[88] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[48], level_ranges = { { 12, 255 } } };
danger[89] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[48], level_ranges = { { 25, 255 } } };
danger[90] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[91] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[92] = { notes = danger[90], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[91] };
danger[93] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[92], level_ranges = { { 45, 255 } } };
danger[94] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[95] = { notes = danger[94], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[96] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[95], level_ranges = { { 4, 255 } } };
danger[97] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[98] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[99] = { danger[98] };
danger[100] = { notes = danger[97], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[99] };
danger[101] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[100], level_ranges = { { 7, 255 } } };
danger[102] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[48], level_ranges = { { 41, 255 } } };
danger[103] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[104] = { notes = danger[103], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[105] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[104], level_ranges = { { 56, 255 } } };
danger[106] = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40], danger[49], danger[50], danger[51], danger[52], danger[53], danger[54], danger[57], danger[62], danger[67], danger[72], danger[77], danger[82], danger[87], danger[88], danger[89], danger[93], danger[96], danger[101], danger[102], danger[105] };
danger[107] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[108] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = danger[43], entries = danger[106], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[107] };
danger[109] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' };
danger[110] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[111] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[112] = { notes = danger[110], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[111] };
danger[113] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[112], level_ranges = { { 37, 255 } } };
danger[114] = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40], danger[113] };
danger[115] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flash: Flash', notes = danger[109], entries = danger[114], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[107] };
danger[116] = { 'Sickle Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Spray: Poison. Source targeting: cone.', 'Spider Web: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[117] = { kind = 'skill', id = 810, name = 'Sickle Slash', summary = 'Sickle Slash: can crit', notes = danger[1], categories = { 'crit' }, effects = {  }, details = danger[3] };
danger[118] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[119] = { notes = danger[118], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[120] = { kind = 'skill', id = 811, name = 'Acid Spray', summary = 'Acid Spray: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[119] };
danger[121] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[122] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[123] = { danger[122] };
danger[124] = { notes = danger[121], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[123] };
danger[125] = { kind = 'skill', id = 812, name = 'Spider Web', summary = 'Spider Web: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[124] };
danger[126] = { danger[117], danger[120], danger[125] };
danger[127] = { value = 'Sickle Slash: can crit; Acid Spray: Poison; Spider Web: Slow', notes = danger[116], entries = danger[126], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] };
danger[128] = { 'Normal activation range: 16 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 16 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[129] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[130] = { danger[129] };
danger[131] = { notes = danger[128], unknown = {  }, activation_range = 16.0, shape = 'front cone', cone_length = 16.0, shadows = { { mode = 'ignore' } }, removals = danger[130] };
danger[132] = { kind = 'skill', id = 339, name = 'Hi-Freq Field', summary = 'Hi-Freq Field: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[131] };
danger[133] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[134] = { notes = danger[133], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[10] };
danger[135] = { kind = 'skill', id = 343, name = 'Spoil', summary = 'Spoil: STR down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[134] };
danger[136] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[137] = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40] };
danger[138] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence', notes = danger[136], entries = danger[137], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] };
danger[139] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[140] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flash: Flash', notes = danger[139], entries = danger[114], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[107] };
danger[141] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[142] = { notes = danger[141], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[143] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[142], level_ranges = { { 43, 64 } } };
danger[144] = { 'Full-Force Blow: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Gastric Bomb: Attack down. Source targeting: single target.', 'Sandspin: Accuracy down. Source targeting: area around the monster.', 'Tremors: DEX down. Source targeting: area around the monster.', 'Mp Absorption: MP drain. Source targeting: single target.', 'Sound Vacuum Worm: Silence. Source targeting: single target.', 'Quake: Wind magic evasion down.', 'Rasp: Rasp.', 'Bind: bind. Possible effects: Bind.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[145] = { kind = 'skill', id = 424, name = 'Full-Force Blow', summary = 'Full-Force Blow: can crit', notes = danger[1], categories = { 'crit' }, effects = {  }, details = danger[3] };
danger[146] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[147] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[148] = { danger[147] };
danger[149] = { notes = danger[146], unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[148] };
danger[150] = { kind = 'skill', id = 425, name = 'Gastric Bomb', summary = 'Gastric Bomb: Attack down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Attack down' }, details = danger[149] };
danger[151] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[152] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[153] = { danger[152] };
danger[154] = { notes = danger[151], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[153] };
danger[155] = { kind = 'skill', id = 426, name = 'Sandspin', summary = 'Sandspin: Accuracy down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[154] };
danger[156] = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 12 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[157] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[158] = { danger[157] };
danger[159] = { notes = danger[156], unknown = {  }, activation_range = 12.0, shape = 'area around the monster', effect_radius = 12.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[158] };
danger[160] = { kind = 'skill', id = 427, name = 'Tremors', summary = 'Tremors: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[159] };
danger[161] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.' };
danger[162] = { notes = danger[161], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } } };
danger[163] = { kind = 'skill', id = 428, name = 'Mp Absorption', summary = 'Mp Absorption: MP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[162] };
danger[164] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[165] = { notes = danger[164], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[166] = { kind = 'skill', id = 429, name = 'Sound Vacuum Worm', summary = 'Sound Vacuum Worm: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[165] };
danger[167] = { danger[145], danger[150], danger[155], danger[160], danger[163], danger[166], danger[52], danger[77], danger[101] };
danger[168] = { value = 'Full-Force Blow: can crit; Gastric Bomb: Attack down; Sandspin: Accuracy down; Tremors: DEX down; Mp Absorption: MP drain; Sound Vacuum Worm: Silence; Quake: Wind magic evasion down; Rasp: Rasp; Bind: bind', notes = danger[144], entries = danger[167], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[107] };
danger[169] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' };
danger[170] = { value = 'No listed threats', notes = danger[169], entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] };
danger[171] = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' };
danger[172] = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence', notes = danger[171], entries = danger[137], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[19] };
danger[173] = { 'Tail Blow: Stun. Source targeting: single target.', 'Brain Crush: Silence. Source targeting: single target.', 'Baleful Gaze: petrification gaze. Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.', 'Plague Breath: Poison. Random effects may not all happen on the same use. Source targeting: cone.', 'Infrasonics: Evasion down. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[174] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[175] = { notes = danger[174], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[91] };
danger[176] = { kind = 'skill', id = 366, name = 'Tail Blow', summary = 'Tail Blow: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[175] };
danger[177] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[178] = { notes = danger[177], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } };
danger[179] = { kind = 'skill', id = 369, name = 'Brain Crush', summary = 'Brain Crush: Silence', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = danger[178] };
danger[180] = { 'Attempts Petrification when the target faces the monster and the monster is in front of the target. Source targeting: single target. Possible effects: Petrification. The gaze effect requires the target to face the monster.' };
danger[181] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Petrification: Stona.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[182] = { notes = danger[181], unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Petrification', options = { 'Stona' } } } };
danger[183] = { kind = 'skill', id = 370, name = 'Baleful Gaze Lizard', summary = 'Baleful Gaze: petrification gaze', notes = danger[180], categories = { 'debuff' }, effects = { 'Petrification' }, details = danger[182] };
danger[184] = { 'Random effects may not all happen on the same use. Source targeting: cone.' };
danger[185] = { kind = 'skill', id = 371, name = 'Plague Breath', summary = 'Plague Breath: Poison', notes = danger[184], categories = { 'debuff' }, effects = { 'Poison' }, details = danger[119] };
danger[186] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Evasion down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[187] = { notes = danger[186], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[130] };
danger[188] = { kind = 'skill', id = 372, name = 'Infrasonics', summary = 'Infrasonics: Evasion down', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Evasion down' }, details = danger[187] };
danger[189] = { danger[176], danger[179], danger[183], danger[185], danger[188] };
danger[190] = { value = 'Tail Blow: Stun; Brain Crush: Silence; Baleful Gaze: petrification gaze; Plague Breath: Poison; Infrasonics: Evasion down', notes = danger[173], entries = danger[189], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] };
danger[191] = { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[56], level_ranges = { { 72, 255 } } };
danger[192] = { 'Numbing Breath: Paralysis. Random effects may not all happen on the same use. Source targeting: cone.', 'Cold Breath: Bind. Source targeting: cone.', 'Mandible Bite: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Poison Sting: Poison. Source targeting: single target.', 'Death Scissors: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wild Rage: Poison. Source targeting: area around the monster.', 'Earth Pounder: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[193] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[194] = { notes = danger[193], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[195] = { kind = 'skill', id = 348, name = 'Numbing Breath', summary = 'Numbing Breath: Paralysis', notes = danger[184], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[194] };
danger[196] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[197] = { notes = danger[196], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[99] };
danger[198] = { kind = 'skill', id = 349, name = 'Cold Breath', summary = 'Cold Breath: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[197] };
danger[199] = { kind = 'skill', id = 350, name = 'Mandible Bite', summary = 'Mandible Bite: can crit', notes = danger[1], categories = { 'crit' }, effects = {  }, details = danger[3] };
danger[200] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[201] = { notes = danger[200], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[202] = { kind = 'skill', id = 351, name = 'Poison Sting', summary = 'Poison Sting: Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[201] };
danger[203] = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[204] = { notes = danger[203], unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[205] = { kind = 'skill', id = 353, name = 'Death Scissors', summary = 'Death Scissors: can crit', notes = danger[1], categories = { 'crit' }, effects = {  }, details = danger[204] };
danger[206] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[207] = { notes = danger[206], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[208] = { kind = 'skill', id = 354, name = 'Wild Rage', summary = 'Wild Rage: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[207] };
danger[209] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[210] = { notes = danger[209], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[158] };
danger[211] = { kind = 'skill', id = 355, name = 'Earth Pounder', summary = 'Earth Pounder: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[210] };
danger[212] = { danger[195], danger[198], danger[199], danger[202], danger[205], danger[208], danger[211] };
danger[213] = { value = 'Numbing Breath: Paralysis; Cold Breath: Bind; Mandible Bite: can crit; Poison Sting: Poison; Death Scissors: can crit; Wild Rage: Poison; Earth Pounder: DEX down', notes = danger[192], entries = danger[212], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] };
danger[214] = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40], danger[49], danger[50], danger[51], danger[52], danger[53], danger[54], danger[191], danger[62], danger[67], danger[72], danger[77], danger[82], danger[87], danger[88], danger[89], danger[93], danger[96], danger[101], danger[102], danger[105] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio X-I', 'Hastatus XI-XII',
                      'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [2] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [3] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [4] = { sound = { 'Sand Spider', 'Sand Tarantula' } },
        [5] = { sight = { 'Diamond Daig', 'Helm Beetle' } },
        [6] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII',
                      'Triarius IV-XIV', 'Triarius X-XV', 'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [7] = { sound = { 'Sand Digger', 'Sand Eater' } },
        [8] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII',
                      'Triarius IV-XIV', 'Triarius X-XV', 'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [9] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor', 'Antican Signifer',
                      'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I', 'Hastatus XI-XII',
                      'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [10] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [11] = { sound = { 'Sand Lizard' } },
        [12] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Praefectus',
                      'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor', 'Antican Signifer',
                      'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I', 'Hastatus XI-XII',
                      'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [13] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Quaestor', 'Antican Signifer',
                      'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I', 'Hastatus XI-XII',
                      'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [14] = { sight = { 'Helm Beetle' } },
        [15] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Centurio IV-VII', 'Centurio X-I', 'Hastatus XI-XII',
                      'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [16] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII',
                      'Triarius IV-XIV', 'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [17] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII', 'Triarius IV-XIV', 'Triarius X-XV',
                      'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [18] = { sound = { 'Sabotender Bailaor', 'Sabotender Bailarin', 'Spelunking Sabotender' } },
        [19] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII',
                      'Triarius IV-XIV', 'Triarius X-XV', 'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Praetor' },
        },
        [20] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII',
                      'Triarius IV-XIV', 'Triarius X-XV', 'Tribunus VII-I' },
            true_sound = { 'Antican Legatus', 'Antican Praetor' },
        },
        [21] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Proconsul XII', 'Sagittarius X-XIII',
                      'Triarius IV-XIV', 'Triarius X-XV' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
        [22] = {
            sound = { 'Antican Aedilis', 'Antican Antesignanus', 'Antican Hastatus', 'Antican Magister',
                      'Antican Praefectus', 'Antican Princeps', 'Antican Proconsul', 'Antican Quaestor',
                      'Antican Signifer', 'Antican Triarius', 'Antican Tribunus', 'Centurio IV-VII', 'Centurio X-I',
                      'Hastatus XI-XII', 'Princeps IV-XLV', 'Sagittarius X-XIII', 'Triarius IV-XIV',
                      'Triarius X-XV', 'Tribunus VII-I' },
            true_sound = { 'Antican Consul', 'Antican Legatus', 'Antican Praetor' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Antican Aedilis'] = { id = 55, name = 'Antica' },
        ['Antican Antesignanus'] = { id = 55, name = 'Antica' },
        ['Antican Consul'] = { id = 55, name = 'Antica' },
        ['Antican Hastatus'] = { id = 55, name = 'Antica' },
        ['Antican Legatus'] = { id = 55, name = 'Antica' },
        ['Antican Magister'] = { id = 55, name = 'Antica' },
        ['Antican Praefectus'] = { id = 55, name = 'Antica' },
        ['Antican Praetor'] = { id = 55, name = 'Antica' },
        ['Antican Princeps'] = { id = 55, name = 'Antica' },
        ['Antican Proconsul'] = { id = 55, name = 'Antica' },
        ['Antican Quaestor'] = { id = 55, name = 'Antica' },
        ['Antican Signifer'] = { id = 55, name = 'Antica' },
        ['Antican Triarius'] = { id = 55, name = 'Antica' },
        ['Antican Tribunus'] = { id = 55, name = 'Antica' },
        ['Centurio IV-VII'] = { id = 55, name = 'Antica' },
        ['Centurio X-I'] = { id = 55, name = 'Antica' },
        ['Diamond Daig'] = { id = 182, name = 'Beetle' },
        ['Hastatus XI-XII'] = { id = 55, name = 'Antica' },
        ['Helm Beetle'] = { id = 182, name = 'Beetle' },
        ['Princeps IV-XLV'] = { id = 55, name = 'Antica' },
        ['Proconsul XII'] = { id = 55, name = 'Antica' },
        ['Sabotender Bailaor'] = { id = 141, name = 'Cactaur' },
        ['Sabotender Bailarin'] = { id = 141, name = 'Cactaur' },
        ['Sagittarius X-XIII'] = { id = 55, name = 'Antica' },
        ['Sand Digger'] = { id = 10, name = 'Worm' },
        ['Sand Eater'] = { id = 10, name = 'Worm' },
        ['Sand Lizard'] = { id = 126, name = 'Lizard' },
        ['Sand Spider'] = { id = 195, name = 'Spider' },
        ['Sand Tarantula'] = { id = 195, name = 'Spider' },
        ['Spelunking Sabotender'] = { id = 141, name = 'Cactaur' },
        ['Triarius IV-XIV'] = { id = 55, name = 'Antica' },
        ['Triarius X-XV'] = { id = 55, name = 'Antica' },
        ['Tribunus VII-I'] = { id = 55, name = 'Antica' },
    },
    monsters = {
        {
            name   = 'Valor',
            ids    = { 1 },
            nm     = true,
            levels = {
                [70] = { acc = 184, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61, dex = 69, def = 289,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 8, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 6400 }, mp = { [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Tentacle: can crit; Ink Jet: Blindness; Maelstrom: STR down; Whirlwind: VIT down', notes = { 'Tentacle: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Jet: Blindness. Source targeting: cone.', 'Maelstrom: STR down. Source targeting: area around the monster.', 'Whirlwind: VIT down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move argument is not resolved.' }, entries = danger[18], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[19] },
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Honor',
            ids    = { 2 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [70] = { acc = 183, eva = 272, agi = 69, int = 61, mnd = 61, chr = 63, dex = 67, def = 288,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 8, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 5400 }, mp = { [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Tentacle: can crit; Ink Jet: Blindness; Maelstrom: STR down; Whirlwind: VIT down', notes = { 'Tentacle: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Ink Jet: Blindness. Source targeting: cone.', 'Maelstrom: STR down. Source targeting: area around the monster.', 'Whirlwind: VIT down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = danger[18], coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[19] },
                blue = { value = 'Maelstrom', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 515, name = 'Maelstrom', level = 61, min_skill = 176, skill_ids = { 462 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Centurio IV-VII',
            ids    = { 3 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 274, agi = 73, int = 55, mnd = 47, chr = 61, dex = 81, def = 287,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4191 }, mp = { [70] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[42],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Triarius IV-XIV',
            ids    = { 4 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [70] = { acc = 291, eva = 252, agi = 73, int = 85, mnd = 53, chr = 67, dex = 81, def = 271,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 3717 }, mp = { [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[108],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Princeps IV-XLV',
            ids    = { 5 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [70] = { acc = 285, eva = 262, agi = 49, int = 49, mnd = 65, chr = 73, dex = 69, def = 334,
                         attack_skill = 233 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 20 },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4088 }, mp = { [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[115],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Mimic',
            ids    = { 6 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 198, agi = 65, int = 50, mnd = 50, chr = 43, dex = 62, def = 213,
                         attack_skill = 171 },
            },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            drops  = {
                { rate = 1000, item = 1054 },  -- quicksand coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            info = {
                family = { value = 'Mimic / Arcana', notes = { 'Source species: Mimic (ID 73); family ID 33.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 2939 }, mp = { [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 170 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 1 minute; Conditional draw-in', notes = { 'Source idle-despawn delay: 1 minute. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Death Trap: Poison, Stun', notes = { 'Death Trap: Poison, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 729, name = 'Death Trap', summary = 'Death Trap: Poison, Stun', notes = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison', 'Stun' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Sand Spider',
            ids    = { 7, 8, 9, 12, 13, 14, 17, 38, 44, 49, 55, 61, 63, 64, 65, 91 },
            levels = {
                [51] = { acc = 189, eva = 174, agi = 56, int = 45, mnd = 45, chr = 41, dex = 62, def = 188,
                         attack_skill = 151 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 45, mnd = 45, chr = 41, dex = 62, def = 193,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 184, agi = 57, int = 46, mnd = 46, chr = 42, dex = 63, def = 198,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 190, agi = 58, int = 47, mnd = 47, chr = 42, dex = 64, def = 203,
                         attack_skill = 166 },
                [55] = { acc = 210, eva = 195, agi = 58, int = 47, mnd = 47, chr = 43, dex = 65, def = 209,
                         attack_skill = 171 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 10, item = 838 },  -- spider web
                { rate = 10, item = 1054 },  -- quicksand coffer key
            },
            steal  = { 838 },  -- spider web
            links  = 4,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2605, [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939 }, mp = { [51] = 0, [52] = 0, [53] = 0, [54] = 0, [55] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[127],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Helm Beetle',
            ids    = { 10, 11, 15, 16, 18, 31, 32, 33, 35, 36, 37, 110, 116, 118, 125, 136, 143, 146, 147, 172, 173,
                       174, 181, 188, 195, 233, 238, 239, 240, 249, 252, 255, 258, 262, 263 },
            job    = 'pld/pld',
            levels = {
                [51] = { acc = 183, eva = 164, agi = 36, int = 36, mnd = 54, chr = 54, dex = 51, def = 224,
                         attack_skill = 151 },
                [52] = { acc = 188, eva = 169, agi = 36, int = 36, mnd = 54, chr = 54, dex = 51, def = 229,
                         attack_skill = 156 },
                [53] = { acc = 193, eva = 174, agi = 36, int = 36, mnd = 54, chr = 54, dex = 51, def = 235,
                         attack_skill = 161 },
                [54] = { acc = 199, eva = 179, agi = 36, int = 36, mnd = 55, chr = 55, dex = 52, def = 240,
                         attack_skill = 166 },
                [55] = { acc = 204, eva = 184, agi = 37, int = 37, mnd = 56, chr = 56, dex = 53, def = 247,
                         attack_skill = 171 },
                [56] = { acc = 210, eva = 189, agi = 38, int = 38, mnd = 58, chr = 58, dex = 54, def = 251,
                         attack_skill = 176 },
                [57] = { acc = 215, eva = 194, agi = 38, int = 38, mnd = 58, chr = 58, dex = 54, def = 257,
                         attack_skill = 181 },
                [58] = { acc = 221, eva = 199, agi = 39, int = 39, mnd = 59, chr = 59, dex = 56, def = 262,
                         attack_skill = 186 },
            },
            spawn_levels = { [10] = { 51, 54 }, [11] = { 51, 54 }, [15] = { 51, 54 }, [16] = { 51, 54 },
                             [18] = { 51, 54 }, [31] = { 51, 54 }, [32] = { 51, 54 }, [33] = { 51, 54 },
                             [35] = { 51, 54 }, [36] = { 51, 54 }, [37] = { 51, 54 }, [110] = { 51, 54 },
                             [116] = { 51, 54 }, [118] = { 51, 54 }, [125] = { 51, 54 }, [136] = { 51, 54 },
                             [143] = { 51, 54 }, [146] = { 51, 54 }, [147] = { 51, 54 }, [172] = { 55, 58 },
                             [173] = { 55, 58 }, [174] = { 55, 58 }, [181] = { 55, 58 }, [188] = { 55, 58 },
                             [195] = { 55, 58 }, [233] = { 55, 58 }, [238] = { 55, 58 }, [239] = { 55, 58 },
                             [240] = { 55, 58 }, [249] = { 55, 58 }, [252] = { 55, 58 }, [255] = { 55, 58 },
                             [258] = { 55, 58 }, [262] = { 55, 58 }, [263] = { 55, 58 } },
            ph_for = { [249] = { 246 }, [252] = { 246 }, [255] = { 246 }, [258] = { 246 }, [262] = { 246 } },
            ph_rules = {
                [249] = {
                    [246] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.', 'Sandstorm weather is required when the PH despawns.' } },
                },
                [252] = {
                    [246] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.', 'Sandstorm weather is required when the PH despawns.' } },
                },
                [255] = {
                    [246] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.', 'Sandstorm weather is required when the PH despawns.' } },
                },
                [258] = {
                    [246] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.', 'Sandstorm weather is required when the PH despawns.' } },
                },
                [262] = {
                    [246] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.', 'Sandstorm weather is required when the PH despawns.' } },
                },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 100, item = 889 },  -- beetle shell
                { rate = 50, item = 894 },  -- beetle jaw
                { rate = 50, item = 1054 },  -- quicksand coffer key
            },
            links  = 5,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2530, [52] = 2612, [53] = 2694, [54] = 2776, [55] = 2858, [56] = 2940, [57] = 3022, [58] = 3104 }, mp = { [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Hi-Freq Field: Evasion down; Spoil: STR down', notes = { 'Hi-Freq Field: Evasion down. Source targeting: cone.', 'Spoil: STR down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[132], danger[135] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[19] },
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Hastatus',
            ids    = { 19, 25, 28, 41, 46, 51, 56, 59, 68, 74, 86, 92, 95, 99, 103, 106, 111, 114, 119, 122, 131,
                       134, 137, 140, 148, 151, 153, 166, 175, 178, 182, 185, 190, 197, 204, 207, 214, 217, 225,
                       234, 241, 247, 253, 256, 264, 268 },
            levels = {
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 35, chr = 47, dex = 62, def = 193,
                         attack_skill = 156, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 43, mnd = 37, chr = 48, dex = 63, def = 198,
                         attack_skill = 161, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 37, chr = 48, dex = 64, def = 203,
                         attack_skill = 166, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 37, chr = 49, dex = 65, def = 209,
                         attack_skill = 171, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 200, agi = 61, int = 44, mnd = 37, chr = 50, dex = 67, def = 214,
                         attack_skill = 176, resist = { virus = 20 } },
                [57] = { acc = 222, eva = 205, agi = 61, int = 46, mnd = 40, chr = 50, dex = 68, def = 219,
                         attack_skill = 181, resist = { virus = 20 } },
                [58] = { acc = 227, eva = 210, agi = 61, int = 46, mnd = 40, chr = 52, dex = 68, def = 224,
                         attack_skill = 186, resist = { virus = 20 } },
                [59] = { acc = 233, eva = 216, agi = 63, int = 47, mnd = 40, chr = 53, dex = 70, def = 230,
                         attack_skill = 191, resist = { virus = 20 } },
            },
            spawn_levels = { [19] = { 52, 55 }, [25] = { 52, 55 }, [28] = { 52, 55 }, [41] = { 52, 55 },
                             [46] = { 52, 55 }, [51] = { 52, 55 }, [56] = { 52, 55 }, [59] = { 52, 55 },
                             [68] = { 52, 55 }, [74] = { 52, 55 }, [86] = { 52, 55 }, [92] = { 52, 55 },
                             [95] = { 52, 55 }, [99] = { 52, 55 }, [103] = { 52, 55 }, [106] = { 52, 55 },
                             [111] = { 52, 55 }, [114] = { 52, 55 }, [119] = { 52, 55 }, [122] = { 52, 55 },
                             [131] = { 52, 55 }, [134] = { 52, 55 }, [137] = { 52, 55 }, [140] = { 52, 55 },
                             [148] = { 52, 55 }, [151] = { 52, 55 }, [153] = { 52, 55 }, [166] = { 52, 55 },
                             [175] = { 56, 59 }, [178] = { 56, 59 }, [182] = { 57, 59 }, [185] = { 56, 59 },
                             [190] = { 56, 59 }, [197] = { 56, 59 }, [204] = { 56, 59 }, [207] = { 56, 59 },
                             [214] = { 56, 59 }, [217] = { 56, 59 }, [225] = { 56, 59 }, [234] = { 56, 59 },
                             [241] = { 56, 59 }, [247] = { 56, 59 }, [253] = { 56, 59 }, [256] = { 56, 59 },
                             [264] = { 56, 59 }, [268] = { 56, 59 } },
            ph_for = { [225] = { 228 } },
            ph_rules = {
                [225] = {
                    [228] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 1540 },  -- dhalmel leather missive
                { rate = 50, item = 1054 },  -- quicksand coffer key
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [52] = 2688, [53] = 2772, [54] = 2855, [55] = 2939, [56] = 3022, [57] = 3106, [58] = 3189, [59] = 3273 }, mp = { [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[138],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Princeps',
            ids    = { 20, 26, 29, 34, 42, 47, 52, 57, 60, 69, 75, 87, 89, 96, 100, 107, 112, 120, 123, 127, 132,
                       135, 138, 141, 145, 149, 154, 167, 176, 179, 183, 186, 191, 193, 198, 200, 205, 208, 215,
                       226, 232, 235, 242, 244, 250, 254, 259, 260, 261, 265, 269 },
            job    = 'pld/pld',
            levels = {
                [52] = { acc = 189, eva = 170, agi = 38, int = 38, mnd = 50, chr = 56, dex = 53, def = 225,
                         attack_skill = 156 },
                [53] = { acc = 195, eva = 175, agi = 39, int = 39, mnd = 51, chr = 57, dex = 54, def = 231,
                         attack_skill = 161 },
                [54] = { acc = 200, eva = 180, agi = 39, int = 39, mnd = 52, chr = 58, dex = 54, def = 236,
                         attack_skill = 166 },
                [55] = { acc = 206, eva = 185, agi = 39, int = 39, mnd = 52, chr = 58, dex = 56, def = 242,
                         attack_skill = 171 },
                [56] = { acc = 211, eva = 190, agi = 41, int = 41, mnd = 54, chr = 61, dex = 56, def = 246,
                         attack_skill = 176 },
                [57] = { acc = 216, eva = 195, agi = 41, int = 41, mnd = 55, chr = 61, dex = 57, def = 252,
                         attack_skill = 181 },
                [58] = { acc = 222, eva = 200, agi = 41, int = 41, mnd = 55, chr = 61, dex = 59, def = 257,
                         attack_skill = 186 },
                [59] = { acc = 228, eva = 206, agi = 42, int = 42, mnd = 56, chr = 63, dex = 60, def = 263,
                         attack_skill = 191 },
            },
            spawn_levels = { [20] = { 52, 55 }, [26] = { 52, 55 }, [29] = { 52, 55 }, [34] = { 52, 55 },
                             [42] = { 52, 55 }, [47] = { 52, 55 }, [52] = { 52, 55 }, [57] = { 52, 55 },
                             [60] = { 52, 55 }, [69] = { 52, 55 }, [75] = { 52, 55 }, [87] = { 52, 55 },
                             [89] = { 52, 55 }, [96] = { 52, 55 }, [100] = { 52, 55 }, [107] = { 52, 55 },
                             [112] = { 52, 55 }, [120] = { 52, 55 }, [123] = { 52, 55 }, [127] = { 52, 55 },
                             [132] = { 52, 55 }, [135] = { 52, 55 }, [138] = { 52, 55 }, [141] = { 52, 55 },
                             [145] = { 52, 55 }, [149] = { 52, 55 }, [154] = { 52, 55 }, [167] = { 52, 55 },
                             [176] = { 56, 59 }, [179] = { 56, 59 }, [183] = { 56, 57 }, [186] = { 56, 59 },
                             [191] = { 56, 59 }, [193] = { 56, 59 }, [198] = { 56, 59 }, [200] = { 56, 59 },
                             [205] = { 56, 59 }, [208] = { 56, 59 }, [215] = { 56, 59 }, [226] = { 56, 59 },
                             [232] = { 56, 59 }, [235] = { 56, 59 }, [242] = { 56, 59 }, [244] = { 56, 59 },
                             [250] = { 56, 59 }, [254] = { 56, 59 }, [259] = { 56, 59 }, [260] = { 56, 59 },
                             [261] = { 56, 59 }, [265] = { 56, 59 }, [269] = { 56, 59 } },
            ph_for = { [96] = { 97 }, [112] = { 117 } },
            ph_rules = {
                [96] = {
                    [97] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [112] = {
                    [117] = { chance = 10, cooldown_min = 14400, cooldown_max = 14400, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 1540 },  -- dhalmel leather missive
                { rate = 50, item = 1054 },  -- quicksand coffer key
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [52] = 2612, [53] = 2694, [54] = 2776, [55] = 2858, [56] = 2940, [57] = 3022, [58] = 3104, [59] = 3186 }, mp = { [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[140],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Signifer',
            ids    = { 21, 27, 30, 43, 48, 53, 58, 70, 76, 88, 90, 93, 101, 104, 113, 115, 121, 124, 126, 133, 139,
                       142, 144, 150, 152, 155, 168, 177, 180, 184, 187, 192, 194, 199, 201, 206, 209, 216, 218,
                       227, 236, 243, 245, 248, 251, 257, 270 },
            job    = 'blm/blm',
            levels = {
                [52] = { acc = 194, eva = 163, agi = 56, int = 65, mnd = 41, chr = 50, dex = 62, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 199, eva = 167, agi = 57, int = 67, mnd = 42, chr = 52, dex = 63, def = 184,
                         attack_skill = 161 },
                [54] = { acc = 205, eva = 173, agi = 58, int = 67, mnd = 42, chr = 52, dex = 64, def = 189,
                         attack_skill = 166 },
                [55] = { acc = 210, eva = 177, agi = 58, int = 69, mnd = 43, chr = 52, dex = 65, def = 194,
                         attack_skill = 171 },
                [56] = { acc = 216, eva = 183, agi = 61, int = 70, mnd = 43, chr = 55, dex = 67, def = 198,
                         attack_skill = 176 },
                [57] = { acc = 222, eva = 187, agi = 61, int = 71, mnd = 44, chr = 55, dex = 68, def = 204,
                         attack_skill = 181 },
                [58] = { acc = 227, eva = 192, agi = 61, int = 71, mnd = 46, chr = 55, dex = 68, def = 210,
                         attack_skill = 186 },
                [59] = { acc = 233, eva = 197, agi = 63, int = 74, mnd = 46, chr = 57, dex = 70, def = 215,
                         attack_skill = 191 },
            },
            spawn_levels = { [21] = { 52, 55 }, [27] = { 52, 55 }, [30] = { 52, 55 }, [43] = { 52, 55 },
                             [48] = { 52, 55 }, [53] = { 52, 55 }, [58] = { 52, 55 }, [70] = { 52, 55 },
                             [76] = { 52, 55 }, [88] = { 52, 55 }, [90] = { 52, 55 }, [93] = { 52, 55 },
                             [101] = { 52, 55 }, [104] = { 52, 55 }, [113] = { 52, 55 }, [115] = { 52, 55 },
                             [121] = { 52, 55 }, [124] = { 52, 55 }, [126] = { 52, 55 }, [133] = { 52, 55 },
                             [139] = { 52, 55 }, [142] = { 52, 55 }, [144] = { 52, 55 }, [150] = { 52, 55 },
                             [152] = { 52, 55 }, [155] = { 52, 55 }, [168] = { 52, 55 }, [177] = { 56, 59 },
                             [180] = { 56, 59 }, [184] = { 56, 59 }, [187] = { 56, 59 }, [192] = { 56, 59 },
                             [194] = { 56, 59 }, [199] = { 56, 59 }, [201] = { 56, 59 }, [206] = { 56, 59 },
                             [209] = { 56, 59 }, [216] = { 56, 59 }, [218] = { 56, 59 }, [227] = { 56, 59 },
                             [236] = { 56, 59 }, [243] = { 56, 59 }, [245] = { 56, 59 }, [248] = { 56, 59 },
                             [251] = { 56, 59 }, [257] = { 56, 59 }, [270] = { 56, 59 } },
            ph_for = { [53] = { 54 }, [236] = { 237 } },
            ph_rules = {
                [53] = {
                    [54] = { chance = 10, cooldown_min = 9000, cooldown_max = 9000, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [236] = {
                    [237] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 100, item = 1980 },  -- jar of antican acid
                { rate = 100, item = 16995 },  -- piece of rotten meat
                { rate = 50, item = 1121 },  -- antican robe
                { rate = 50, item = 1054 },  -- quicksand coffer key
                { rate = 10, item = 644 },  -- chunk of mythril ore
                { rate = 10, item = 1477 },  -- xhifhut body
            },
            steal  = { 749 },  -- mythril beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [52] = 2345, [53] = 2421, [54] = 2497, [55] = 2574, [56] = 2650, [57] = 2726, [58] = 2802, [59] = 2879 }, mp = { [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga: area sleep; Sleepga II: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga: area sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40], danger[50], danger[51], danger[52], danger[53], danger[54], danger[143], danger[57], danger[62], danger[67], danger[72], danger[77], danger[82], danger[87], danger[88], danger[89], danger[93], danger[96], danger[101], danger[102], { kind = 'spell', id = 273, name = 'Sleepga', summary = 'Sleepga: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[104], level_ranges = { { 31, 55 } } }, danger[105] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[107] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sand Eater',
            ids    = { 22, 23, 24, 39, 40, 45, 50, 62, 66, 67, 73, 79, 83, 84, 85, 94, 98, 102, 105, 108, 109, 158,
                       160, 162, 165, 171, 220, 221, 266, 271, 274, 277 },
            job    = 'blm/rdm',
            levels = {
                [51] = { acc = 185, eva = 166, agi = 53, int = 66, mnd = 50, chr = 48, dex = 54, def = 174,
                         attack_skill = 151 },
                [52] = { acc = 190, eva = 171, agi = 53, int = 66, mnd = 50, chr = 48, dex = 54, def = 179,
                         attack_skill = 156 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 67, mnd = 51, chr = 49, dex = 55, def = 185,
                         attack_skill = 161 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 68, mnd = 51, chr = 49, dex = 56, def = 190,
                         attack_skill = 166 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 69, mnd = 52, chr = 50, dex = 56, def = 195,
                         attack_skill = 171 },
                [56] = { acc = 212, eva = 192, agi = 57, int = 71, mnd = 54, chr = 52, dex = 59, def = 199,
                         attack_skill = 176 },
                [57] = { acc = 217, eva = 196, agi = 57, int = 72, mnd = 54, chr = 52, dex = 59, def = 205,
                         attack_skill = 181 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 72, mnd = 55, chr = 53, dex = 59, def = 211,
                         attack_skill = 186 },
                [59] = { acc = 228, eva = 208, agi = 60, int = 74, mnd = 56, chr = 54, dex = 61, def = 216,
                         attack_skill = 191 },
            },
            spawn_levels = { [22] = { 51, 54 }, [23] = { 51, 54 }, [24] = { 51, 54 }, [39] = { 51, 54 },
                             [40] = { 51, 54 }, [45] = { 52, 55 }, [50] = { 52, 55 }, [62] = { 52, 55 },
                             [66] = { 52, 55 }, [67] = { 52, 55 }, [73] = { 52, 55 }, [79] = { 52, 55 },
                             [83] = { 52, 55 }, [84] = { 52, 55 }, [85] = { 52, 55 }, [94] = { 52, 55 },
                             [98] = { 52, 55 }, [102] = { 52, 55 }, [105] = { 52, 55 }, [108] = { 52, 55 },
                             [109] = { 52, 55 }, [158] = { 52, 55 }, [160] = { 52, 55 }, [162] = { 52, 55 },
                             [165] = { 52, 55 }, [171] = { 52, 55 }, [220] = { 56, 59 }, [221] = { 56, 59 },
                             [266] = { 56, 59 }, [271] = { 56, 59 }, [274] = { 56, 59 }, [277] = { 56, 59 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 1054 },  -- quicksand coffer key
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            links  = 7,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 2319, [52] = 2396, [53] = 2473, [54] = 2550, [55] = 2628, [56] = 2705, [57] = 2782, [58] = 2859, [59] = 2937 }, mp = { [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[168],
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Centurio X-I',
            ids    = { 54 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [56] = { acc = 216, eva = 183, agi = 61, int = 70, mnd = 43, chr = 55, dex = 67, def = 198,
                         attack_skill = 176 },
                [57] = { acc = 222, eva = 187, agi = 61, int = 71, mnd = 44, chr = 55, dex = 68, def = 204,
                         attack_skill = 181 },
                [58] = { acc = 227, eva = 192, agi = 61, int = 71, mnd = 46, chr = 55, dex = 68, def = 210,
                         attack_skill = 186 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1121 },  -- antican robe
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 150, item = 13803 },  -- shamans cloak
                { rate = 150, item = 4769 },  -- scroll of stone iii
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 4798 },  -- scroll of stonega ii
                { rate = 100, item = 4799 },  -- scroll of stonega iii
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 100, item = 4770 },  -- scroll of stone iv
                { rate = 50, item = 4818 },  -- scroll of quake
                { rate = 50, item = 646 },  -- chunk of adaman ore
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
            links  = 8,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 5500, [57] = 5500, [58] = 5500 }, mp = { [56] = 5500, [57] = 5500, [58] = 5500 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40], danger[50], danger[51], danger[52], danger[53], danger[54], danger[143], danger[57], danger[62], danger[67], danger[72], danger[77], danger[82], danger[87], danger[88], danger[89], danger[93], danger[96], danger[101], danger[102], danger[105] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[107] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Sabotender Bailaor',
            ids    = { 71, 72, 77, 78, 81, 82, 128, 129, 130, 156, 157, 159, 161, 163, 164, 169, 170, 202, 222, 223,
                       267, 272, 273, 275, 276 },
            job    = 'mnk/mnk',
            levels = {
                [52] = { acc = 191, eva = 178, agi = 45, int = 36, mnd = 48, chr = 51, dex = 57, def = 190,
                         attack_skill = 156 },
                [53] = { acc = 197, eva = 184, agi = 46, int = 36, mnd = 49, chr = 51, dex = 58, def = 196,
                         attack_skill = 161 },
                [54] = { acc = 202, eva = 189, agi = 47, int = 36, mnd = 49, chr = 52, dex = 58, def = 201,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 194, agi = 47, int = 37, mnd = 50, chr = 53, dex = 61, def = 207,
                         attack_skill = 171 },
                [56] = { acc = 213, eva = 200, agi = 48, int = 38, mnd = 52, chr = 54, dex = 61, def = 211,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 206, agi = 50, int = 38, mnd = 52, chr = 54, dex = 62, def = 217,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 211, agi = 50, int = 39, mnd = 53, chr = 56, dex = 63, def = 222,
                         attack_skill = 186 },
                [59] = { acc = 230, eva = 216, agi = 51, int = 39, mnd = 54, chr = 57, dex = 65, def = 228,
                         attack_skill = 191 },
            },
            spawn_levels = { [71] = { 52, 55 }, [72] = { 52, 55 }, [77] = { 52, 55 }, [78] = { 52, 55 },
                             [81] = { 52, 55 }, [82] = { 52, 55 }, [128] = { 52, 55 }, [129] = { 52, 55 },
                             [130] = { 52, 55 }, [156] = { 52, 55 }, [157] = { 52, 55 }, [159] = { 52, 55 },
                             [161] = { 52, 55 }, [163] = { 52, 55 }, [164] = { 52, 55 }, [169] = { 52, 55 },
                             [170] = { 52, 55 }, [202] = { 56, 59 }, [222] = { 56, 59 }, [223] = { 56, 59 },
                             [267] = { 56, 59 }, [272] = { 56, 59 }, [273] = { 56, 59 }, [275] = { 56, 59 },
                             [276] = { 56, 59 } },
            ph_for = { [78] = { 80 } },
            ph_rules = {
                [78] = {
                    [80] = { chance = 10, cooldown_min = 9000, cooldown_max = 9000, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1054 },  -- quicksand coffer key
                { rate = 100, item = 4509 },  -- flask of distilled water
                { rate = 100, item = 916 },  -- cactuar needle
                { rate = 100, item = 1817 },  -- cactus arm
                { rate = 100, item = 1236 },  -- bag of cactus stems
            },
            steal  = { 916 },  -- cactuar needle
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [52] = 2827, [53] = 2912, [54] = 2997, [55] = 3142, [56] = 3227, [57] = 3312, [58] = 3397, [59] = 3482 }, mp = { [52] = 0, [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sabotender Bailarin',
            ids    = { 80 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [59] = { acc = 230, eva = 216, agi = 51, int = 39, mnd = 54, chr = 57, dex = 65, def = 228,
                         attack_skill = 191 },
                [60] = { acc = 235, eva = 221, agi = 51, int = 39, mnd = 54, chr = 57, dex = 65, def = 233,
                         attack_skill = 196 },
                [61] = { acc = 240, eva = 226, agi = 53, int = 42, mnd = 57, chr = 59, dex = 67, def = 238,
                         attack_skill = 199 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 18138 },  -- bailathorn
                { rate = 150, item = 1592 },  -- cactuar root
                { rate = 240, item = 18138 },  -- bailathorn
                { rate = 150, item = 18138 },  -- bailathorn
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [59] = 7120, [60] = 7120, [61] = 7120 }, mp = { [59] = 0, [60] = 0, [61] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 9000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[170],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Praefectus',
            ids    = { 97 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [65] = { acc = 259, eva = 237, agi = 46, int = 46, mnd = 61, chr = 68, dex = 65, def = 295,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 20 },
            drops  = {
                { rate = 100, item = 16604 },  -- save the queen
                { rate = 1000, item = 644 },  -- chunk of mythril ore
                { rate = 1000, item = 1118 },  -- antican pauldron
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 9,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 5000 }, mp = { [65] = 5000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[115],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Sagittarius X-XIII',
            ids    = { 117 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [55] = { acc = 242, eva = 182, agi = 69, int = 49, mnd = 46, chr = 49, dex = 59, def = 199,
                         attack_skill = 171 },
                [56] = { acc = 248, eva = 188, agi = 70, int = 50, mnd = 48, chr = 50, dex = 61, def = 204,
                         attack_skill = 176 },
                [57] = { acc = 254, eva = 192, agi = 71, int = 50, mnd = 49, chr = 50, dex = 62, def = 209,
                         attack_skill = 181 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            drops  = {
                { rate = 1000, item = 1121 },  -- antican robe
                { rate = 240, item = 17199 },  -- loxley bow
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 10,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [55] = 6000, [56] = 6000, [57] = 6000 }, mp = { [55] = 0, [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[172],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Sand Lizard',
            ids    = { 189, 196, 203, 210, 211, 212, 213, 224, 229, 230, 231, 278, 279, 280, 284, 288, 293, 294,
                       306, 310, 314, 318, 319, 322, 333, 334, 357 },
            levels = {
                [56] = { acc = 215, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50, dex = 65, def = 214,
                         attack_skill = 176 },
                [57] = { acc = 220, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50, dex = 65, def = 219,
                         attack_skill = 181 },
                [58] = { acc = 225, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52, dex = 65, def = 224,
                         attack_skill = 186 },
                [59] = { acc = 231, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53, dex = 67, def = 230,
                         attack_skill = 191 },
            },
            spawn_levels = { [357] = { 57, 59 } },
            ph_for = { [213] = { 219 } },
            ph_rules = {
                [213] = {
                    [219] = { chance = 20, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.', 'Sandstorm weather is required when the PH despawns.' } },
                },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 50, item = 1054 },  -- quicksand coffer key
            },
            steal  = { 4362 },  -- lizard egg
            links  = 11,
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Hill Lizard (ID 307); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 3022, [57] = 3106, [58] = 3189, [59] = 3273 }, mp = { [56] = 0, [57] = 0, [58] = 0, [59] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[190],
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Nussknacker',
            ids    = { 219 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 47, chr = 53, dex = 67, def = 235,
                         attack_skill = 196 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55, dex = 70, def = 240,
                         attack_skill = 199 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 240, item = 926 },  -- lizard tail
                { rate = 100, item = 14064 },  -- sand gloves
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Ash Lizard (ID 306); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 6000, [61] = 6000 }, mp = { [60] = 0, [61] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[190],
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Magister',
            ids    = { 228 },
            nm     = true,
            levels = {
                [65] = { acc = 264, eva = 248, agi = 68, int = 52, mnd = 45, chr = 58, dex = 75, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 253, agi = 70, int = 52, mnd = 45, chr = 58, dex = 78, def = 265,
                         attack_skill = 218 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 20 },
            drops  = {
                { rate = 100, item = 16686 },  -- arcanabane
                { rate = 1000, item = 644 },  -- chunk of mythril ore
                { rate = 1000, item = 1118 },  -- antican pauldron
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 12,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 7700, [66] = 7700 }, mp = { [65] = 0, [66] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[42],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Antican Proconsul',
            ids    = { 237 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [65] = { acc = 264, eva = 227, agi = 68, int = 80, mnd = 51, chr = 62, dex = 75, def = 246,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 100, item = 4770 },  -- scroll of stone iv
                { rate = 100, item = 4799 },  -- scroll of stonega iii
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 13,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 6750 }, mp = { [65] = 6750 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[108],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Diamond Daig',
            ids    = { 246 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [70] = { acc = 283, eva = 260, agi = 45, int = 45, mnd = 69, chr = 69, dex = 65, def = 340,
                         attack_skill = 233 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            drops  = {
                { rate = 1000, item = 14063 },  -- protecting bangles
                { rate = 150, item = 889 },  -- beetle shell
                { rate = 150, item = 894 },  -- beetle jaw
                { rate = 150, item = 846 },  -- insect wing
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 14,
            info = {
                family = { value = 'Beetle / Vermin', notes = { 'Source species: Beetle (ID 429); family ID 182.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 13000 }, mp = { [70] = 2021 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 1200-2999; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Hi-Freq Field: Evasion down; Spoil: STR down; Flash: Flash', notes = { 'Hi-Freq Field: Evasion down. Source targeting: cone.', 'Spoil: STR down. Source targeting: single target.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[132], danger[135], danger[113] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[107] },
                blue = { value = 'Power Attack', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 551, name = 'Power Attack', level = 4, min_skill = 0, skill_ids = { 338 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Triarius',
            ids    = { 281, 285, 289, 295, 303, 305, 315, 325, 341, 345, 349, 353, 359, 369, 373, 378, 382, 386,
                       391, 408, 415, 422, 427, 434, 438, 443, 447, 452 },
            levels = {
                [62] = { acc = 248, eva = 232, agi = 66, int = 49, mnd = 42, chr = 55, dex = 73, def = 245,
                         attack_skill = 203, resist = { virus = 20 } },
                [63] = { acc = 253, eva = 237, agi = 66, int = 49, mnd = 42, chr = 55, dex = 73, def = 250,
                         attack_skill = 207, resist = { virus = 20 } },
                [64] = { acc = 259, eva = 243, agi = 68, int = 50, mnd = 42, chr = 56, dex = 75, def = 256,
                         attack_skill = 210, resist = { virus = 20 } },
                [65] = { acc = 264, eva = 248, agi = 68, int = 52, mnd = 45, chr = 58, dex = 75, def = 261,
                         attack_skill = 214, resist = { virus = 20 } },
                [66] = { acc = 271, eva = 253, agi = 70, int = 52, mnd = 45, chr = 58, dex = 78, def = 265,
                         attack_skill = 218, resist = { virus = 20 } },
                [67] = { acc = 275, eva = 258, agi = 71, int = 53, mnd = 45, chr = 59, dex = 78, def = 271,
                         attack_skill = 221, resist = { virus = 20 } },
                [68] = { acc = 280, eva = 263, agi = 71, int = 53, mnd = 45, chr = 60, dex = 79, def = 277,
                         attack_skill = 225, resist = { virus = 20 } },
                [69] = { acc = 286, eva = 269, agi = 72, int = 54, mnd = 47, chr = 60, dex = 80, def = 282,
                         attack_skill = 229, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 274, agi = 73, int = 55, mnd = 47, chr = 61, dex = 81, def = 287,
                         attack_skill = 233, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 279, agi = 75, int = 55, mnd = 47, chr = 63, dex = 83, def = 292,
                         attack_skill = 237, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 284, agi = 75, int = 55, mnd = 47, chr = 63, dex = 83, def = 297,
                         attack_skill = 241, resist = { virus = 25 } },
            },
            spawn_levels = { [281] = { 62, 65 }, [285] = { 62, 65 }, [289] = { 62, 65 }, [295] = { 62, 65 },
                             [303] = { 62, 65 }, [305] = { 62, 65 }, [315] = { 62, 65 }, [325] = { 62, 65 },
                             [345] = { 62, 65 }, [349] = { 62, 65 }, [359] = { 62, 65 }, [369] = { 66, 69 },
                             [373] = { 66, 69 }, [378] = { 66, 69 }, [382] = { 66, 69 }, [386] = { 66, 69 },
                             [391] = { 66, 69 }, [408] = { 66, 69 }, [415] = { 66, 69 }, [422] = { 66, 69 },
                             [427] = { 66, 69 }, [434] = { 69, 71 }, [438] = { 69, 71 }, [443] = { 69, 71 },
                             [447] = { 69, 72 }, [452] = { 69, 72 } },
            ph_for = { [341] = { 340 }, [345] = { 340 }, [349] = { 340 }, [353] = { 340 }, [373] = { 377 } },
            ph_rules = {
                [341] = {
                    [340] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [345] = {
                    [340] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [349] = {
                    [340] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [353] = {
                    [340] = { chance = 10, cooldown_min = 7200, cooldown_max = 7200, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [373] = {
                    [377] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1426 },  -- warriors testimony
                { rate = 50, item = 1118 },  -- antican pauldron
                { rate = 10, item = 645 },  -- chunk of darksteel ore
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3523, [63] = 3607, [64] = 3690, [65] = 3774, [66] = 3857, [67] = 3941, [68] = 4024, [69] = 4108, [70] = 4191, [71] = 4275, [72] = 4359 }, mp = { [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[138],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Antesignanus',
            ids    = { 282, 290, 297, 307, 308, 312, 320, 324, 343, 347, 351, 355, 371, 375, 380, 384, 388, 392,
                       400, 409, 416, 428, 432, 436, 439, 444, 449, 453 },
            job    = 'pld/pld',
            levels = {
                [62] = { acc = 243, eva = 221, agi = 45, int = 45, mnd = 59, chr = 66, dex = 62, def = 278,
                         attack_skill = 203 },
                [63] = { acc = 248, eva = 226, agi = 45, int = 45, mnd = 59, chr = 66, dex = 62, def = 284,
                         attack_skill = 207 },
                [64] = { acc = 253, eva = 232, agi = 46, int = 46, mnd = 60, chr = 68, dex = 63, def = 289,
                         attack_skill = 210 },
                [65] = { acc = 259, eva = 237, agi = 46, int = 46, mnd = 61, chr = 68, dex = 65, def = 295,
                         attack_skill = 214 },
                [66] = { acc = 265, eva = 241, agi = 47, int = 47, mnd = 63, chr = 70, dex = 66, def = 299,
                         attack_skill = 218 },
                [67] = { acc = 269, eva = 247, agi = 48, int = 48, mnd = 63, chr = 71, dex = 66, def = 305,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 252, agi = 48, int = 48, mnd = 63, chr = 71, dex = 68, def = 311,
                         attack_skill = 225 },
                [69] = { acc = 280, eva = 257, agi = 48, int = 48, mnd = 65, chr = 72, dex = 68, def = 316,
                         attack_skill = 229 },
                [70] = { acc = 285, eva = 262, agi = 49, int = 49, mnd = 65, chr = 73, dex = 69, def = 334,
                         attack_skill = 233 },
                [71] = { acc = 291, eva = 267, agi = 51, int = 51, mnd = 67, chr = 75, dex = 71, def = 340,
                         attack_skill = 237 },
                [72] = { acc = 296, eva = 272, agi = 51, int = 51, mnd = 67, chr = 75, dex = 71, def = 345,
                         attack_skill = 241 },
            },
            spawn_levels = { [282] = { 62, 65 }, [290] = { 62, 65 }, [297] = { 62, 65 }, [307] = { 62, 65 },
                             [308] = { 62, 65 }, [312] = { 62, 65 }, [320] = { 62, 65 }, [324] = { 62, 65 },
                             [343] = { 62, 65 }, [347] = { 62, 65 }, [351] = { 62, 65 }, [355] = { 62, 65 },
                             [371] = { 66, 69 }, [375] = { 66, 69 }, [380] = { 66, 69 }, [384] = { 66, 69 },
                             [388] = { 66, 69 }, [392] = { 66, 69 }, [400] = { 66, 69 }, [409] = { 66, 69 },
                             [416] = { 66, 69 }, [428] = { 66, 69 }, [432] = { 69, 71 }, [436] = { 69, 71 },
                             [439] = { 69, 71 }, [444] = { 69, 71 }, [449] = { 69, 72 }, [453] = { 69, 72 } },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 20 },
            drops  = {
                { rate = 100, item = 1432 },  -- paladins testimony
                { rate = 10, item = 645 },  -- chunk of darksteel ore
                { rate = 240, item = 16995 },  -- piece of rotten meat
                { rate = 50, item = 1118 },  -- antican pauldron
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3432, [63] = 3514, [64] = 3596, [65] = 3678, [66] = 3760, [67] = 3842, [68] = 3924, [69] = 4006, [70] = 4088, [71] = 4170, [72] = 4253 }, mp = { [62] = 1768, [63] = 1799, [64] = 1831, [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989, [70] = 2021, [71] = 2053, [72] = 2085 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[140],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Quaestor',
            ids    = { 283, 287, 292, 298, 309, 311, 313, 321, 342, 346, 350, 354, 360, 370, 374, 379, 383, 387,
                       393, 401, 410, 417, 423, 429, 435, 441, 446, 448, 450 },
            job    = 'blm/blm',
            levels = {
                [62] = { acc = 248, eva = 213, agi = 66, int = 76, mnd = 48, chr = 60, dex = 73, def = 230,
                         attack_skill = 203 },
                [63] = { acc = 253, eva = 217, agi = 66, int = 78, mnd = 48, chr = 60, dex = 73, def = 235,
                         attack_skill = 207 },
                [64] = { acc = 259, eva = 223, agi = 68, int = 79, mnd = 48, chr = 62, dex = 75, def = 240,
                         attack_skill = 210 },
                [65] = { acc = 264, eva = 227, agi = 68, int = 80, mnd = 51, chr = 62, dex = 75, def = 246,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 233, agi = 70, int = 80, mnd = 51, chr = 62, dex = 78, def = 250,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 237, agi = 71, int = 83, mnd = 51, chr = 65, dex = 78, def = 255,
                         attack_skill = 221 },
                [68] = { acc = 280, eva = 242, agi = 71, int = 83, mnd = 52, chr = 65, dex = 79, def = 261,
                         attack_skill = 225 },
                [69] = { acc = 286, eva = 247, agi = 72, int = 84, mnd = 53, chr = 65, dex = 80, def = 266,
                         attack_skill = 229 },
                [70] = { acc = 291, eva = 252, agi = 73, int = 85, mnd = 53, chr = 67, dex = 81, def = 271,
                         attack_skill = 233 },
                [71] = { acc = 297, eva = 257, agi = 75, int = 87, mnd = 55, chr = 67, dex = 83, def = 276,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 262, agi = 75, int = 87, mnd = 55, chr = 67, dex = 83, def = 281,
                         attack_skill = 241 },
            },
            spawn_levels = { [283] = { 62, 65 }, [287] = { 62, 65 }, [292] = { 62, 65 }, [298] = { 62, 65 },
                             [309] = { 62, 65 }, [311] = { 62, 65 }, [313] = { 62, 65 }, [321] = { 62, 65 },
                             [342] = { 62, 65 }, [346] = { 62, 65 }, [350] = { 62, 65 }, [354] = { 62, 65 },
                             [360] = { 62, 65 }, [370] = { 66, 69 }, [374] = { 66, 69 }, [379] = { 66, 69 },
                             [383] = { 66, 69 }, [387] = { 66, 69 }, [393] = { 66, 69 }, [401] = { 66, 69 },
                             [410] = { 66, 69 }, [417] = { 66, 69 }, [423] = { 66, 69 }, [429] = { 66, 69 },
                             [435] = { 69, 71 }, [441] = { 69, 71 }, [446] = { 69, 72 }, [448] = { 69, 72 },
                             [450] = { 69, 72 } },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 240, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 4770 },  -- scroll of stone iv
                { rate = 240, item = 1121 },  -- antican robe
                { rate = 100, item = 1429 },  -- black mages testimony
                { rate = 100, item = 4798 },  -- scroll of stonega ii
                { rate = 50, item = 4799 },  -- scroll of stonega iii
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3107, [63] = 3184, [64] = 3260, [65] = 3336, [66] = 3412, [67] = 3489, [68] = 3565, [69] = 3641, [70] = 3717, [71] = 3794, [72] = 3871 }, mp = { [62] = 1768, [63] = 1799, [64] = 1831, [65] = 1862, [66] = 1894, [67] = 1926, [68] = 1957, [69] = 1989, [70] = 2021, [71] = 2053, [72] = 2085 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poison II: Poison; Poisonga: area poison; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[44], danger[25], danger[30], danger[33], danger[46], danger[40], danger[49], danger[50], danger[51], danger[52], danger[53], danger[54], danger[143], danger[57], danger[191], danger[62], danger[67], danger[72], danger[77], danger[82], danger[87], danger[88], danger[89], danger[93], danger[96], danger[101], danger[102], danger[105] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[107] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Aedilis',
            ids    = { 286, 291, 296, 304, 316, 317, 344, 348, 352, 356, 372, 376, 381, 385, 389, 394, 411, 418,
                       424, 430, 433, 440, 445, 451, 454 },
            job    = 'rng/rng',
            levels = {
                [62] = { acc = 280, eva = 218, agi = 76, int = 55, mnd = 53, chr = 55, dex = 67, def = 235,
                         attack_skill = 203 },
                [63] = { acc = 285, eva = 223, agi = 78, int = 55, mnd = 53, chr = 55, dex = 67, def = 240,
                         attack_skill = 207 },
                [64] = { acc = 291, eva = 228, agi = 79, int = 56, mnd = 54, chr = 56, dex = 69, def = 246,
                         attack_skill = 210 },
                [65] = { acc = 296, eva = 233, agi = 80, int = 58, mnd = 55, chr = 58, dex = 69, def = 251,
                         attack_skill = 214 },
                [66] = { acc = 302, eva = 238, agi = 80, int = 58, mnd = 55, chr = 58, dex = 70, def = 255,
                         attack_skill = 218 },
                [67] = { acc = 307, eva = 243, agi = 83, int = 59, mnd = 57, chr = 59, dex = 72, def = 261,
                         attack_skill = 221 },
                [68] = { acc = 312, eva = 248, agi = 83, int = 60, mnd = 57, chr = 60, dex = 73, def = 267,
                         attack_skill = 225 },
                [69] = { acc = 317, eva = 253, agi = 84, int = 60, mnd = 58, chr = 60, dex = 73, def = 272,
                         attack_skill = 229 },
                [70] = { acc = 336, eva = 258, agi = 85, int = 61, mnd = 59, chr = 61, dex = 75, def = 277,
                         attack_skill = 233 },
                [71] = { acc = 341, eva = 263, agi = 87, int = 63, mnd = 59, chr = 63, dex = 75, def = 282,
                         attack_skill = 237 },
                [72] = { acc = 346, eva = 268, agi = 87, int = 63, mnd = 59, chr = 63, dex = 75, def = 287,
                         attack_skill = 241 },
            },
            spawn_levels = { [286] = { 62, 65 }, [291] = { 62, 65 }, [296] = { 62, 65 }, [304] = { 62, 65 },
                             [316] = { 62, 65 }, [317] = { 62, 65 }, [344] = { 62, 65 }, [348] = { 62, 65 },
                             [352] = { 62, 65 }, [356] = { 62, 65 }, [372] = { 66, 69 }, [376] = { 66, 69 },
                             [381] = { 66, 69 }, [385] = { 66, 69 }, [389] = { 66, 69 }, [394] = { 66, 69 },
                             [411] = { 66, 69 }, [418] = { 66, 69 }, [424] = { 66, 69 }, [430] = { 66, 69 },
                             [433] = { 69, 71 }, [440] = { 69, 71 }, [445] = { 69, 71 }, [451] = { 69, 72 },
                             [454] = { 69, 72 } },
            ph_for = { [296] = { 299 } },
            ph_rules = {
                [296] = {
                    [299] = { chance = 10, cooldown_min = 3600, cooldown_max = 3600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 20 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 50, item = 1121 },  -- antican robe
                { rate = 100, item = 1436 },  -- rangers testimony
                { rate = 10, item = 1476 },  -- bag of xhifhut strings
                { rate = 10, item = 5010 },  -- scroll of archers prelude
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3201, [63] = 3279, [64] = 3356, [65] = 3434, [66] = 3512, [67] = 3590, [68] = 3667, [69] = 3745, [70] = 3823, [71] = 3901, [72] = 3979 }, mp = { [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[138],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Tribunus',
            ids    = { 299 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [65] = { acc = 296, eva = 233, agi = 80, int = 58, mnd = 55, chr = 58, dex = 69, def = 251,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 20 },
            drops  = {
                { rate = 1000, item = 644 },  -- chunk of mythril ore
                { rate = 1000, item = 1121 },  -- antican robe
                { rate = 100, item = 17191 },  -- pharaohs bow
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 15,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 6850 }, mp = { [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 3000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[172],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Girtab',
            ids    = { 300, 301, 302, 326, 327, 328, 329, 335, 336, 337, 338, 339, 358, 362, 363, 395, 412, 419,
                       431 },
            levels = {
                [62] = { acc = 243, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55, dex = 63, def = 247,
                         attack_skill = 203 },
                [63] = { acc = 248, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55, dex = 63, def = 252,
                         attack_skill = 207 },
                [64] = { acc = 254, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56, dex = 64, def = 258,
                         attack_skill = 210 },
                [65] = { acc = 259, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58, dex = 65, def = 263,
                         attack_skill = 214 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 10, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3523, [63] = 3607, [64] = 3690, [65] = 3774 }, mp = { [62] = 0, [63] = 0, [64] = 0, [65] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[213],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sand Digger',
            ids    = { 323, 330, 331, 332 },
            job    = 'blm/rdm',
            levels = {
                [62] = { acc = 244, eva = 223, agi = 62, int = 77, mnd = 59, chr = 57, dex = 64, def = 231,
                         attack_skill = 203 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 78, mnd = 59, chr = 57, dex = 64, def = 236,
                         attack_skill = 207 },
                [64] = { acc = 255, eva = 233, agi = 64, int = 79, mnd = 60, chr = 58, dex = 66, def = 241,
                         attack_skill = 210 },
                [65] = { acc = 260, eva = 238, agi = 65, int = 80, mnd = 61, chr = 59, dex = 66, def = 247,
                         attack_skill = 214 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 50, item = 1147 },  -- rock of ancient salt
            },
            steal  = { 17296 },  -- pebble
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 7,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3168, [63] = 3246, [64] = 3323, [65] = 3400 }, mp = { [62] = 1768, [63] = 1799, [64] = 1831, [65] = 1862 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[168],
                blue = { value = 'Sandspin', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 524, name = 'Sandspin', level = 1, min_skill = 0, skill_ids = { 426 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Triarius X-XV',
            ids    = { 340 },
            nm     = true,
            levels = {
                [72] = { acc = 302, eva = 284, agi = 75, int = 55, mnd = 47, chr = 63, dex = 83, def = 297,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 290, agi = 76, int = 58, mnd = 50, chr = 64, dex = 84, def = 303,
                         attack_skill = 246 },
                [74] = { acc = 313, eva = 295, agi = 77, int = 58, mnd = 50, chr = 64, dex = 85, def = 308,
                         attack_skill = 251 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 25 },
            drops  = {
                { rate = 1000, item = 1118 },  -- antican pauldron
                { rate = 150, item = 16734 },  -- pendragon axe
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 16,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 11500, [73] = 11500, [74] = 11500 }, mp = { [72] = 0, [73] = 0, [74] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[42],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Spelunking Sabotender',
            ids    = { 361, 364, 365, 366, 367, 397, 398, 402, 405, 406, 442 },
            levels = {
                [62] = { acc = 243, eva = 234, agi = 70, int = 46, mnd = 46, chr = 59, dex = 63, def = 245,
                         attack_skill = 203 },
                [63] = { acc = 248, eva = 239, agi = 70, int = 46, mnd = 46, chr = 59, dex = 63, def = 250,
                         attack_skill = 207 },
                [64] = { acc = 254, eva = 245, agi = 72, int = 46, mnd = 46, chr = 60, dex = 64, def = 256,
                         attack_skill = 210 },
                [65] = { acc = 259, eva = 250, agi = 72, int = 49, mnd = 49, chr = 62, dex = 65, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 265, eva = 255, agi = 75, int = 49, mnd = 49, chr = 63, dex = 67, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 269, eva = 260, agi = 75, int = 49, mnd = 49, chr = 63, dex = 67, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 265, agi = 75, int = 50, mnd = 50, chr = 64, dex = 68, def = 277,
                         attack_skill = 225 },
            },
            spawn_levels = { [361] = { 62, 65 }, [364] = { 62, 65 }, [365] = { 62, 65 }, [366] = { 62, 65 },
                             [367] = { 62, 65 }, [397] = { 65, 68 }, [398] = { 65, 68 }, [402] = { 65, 68 },
                             [405] = { 65, 68 }, [406] = { 65, 68 }, [442] = { 65, 68 } },
            ph_for = { [398] = { 403 }, [402] = { 403 }, [406] = { 403 } },
            ph_rules = {
                [398] = {
                    [403] = { chance = 10, cooldown_min = 9000, cooldown_max = 9000, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [402] = {
                    [403] = { chance = 10, cooldown_min = 9000, cooldown_max = 9000, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
                [406] = {
                    [403] = { chance = 10, cooldown_min = 9000, cooldown_max = 9000, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 100, item = 916 },  -- cactuar needle
                { rate = 100, item = 1817 },  -- cactus arm
                { rate = 100, item = 1149 },  -- star spinel
                { rate = 100, item = 1236 },  -- bag of cactus stems
            },
            steal  = { 916 },  -- cactuar needle
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3523, [63] = 3607, [64] = 3690, [65] = 3774, [66] = 3857, [67] = 3941, [68] = 4024 }, mp = { [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[170],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sand Tarantula',
            ids    = { 368, 390, 396, 399, 404, 407, 413, 414, 420, 421, 425, 426 },
            levels = {
                [65] = { acc = 264, eva = 248, agi = 68, int = 56, mnd = 56, chr = 51, dex = 75, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 253, agi = 70, int = 57, mnd = 57, chr = 51, dex = 78, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 258, agi = 71, int = 57, mnd = 57, chr = 51, dex = 78, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 280, eva = 263, agi = 71, int = 57, mnd = 57, chr = 52, dex = 79, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 286, eva = 269, agi = 72, int = 59, mnd = 59, chr = 53, dex = 80, def = 282,
                         attack_skill = 229 },
            },
            spawn_levels = { [368] = { 65, 68 }, [390] = { 65, 68 }, [396] = { 65, 68 }, [399] = { 65, 68 },
                             [404] = { 65, 68 }, [407] = { 65, 68 }, [413] = { 65, 68 }, [414] = { 66, 69 },
                             [420] = { 66, 69 }, [421] = { 66, 69 }, [425] = { 65, 68 }, [426] = { 65, 68 } },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 100, item = 838 },  -- spider web
            },
            steal  = { 838 },  -- spider web
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3774, [66] = 3857, [67] = 3941, [68] = 4024, [69] = 4108 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[127],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hastatus XI-XII',
            ids    = { 377 },
            nm     = true,
            levels = {
                [65] = { acc = 264, eva = 248, agi = 68, int = 52, mnd = 45, chr = 58, dex = 75, def = 261,
                         attack_skill = 214 },
                [66] = { acc = 271, eva = 253, agi = 70, int = 52, mnd = 45, chr = 58, dex = 78, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 275, eva = 258, agi = 71, int = 53, mnd = 45, chr = 59, dex = 78, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 280, eva = 263, agi = 71, int = 53, mnd = 45, chr = 60, dex = 79, def = 277,
                         attack_skill = 225 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 20 },
            drops  = {
                { rate = 1000, item = 1479 },  -- xhifhut head
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 17,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 7000, [66] = 7000, [67] = 7000, [68] = 7000 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 650-1449; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[42],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Sabotender Bailarina',
            ids    = { 403 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [80] = { acc = 343, eva = 327, agi = 66, int = 51, mnd = 71, chr = 74, dex = 84, def = 340,
                         attack_skill = 281 },
                [81] = { acc = 350, eva = 332, agi = 69, int = 54, mnd = 73, chr = 76, dex = 87, def = 345,
                         attack_skill = 287 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 14168 },  -- dune boots
                { rate = 240, item = 1592 },  -- cactuar root
                { rate = 150, item = 1236 },  -- bag of cactus stems
                { rate = 150, item = 916 },  -- cactuar needle
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 18,
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 26680, [81] = 26680 }, mp = { [80] = 0, [81] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[170],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Antican Praetor',
            ids    = { 437, 455 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [72] = { acc = 302, eva = 262, agi = 75, int = 87, mnd = 55, chr = 67, dex = 83, def = 281,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 267, agi = 76, int = 89, mnd = 56, chr = 70, dex = 84, def = 287,
                         attack_skill = 246 },
                [74] = { acc = 313, eva = 272, agi = 77, int = 89, mnd = 56, chr = 70, dex = 85, def = 292,
                         attack_skill = 251 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 240, item = 645 },  -- chunk of darksteel ore
                { rate = 240, item = 1429 },  -- black mages testimony
                { rate = 100, item = 4770 },  -- scroll of stone iv
                { rate = 100, item = 4799 },  -- scroll of stonega iii
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 6,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3950, [73] = 3950, [74] = 3950 }, mp = { [72] = 3950, [73] = 3950, [74] = 3950 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = danger[214], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[107] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Antican Legatus',
            ids    = { 456 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [72] = { acc = 296, eva = 272, agi = 51, int = 51, mnd = 67, chr = 75, dex = 71, def = 345,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 278, agi = 52, int = 52, mnd = 68, chr = 76, dex = 72, def = 350,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 283, agi = 52, int = 52, mnd = 69, chr = 77, dex = 72, def = 355,
                         attack_skill = 251 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 20 },
            drops  = {
                { rate = 50, item = 17662 },  -- company sword
                { rate = 100, item = 1432 },  -- paladins testimony
                { rate = 1000, item = 645 },  -- chunk of darksteel ore
                { rate = 150, item = 1118 },  -- antican pauldron
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 19,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 4250, [73] = 4250, [74] = 4250 }, mp = { [72] = 4250, [73] = 4250, [74] = 4250 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[115],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Antican Consul',
            ids    = { 457 },
            nm     = true,
            levels = {
                [75] = { acc = 319, eva = 300, agi = 77, int = 58, mnd = 50, chr = 65, dex = 86, def = 313,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 25 },
            drops  = {
                { rate = 50, item = 16729 },  -- berserkers axe
                { rate = 1000, item = 1118 },  -- antican pauldron
                { rate = 1000, item = 645 },  -- chunk of darksteel ore
                { rate = 240, item = 1426 },  -- warriors testimony
                { rate = 10, item = 1118 },  -- antican pauldron
            },
            steal  = { 751 },  -- platinum beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 20,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 4800 }, mp = { [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 12000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[42],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Ancient Vessel',
            ids    = { 458 },
            nm     = true,
            job    = 'rdm/war',
            levels = {
                [72] = { acc = 298, eva = 279, agi = 64, int = 76, mnd = 73, chr = 71, dex = 75, def = 297,
                         attack_skill = 241 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 13, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            weapon_dmg = { blunt = 50, hand_to_hand = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Magic Pot / Arcana', notes = { 'Source species: Magic Pot (ID 69); family ID 31.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 12000 }, mp = { [72] = 2085 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 10 minutes', notes = { 'Source idle-despawn delay: 10 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: Stun; Mysterious Light: Weight; Mind Drain: MND down', notes = { 'Normal attacks: Stun. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Mysterious Light: Weight. Source targeting: area around the monster.', 'Mind Drain: MND down. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Stun', notes = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, removals = danger[91] } }, { kind = 'skill', id = 523, name = 'Mysterious Light', summary = 'Mysterious Light: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[28] } }, { kind = 'skill', id = 524, name = 'Mind Drain', summary = 'Mind Drain: MND down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'MND down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[19] },
                blue = { value = 'Mysterious Light', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 534, name = 'Mysterious Light', level = 40, min_skill = 92, skill_ids = { 523 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Tribunus VII-I',
            ids    = { 459 },
            nm     = true,
            levels = {
                [60] = { acc = 238, eva = 221, agi = 63, int = 47, mnd = 40, chr = 53, dex = 70, def = 235,
                         attack_skill = 196 },
                [61] = { acc = 243, eva = 227, agi = 66, int = 49, mnd = 42, chr = 55, dex = 73, def = 240,
                         attack_skill = 199 },
                [62] = { acc = 248, eva = 232, agi = 66, int = 49, mnd = 42, chr = 55, dex = 73, def = 245,
                         attack_skill = 203 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { virus = 20 },
            drops  = {
                { rate = 1000, item = 1118 },  -- antican pauldron
                { rate = 150, item = 17924 },  -- tungi
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 100, item = 645 },  -- chunk of darksteel ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 21,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [60] = 10500, [61] = 10500, [62] = 10500 }, mp = { [60] = 0, [61] = 0, [62] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Antican Tag to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 15 minutes', notes = { 'Source idle-despawn delay: 15 minutes. This is not its remaining lifetime.' } },
                dangers = danger[42],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Proconsul XII',
            ids    = { 460 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [70] = { acc = 285, eva = 262, agi = 49, int = 49, mnd = 65, chr = 73, dex = 69, def = 334,
                         attack_skill = 233 },
                [71] = { acc = 291, eva = 267, agi = 51, int = 51, mnd = 67, chr = 75, dex = 71, def = 340,
                         attack_skill = 237 },
                [72] = { acc = 296, eva = 272, agi = 51, int = 51, mnd = 67, chr = 75, dex = 71, def = 345,
                         attack_skill = 241 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 20 },
            drops  = {
                { rate = 1000, item = 1118 },  -- antican pauldron
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 1000, item = 643 },  -- chunk of iron ore
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 645 },  -- chunk of darksteel ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
                { rate = 50, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 17651 },  -- dainslaif
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 22,
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 11500, [71] = 11500, [72] = 11500 }, mp = { [70] = 11500, [71] = 11500, [72] = 11500 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Base gil 6000; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[115],
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Girtablulu',
            ids    = { 461 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69, dex = 78, def = 341,
                         attack_skill = 281 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [80] = 10000 }, mp = { [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[213],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Malleator Maurok',
            ids    = { 462, 468 },
            nm     = true,
            levels = {
                [99] = { acc = 472, eva = 427, agi = 101, int = 76, mnd = 76, chr = 85, dex = 96, def = 441,
                         attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [99] = 6627 }, mp = { [99] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[213],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Peon Pounder',
            ids    = { 463, 464, 469, 470 },
            nm     = true,
            levels = {
                [99] = { acc = 472, eva = 427, agi = 101, int = 76, mnd = 76, chr = 85, dex = 96, def = 441,
                         attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [99] = 6627 }, mp = { [99] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[213],
                blue = { value = 'Death Scissors', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 554, name = 'Death Scissors', level = 60, min_skill = 172, skill_ids = { 353 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Centurio XX-I',
            ids    = { 471, 472, 473 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [99] = { acc = 480, eva = 396, agi = 101, int = 118, mnd = 74, chr = 92, dex = 112, def = 420,
                         attack_skill = 404 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Antica / Beastmen', notes = { 'Source species: Antica (ID 117); family ID 55.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [99] = 5943 }, mp = { [99] = 2962 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Spikeball: Poison; Shoulder Slam: can crit; Magnetite Cloud: Weight; Sandstorm: Blindness; Sand Trap: petrification; Jamming Wave: Silence; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Spikeball: Poison. Source targeting: single target.', 'Shoulder Slam: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Magnetite Cloud: Weight. Source targeting: cone.', 'Sandstorm: Blindness. Source targeting: area around the monster.', 'Sand Trap: petrification. Physical damage that ignores shadows. On a successful damage result it attempts Petrification and makes the target\'s enmity inactive; this is not a full enmity reset. Source targeting: area around the monster. Possible effects: Petrification.', 'Jamming Wave: Silence. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = danger[214], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[107] },
                blue = { value = 'Magnetite Cloud', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 555, name = 'Magnetite Cloud', level = 46, min_skill = 110, skill_ids = { 791 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Spelunking Sabotender',
            ids    = { 474, 475 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [139] = { acc = 495, eva = 639, agi = 113, int = 87, mnd = 120, chr = 125, dex = 143, def = 654,
                          attack_skill = 404 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 10376 }, mp = { [139] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[170],
                blue = { value = '1000 Needles', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 595, name = '1000 Needles', level = 62, min_skill = 181, skill_ids = { 322 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sand Tarantula',
            ids    = { 476, 477 },
            nm     = true,
            levels = {
                [139] = { acc = 501, eva = 638, agi = 139, int = 113, mnd = 113, chr = 102, dex = 154, def = 647,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 9987 }, mp = { [139] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[127],
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Sand Lizard',
            ids    = { 478, 479 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 638, agi = 139, int = 105, mnd = 105, chr = 117, dex = 147, def = 647,
                          attack_skill = 404 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            info = {
                family = { value = 'Lizard / Lizard', notes = { 'Source species: Hill Lizard (ID 307); family ID 126.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 9987 }, mp = { [139] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[190],
                blue = { value = 'Infrasonics', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 610, name = 'Infrasonics', level = 65, min_skill = 196, skill_ids = { 372 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Uran-Mafran',
            ids    = { 480 },
            nm     = true,
            levels = {
                [139] = { acc = 505, eva = 646, agi = 154, int = 105, mnd = 98, chr = 102, dex = 162, def = 647,
                          attack_skill = 404 },
            },
            info = {
                family = { value = 'Tarutaru / Humanoid', notes = { 'Source species: Tarutaru (ID 297); family ID 121.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 9987 }, mp = { [139] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[170],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
