-- Monastic Cavern (zone 150).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[3] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[4] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[5] = { notes = danger[3], unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[4] };
danger[6] = { kind = 'skill', id = 605, name = 'Aerial Wheel', summary = 'Aerial Wheel: Stun', notes = danger[2], categories = { 'debuff' }, effects = { 'Stun' }, details = danger[5] };
danger[7] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[8] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[9] = { danger[8] };
danger[10] = { notes = danger[7], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[9] };
danger[11] = { kind = 'skill', id = 607, name = 'Slam Dunk', summary = 'Slam Dunk: Bind', notes = danger[2], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[10] };
danger[12] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 4 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[13] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[14] = { danger[13] };
danger[15] = { notes = danger[12], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'absorb', per_hit = true, count = 4 } }, removals = danger[14] };
danger[16] = { kind = 'skill', id = 609, name = 'Battle Dance', summary = 'Battle Dance: DEX down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[15] };
danger[17] = { danger[6], danger[11], danger[16] };
danger[18] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[19] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down', notes = danger[1], entries = danger[17], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] };
danger[20] = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[21] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Flash: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[22] = { { effect = 'Flash', options = { 'Erase (one random eligible timed ailment)' } } };
danger[23] = { notes = danger[21], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[22] };
danger[24] = { kind = 'spell', id = 112, name = 'Flash', summary = 'Flash: Flash', notes = {  }, categories = { 'debuff' }, effects = { 'Flash' }, details = danger[23], level_ranges = { { 37, 255 } } };
danger[25] = { danger[6], danger[11], danger[16], danger[24] };
danger[26] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[27] = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flash: Flash', notes = danger[20], entries = danger[25], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[26] };
danger[28] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[29] = { notes = danger[28], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[30] = { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[29], level_ranges = { { 46, 255 } } };
danger[31] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[32] = { notes = danger[31], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[33] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[32], level_ranges = { { 10, 255 } } };
danger[34] = { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[32], level_ranges = { { 20, 255 } } };
danger[35] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[36] = { notes = danger[35], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[4] };
danger[37] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[36], level_ranges = { { 37, 255 } } };
danger[38] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[39] = { notes = danger[38], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[9] };
danger[40] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[39], level_ranges = { { 20, 255 } } };
danger[41] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[32], level_ranges = { { 56, 255 } } };
danger[42] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[43] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[44] = { danger[43] };
danger[45] = { notes = danger[42], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[44] };
danger[46] = { kind = 'spell', id = 266, name = 'Absorb-Str', summary = 'Absorb-Str: STR down', notes = {  }, categories = { 'debuff' }, effects = { 'STR down' }, details = danger[45], level_ranges = { { 43, 255 } } };
danger[47] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: DEX down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[48] = { notes = danger[47], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[14] };
danger[49] = { kind = 'spell', id = 267, name = 'Absorb-Dex', summary = 'Absorb-Dex: DEX down', notes = {  }, categories = { 'debuff' }, effects = { 'DEX down' }, details = danger[48], level_ranges = { { 41, 255 } } };
danger[50] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[51] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[52] = { danger[51] };
danger[53] = { notes = danger[50], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[52] };
danger[54] = { kind = 'spell', id = 268, name = 'Absorb-Vit', summary = 'Absorb-Vit: VIT down', notes = {  }, categories = { 'debuff' }, effects = { 'VIT down' }, details = danger[53], level_ranges = { { 35, 255 } } };
danger[55] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: AGI down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[57] = { danger[56] };
danger[58] = { notes = danger[55], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[57] };
danger[59] = { kind = 'spell', id = 269, name = 'Absorb-Agi', summary = 'Absorb-Agi: AGI down', notes = {  }, categories = { 'debuff' }, effects = { 'AGI down' }, details = danger[58], level_ranges = { { 37, 255 } } };
danger[60] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: INT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[61] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { danger[61] };
danger[63] = { notes = danger[60], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[62] };
danger[64] = { kind = 'spell', id = 270, name = 'Absorb-Int', summary = 'Absorb-Int: INT down', notes = {  }, categories = { 'debuff' }, effects = { 'INT down' }, details = danger[63], level_ranges = { { 39, 255 } } };
danger[65] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[66] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[67] = { danger[66] };
danger[68] = { notes = danger[65], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[67] };
danger[69] = { kind = 'spell', id = 271, name = 'Absorb-Mnd', summary = 'Absorb-Mnd: MND down', notes = {  }, categories = { 'debuff' }, effects = { 'MND down' }, details = danger[68], level_ranges = { { 31, 255 } } };
danger[70] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: CHR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[71] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[72] = { danger[71] };
danger[73] = { notes = danger[70], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[72] };
danger[74] = { kind = 'spell', id = 272, name = 'Absorb-Chr', summary = 'Absorb-Chr: CHR down', notes = {  }, categories = { 'debuff' }, effects = { 'CHR down' }, details = danger[73], level_ranges = { { 33, 255 } } };
danger[75] = { kind = 'spell', id = 275, name = 'Absorb-Tp', summary = 'Absorb-Tp: TP drain', notes = {  }, categories = { 'drain' }, effects = { 'TP drain' }, details = danger[32], level_ranges = { { 45, 255 } } };
danger[76] = { kind = 'spell', id = 206, name = 'Freeze', summary = 'Freeze: Fire magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Fire magic evasion down' }, details = danger[32], level_ranges = { { 50, 255 } } };
danger[77] = { kind = 'spell', id = 210, name = 'Quake', summary = 'Quake: Wind magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Wind magic evasion down' }, details = danger[32], level_ranges = { { 54, 255 } } };
danger[78] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[79] = { notes = danger[78], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[80] = { kind = 'spell', id = 245, name = 'Drain', summary = 'Drain: HP drain', notes = {  }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[32], level_ranges = { { 12, 255 } } };
danger[81] = { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[36], level_ranges = { { 45, 255 } } };
danger[82] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[83] = { notes = danger[82], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[84] = { kind = 'spell', id = 254, name = 'Blind', summary = 'Blind: Blindness', notes = {  }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[83], level_ranges = { { 4, 255 } } };
danger[85] = { kind = 'spell', id = 258, name = 'Bind', summary = 'Bind: bind', notes = { 'Possible effects: Bind.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = danger[39], level_ranges = { { 7, 255 } } };
danger[86] = { kind = 'spell', id = 259, name = 'Sleep II', summary = 'Sleep II: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[32], level_ranges = { { 41, 255 } } };
danger[87] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 10 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' };
danger[88] = { notes = danger[87], unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 10.0, shadows = { { mode = 'wipe' } } };
danger[89] = { kind = 'spell', id = 274, name = 'Sleepga II', summary = 'Sleepga II: area sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[88], level_ranges = { { 56, 255 } } };
danger[90] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                      'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Predator',
                      'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker' },
            true_sight = { 'Orcish Hexspinner', 'Orcish Overlord', 'Orcish Warlord', 'Overlord Bakgodek' },
        },
        [2] = {
            sight = { 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                      'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Predator',
                      'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker' },
            true_sight = { 'Orcish Overlord', 'Orcish Warlord', 'Overlord Bakgodek' },
        },
        [3] = {
            sight = { 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                      'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Predator',
                      'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker' },
            true_sight = { 'Orcish Hexspinner', 'Orcish Warlord', 'Overlord Bakgodek' },
        },
        [4] = {
            sight = { 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                      'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Predator',
                      'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker' },
            true_sight = { 'Orcish Hexspinner', 'Orcish Overlord', 'Orcish Warlord' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Orcish Bowshooter'] = { id = 63, name = 'Orc' },
        ['Orcish Champion'] = { id = 63, name = 'Orc' },
        ['Orcish Dragoon'] = { id = 63, name = 'Orc' },
        ['Orcish Dreadnought'] = { id = 63, name = 'Orc' },
        ['Orcish Farkiller'] = { id = 63, name = 'Orc' },
        ['Orcish Footsoldier'] = { id = 63, name = 'Orc' },
        ['Orcish Gladiator'] = { id = 63, name = 'Orc' },
        ['Orcish Hexspinner'] = { id = 63, name = 'Orc' },
        ['Orcish Overlord'] = { id = 63, name = 'Orc' },
        ['Orcish Predator'] = { id = 63, name = 'Orc' },
        ['Orcish Protector'] = { id = 63, name = 'Orc' },
        ['Orcish Trooper'] = { id = 63, name = 'Orc' },
        ['Orcish Veteran'] = { id = 63, name = 'Orc' },
        ['Orcish Warchief'] = { id = 63, name = 'Orc' },
        ['Orcish Warlord'] = { id = 63, name = 'Orc' },
        ['Orcish Zerker'] = { id = 63, name = 'Orc' },
        ['Overlord Bakgodek'] = { id = 63, name = 'Orc' },
    },
    monsters = {
        {
            name   = 'Orcish Bowshooter',
            ids    = { 1, 5, 9, 17, 168, 172, 178, 182 },
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
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Footsoldier',
            ids    = { 2, 6, 10, 18, 169, 173, 179, 183 },
            levels = {
                [43] = { acc = 156, eva = 144, agi = 44, int = 28, mnd = 31, chr = 41, dex = 49, def = 160,
                         attack_skill = 126 },
                [44] = { acc = 161, eva = 148, agi = 47, int = 28, mnd = 31, chr = 42, dex = 52, def = 164,
                         attack_skill = 129 },
                [45] = { acc = 164, eva = 151, agi = 47, int = 31, mnd = 34, chr = 43, dex = 52, def = 167,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 155, agi = 48, int = 31, mnd = 34, chr = 44, dex = 54, def = 170,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 157, agi = 49, int = 31, mnd = 34, chr = 44, dex = 54, def = 173,
                         attack_skill = 138 },
            },
            spawn_levels = { [10] = { 44, 47 }, [18] = { 44, 47 }, [169] = { 44, 44 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [43] = 1979, [44] = 2066, [45] = 2148, [46] = 2235, [47] = 2322 }, mp = { [43] = 0, [44] = 0, [45] = 0, [46] = 0, [47] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Gladiator',
            ids    = { 3, 7, 11, 19, 170, 174, 180, 184 },
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
            spawn_levels = { [11] = { 47, 48 }, [180] = { 47, 48 } },
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
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Trooper',
            ids    = { 4, 8, 12, 20, 171, 175, 181, 185 },
            job    = 'pld/war',
            levels = {
                [45] = { acc = 161, eva = 146, agi = 36, int = 28, mnd = 42, chr = 48, dex = 47, def = 184,
                         attack_skill = 132 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2102, [46] = 2188, [47] = 2274, [48] = 2360, [49] = 2441 }, mp = { [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Veteran',
            ids    = { 13, 21, 25, 29, 33, 37, 41, 45, 49, 55, 59, 63, 67, 71, 77, 81, 85, 90, 94, 166 },
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
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Predator',
            ids    = { 14, 22, 26, 30, 34, 38, 42, 46, 50, 56, 60, 64, 68, 72, 78, 82, 86, 91, 95, 176 },
            job    = 'rng/war',
            levels = {
                [53] = { acc = 233, eva = 188, agi = 64, int = 40, mnd = 46, chr = 51, dex = 60, def = 200,
                         attack_skill = 161, resist = { poison = 15, virus = 15 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [53] = 2719, [54] = 2802, [55] = 2886, [56] = 2969, [57] = 3053 }, mp = { [53] = 0, [54] = 0, [55] = 0, [56] = 0, [57] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Zerker',
            ids    = { 15, 23, 27, 31, 35, 39, 43, 47, 51, 57, 61, 65, 69, 73, 79, 83, 87, 92, 96, 177 },
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
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[6], danger[11], danger[16], danger[30], danger[33], danger[34], danger[37], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[32], level_ranges = { { 30, 55 } } }, danger[40], danger[41], danger[46], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[26] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Warchief',
            ids    = { 16, 24, 28, 32, 36, 40, 44, 48, 52, 58, 62, 66, 70, 74, 80, 84, 88, 93, 97, 167 },
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
                dangers = danger[27],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Farkiller',
            ids    = { 53, 75, 98, 102, 106, 112, 116, 120, 124, 128, 132, 136, 140, 145, 152, 157, 162 },
            job    = 'rng/war',
            levels = {
                [62] = { acc = 281, eva = 235, agi = 73, int = 46, mnd = 53, chr = 59, dex = 69, def = 247,
                         attack_skill = 203, resist = { poison = 20, virus = 20 } },
                [63] = { acc = 286, eva = 241, agi = 74, int = 46, mnd = 53, chr = 59, dex = 69, def = 252,
                         attack_skill = 207, resist = { poison = 20, virus = 20 } },
                [64] = { acc = 292, eva = 246, agi = 75, int = 46, mnd = 54, chr = 60, dex = 71, def = 258,
                         attack_skill = 210, resist = { poison = 20, virus = 20 } },
                [65] = { acc = 297, eva = 252, agi = 76, int = 49, mnd = 56, chr = 62, dex = 71, def = 263,
                         attack_skill = 214, resist = { poison = 20, virus = 20 } },
                [66] = { acc = 303, eva = 256, agi = 77, int = 49, mnd = 56, chr = 63, dex = 73, def = 267,
                         attack_skill = 218, resist = { poison = 20, virus = 20 } },
                [67] = { acc = 308, eva = 262, agi = 79, int = 49, mnd = 57, chr = 63, dex = 74, def = 273,
                         attack_skill = 221, resist = { poison = 20, virus = 20 } },
                [68] = { acc = 313, eva = 267, agi = 79, int = 50, mnd = 58, chr = 64, dex = 75, def = 278,
                         attack_skill = 225, resist = { poison = 20, virus = 20 } },
                [69] = { acc = 318, eva = 273, agi = 80, int = 51, mnd = 58, chr = 65, dex = 75, def = 283,
                         attack_skill = 229, resist = { poison = 20, virus = 20 } },
                [70] = { acc = 337, eva = 278, agi = 81, int = 51, mnd = 59, chr = 65, dex = 77, def = 289,
                         attack_skill = 233, resist = { poison = 20, virus = 25 } },
                [71] = { acc = 343, eva = 283, agi = 83, int = 52, mnd = 60, chr = 68, dex = 78, def = 293,
                         attack_skill = 237, resist = { poison = 20, virus = 25 } },
                [72] = { acc = 348, eva = 288, agi = 83, int = 52, mnd = 60, chr = 68, dex = 78, def = 298,
                         attack_skill = 241, resist = { poison = 20, virus = 25 } },
            },
            spawn_levels = { [53] = { 62, 66 }, [75] = { 62, 66 }, [98] = { 62, 66 }, [102] = { 62, 66 },
                             [112] = { 62, 66 }, [116] = { 62, 66 }, [120] = { 62, 66 }, [124] = { 62, 66 },
                             [128] = { 69, 71 }, [136] = { 69, 71 }, [140] = { 69, 71 }, [145] = { 69, 71 },
                             [152] = { 71, 72 }, [157] = { 71, 72 }, [162] = { 71, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [62] = 3470, [63] = 3554, [64] = 3637, [65] = 3721, [66] = 3804, [67] = 3888, [68] = 3971, [69] = 4055, [70] = 4138, [71] = 4222, [72] = 4306 }, mp = { [62] = 0, [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Dreadnought',
            ids    = { 54, 76, 99, 103, 107, 110, 113, 117, 121, 125, 129, 133, 137, 141, 146, 153, 158, 163 },
            levels = {
                [63] = { acc = 253, eva = 237, agi = 66, int = 42, mnd = 46, chr = 59, dex = 73, def = 252,
                         attack_skill = 207, resist = { virus = 20 } },
                [64] = { acc = 259, eva = 243, agi = 68, int = 42, mnd = 46, chr = 60, dex = 75, def = 258,
                         attack_skill = 210, resist = { virus = 20 } },
                [65] = { acc = 264, eva = 248, agi = 68, int = 45, mnd = 49, chr = 62, dex = 75, def = 263,
                         attack_skill = 214, resist = { virus = 20 } },
                [66] = { acc = 271, eva = 253, agi = 70, int = 45, mnd = 49, chr = 63, dex = 78, def = 267,
                         attack_skill = 218, resist = { virus = 20 } },
                [67] = { acc = 275, eva = 258, agi = 71, int = 45, mnd = 49, chr = 63, dex = 78, def = 273,
                         attack_skill = 221, resist = { virus = 20 } },
                [68] = { acc = 280, eva = 263, agi = 71, int = 45, mnd = 50, chr = 64, dex = 79, def = 278,
                         attack_skill = 225, resist = { virus = 20 } },
                [69] = { acc = 286, eva = 269, agi = 72, int = 47, mnd = 51, chr = 65, dex = 80, def = 283,
                         attack_skill = 229, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 274, agi = 73, int = 47, mnd = 51, chr = 65, dex = 81, def = 289,
                         attack_skill = 233, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 279, agi = 75, int = 47, mnd = 52, chr = 68, dex = 83, def = 293,
                         attack_skill = 237, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 284, agi = 75, int = 47, mnd = 52, chr = 68, dex = 83, def = 298,
                         attack_skill = 241, resist = { virus = 25 } },
            },
            spawn_levels = { [54] = { 63, 66 }, [76] = { 63, 66 }, [99] = { 63, 66 }, [103] = { 63, 66 },
                             [107] = { 63, 66 }, [110] = { 63, 66 }, [113] = { 63, 66 }, [117] = { 63, 66 },
                             [121] = { 63, 66 }, [125] = { 63, 66 }, [133] = { 69, 71 }, [137] = { 69, 71 },
                             [141] = { 69, 71 }, [146] = { 71, 72 }, [158] = { 71, 72 }, [163] = { 71, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3787, [64] = 3874, [65] = 3962, [66] = 4049, [67] = 4138, [68] = 4225, [69] = 4313, [70] = 4400, [71] = 4488, [72] = 4576 }, mp = { [63] = 0, [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Champion',
            ids    = { 89, 100, 104, 108, 114, 118, 122, 126, 130, 134, 138, 142, 147, 154, 159, 164 },
            job    = 'mnk/war',
            levels = {
                [64] = { acc = 261, eva = 243, agi = 56, int = 39, mnd = 54, chr = 60, dex = 78, def = 263,
                         attack_skill = 210, resist = { virus = 20 } },
                [65] = { acc = 266, eva = 248, agi = 57, int = 41, mnd = 56, chr = 62, dex = 78, def = 269,
                         attack_skill = 214, resist = { virus = 20 } },
                [66] = { acc = 272, eva = 254, agi = 58, int = 42, mnd = 56, chr = 63, dex = 81, def = 273,
                         attack_skill = 218, resist = { virus = 20 } },
                [67] = { acc = 276, eva = 259, agi = 59, int = 42, mnd = 57, chr = 63, dex = 81, def = 279,
                         attack_skill = 221, resist = { virus = 20 } },
                [68] = { acc = 282, eva = 264, agi = 59, int = 42, mnd = 58, chr = 64, dex = 83, def = 284,
                         attack_skill = 225, resist = { virus = 20 } },
                [69] = { acc = 287, eva = 270, agi = 60, int = 43, mnd = 58, chr = 65, dex = 83, def = 290,
                         attack_skill = 229, resist = { virus = 20 } },
                [70] = { acc = 293, eva = 275, agi = 61, int = 43, mnd = 59, chr = 65, dex = 85, def = 295,
                         attack_skill = 233, resist = { virus = 25 } },
                [71] = { acc = 299, eva = 280, agi = 62, int = 44, mnd = 60, chr = 68, dex = 86, def = 300,
                         attack_skill = 237, resist = { virus = 25 } },
                [72] = { acc = 304, eva = 285, agi = 62, int = 44, mnd = 60, chr = 68, dex = 86, def = 305,
                         attack_skill = 241, resist = { virus = 25 } },
            },
            spawn_levels = { [89] = { 64, 68 }, [100] = { 64, 68 }, [104] = { 64, 68 }, [108] = { 64, 68 },
                             [118] = { 64, 68 }, [122] = { 64, 68 }, [126] = { 64, 68 }, [130] = { 69, 71 },
                             [134] = { 69, 71 }, [138] = { 69, 71 }, [142] = { 69, 71 }, [154] = { 70, 72 },
                             [159] = { 70, 72 }, [164] = { 70, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [64] = 4068, [65] = 4158, [66] = 4246, [67] = 4335, [68] = 4423, [69] = 4512, [70] = 4664, [71] = 4753, [72] = 4842 }, mp = { [64] = 0, [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 250 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Dragoon',
            ids    = { 101, 105, 109, 115, 119, 123, 127, 131, 135, 139, 143, 148, 155, 160, 165 },
            job    = 'drg/war',
            levels = {
                [65] = { acc = 284, eva = 252, agi = 64, int = 45, mnd = 53, chr = 69, dex = 71, def = 265,
                         attack_skill = 214, resist = { virus = 20 } },
                [66] = { acc = 290, eva = 257, agi = 65, int = 45, mnd = 53, chr = 71, dex = 73, def = 269,
                         attack_skill = 218, resist = { virus = 20 } },
                [67] = { acc = 295, eva = 263, agi = 67, int = 45, mnd = 53, chr = 71, dex = 74, def = 275,
                         attack_skill = 221, resist = { virus = 20 } },
                [68] = { acc = 300, eva = 268, agi = 67, int = 45, mnd = 55, chr = 71, dex = 75, def = 280,
                         attack_skill = 225, resist = { virus = 20 } },
                [69] = { acc = 305, eva = 273, agi = 67, int = 47, mnd = 55, chr = 73, dex = 75, def = 286,
                         attack_skill = 229, resist = { virus = 20 } },
                [70] = { acc = 311, eva = 279, agi = 69, int = 47, mnd = 55, chr = 73, dex = 77, def = 291,
                         attack_skill = 233, resist = { virus = 25 } },
                [71] = { acc = 317, eva = 284, agi = 70, int = 47, mnd = 57, chr = 76, dex = 78, def = 296,
                         attack_skill = 237, resist = { virus = 25 } },
                [72] = { acc = 322, eva = 289, agi = 70, int = 47, mnd = 57, chr = 76, dex = 78, def = 301,
                         attack_skill = 241, resist = { virus = 25 } },
            },
            spawn_levels = { [101] = { 65, 69 }, [105] = { 65, 69 }, [109] = { 65, 69 }, [115] = { 66, 69 },
                             [119] = { 66, 69 }, [123] = { 66, 69 }, [127] = { 66, 69 }, [135] = { 69, 71 },
                             [139] = { 69, 71 }, [143] = { 69, 71 }, [148] = { 69, 71 }, [155] = { 71, 72 },
                             [160] = { 71, 72 }, [165] = { 71, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [65] = 3962, [66] = 4049, [67] = 4138, [68] = 4225, [69] = 4313, [70] = 4400, [71] = 4488, [72] = 4576 }, mp = { [65] = 0, [66] = 0, [67] = 0, [68] = 0, [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Warlord',
            ids    = { 111, 150 },
            nm     = true,
            job    = 'drk/war',
            levels = {
                [72] = { acc = 302, eva = 282, agi = 70, int = 60, mnd = 49, chr = 60, dex = 83, def = 301,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 288, agi = 72, int = 62, mnd = 50, chr = 60, dex = 84, def = 307,
                         attack_skill = 246 },
                [74] = { acc = 313, eva = 293, agi = 72, int = 63, mnd = 50, chr = 61, dex = 85, def = 312,
                         attack_skill = 251 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 20, virus = 25 },
            drops  = {
                { rate = 240, item = 1433 },  -- dark knights testimony
                { rate = 150, item = 4860 },  -- scroll of stun
                { rate = 50, item = 4798 },  -- scroll of stonega ii
                { rate = 10, item = 4769 },  -- scroll of stone iii
                { rate = 10, item = 4770 },  -- scroll of stone iv
                { rate = 10, item = 4799 },  -- scroll of stonega iii
                { rate = 10, item = 4818 },  -- scroll of quake
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 5145, [73] = 5145, [74] = 5145 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Normal attacks: HP drain; Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Poison II: Poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Bind: bind; Sleep II: sleep; Absorb-Str: STR down; Absorb-Dex: DEX down; Absorb-Vit: VIT down; Absorb-Agi: AGI down; Absorb-Int: INT down; Absorb-Mnd: MND down; Absorb-Chr: CHR down; Absorb-Tp: TP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Poison II: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Absorb-Str: STR down.', 'Absorb-Dex: DEX down.', 'Absorb-Vit: VIT down.', 'Absorb-Agi: AGI down.', 'Absorb-Int: INT down.', 'Absorb-Mnd: MND down.', 'Absorb-Chr: CHR down.', 'Absorb-Tp: TP drain.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, danger[6], danger[11], danger[16], danger[30], danger[33], danger[34], danger[37], danger[40], danger[41], danger[46], danger[49], danger[54], danger[59], danger[64], danger[69], danger[74], danger[75] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[26] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Orcish Protector',
            ids    = { 144, 151, 156, 161 },
            job    = 'pld/war',
            levels = {
                [70] = { acc = 287, eva = 266, agi = 57, int = 43, mnd = 63, chr = 73, dex = 73, def = 333,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 271, agi = 59, int = 44, mnd = 65, chr = 76, dex = 75, def = 338,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 276, agi = 59, int = 44, mnd = 65, chr = 76, dex = 75, def = 343,
                         attack_skill = 241 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 20, virus = 25 },
            drops  = {
                { rate = 100, item = 1432 },  -- paladins testimony
            },
            steal  = { 748 },  -- gold beastcoin
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4328, [71] = 4415, [72] = 4502 }, mp = { [70] = 2021, [71] = 2053, [72] = 2085 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Orcish Hexspinner',
            ids    = { 149 },
            nm     = true,
            job    = 'blm/war',
            levels = {
                [71] = { acc = 297, eva = 279, agi = 75, int = 68, mnd = 57, chr = 71, dex = 83, def = 289,
                         attack_skill = 237 },
                [72] = { acc = 302, eva = 284, agi = 75, int = 68, mnd = 57, chr = 71, dex = 83, def = 294,
                         attack_skill = 241 },
                [73] = { acc = 308, eva = 290, agi = 76, int = 71, mnd = 58, chr = 72, dex = 84, def = 301,
                         attack_skill = 246 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1429 },  -- black mages testimony
                { rate = 150, item = 4769 },  -- scroll of stone iii
                { rate = 50, item = 4799 },  -- scroll of stonega iii
                { rate = 100, item = 4798 },  -- scroll of stonega ii
                { rate = 50, item = 4818 },  -- scroll of quake
                { rate = 10, item = 4770 },  -- scroll of stone iv
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 4830, [72] = 4830, [73] = 4830 }, mp = { [71] = 2053, [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flare: Water magic evasion down; Freeze: Fire magic evasion down; Tornado: Ice magic evasion down; Quake: Wind magic evasion down; Burst: Earth magic evasion down; Flood: Thunder magic evasion down; Poisonga: area poison; Poisonga II: area poison; Burn: Burn; Frost: Frost; Choke: Choke; Rasp: Rasp; Shock: Shock; Drown: Drown; Drain: HP drain; Aspir: MP drain; Stun: stun; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flare: Water magic evasion down.', 'Freeze: Fire magic evasion down.', 'Tornado: Ice magic evasion down.', 'Quake: Wind magic evasion down.', 'Burst: Earth magic evasion down.', 'Flood: Thunder magic evasion down.', 'Poisonga: area poison. Possible effects: Poison.', 'Poisonga II: area poison. Possible effects: Poison.', 'Burn: Burn.', 'Frost: Frost.', 'Choke: Choke.', 'Rasp: Rasp.', 'Shock: Shock.', 'Drown: Drown.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { danger[6], danger[11], danger[16], { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[32], level_ranges = { { 60, 255 } } }, danger[76], { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[32], level_ranges = { { 52, 255 } } }, danger[77], { kind = 'spell', id = 212, name = 'Burst', summary = 'Burst: Earth magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Earth magic evasion down' }, details = danger[32], level_ranges = { { 56, 255 } } }, { kind = 'spell', id = 214, name = 'Flood', summary = 'Flood: Thunder magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Thunder magic evasion down' }, details = danger[32], level_ranges = { { 58, 255 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[79], level_ranges = { { 24, 71 } } }, { kind = 'spell', id = 226, name = 'Poisonga II', summary = 'Poisonga II: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[79], level_ranges = { { 72, 255 } } }, { kind = 'spell', id = 235, name = 'Burn', summary = 'Burn: Burn', notes = {  }, categories = { 'debuff' }, effects = { 'Burn' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Burn: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 24, 255 } } }, { kind = 'spell', id = 236, name = 'Frost', summary = 'Frost: Frost', notes = {  }, categories = { 'debuff' }, effects = { 'Frost' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Frost: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 22, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 20, 255 } } }, { kind = 'spell', id = 238, name = 'Rasp', summary = 'Rasp: Rasp', notes = {  }, categories = { 'debuff' }, effects = { 'Rasp' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Rasp: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 18, 255 } } }, { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 16, 255 } } }, { kind = 'spell', id = 240, name = 'Drown', summary = 'Drown: Drown', notes = {  }, categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 27, 255 } } }, danger[80], { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[32], level_ranges = { { 25, 255 } } }, danger[81], danger[84], danger[85], danger[86], danger[89] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[26] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Orcish Overlord',
            ids    = { 186 },
            nm     = true,
            job    = 'pld/war',
            levels = {
                [75] = { acc = 315, eva = 292, agi = 60, int = 46, mnd = 68, chr = 78, dex = 78, def = 360,
                         attack_skill = 256 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 25, virus = 25 },
            drops  = {
                { rate = 1000, item = 554 },  -- gold orcmask
                { rate = 1000, item = 751 },  -- platinum beastcoin
                { rate = 1000, item = 1432 },  -- paladins testimony
                { rate = 100, item = 16938 },  -- glorious sword
            },
            steal  = { 656 },  -- beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 3,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Warchief (ID 141); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [75] = 5250 }, mp = { [75] = 2181 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flash: Flash', notes = { 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = danger[25], coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[26] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Overlord Bakgodek',
            ids    = { 187 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [85] = { acc = 372, eva = 339, agi = 59, int = 50, mnd = 83, chr = 92, dex = 83, def = 417,
                         attack_skill = 311 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, paralyze = 8,
                       silence = 11, slow = 8, poison = -3, light_sleep = 11, dark_sleep = 11, blind = -2,
                       stun = -2, gravity = -2 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 1000, item = 1432 },  -- paladins testimony
                { rate = 240, item = 17928 },  -- juggernaut
                { rate = 10, item = 4172 },  -- reraiser
                { rate = 10, item = 4174 },  -- vile elixir
                { rate = 10, item = 4175 },  -- vile elixir +1
                { rate = 1000, group = {  -- one of
                    { 942, 3000 },  -- philosophers stone
                    { 844, 3000 },  -- phoenix feather
                    { 1132, 1000 },  -- square of raxa
                    { 658, 750 },  -- damascus ingot
                    { 837, 750 },  -- spool of malboro fiber
                    { 836, 750 },  -- square of damascene cloth
                    { 1110, 750 },  -- vial of black beetle blood
                } },
                { rate = 1000, group = {  -- one of
                    { 1132, 1550 },  -- square of raxa
                    { 645, 650 },  -- chunk of darksteel ore
                    { 737, 650 },  -- chunk of gold ore
                    { 644, 650 },  -- chunk of mythril ore
                    { 738, 650 },  -- chunk of platinum ore
                    { 887, 650 },  -- coral fragment
                    { 902, 650 },  -- demon horn
                    { 702, 650 },  -- ebony log
                    { 866, 650 },  -- handful of wyvern scales
                    { 700, 650 },  -- mahogany log
                    { 703, 650 },  -- petrified log
                    { 895, 650 },  -- ram horn
                    { 823, 650 },  -- spool of gold thread
                    { 830, 650 },  -- square of rainbow cloth
                } },
                { rate = 1000, group = {  -- one of
                    { 17649, 8500 },  -- nightmare sword
                    { 12362, 1500 },  -- highlanders targe
                } },
            },
            steal  = { 751 },  -- platinum beastcoin
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Warchief (ID 141); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [85] = 44099 }, mp = { [85] = 42000 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Normal attacks: TP drain; Aerial Wheel: Stun; Slam Dunk: Bind; Battle Dance: DEX down; Flash: Flash', notes = { 'Normal attacks: TP drain. These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Aerial Wheel: Stun. Random effects may not all happen on the same use. Source targeting: single target.', 'Slam Dunk: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Battle Dance: DEX down. Source targeting: area around the monster.', 'Flash: Flash.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'A scripted move argument is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: TP drain', notes = { 'These effects depend on the callback conditions and may not all happen on the same hit. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'drain' }, effects = { 'TP drain' }, details = { notes = {  }, unknown = {  } } }, danger[6], danger[11], danger[16], danger[24] }, coverage = 'partial', incomplete = true, reasons = { 'A scripted move argument is not resolved.' }, general_notes = danger[26] },
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted move argument is not resolved.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Bugaboo',
            ids    = { 188 },
            nm     = true,
            job    = 'war/blm',
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 63, mnd = 48, chr = 61, dex = 66, def = 250,
                         attack_skill = 207 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 10, bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 10, stun = 10, gravity = -2 },
            weapon_dmg = { slashing = -25, piercing = -25, blunt = -50, hand_to_hand = -50 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Ghost / Undead', notes = { 'Source species: Ghost (ID 408); family ID 173.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [63] = 3500 }, mp = { [63] = 3500 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Ice crystal (conditional)', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10; Store TP 75', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Normal attacks: HP drain; Grave Reel: HP drain; Ectosmash: can crit; Fear Touch: can crit; Terror Touch: Attack down, can crit; Curse: curse; Dark Sphere: Blindness; Freeze: Fire magic evasion down; Quake: Wind magic evasion down; Gravity: Weight; Poison II: Poison; Poisonga: area poison; Drain: HP drain; Aspir: MP drain; Stun: stun; Sleep: sleep; Blind: Blindness; Bind: bind; Sleep II: sleep; Sleepga II: area sleep', notes = { 'Normal attacks: HP drain. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Grave Reel: HP drain. Source targeting: area around the monster.', 'Ectosmash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fear Touch: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Terror Touch: Attack down, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Curse: curse. Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.', 'Dark Sphere: Blindness. Source targeting: single target.', 'Freeze: Fire magic evasion down.', 'Quake: Wind magic evasion down.', 'Gravity: Weight.', 'Poison II: Poison.', 'Poisonga: area poison. Possible effects: Poison.', 'Drain: HP drain.', 'Aspir: MP drain.', 'Stun: stun. Possible effects: Stun.', 'Sleep: sleep. Possible effects: Sleep.', 'Blind: Blindness.', 'Bind: bind. Possible effects: Bind.', 'Sleep II: sleep. Possible effects: Sleep.', 'Sleepga II: area sleep. Possible effects: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } }, { kind = 'skill', id = 472, name = 'Grave Reel', summary = 'Grave Reel: HP drain', notes = { 'Source targeting: area around the monster.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'wipe', per_hit = false } } } }, { kind = 'skill', id = 473, name = 'Ectosmash', summary = 'Ectosmash: can crit', notes = danger[90], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 15.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 474, name = 'Fear Touch', summary = 'Fear Touch: can crit', notes = danger[90], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 475, name = 'Terror Touch', summary = 'Terror Touch: Attack down, can crit', notes = danger[90], categories = { 'crit', 'debuff' }, effects = { 'Attack down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Attack down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 476, name = 'Curse', summary = 'Curse: curse', notes = { 'Attempts Curse on its targets. Source targeting: area around the monster. Possible effects: Curse.' }, categories = { 'debuff' }, effects = { 'Curse' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Curse: Cursna, Holy Water.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Cursna and Holy Water handle a successful Doom removal before Curse when both are present.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Curse', options = { 'Cursna', 'Holy Water' } } } } }, { kind = 'skill', id = 477, name = 'Dark Sphere', summary = 'Dark Sphere: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, danger[76], danger[77], { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 21, 255 } } }, { kind = 'spell', id = 221, name = 'Poison II', summary = 'Poison II: Poison', notes = {  }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[29], level_ranges = { { 43, 64 } } }, { kind = 'spell', id = 225, name = 'Poisonga', summary = 'Poisonga: area poison', notes = { 'Possible effects: Poison.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[79], level_ranges = { { 24, 69 } } }, danger[80], { kind = 'spell', id = 247, name = 'Aspir', summary = 'Aspir: MP drain', notes = {  }, categories = { 'drain' }, effects = { 'MP drain' }, details = danger[32], level_ranges = { { 25, 82 } } }, danger[81], { kind = 'spell', id = 253, name = 'Sleep', summary = 'Sleep: sleep', notes = { 'Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[32], level_ranges = { { 20, 255 } } }, danger[84], danger[85], danger[86], danger[89] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[26] },
                blue = { value = 'Terror Touch', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 539, name = 'Terror Touch', level = 40, min_skill = 92, skill_ids = { 475 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Mimic',
            ids    = { 189 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46, dex = 67, def = 240,
                         attack_skill = 196 },
            },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            drops  = {
                { rate = 1000, item = 1042 },  -- davoi coffer key
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
                dangers = { value = 'Death Trap: Poison, Stun', notes = { 'Death Trap: Poison, Stun. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 729, name = 'Death Trap', summary = 'Death Trap: Poison, Stun', notes = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison', 'Stun' }, details = { notes = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy; Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[18] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Orcish Bewitcher',
            ids    = { 197 },
            nm     = true,
            job    = 'blm/drk',
            levels = {
                [139] = { acc = 501, eva = 636, agi = 135, int = 139, mnd = 102, chr = 124, dex = 154, def = 635,
                          attack_skill = 404 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Orc (ID 139); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [139] = 9714 }, mp = { [139] = 4309 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[19],
                blue = { value = 'Battle Dance', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 620, name = 'Battle Dance', level = 12, min_skill = 8, skill_ids = { 609 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
    },
    by_name = {},
}
