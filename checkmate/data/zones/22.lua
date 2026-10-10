-- Promyvion-Vahzl (zone 22).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Empty Cutter Thinker: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Negative Whirl: Slow. Source targeting: area around the monster.', 'Stygian Vapor: Plague. Source targeting: cone.', 'Spirit Absorption Thinker: HP drain. Source targeting: single target.', 'Binary Absorption: HP drain. Source targeting: single target.', 'Trinary Absorption: HP drain. Source targeting: single target.', 'Spirit Tap: Buff theft. Source targeting: single target.', 'Binary Tap: Buff theft. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[2] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[3] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[4] = { notes = danger[3], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[5] = { kind = 'skill', id = 1242, name = 'Empty Cutter Thinker', summary = 'Empty Cutter Thinker: can crit', notes = danger[2], categories = { 'crit' }, effects = {  }, details = danger[4] };
danger[6] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[7] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[8] = { danger[7] };
danger[9] = { notes = danger[6], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[8] };
danger[10] = { kind = 'skill', id = 1243, name = 'Negative Whirl', summary = 'Negative Whirl: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = danger[9] };
danger[11] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 8 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Plague: Viruna.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[12] = { notes = danger[11], unknown = {  }, activation_range = 8.0, shape = 'front cone', cone_length = 8.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Plague', options = { 'Viruna' } } } };
danger[13] = { kind = 'skill', id = 1244, name = 'Stygian Vapor', summary = 'Stygian Vapor: Plague', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Plague' }, details = danger[12] };
danger[14] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image for the damage step. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[15] = { notes = danger[14], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = false, count = 1 } } };
danger[16] = { kind = 'skill', id = 1246, name = 'Spirit Absorption Thinker', summary = 'Spirit Absorption Thinker: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] };
danger[17] = { kind = 'skill', id = 1247, name = 'Binary Absorption', summary = 'Binary Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] };
danger[18] = { kind = 'skill', id = 1248, name = 'Trinary Absorption', summary = 'Trinary Absorption: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] };
danger[19] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[20] = { notes = danger[19], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[21] = { kind = 'skill', id = 1249, name = 'Spirit Tap', summary = 'Spirit Tap: Buff theft', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[20] };
danger[22] = { kind = 'skill', id = 1250, name = 'Binary Tap', summary = 'Binary Tap: Buff theft', notes = { 'Source targeting: single target.' }, categories = { 'dispel' }, effects = { 'Buff theft' }, details = danger[20] };
danger[23] = { danger[5], danger[10], danger[13], danger[16], danger[17], danger[18], danger[21], danger[22] };
danger[24] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[25] = { value = 'Empty Cutter Thinker: can crit; Negative Whirl: Slow; Stygian Vapor: Plague; Spirit Absorption Thinker: HP drain; Binary Absorption: HP drain; Trinary Absorption: HP drain; Spirit Tap: Buff theft; Binary Tap: Buff theft', notes = danger[1], entries = danger[23], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] };
danger[26] = { 'Spirit Absorption Gorger: HP drain. Source targeting: single target.', 'Stygian Flatus: Paralysis. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[27] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[28] = { notes = danger[27], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[29] = { kind = 'skill', id = 750, name = 'Stygian Flatus', summary = 'Stygian Flatus: Paralysis', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[28] };
danger[30] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow, Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[31] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[32] = { danger[7], danger[31] };
danger[33] = { notes = danger[30], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[32] };
danger[34] = { kind = 'skill', id = 1232, name = 'Murk', summary = 'Murk: Slow, Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow', 'Weight' }, details = danger[33] };
danger[35] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[36] = { notes = danger[35], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[37] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'An empty list does not mean this monster is safe.' };
danger[38] = { value = 'No listed threats', notes = danger[37], entries = {  }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] };
danger[39] = { 'Vacuous Osculation: Plague, Poison. Source targeting: single target.', 'Auroral Drape: Blindness, Silence. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[40] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Plague: Viruna; Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Viruna removes Disease first if both Disease and Plague are present.' };
danger[41] = { { effect = 'Plague', options = { 'Viruna' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } };
danger[42] = { notes = danger[40], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[41] };
danger[43] = { kind = 'skill', id = 1218, name = 'Vacuous Osculation', summary = 'Vacuous Osculation: Plague, Poison', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Plague', 'Poison' }, details = danger[42] };
danger[44] = { 'Normal activation range: 13.7 yalms. This is the move selection limit, not its affected area.', 'Area: 13.7 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[45] = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } };
danger[46] = { notes = danger[44], unknown = {  }, activation_range = 13.7, shape = 'area around the monster', effect_radius = 13.7, shadows = { { mode = 'ignore' } }, removals = danger[45] };
danger[47] = { kind = 'skill', id = 1220, name = 'Auroral Drape', summary = 'Auroral Drape: Blindness, Silence', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness', 'Silence' }, details = danger[46] };
danger[48] = { danger[43], danger[47] };
danger[49] = { value = 'Vacuous Osculation: Plague, Poison; Auroral Drape: Blindness, Silence', notes = danger[39], entries = danger[48], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] };
danger[50] = { 'Vanity Strike: Stun, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight. Source targeting: cone.', 'Lamentation: Dia. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[51] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[52] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[53] = { notes = danger[51], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[52] };
danger[54] = { kind = 'skill', id = 1253, name = 'Vanity Strike', summary = 'Vanity Strike: Stun, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Stun' }, details = danger[53] };
danger[55] = { 'AGI down', 'Accuracy down', 'Addle', 'Attack down', 'Bio', 'Blindness', 'Burn', 'CHR down', 'Choke', 'DEX down', 'Defense down', 'Dia', 'Drown', 'Evasion down', 'Frost', 'INT down', 'MND down', 'Magic accuracy down', 'Magic attack down', 'Magic defense down', 'Paralysis', 'Poison', 'Rasp', 'STR down', 'Shock', 'Silence', 'Slow', 'VIT down', 'Weight' };
danger[56] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: AGI down, Addle, Attack down, Bio, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Rasp, STR down, Shock, Slow, VIT down, Weight: Erase (one random eligible timed ailment), Panacea; Accuracy down: Erase (one random eligible timed ailment); Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[57] = { effect = 'AGI down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[58] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[59] = { effect = 'Addle', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[60] = { effect = 'Attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[61] = { effect = 'Bio', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[62] = { effect = 'Burn', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[63] = { effect = 'CHR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[64] = { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[65] = { effect = 'DEX down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[66] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[67] = { effect = 'Dia', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[68] = { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[69] = { effect = 'Evasion down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[70] = { effect = 'Frost', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[71] = { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[72] = { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[73] = { effect = 'Magic accuracy down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[74] = { effect = 'Magic attack down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[75] = { effect = 'Magic defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[76] = { effect = 'Rasp', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[77] = { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[78] = { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[79] = { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[80] = { danger[57], danger[58], danger[59], danger[60], danger[61], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, danger[62], danger[63], danger[64], danger[65], danger[66], danger[67], danger[68], danger[69], danger[70], danger[71], danger[72], danger[73], danger[74], danger[75], { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, danger[76], danger[77], danger[78], { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[7], danger[79], danger[31] };
danger[81] = { notes = danger[56], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[80] };
danger[82] = { kind = 'skill', id = 1254, name = 'Wanion', summary = 'Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = danger[55], details = danger[81] };
danger[83] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Dia: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[84] = { danger[67] };
danger[85] = { notes = danger[83], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[84] };
danger[86] = { kind = 'skill', id = 1258, name = 'Lamentation', summary = 'Lamentation: Dia', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Dia' }, details = danger[85] };
danger[87] = { danger[54], danger[82], danger[86] };
danger[88] = { value = 'Vanity Strike: Stun, can crit; Wanion: AGI down, Accuracy down, Addle, Attack down, Bio, Blindness, Burn, CHR down, Choke, DEX down, Defense down, Dia, Drown, Evasion down, Frost, INT down, MND down, Magic accuracy down, Magic attack down, Magic defense down, Paralysis, Poison, Rasp, STR down, Shock, Silence, Slow, VIT down, Weight; Lamentation: Dia', notes = danger[50], entries = danger[87], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { true_sound = { 'Offspring' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Offspring'] = { id = 111, name = 'Gorger' },
    },
    monsters = {
        {
            name   = 'Ponderer',
            ids    = { 1 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [56] = { acc = 214, eva = 198, agi = 57, int = 50, mnd = 50, chr = 52, dex = 63, def = 217,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 203, agi = 57, int = 51, mnd = 51, chr = 52, dex = 63, def = 223,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53, dex = 63, def = 228,
                         attack_skill = 186 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Thinker / Empty', notes = { 'Source species: Thinker (ID 288); family ID 114.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 3850, [57] = 3850, [58] = 3850 }, mp = { [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 4 minutes', notes = { 'Source idle-despawn delay: 4 minutes. This is not its remaining lifetime.' } },
                dangers = danger[25],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Propagator',
            ids    = { 2 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52, dex = 63, def = 217,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52, dex = 63, def = 223,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53, dex = 63, def = 228,
                         attack_skill = 186 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Gorger / Empty', notes = { 'Source species: Gorger (ID 283); family ID 111.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 2956, [57] = 3038, [58] = 3120 }, mp = { [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 4 minutes', notes = { 'Source idle-despawn delay: 4 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Spirit Absorption Gorger: HP drain; Stygian Flatus: Paralysis', notes = danger[26], entries = { { kind = 'skill', id = 745, name = 'Spirit Absorption Gorger', summary = 'Spirit Absorption Gorger: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] }, danger[29] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Offspring',
            ids    = { 3, 4 },
            levels = {
                [47] = { acc = 171, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43, dex = 55, def = 177,
                         attack_skill = 138 },
                [48] = { acc = 174, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44, dex = 55, def = 180,
                         attack_skill = 141 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
            info = {
                family = { value = 'Gorger / Empty', notes = { 'Source species: Gorger (ID 283); family ID 111.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [47] = 800, [48] = 800 }, mp = { [47] = 0, [48] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, general_notes = danger[24] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Solicitor',
            ids    = { 5 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52, dex = 63, def = 219,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52, dex = 63, def = 225,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53, dex = 63, def = 230,
                         attack_skill = 186 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Craver / Empty', notes = { 'Source species: Craver (ID 281); family ID 110.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [56] = 2956, [57] = 3038, [58] = 3120 }, mp = { [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 4 minutes', notes = { 'Source idle-despawn delay: 4 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Murk: Slow, Weight; Promyvion Brume: Poison', notes = { 'Murk: Slow, Weight. Source targeting: area around the monster.', 'Promyvion Brume: Poison. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[34], { kind = 'skill', id = 1276, name = 'Promyvion Brume', summary = 'Promyvion Brume: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[36] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Wanderer',
            ids    = { 6, 7, 9, 10, 11, 12, 13, 14, 16, 17, 19, 20, 21, 23, 24, 25, 28, 29, 33, 34, 36, 37, 38, 40,
                       42, 44, 46, 47, 49, 51, 69, 72, 73, 75, 76, 81, 82, 83, 85, 88, 90, 99, 100, 124, 127, 128,
                       134, 135, 136, 138, 139, 147, 150, 154, 155, 156, 158, 203, 206, 210, 211, 218, 221, 235,
                       237, 240, 241, 243, 244, 247, 251, 254, 257, 258, 300, 303, 309, 310, 311, 315, 320, 334,
                       337, 342, 345, 347, 355, 357 },
            job    = 'war/rdm',
            levels = {
                [49] = { acc = 177, eva = 163, agi = 48, int = 44, mnd = 44, chr = 45, dex = 55, def = 179,
                         attack_skill = 144 },
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47, dex = 56, def = 182,
                         attack_skill = 147 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48, dex = 58, def = 187,
                         attack_skill = 151 },
                [52] = { acc = 192, eva = 176, agi = 51, int = 46, mnd = 46, chr = 48, dex = 58, def = 192,
                         attack_skill = 156 },
                [53] = { acc = 197, eva = 181, agi = 51, int = 48, mnd = 48, chr = 49, dex = 58, def = 198,
                         attack_skill = 161 },
                [54] = { acc = 203, eva = 187, agi = 52, int = 48, mnd = 48, chr = 49, dex = 60, def = 203,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 192, agi = 53, int = 48, mnd = 48, chr = 50, dex = 60, def = 208,
                         attack_skill = 171 },
                [56] = { acc = 214, eva = 197, agi = 54, int = 50, mnd = 50, chr = 52, dex = 63, def = 213,
                         attack_skill = 176 },
            },
            spawn_levels = { [6] = { 49, 51 }, [7] = { 49, 51 }, [9] = { 49, 51 }, [10] = { 49, 51 },
                             [11] = { 49, 51 }, [12] = { 49, 51 }, [13] = { 49, 51 }, [14] = { 49, 51 },
                             [16] = { 49, 51 }, [17] = { 49, 51 }, [19] = { 49, 51 }, [20] = { 49, 51 },
                             [21] = { 49, 51 }, [23] = { 49, 51 }, [24] = { 49, 51 }, [25] = { 49, 51 },
                             [28] = { 49, 51 }, [29] = { 49, 51 }, [33] = { 49, 51 }, [34] = { 49, 51 },
                             [36] = { 49, 51 }, [37] = { 49, 51 }, [38] = { 49, 51 }, [40] = { 49, 51 },
                             [42] = { 49, 51 }, [44] = { 49, 51 }, [46] = { 49, 51 }, [47] = { 49, 51 },
                             [49] = { 49, 51 }, [51] = { 49, 51 }, [69] = { 51, 53 }, [72] = { 51, 53 },
                             [73] = { 51, 53 }, [75] = { 51, 53 }, [76] = { 51, 53 }, [81] = { 49, 51 },
                             [82] = { 49, 51 }, [83] = { 51, 53 }, [85] = { 51, 53 }, [88] = { 51, 53 },
                             [90] = { 51, 53 }, [99] = { 51, 53 }, [100] = { 52, 54 }, [124] = { 52, 54 },
                             [127] = { 52, 54 }, [128] = { 52, 54 }, [134] = { 52, 54 }, [135] = { 52, 54 },
                             [136] = { 52, 54 }, [138] = { 52, 54 }, [139] = { 52, 54 }, [147] = { 52, 54 },
                             [150] = { 52, 54 }, [154] = { 52, 54 }, [155] = { 52, 54 }, [156] = { 52, 54 },
                             [158] = { 52, 54 }, [203] = { 52, 54 }, [206] = { 53, 55 }, [210] = { 53, 55 },
                             [211] = { 53, 55 }, [218] = { 53, 55 }, [221] = { 53, 55 }, [235] = { 53, 55 },
                             [237] = { 54, 56 }, [240] = { 54, 56 }, [241] = { 54, 56 }, [243] = { 54, 56 },
                             [244] = { 54, 56 }, [247] = { 54, 56 }, [251] = { 54, 56 }, [254] = { 54, 56 },
                             [257] = { 53, 55 }, [258] = { 53, 55 }, [300] = { 54, 56 }, [303] = { 54, 56 },
                             [309] = { 54, 56 }, [310] = { 54, 56 }, [311] = { 54, 56 }, [315] = { 54, 56 },
                             [320] = { 54, 56 }, [334] = { 54, 56 }, [337] = { 54, 56 }, [342] = { 52, 54 },
                             [345] = { 52, 54 }, [347] = { 52, 54 }, [355] = { 53, 55 }, [357] = { 53, 55 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wanderer / Empty', notes = { 'Source species: Wanderer (ID 290); family ID 115.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [49] = 2098, [50] = 2215, [51] = 2290, [52] = 2364, [53] = 2438, [54] = 2511, [55] = 2586, [56] = 2660 }, mp = { [49] = 687, [50] = 702, [51] = 718, [52] = 733, [53] = 749, [54] = 764, [55] = 780, [56] = 795 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[38],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Weeper',
            ids    = { 8, 15, 18, 22, 26, 27, 30, 31, 32, 35, 39, 41, 43, 45, 48, 50, 68, 70, 71, 77, 78, 79, 80,
                       84, 87, 91, 92, 93, 94, 95, 96, 97, 98, 125, 129, 131, 132, 140, 141, 143, 144, 145, 148,
                       149, 152, 153, 159, 160, 161, 162, 165, 204, 205, 207, 208, 212, 213, 214, 216, 219, 222,
                       223, 227, 228, 231, 232, 236, 238, 242, 245, 248, 249, 253, 256, 259, 301, 302, 304, 305,
                       307, 308, 313, 314, 317, 318, 321, 322, 324, 325, 327, 328, 333, 335, 338, 339, 341, 343,
                       344, 346, 348, 349, 350, 354, 356, 359, 360 },
            job    = 'war/rdm',
            levels = {
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47, dex = 56, def = 182,
                         attack_skill = 147 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48, dex = 58, def = 187,
                         attack_skill = 151 },
                [52] = { acc = 192, eva = 176, agi = 51, int = 46, mnd = 46, chr = 48, dex = 58, def = 192,
                         attack_skill = 156 },
                [53] = { acc = 197, eva = 181, agi = 51, int = 48, mnd = 48, chr = 49, dex = 58, def = 198,
                         attack_skill = 161 },
                [54] = { acc = 203, eva = 187, agi = 52, int = 48, mnd = 48, chr = 49, dex = 60, def = 203,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 192, agi = 53, int = 48, mnd = 48, chr = 50, dex = 60, def = 208,
                         attack_skill = 171 },
                [56] = { acc = 214, eva = 197, agi = 54, int = 50, mnd = 50, chr = 52, dex = 63, def = 213,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 202, agi = 54, int = 51, mnd = 51, chr = 52, dex = 63, def = 218,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 208, agi = 56, int = 51, mnd = 51, chr = 53, dex = 63, def = 224,
                         attack_skill = 186 },
            },
            spawn_levels = { [8] = { 50, 51 }, [15] = { 50, 51 }, [18] = { 50, 51 }, [22] = { 50, 51 },
                             [26] = { 50, 51 }, [27] = { 50, 51 }, [30] = { 50, 51 }, [31] = { 50, 51 },
                             [32] = { 50, 51 }, [35] = { 50, 51 }, [39] = { 50, 51 }, [41] = { 50, 51 },
                             [43] = { 50, 51 }, [45] = { 50, 51 }, [48] = { 50, 51 }, [50] = { 50, 51 },
                             [68] = { 52, 53 }, [70] = { 52, 53 }, [71] = { 52, 53 }, [77] = { 52, 53 },
                             [78] = { 50, 51 }, [79] = { 50, 51 }, [80] = { 50, 51 }, [84] = { 52, 53 },
                             [87] = { 52, 53 }, [91] = { 52, 53 }, [92] = { 52, 53 }, [93] = { 52, 53 },
                             [94] = { 52, 53 }, [95] = { 52, 53 }, [96] = { 52, 53 }, [97] = { 52, 53 },
                             [98] = { 52, 53 }, [125] = { 54, 55 }, [129] = { 54, 55 }, [131] = { 54, 55 },
                             [132] = { 54, 55 }, [140] = { 54, 55 }, [141] = { 54, 55 }, [143] = { 54, 55 },
                             [144] = { 54, 55 }, [145] = { 54, 55 }, [148] = { 54, 55 }, [149] = { 54, 55 },
                             [152] = { 54, 55 }, [153] = { 54, 55 }, [159] = { 54, 55 }, [160] = { 54, 55 },
                             [161] = { 54, 55 }, [162] = { 54, 55 }, [165] = { 54, 55 }, [204] = { 55, 56 },
                             [205] = { 55, 56 }, [207] = { 55, 56 }, [208] = { 55, 56 }, [212] = { 55, 56 },
                             [213] = { 55, 56 }, [214] = { 52, 54 }, [216] = { 55, 56 }, [219] = { 55, 56 },
                             [222] = { 55, 56 }, [223] = { 55, 56 }, [227] = { 55, 56 }, [228] = { 55, 56 },
                             [231] = { 55, 56 }, [232] = { 55, 56 }, [236] = { 52, 53 }, [238] = { 55, 56 },
                             [242] = { 55, 56 }, [245] = { 55, 56 }, [248] = { 55, 56 }, [249] = { 55, 56 },
                             [253] = { 55, 56 }, [256] = { 55, 56 }, [259] = { 55, 56 }, [301] = { 56, 58 },
                             [302] = { 56, 58 }, [304] = { 56, 58 }, [305] = { 56, 58 }, [307] = { 56, 58 },
                             [308] = { 56, 58 }, [313] = { 56, 58 }, [314] = { 56, 58 }, [317] = { 56, 58 },
                             [318] = { 56, 58 }, [321] = { 56, 58 }, [322] = { 56, 58 }, [324] = { 56, 58 },
                             [325] = { 56, 58 }, [327] = { 56, 58 }, [328] = { 56, 58 }, [333] = { 56, 58 },
                             [335] = { 56, 58 }, [338] = { 56, 58 }, [339] = { 56, 58 }, [341] = { 56, 58 },
                             [343] = { 54, 55 }, [344] = { 54, 55 }, [346] = { 54, 55 }, [348] = { 54, 55 },
                             [349] = { 54, 55 }, [350] = { 55, 56 }, [354] = { 55, 56 }, [356] = { 55, 56 },
                             [359] = { 55, 56 }, [360] = { 55, 56 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Weeper / Empty', notes = { 'Source species: Weeper (ID 292); family ID 116.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [50] = 2708, [51] = 2799, [52] = 2889, [53] = 2979, [54] = 3070, [55] = 3161, [56] = 3251, [57] = 3341, [58] = 3432 }, mp = { [50] = 1395, [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[49],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Thinker',
            ids    = { 52, 55, 103, 106, 166, 169, 172, 260, 263, 266, 269, 363, 366, 369, 372 },
            job    = 'war/rdm',
            levels = {
                [54] = { acc = 203, eva = 188, agi = 55, int = 48, mnd = 48, chr = 49, dex = 60, def = 207,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 193, agi = 55, int = 48, mnd = 48, chr = 50, dex = 60, def = 213,
                         attack_skill = 171 },
                [56] = { acc = 214, eva = 198, agi = 57, int = 50, mnd = 50, chr = 52, dex = 63, def = 217,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 203, agi = 57, int = 51, mnd = 51, chr = 52, dex = 63, def = 223,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53, dex = 63, def = 228,
                         attack_skill = 186 },
                [59] = { acc = 230, eva = 215, agi = 60, int = 52, mnd = 52, chr = 54, dex = 65, def = 234,
                         attack_skill = 191 },
                [60] = { acc = 235, eva = 220, agi = 60, int = 52, mnd = 52, chr = 54, dex = 65, def = 239,
                         attack_skill = 196 },
            },
            spawn_levels = { [52] = { 54, 55 }, [55] = { 54, 55 }, [103] = { 55, 56 }, [106] = { 55, 56 },
                             [166] = { 56, 57 }, [169] = { 56, 57 }, [172] = { 56, 57 }, [260] = { 57, 58 },
                             [263] = { 57, 58 }, [266] = { 57, 58 }, [269] = { 57, 58 }, [363] = { 59, 60 },
                             [366] = { 59, 60 }, [369] = { 59, 60 }, [372] = { 59, 60 } },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 50, item = 1723 },  -- white memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Thinker / Empty', notes = { 'Source species: Thinker (ID 288); family ID 114.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [54] = 2791, [55] = 2874, [56] = 2956, [57] = 3038, [58] = 3120, [59] = 3203, [60] = 3285 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674, [60] = 1705 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[25],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Gorger',
            ids    = { 53, 56, 104, 107, 167, 170, 173, 246, 261, 264, 267, 270, 364, 367, 370, 373, 375 },
            job    = 'war/rdm',
            levels = {
                [54] = { acc = 203, eva = 190, agi = 59, int = 48, mnd = 48, chr = 49, dex = 60, def = 207,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 195, agi = 59, int = 48, mnd = 48, chr = 50, dex = 60, def = 213,
                         attack_skill = 171 },
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52, dex = 63, def = 217,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52, dex = 63, def = 223,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53, dex = 63, def = 228,
                         attack_skill = 186 },
                [59] = { acc = 230, eva = 217, agi = 64, int = 52, mnd = 52, chr = 54, dex = 65, def = 234,
                         attack_skill = 191 },
                [60] = { acc = 235, eva = 222, agi = 64, int = 52, mnd = 52, chr = 54, dex = 65, def = 239,
                         attack_skill = 196 },
            },
            spawn_levels = { [53] = { 54, 55 }, [56] = { 54, 55 }, [104] = { 55, 56 }, [107] = { 55, 56 },
                             [167] = { 56, 57 }, [170] = { 56, 57 }, [173] = { 56, 57 }, [246] = { 59, 60 },
                             [261] = { 58, 59 }, [264] = { 58, 59 }, [267] = { 58, 59 }, [270] = { 58, 59 },
                             [364] = { 59, 60 }, [367] = { 59, 60 }, [370] = { 59, 60 }, [373] = { 59, 60 },
                             [375] = { 59, 60 } },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 50, item = 1723 },  -- white memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Gorger / Empty', notes = { 'Source species: Gorger (ID 283); family ID 111.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [54] = 2791, [55] = 2874, [56] = 2956, [57] = 3038, [58] = 3120, [59] = 3203, [60] = 3285 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674, [60] = 1705 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Spirit Absorption Gorger: HP drain; Stygian Flatus: Paralysis', notes = danger[26], entries = { { kind = 'skill', id = 744, name = 'Spirit Absorption Gorger', summary = 'Spirit Absorption Gorger: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[15] }, danger[29] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Craver',
            ids    = { 54, 57, 105, 108, 168, 171, 174, 262, 265, 268, 271, 365, 368, 371, 374, 376 },
            job    = 'war/rdm',
            levels = {
                [54] = { acc = 203, eva = 190, agi = 59, int = 48, mnd = 48, chr = 49, dex = 60, def = 209,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 195, agi = 59, int = 48, mnd = 48, chr = 50, dex = 60, def = 215,
                         attack_skill = 171 },
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52, dex = 63, def = 219,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52, dex = 63, def = 225,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53, dex = 63, def = 230,
                         attack_skill = 186 },
                [59] = { acc = 230, eva = 217, agi = 64, int = 52, mnd = 52, chr = 54, dex = 65, def = 236,
                         attack_skill = 191 },
                [60] = { acc = 235, eva = 222, agi = 64, int = 52, mnd = 52, chr = 54, dex = 65, def = 241,
                         attack_skill = 196 },
            },
            spawn_levels = { [54] = { 54, 55 }, [57] = { 54, 55 }, [105] = { 55, 56 }, [108] = { 55, 56 },
                             [168] = { 56, 57 }, [171] = { 56, 57 }, [174] = { 56, 57 }, [262] = { 57, 58 },
                             [265] = { 57, 58 }, [268] = { 57, 58 }, [271] = { 57, 58 }, [365] = { 59, 60 },
                             [368] = { 59, 60 }, [371] = { 59, 60 }, [374] = { 59, 60 }, [376] = { 59, 60 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 50, item = 1723 },  -- white memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Craver / Empty', notes = { 'Source species: Craver (ID 281); family ID 110.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [54] = 2791, [55] = 2874, [56] = 2956, [57] = 3038, [58] = 3120, [59] = 3203, [60] = 3285 }, mp = { [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643, [59] = 1674, [60] = 1705 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Brain Spike: Paralysis, can crit; Promyvion Brume: Poison; Murk: Slow, Weight', notes = { 'Brain Spike: Paralysis, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Promyvion Brume: Poison. Source targeting: area around the monster.', 'Murk: Slow, Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1229, name = 'Brain Spike', summary = 'Brain Spike: Paralysis, can crit', notes = danger[2], categories = { 'crit', 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 1231, name = 'Promyvion Brume', summary = 'Promyvion Brume: Poison', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[36] }, danger[34] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[24] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Memory Receptacle',
            ids    = { 59, 64, 111, 118, 176, 183, 190, 197, 273, 282, 291 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45, dex = 54, def = 240,
                         attack_skill = 147 },
            },
            no_swings = true,
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = 100, piercing = 100, blunt = 100, hand_to_hand = 100 },
            info = {
                family = { value = 'Receptacle / Empty', notes = { 'Source species: Receptacle (ID 284); family ID 112.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [50] = 5200 }, mp = { [50] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn setup disables ordinary attacks.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Spawn rules', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[38],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Stray',
            ids    = { 60, 61, 62, 65, 66, 67, 112, 113, 114, 115, 116, 119, 120, 121, 122, 123, 177, 178, 179, 180,
                       184, 185, 186, 187, 191, 192, 193, 194, 198, 199, 200, 201, 274, 275, 277, 278, 279, 283,
                       284, 286, 287, 288, 292, 293, 295, 296, 297 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [39] = { acc = 143, eva = 131, agi = 40, int = 36, mnd = 36, chr = 38, dex = 46, def = 147,
                         attack_skill = 115 },
                [40] = { acc = 146, eva = 134, agi = 40, int = 36, mnd = 36, chr = 38, dex = 46, def = 150,
                         attack_skill = 118 },
                [41] = { acc = 150, eva = 138, agi = 42, int = 39, mnd = 39, chr = 40, dex = 48, def = 154,
                         attack_skill = 121 },
                [42] = { acc = 153, eva = 140, agi = 42, int = 39, mnd = 39, chr = 40, dex = 48, def = 156,
                         attack_skill = 123 },
                [43] = { acc = 156, eva = 143, agi = 42, int = 39, mnd = 39, chr = 40, dex = 48, def = 159,
                         attack_skill = 126 },
                [44] = { acc = 160, eva = 146, agi = 43, int = 40, mnd = 40, chr = 42, dex = 51, def = 163,
                         attack_skill = 129 },
                [45] = { acc = 163, eva = 150, agi = 45, int = 41, mnd = 41, chr = 43, dex = 51, def = 167,
                         attack_skill = 132 },
                [47] = { acc = 170, eva = 156, agi = 46, int = 43, mnd = 43, chr = 44, dex = 53, def = 172,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 43, mnd = 43, chr = 45, dex = 53, def = 176,
                         attack_skill = 141 },
                [49] = { acc = 177, eva = 163, agi = 48, int = 44, mnd = 44, chr = 45, dex = 55, def = 179,
                         attack_skill = 144 },
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47, dex = 56, def = 182,
                         attack_skill = 147 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48, dex = 58, def = 187,
                         attack_skill = 151 },
            },
            spawn_levels = { [60] = { 39, 42 }, [61] = { 39, 42 }, [62] = { 39, 42 }, [65] = { 39, 42 },
                             [66] = { 39, 42 }, [67] = { 39, 42 }, [112] = { 43, 45 }, [113] = { 43, 45 },
                             [114] = { 43, 45 }, [115] = { 43, 45 }, [116] = { 43, 45 }, [119] = { 43, 45 },
                             [120] = { 43, 45 }, [121] = { 43, 45 }, [122] = { 43, 45 }, [123] = { 43, 45 },
                             [177] = { 47, 49 }, [178] = { 47, 49 }, [179] = { 47, 49 }, [180] = { 47, 49 },
                             [184] = { 47, 49 }, [185] = { 47, 49 }, [186] = { 47, 49 }, [187] = { 47, 49 },
                             [191] = { 47, 49 }, [192] = { 47, 49 }, [193] = { 47, 49 }, [194] = { 47, 49 },
                             [198] = { 47, 49 }, [199] = { 47, 49 }, [200] = { 47, 49 }, [201] = { 47, 49 },
                             [274] = { 49, 51 }, [275] = { 49, 51 }, [277] = { 49, 51 }, [278] = { 49, 51 },
                             [279] = { 49, 51 }, [283] = { 49, 51 }, [284] = { 49, 51 }, [286] = { 49, 51 },
                             [287] = { 49, 51 }, [288] = { 49, 51 }, [292] = { 49, 51 }, [293] = { 49, 51 },
                             [295] = { 49, 51 }, [296] = { 49, 51 }, [297] = { 49, 51 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wanderer / Empty', notes = { 'Source species: Wanderer (ID 290); family ID 115.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [39] = 405, [40] = 405, [41] = 405, [42] = 405, [43] = 405, [44] = 405, [45] = 405, [47] = 405, [48] = 405, [49] = 405, [50] = 405, [51] = 405 }, mp = { [39] = 536, [40] = 551, [41] = 566, [42] = 581, [43] = 596, [44] = 611, [45] = 626, [47] = 656, [48] = 672, [49] = 687, [50] = 702, [51] = 718 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[38],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Seether',
            ids    = { 74, 86, 89, 101, 102, 109, 126, 130, 133, 142, 146, 151, 157, 163, 164, 209, 215, 217, 220,
                       224, 225, 229, 230, 233, 234, 239, 250, 252, 255, 299, 306, 312, 316, 319, 323, 326, 330,
                       331, 332, 336, 340, 351, 352, 353, 358, 361, 362 },
            job    = 'war/rdm',
            levels = {
                [51] = { acc = 187, eva = 172, agi = 53, int = 46, mnd = 46, chr = 48, dex = 58, def = 191,
                         attack_skill = 151 },
                [52] = { acc = 192, eva = 177, agi = 53, int = 46, mnd = 46, chr = 48, dex = 58, def = 196,
                         attack_skill = 156 },
                [53] = { acc = 197, eva = 183, agi = 54, int = 48, mnd = 48, chr = 49, dex = 58, def = 202,
                         attack_skill = 161 },
                [54] = { acc = 203, eva = 188, agi = 55, int = 48, mnd = 48, chr = 49, dex = 60, def = 207,
                         attack_skill = 166 },
                [55] = { acc = 208, eva = 193, agi = 55, int = 48, mnd = 48, chr = 50, dex = 60, def = 213,
                         attack_skill = 171 },
                [56] = { acc = 214, eva = 198, agi = 57, int = 50, mnd = 50, chr = 52, dex = 63, def = 217,
                         attack_skill = 176 },
                [57] = { acc = 219, eva = 203, agi = 57, int = 51, mnd = 51, chr = 52, dex = 63, def = 223,
                         attack_skill = 181 },
                [58] = { acc = 224, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53, dex = 63, def = 228,
                         attack_skill = 186 },
            },
            spawn_levels = { [74] = { 51, 52 }, [86] = { 51, 52 }, [89] = { 51, 52 }, [101] = { 51, 52 },
                             [102] = { 51, 52 }, [109] = { 51, 52 }, [126] = { 53, 54 }, [130] = { 53, 54 },
                             [133] = { 53, 54 }, [142] = { 53, 54 }, [146] = { 53, 54 }, [151] = { 53, 54 },
                             [157] = { 53, 54 }, [163] = { 53, 54 }, [164] = { 53, 54 }, [209] = { 55, 56 },
                             [215] = { 55, 56 }, [217] = { 55, 56 }, [220] = { 55, 56 }, [224] = { 55, 56 },
                             [225] = { 55, 56 }, [229] = { 55, 56 }, [230] = { 55, 56 }, [233] = { 55, 56 },
                             [234] = { 55, 56 }, [239] = { 57, 58 }, [250] = { 57, 58 }, [252] = { 57, 58 },
                             [255] = { 57, 58 }, [299] = { 57, 58 }, [306] = { 57, 58 }, [312] = { 57, 58 },
                             [316] = { 57, 58 }, [319] = { 57, 58 }, [323] = { 57, 58 }, [326] = { 57, 58 },
                             [330] = { 57, 58 }, [331] = { 57, 58 }, [332] = { 57, 58 }, [336] = { 57, 58 },
                             [340] = { 57, 58 }, [351] = { 55, 56 }, [352] = { 55, 56 }, [353] = { 55, 56 },
                             [358] = { 55, 56 }, [361] = { 55, 56 }, [362] = { 55, 56 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Seether / Empty', notes = { 'Source species: Seether (ID 286); family ID 113.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [51] = 2545, [52] = 2627, [53] = 2709, [54] = 2791, [55] = 2874, [56] = 2956, [57] = 3038, [58] = 3120 }, mp = { [51] = 1426, [52] = 1457, [53] = 1488, [54] = 1519, [55] = 1550, [56] = 1581, [57] = 1612, [58] = 1643 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[88],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Deviator',
            ids    = { 137 },
            nm     = true,
            job    = 'war/blm',
            levels = {
                [58] = { acc = 225, eva = 209, agi = 59, int = 54, mnd = 48, chr = 53, dex = 65, def = 223,
                         attack_skill = 186 },
                [59] = { acc = 231, eva = 215, agi = 60, int = 56, mnd = 49, chr = 54, dex = 67, def = 228,
                         attack_skill = 191 },
                [60] = { acc = 236, eva = 220, agi = 60, int = 56, mnd = 49, chr = 54, dex = 67, def = 233,
                         attack_skill = 196 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, water = -3, paralyze = 11, bind = 11, silence = 11,
                       poison = -3 },
            immune = { 'silence' },
            drops  = {
                { rate = 1000, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1759 },  -- recollection of suffering
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Wanderer / Empty', notes = { 'Source species: Wanderer (ID 290); family ID 115.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [58] = 6300, [59] = 6300, [60] = 6300 }, mp = { [58] = 7000, [59] = 7000, [60] = 7000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 50', notes = { 'Source base speed is 50; the ordinary monster default is 40. Animation speed is 50.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Remnant Of A Cerebrator to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted spell argument is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted spell argument is not resolved.' }, general_notes = danger[24] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Stray',
            ids    = { 181, 188, 195, 202, 276, 285, 294 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [47] = { acc = 170, eva = 156, agi = 46, int = 43, mnd = 43, chr = 44, dex = 53, def = 172,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 43, mnd = 43, chr = 45, dex = 53, def = 176,
                         attack_skill = 141 },
                [49] = { acc = 177, eva = 163, agi = 48, int = 44, mnd = 44, chr = 45, dex = 55, def = 179,
                         attack_skill = 144 },
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47, dex = 56, def = 182,
                         attack_skill = 147 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48, dex = 58, def = 187,
                         attack_skill = 151 },
            },
            spawn_levels = { [181] = { 47, 49 }, [188] = { 47, 49 }, [195] = { 47, 49 }, [202] = { 47, 49 },
                             [276] = { 49, 51 }, [285] = { 49, 51 }, [294] = { 49, 51 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Weeper / Empty', notes = { 'Source species: Weeper (ID 292); family ID 116.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [47] = 495, [48] = 495, [49] = 495, [50] = 495, [51] = 495 }, mp = { [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395, [51] = 1426 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[49],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Wailer',
            ids    = { 226 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [58] = { acc = 224, eva = 208, agi = 56, int = 51, mnd = 51, chr = 53, dex = 63, def = 224,
                         attack_skill = 186 },
                [59] = { acc = 230, eva = 213, agi = 57, int = 52, mnd = 52, chr = 54, dex = 65, def = 229,
                         attack_skill = 191 },
                [60] = { acc = 235, eva = 218, agi = 57, int = 52, mnd = 52, chr = 54, dex = 65, def = 234,
                         attack_skill = 196 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, light = -3, dark = 11, paralyze = 11, bind = 11,
                       poison = -3, light_sleep = -3, dark_sleep = 11, blind = 11 },
            drops  = {
                { rate = 1000, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1760 },  -- recollection of animosity
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Weeper / Empty', notes = { 'Source species: Weeper (ID 292); family ID 116.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [58] = 8800, [59] = 8800, [60] = 8800 }, mp = { [58] = 1643, [59] = 1674, [60] = 1705 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Trade pop', notes = { 'Trade Remnant Of A Coveter to the ???; other trade and spawn checks still apply.', 'Source rules only; no remaining time or open spawn window is known.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted move chooser return is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = { 'A scripted move chooser return is not resolved.' }, general_notes = danger[24] },
                blue = { value = 'Unknown', notes = { 'A scripted move chooser return is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Stray',
            ids    = { 280, 289, 298 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [49] = { acc = 177, eva = 164, agi = 50, int = 44, mnd = 44, chr = 45, dex = 55, def = 183,
                         attack_skill = 144 },
                [50] = { acc = 181, eva = 167, agi = 51, int = 45, mnd = 45, chr = 47, dex = 56, def = 187,
                         attack_skill = 147 },
                [51] = { acc = 187, eva = 172, agi = 53, int = 46, mnd = 46, chr = 48, dex = 58, def = 191,
                         attack_skill = 151 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Seether / Empty', notes = { 'Source species: Seether (ID 286); family ID 113.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [49] = 450, [50] = 450, [51] = 450 }, mp = { [49] = 1365, [50] = 1395, [51] = 1426 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[88],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Provoker',
            ids    = { 329 },
            nm     = true,
            job    = 'war/rdm',
            levels = {
                [58] = { acc = 274, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53, dex = 63, def = 228,
                         attack_skill = 186 },
                [59] = { acc = 280, eva = 215, agi = 60, int = 52, mnd = 52, chr = 54, dex = 65, def = 234,
                         attack_skill = 191 },
                [60] = { acc = 285, eva = 220, agi = 60, int = 52, mnd = 52, chr = 54, dex = 65, def = 239,
                         attack_skill = 196 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 1000, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1761 },  -- recollection of anxiety
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true, scripted_weapons = true },
            info = {
                family = { value = 'Seether / Empty', notes = { 'Source species: Seether (ID 286); family ID 113.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [58] = 9600, [59] = 9600, [60] = 9600 }, mp = { [58] = 1643, [59] = 1674, [60] = 1705 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'No base crystal element', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 35', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Idle despawn 3 minutes', notes = { 'Source idle-despawn delay: 3 minutes. This is not its remaining lifetime.' } },
                dangers = danger[88],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
