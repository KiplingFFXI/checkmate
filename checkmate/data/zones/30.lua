-- Riverne-Site A01 (zone 30).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[2] = { danger[1] };
danger[3] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[4] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[5] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[6] = { notes = danger[4], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[5] };
danger[7] = { 'Normal attacks: Weight. Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.', 'Jettatura: Terror. Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Nihility Song: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'Choke Breath: Paralysis, Silence. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[8] = { 'Additional effects require a connecting normal attack. Proc checks, resistance and immunity can prevent them. An active enspell can take priority over the scripted additional effect. The current proc rate is not calculated.' };
danger[9] = { 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[10] = { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[11] = { danger[10] };
danger[12] = { notes = danger[9], unknown = {  }, removals = danger[11] };
danger[13] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: Weight', notes = danger[8], categories = { 'debuff' }, effects = { 'Weight' }, details = danger[12] };
danger[14] = { 'Random effects may not all happen on the same use. The gaze effect requires the target to face the monster. Source targeting: cone.' };
danger[15] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 7 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[16] = { notes = danger[15], unknown = {  }, activation_range = 7.0, shape = 'front cone', cone_length = 7.0, shadows = { { mode = 'ignore' } } };
danger[17] = { kind = 'skill', id = 577, name = 'Jettatura', summary = 'Jettatura: Terror', notes = danger[14], categories = { 'debuff' }, effects = { 'Terror' }, details = danger[16] };
danger[18] = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.' };
danger[19] = { 'Normal activation range: 12.5 yalms. This is the move selection limit, not its affected area.', 'Area: 12.5 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[20] = { notes = danger[19], unknown = {  }, activation_range = 12.5, shape = 'area around the monster', effect_radius = 12.5, shadows = { { mode = 'ignore' } } };
danger[21] = { kind = 'skill', id = 578, name = 'Nihility Song', summary = 'Nihility Song: Buff removal', notes = danger[18], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[20] };
danger[22] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 7 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Paralysis: Paralyna, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[23] = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } };
danger[24] = { notes = danger[22], unknown = {  }, activation_range = 7.0, shape = 'front cone', cone_length = 7.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = danger[23] };
danger[25] = { kind = 'skill', id = 579, name = 'Choke Breath', summary = 'Choke Breath: Paralysis, Silence', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis', 'Silence' }, details = danger[24] };
danger[26] = { danger[13], danger[17], danger[21], danger[25] };
danger[27] = { value = 'Normal attacks: Weight; Jettatura: Terror; Nihility Song: Buff removal; Choke Breath: Paralysis, Silence', notes = danger[7], entries = danger[26], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[3] };
danger[28] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[29] = { 'Dispelling Wind: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Deadly Drive: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Fang Rush: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Dread Shriek: Paralysis. Random effects may not all happen on the same use. Source targeting: area around the monster.', 'Tail Crush: Poison, can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Radiant Breath: silence and slow. Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[30] = { 'Only effects allowed by the move\'s dispel checks can be removed. Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[31] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[32] = { notes = danger[31], unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } } };
danger[33] = { kind = 'skill', id = 813, name = 'Dispelling Wind', summary = 'Dispelling Wind: Buff removal', notes = danger[30], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[32] };
danger[34] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[35] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[36] = { notes = danger[35], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[37] = { kind = 'skill', id = 814, name = 'Deadly Drive', summary = 'Deadly Drive: can crit', notes = danger[34], categories = { 'crit' }, effects = {  }, details = danger[36] };
danger[38] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[39] = { notes = danger[38], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[40] = { kind = 'skill', id = 816, name = 'Fang Rush', summary = 'Fang Rush: can crit', notes = danger[34], categories = { 'crit' }, effects = {  }, details = danger[39] };
danger[41] = { 'Random effects may not all happen on the same use. Source targeting: area around the monster.' };
danger[42] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' };
danger[43] = { notes = danger[42], unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } };
danger[44] = { kind = 'skill', id = 817, name = 'Dread Shriek', summary = 'Dread Shriek: Paralysis', notes = danger[41], categories = { 'debuff' }, effects = { 'Paralysis' }, details = danger[43] };
danger[45] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[46] = { notes = danger[45], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[47] = { kind = 'skill', id = 818, name = 'Tail Crush', summary = 'Tail Crush: Poison, can crit', notes = danger[34], categories = { 'crit', 'debuff' }, effects = { 'Poison' }, details = danger[46] };
danger[48] = { 'Light breath damage that ignores shadows. On a successful damage result it attempts Silence and Slow. Source targeting: cone. Possible effects: Silence, Slow.' };
danger[49] = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy; Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[50] = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[1] };
danger[51] = { notes = danger[49], unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = danger[50] };
danger[52] = { kind = 'skill', id = 821, name = 'Radiant Breath', summary = 'Radiant Breath: silence and slow', notes = danger[48], categories = { 'debuff' }, effects = { 'Silence', 'Slow' }, details = danger[51] };
danger[53] = { danger[33], danger[37], danger[40], danger[44], danger[47], danger[52] };
danger[54] = { value = 'Dispelling Wind: Buff removal; Deadly Drive: can crit; Fang Rush: can crit; Dread Shriek: Paralysis; Tail Crush: Poison, can crit; Radiant Breath: silence and slow', notes = danger[29], entries = danger[53], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[3] };
danger[55] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[56] = { notes = danger[55], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[57] = { kind = 'skill', id = 660, name = 'Venom', summary = 'Venom: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[56] };
danger[58] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'A scripted move chooser return is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[59] = { 'The assigned TP-move list is missing from the source tables.', 'A scripted move chooser return is not resolved.' };
danger[60] = { value = 'Move list unresolved', notes = danger[58], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[59], general_notes = danger[3] };
danger[61] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[62] = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[63] = { value = 'Move list unresolved', notes = danger[61], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[62], general_notes = danger[3] };
danger[64] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[65] = { notes = danger[64], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { superlink = { 'Heliodromos' } },
        [2] = { superlink = { 'Carmine Dobsonfly' }, sound = { 'Carmine Dobsonfly', 'Hawker' } },
        [3] = { superlink = { 'Carmine Dobsonfly' }, sound = { 'Hawker' } },
        [4] = { sound = { 'Ziryu' } },
        [5] = { sound = { 'Ziryu' }, true_both = { 'Ouryu' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Carmine Dobsonfly'] = { id = 188, name = 'Fly' },
        ['Hawker'] = { id = 188, name = 'Fly' },
        ['Heliodromos'] = { id = 83, name = 'Hippogryph' },
        ['Ouryu'] = { id = 98, name = 'Wyrm' },
        ['Ziryu'] = { id = 10, name = 'Worm' },
    },
    monsters = {
        {
            name   = 'Hawkertrap',
            ids    = { 1, 2, 18, 19, 26, 27, 33, 36, 47, 48, 49, 50, 51, 59, 60, 61, 62, 63, 80, 81, 82, 83, 92, 93,
                       94, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112 },
            levels = {
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36, dex = 42, def = 144,
                         attack_skill = 112 },
                [39] = { acc = 142, eva = 133, agi = 44, int = 32, mnd = 32, chr = 37, dex = 44, def = 149,
                         attack_skill = 115 },
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37, dex = 44, def = 152,
                         attack_skill = 118 },
                [41] = { acc = 149, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39, dex = 47, def = 156,
                         attack_skill = 121 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [38] = 1436, [39] = 1514, [40] = 1641, [41] = 1719 }, mp = { [38] = 0, [39] = 0, [40] = 0, [41] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Soporific: sleep; Palsy Pollen: Paralysis; Gloeosuccus: Slow', notes = { 'Soporific: sleep. Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep.', 'Palsy Pollen: Paralysis. Source targeting: cone.', 'Gloeosuccus: Slow. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 434, name = 'Soporific', summary = 'Soporific: sleep', notes = { 'Attempts Sleep on its targets. Source targeting: area around the monster. Possible effects: Sleep.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } } } }, { kind = 'skill', id = 435, name = 'Palsy Pollen', summary = 'Palsy Pollen: Paralysis', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Paralysis' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Paralysis: Paralyna, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } } } } }, { kind = 'skill', id = 436, name = 'Gloeosuccus', summary = 'Gloeosuccus: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = danger[2] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[3] },
                blue = { value = 'Soporific', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 598, name = 'Soporific', level = 24, min_skill = 44, skill_ids = { 434 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Riverne Vulture',
            ids    = { 3, 4, 5, 6, 8, 9, 20, 21, 22, 28, 29, 30, 31, 34, 35, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46,
                       52, 53, 54, 55, 64, 65, 66, 84, 85, 86, 95, 96, 97 },
            levels = {
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37, dex = 44, def = 148,
                         attack_skill = 115 },
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 37, dex = 44, def = 151,
                         attack_skill = 118 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39, dex = 47, def = 155,
                         attack_skill = 121 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39, dex = 47, def = 157,
                         attack_skill = 123 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 100, item = 847 },  -- bird feather
                { rate = 100, item = 1665 },  -- copper key
                { rate = 50, item = 4570 },  -- bird egg
            },
            steal  = { 847 },  -- bird feather
            info = {
                family = { value = 'Bird / Bird', notes = { 'Source species: Bird (ID 175); family ID 78.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [39] = 1514, [40] = 1641, [41] = 1719, [42] = 1802 }, mp = { [39] = 0, [40] = 0, [41] = 0, [42] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Broadside Barrage: STR down, VIT down; Blind Side Barrage: INT down, MND down; Damnation Dive: Stun', notes = { 'Broadside Barrage: STR down, VIT down. Source targeting: single target.', 'Blind Side Barrage: INT down, MND down. Source targeting: single target.', 'Damnation Dive: Stun. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 1159, name = 'Broadside Barrage', summary = 'Broadside Barrage: STR down, VIT down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'STR down', 'VIT down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down, VIT down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'VIT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1160, name = 'Blind Side Barrage', summary = 'Blind Side Barrage: INT down, MND down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'INT down', 'MND down' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: INT down, MND down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'INT down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } }, { effect = 'MND down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 1161, name = 'Damnation Dive', summary = 'Damnation Dive: Stun', notes = { 'Random effects may not all happen on the same use. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[6] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[3] },
                blue = { value = 'Helldive', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 567, name = 'Helldive', level = 16, min_skill = 20, skill_ids = { 622 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Hippogryph',
            ids    = { 7, 10, 11, 12, 13, 23, 24, 32, 56, 57, 58, 70, 71, 78, 90, 91, 101, 102, 114, 115 },
            job    = 'thf/thf',
            levels = {
                [40] = { acc = 149, eva = 168, agi = 47, int = 44, mnd = 29, chr = 29, dex = 52, def = 142,
                         attack_skill = 118 },
                [41] = { acc = 153, eva = 173, agi = 50, int = 47, mnd = 32, chr = 32, dex = 54, def = 146,
                         attack_skill = 121 },
                [42] = { acc = 156, eva = 176, agi = 50, int = 47, mnd = 32, chr = 32, dex = 54, def = 148,
                         attack_skill = 123 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Hippogryph / Bird', notes = { 'Source species: Hippogryph (ID 187); family ID 83.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [40] = 1213, [41] = 1273, [42] = 1336 }, mp = { [40] = 551, [41] = 566, [42] = 581 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +15%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Jettatura', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 575, name = 'Jettatura', level = 48, min_skill = 116, skill_ids = { 577 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Heliodromos',
            ids    = { 14, 15, 16 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [45] = { acc = 167, eva = 186, agi = 52, int = 49, mnd = 33, chr = 33, dex = 58, def = 158,
                         attack_skill = 132 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -2, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 15348 },  -- mountain gaiters
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
            info = {
                family = { value = 'Hippogryph / Bird', notes = { 'Source species: Hippogryph (ID 187); family ID 83.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2640 }, mp = { [45] = 626 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Triple Attack 15', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Scripted spawn', notes = { 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[27],
                blue = { value = 'Jettatura', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 575, name = 'Jettatura', level = 48, min_skill = 116, skill_ids = { 577 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 17, 25, 144, 168 },
            job    = 'blm/rdm',
            levels = {
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45, dex = 48, def = 151,
                         attack_skill = 129 },
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45, dex = 48, def = 155,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45, dex = 49, def = 158,
                         attack_skill = 135 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47, dex = 50, def = 161,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47, dex = 50, def = 164,
                         attack_skill = 141 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47, dex = 51, def = 167,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
            },
            spawn_levels = { [17] = { 44, 47 }, [25] = { 44, 47 }, [144] = { 47, 50 }, [168] = { 47, 50 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1740, [45] = 1813, [46] = 1889, [47] = 1966, [48] = 2043, [49] = 2116, [50] = 2241 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Wind weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence: silence; Gravity: Weight; Choke: Choke', notes = { 'Silence: silence. Possible effects: Silence.', 'Gravity: Weight.', 'Choke: Choke.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } }, level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[11] }, level_ranges = { { 21, 255 } } }, { kind = 'spell', id = 237, name = 'Choke', summary = 'Choke: Choke', notes = {  }, categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 20, 50 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[28] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Firedrake',
            ids    = { 67, 68, 69, 72, 73, 74, 75, 76, 77, 87, 88, 89, 98, 99, 100, 116, 117, 118, 119 },
            levels = {
                [41] = { acc = 151, eva = 140, agi = 47, int = 40, mnd = 33, chr = 37, dex = 50, def = 157,
                         attack_skill = 121 },
                [42] = { acc = 154, eva = 142, agi = 47, int = 40, mnd = 33, chr = 37, dex = 50, def = 159,
                         attack_skill = 123 },
                [43] = { acc = 157, eva = 145, agi = 47, int = 40, mnd = 33, chr = 37, dex = 50, def = 162,
                         attack_skill = 126 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 100, item = 1122 },  -- wyvern skin
                { rate = 50, item = 1124 },  -- wyvern wing
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [41] = 1719, [42] = 1802, [43] = 1885 }, mp = { [41] = 0, [42] = 0, [43] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[54],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 79, 113, 211 },
            job    = 'blm/rdm',
            levels = {
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45, dex = 48, def = 151,
                         attack_skill = 129 },
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45, dex = 48, def = 155,
                         attack_skill = 132 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45, dex = 49, def = 158,
                         attack_skill = 135 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47, dex = 50, def = 161,
                         attack_skill = 138 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47, dex = 50, def = 164,
                         attack_skill = 141 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47, dex = 51, def = 167,
                         attack_skill = 144 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50, dex = 53, def = 171,
                         attack_skill = 147 },
            },
            spawn_levels = { [79] = { 44, 47 }, [113] = { 47, 50 }, [211] = { 47, 50 } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1740, [45] = 1813, [46] = 1889, [47] = 1966, [48] = 2043, [49] = 2116, [50] = 2241 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273, [47] = 1303, [48] = 1334, [49] = 1365, [50] = 1395 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Thunder crystal (conditional)', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Thunder weather; Respawn 16 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Shock: Shock; Stun: stun', notes = { 'Shock: Shock.', 'Stun: stun. Possible effects: Stun.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 239, name = 'Shock', summary = 'Shock: Shock', notes = {  }, categories = { 'debuff' }, effects = { 'Shock' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Shock: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Shock', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 16, 50 } } }, { kind = 'spell', id = 252, name = 'Stun', summary = 'Stun: stun', notes = { 'Possible effects: Stun.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = danger[5] }, level_ranges = { { 37, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[28] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Hawker',
            ids    = { 120, 121, 122, 123, 124, 125, 126, 127, 151, 152, 153, 154, 155, 156, 157, 158, 161, 162,
                       163, 164, 165, 166, 167, 174, 175, 176, 177, 178, 191, 192, 193, 194, 195 },
            levels = {
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42, dex = 49, def = 168,
                         attack_skill = 132 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42, dex = 51, def = 171,
                         attack_skill = 135 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43, dex = 52, def = 174,
                         attack_skill = 138 },
                [48] = { acc = 173, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44, dex = 52, def = 177,
                         attack_skill = 141 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 2,
            info = {
                family = { value = 'Fly / Vermin', notes = { 'Source species: Fly (ID 444); family ID 188.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2046, [46] = 2129, [47] = 2212, [48] = 2295 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Venom: Poison', notes = { 'Venom: Poison. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[57] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[3] },
                blue = { value = 'Cursed Sphere', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 544, name = 'Cursed Sphere', level = 18, min_skill = 26, skill_ids = { 659 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Cloud Hippogryph',
            ids    = { 128, 129, 130, 169, 170, 171, 172, 173, 180, 181, 182, 183, 184, 185, 186, 187, 188 },
            job    = 'thf/thf',
            levels = {
                [45] = { acc = 167, eva = 186, agi = 52, int = 49, mnd = 33, chr = 33, dex = 58, def = 158,
                         attack_skill = 132 },
                [46] = { acc = 170, eva = 190, agi = 54, int = 51, mnd = 34, chr = 34, dex = 58, def = 161,
                         attack_skill = 135 },
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 35, dex = 61, def = 164,
                         attack_skill = 138 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 10, item = 1619 },  -- hippogryph feather
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Hippogryph / Bird', notes = { 'Source species: Hippogryph (ID 187); family ID 83.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 1523, [46] = 1585, [47] = 1648 }, mp = { [45] = 626, [46] = 641, [47] = 656 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +15%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[27],
                blue = { value = 'Jettatura', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 575, name = 'Jettatura', level = 48, min_skill = 116, skill_ids = { 577 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Atomic Cluster',
            ids    = { 131, 132, 145, 146, 147, 148, 149, 159, 160, 179, 189, 190, 203, 204, 212, 213, 214, 215 },
            levels = {
                [45] = { acc = 164, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45, dex = 52, def = 170,
                         attack_skill = 132 },
                [46] = { acc = 168, eva = 156, agi = 51, int = 37, mnd = 37, chr = 46, dex = 55, def = 173,
                         attack_skill = 135 },
                [47] = { acc = 171, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46, dex = 55, def = 176,
                         attack_skill = 138 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 38, mnd = 38, chr = 47, dex = 55, def = 179,
                         attack_skill = 141 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 100, item = 1880 },  -- pot of clustered tar
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 17305 },  -- cluster arm
            },
            steal  = { 1667 },  -- cluster core
            aggro  = true,
            detects = { 'sight', 'magic' },
            info = {
                family = { value = 'Cluster / Arcana', notes = { 'Source species: Cluster (ID 59); family ID 25.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [45] = 2046, [46] = 2129, [47] = 2212, [48] = 2295 }, mp = { [45] = 0, [46] = 0, [47] = 0, [48] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Circle Of Flames: Weight', notes = { 'Circle Of Flames: Weight. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'A scripted choice table adds a move that is not resolved.' }, entries = { { kind = 'skill', id = 570, name = 'Circle Of Flames', summary = 'Circle Of Flames: Weight', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = danger[11] } } }, coverage = 'partial', incomplete = true, reasons = { 'A scripted choice table adds a move that is not resolved.' }, general_notes = danger[3] },
                blue = { value = 'Refueling', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.', 'Additional lessons are unknown because part of the move selection is unresolved.', 'A scripted choice table adds a move that is not resolved.' }, spells = { { id = 530, name = 'Refueling', level = 48, min_skill = 116, skill_ids = { 569 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = true },
            },
        },
        {
            name   = 'Flamedrake',
            ids    = { 133, 150, 205, 206, 207, 208, 209 },
            levels = {
                [47] = { acc = 171, eva = 159, agi = 52, int = 43, mnd = 35, chr = 40, dex = 55, def = 176,
                         attack_skill = 138 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 44, mnd = 36, chr = 42, dex = 55, def = 179,
                         attack_skill = 141 },
                [49] = { acc = 178, eva = 165, agi = 53, int = 46, mnd = 38, chr = 42, dex = 57, def = 182,
                         attack_skill = 144 },
            },
            ph_for = { [209] = { 210 } },
            ph_rules = {
                [209] = {
                    [210] = { chance = 10, cooldown_min = 75600, cooldown_max = 75600, conditions = { 'A successful roll uses the PH respawn delay.' } },
                },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [47] = 2212, [48] = 2295, [49] = 2373 }, mp = { [47] = 0, [48] = 0, [49] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 14 minutes', notes = { 'Base respawn delay: 14 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = danger[54],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Carmine Dobsonfly',
            ids    = { 134, 135, 136, 137, 138, 139, 140, 141, 142, 143 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [44] = { acc = 157, eva = 141, agi = 43, int = 49, mnd = 49, chr = 45, dex = 45, def = 153,
                         attack_skill = 129 },
                [45] = { acc = 160, eva = 144, agi = 45, int = 49, mnd = 49, chr = 45, dex = 45, def = 157,
                         attack_skill = 132 },
                [46] = { acc = 163, eva = 148, agi = 46, int = 51, mnd = 51, chr = 45, dex = 45, def = 160,
                         attack_skill = 135 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            weapon_dmg = { piercing = 25 },
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 15183 },  -- dobson bandana
                { rate = 150, item = 14669 },  -- jaeger ring
                { rate = 100, item = 15184 },  -- voyager sallet
            },
            links  = 3,
            info = {
                family = { value = 'Fly / Vermin', notes = { 'Source species: Fly (ID 444); family ID 188.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [44] = 1300, [45] = 1300, [46] = 1300 }, mp = { [44] = 1212, [45] = 1243, [46] = 1273 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                spawn = { value = 'Scripted spawn', notes = { 'The NM\'s actual respawn is controlled by its script or spawn rules; the base delay is not a live window.', 'Scripted spawn or respawn checks also apply. Their current state is not visible.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = { value = 'Venom: Poison; Slowga: Slow', notes = { 'Venom: Poison. Source targeting: cone.', 'Slowga: Slow.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { danger[57], { kind = 'spell', id = 357, name = 'Slowga', summary = 'Slowga: Slow', notes = {  }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 16 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'area around the target', effect_radius = 16.0, shadows = { { mode = 'wipe' } }, removals = danger[2] }, level_ranges = { { 1, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[28] },
                blue = { value = 'Cursed Sphere', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 544, name = 'Cursed Sphere', level = 18, min_skill = 26, skill_ids = { 659 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Aiatar',
            ids    = { 210 },
            nm     = true,
            levels = {
                [51] = { acc = 188, eva = 174, agi = 56, int = 47, mnd = 39, chr = 45, dex = 60, def = 191,
                         attack_skill = 151 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 47, mnd = 39, chr = 45, dex = 60, def = 196,
                         attack_skill = 156 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 100, item = 15367 },  -- falconers hose
                { rate = 100, item = 15370 },  -- sable cuisses
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [51] = 5200, [52] = 5200 }, mp = { [51] = 0, [52] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Lottery', notes = { 'Lottery spawn; see a listed placeholder for its chance and cooldown rules.', 'Source rules only; no remaining time or open spawn window is known.' } },
                claim = { value = 'Claimshield 5 seconds', notes = { 'This Phoenix list entry is unclaimable and unkillable for 5 seconds after spawning. Call for Help is blocked during the shield.', 'When the shield ends, Phoenix selects claim from eligible entries on its enmity list. Remaining shield time and the winner are not known.' } },
                dangers = danger[54],
                blue = { value = 'Radiant Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 565, name = 'Radiant Breath', level = 54, min_skill = 142, skill_ids = { 821 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 216 },
            job    = 'blm/rdm',
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67, dex = 72, def = 284,
                         attack_skill = 241 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70, dex = 74, def = 290,
                         attack_skill = 246 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'poison' },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Water Elemental (ID 267); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3200, [73] = 3200 }, mp = { [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 217 },
            job    = 'blm/rdm',
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67, dex = 72, def = 284,
                         attack_skill = 241 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70, dex = 74, def = 290,
                         attack_skill = 246 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'stun', 'slow', 'elegy' },
            aggro  = true,
            detects = { 'magic' },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Earth Elemental (ID 260); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [72] = 3200, [73] = 3200 }, mp = { [72] = 2085, [73] = 2117 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Ordinary item drops disabled', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'This does not describe separate scripted or encounter completion rewards.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[60],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Ouryu',
            ids    = { 218 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [90] = { acc = 407, eva = 370, agi = 72, int = 77, mnd = 82, chr = 102, dex = 92, def = 446,
                         attack_skill = 341 },
            },
            ranks  = { wind = -2, earth = 11, thunder = 11, silence = -2, slow = 11, stun = 11, gravity = -2 },
            magic_dmg = { all = -50 },
            weapon_guard = { ranged = -50 },
            immune = { 'stun', 'slow', 'elegy', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1703 },  -- chunk of kunwu ore
                { rate = 1000, item = 1703 },  -- chunk of kunwu ore
                { rate = 1000, item = 2108 },  -- monarchs orb
                { rate = 1000, item = 1703 },  -- chunk of kunwu ore
                { rate = 1000, item = 1816 },  -- wyrm horn
                { rate = 1000, item = 17658 },  -- tutelary
                { rate = 100, item = 17799 },  -- imanotsurugi
                { rate = 240, group = {  -- one of
                    { 1313, 1500 },  -- lock of sirens hair
                    { 836, 1500 },  -- square of damascene cloth
                    { 1110, 1500 },  -- vial of black beetle blood
                    { 655, 1000 },  -- adaman ingot
                    { 658, 1000 },  -- damascus ingot
                    { 722, 1000 },  -- divine log
                    { 837, 1000 },  -- spool of malboro fiber
                    { 860, 750 },  -- behemoth hide
                    { 1311, 750 },  -- piece of oxblood
                } },
                { rate = 240, group = {  -- one of
                    { 4272, 5000 },  -- slice of dragon meat
                    { 903, 3000 },  -- dragon talon
                    { 4486, 1000 },  -- dragon heart
                    { 1133, 1000 },  -- vial of dragon blood
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            info = {
                family = { value = 'Wyrm / Dragon', notes = { 'Source species: Earth Wyrm (ID 229); family ID 98.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [90] = 50000 }, mp = { [90] = 2667 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 15', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Conditional draw-in', notes = { 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = danger[63],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ziryu',
            ids    = { 219, 220, 221, 222 },
            job    = 'blm/rdm',
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 88, mnd = 67, chr = 64, dex = 72, def = 282,
                         attack_skill = 241 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 89, mnd = 68, chr = 66, dex = 74, def = 288,
                         attack_skill = 246 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 90, mnd = 68, chr = 66, dex = 75, def = 293,
                         attack_skill = 251 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 1830 },  -- sack of lugworm sand
                { rate = 150, item = 1831 },  -- sack of little worm mulch
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 5,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [72] = 3500, [73] = 3500, [74] = 3500 }, mp = { [72] = 2085, [73] = 2117, [74] = 2149 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[63],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Arcane Phantasm',
            ids    = { 223 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [44] = { acc = 157, eva = 138, agi = 36, int = 45, mnd = 45, chr = 55, dex = 45, def = 155,
                         attack_skill = 129 },
                [45] = { acc = 160, eva = 140, agi = 37, int = 45, mnd = 45, chr = 55, dex = 45, def = 158,
                         attack_skill = 132 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Fomor (ID 403); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [44] = 1829, [45] = 1904 }, mp = { [44] = 0, [45] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Dark crystal (conditional)', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 100% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Foxfire: Stun; Grim Halo: can crit; Netherspikes: Bind; Aegis Schism: Defense down; Dancing Chains: Drown; Barbed Crescent: Accuracy down; Foe Requiem III: Requiem; Horde Lullaby: Sleep; Battlefield Elegy: Elegy; Magic Finale: Buff removal; Foe Lullaby: Sleep', notes = { 'Foxfire: Stun. Source targeting: cone.', 'Grim Halo: can crit. This move can crit. Its current critical chance is not known. Source targeting: area around the monster.', 'Netherspikes: Bind. Source targeting: cone.', 'Aegis Schism: Defense down. Source targeting: single target.', 'Dancing Chains: Drown. Source targeting: area around the monster.', 'Barbed Crescent: Accuracy down. Source targeting: single target.', 'Foe Requiem III: Requiem.', 'Horde Lullaby: Sleep.', 'Battlefield Elegy: Elegy.', 'Magic Finale: Buff removal.', 'Foe Lullaby: Sleep.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' }, entries = { { kind = 'skill', id = 247, name = 'Foxfire', summary = 'Foxfire: Stun', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[6] }, { kind = 'skill', id = 248, name = 'Grim Halo', summary = 'Grim Halo: can crit', notes = { 'This move can crit. Its current critical chance is not known. Source targeting: area around the monster.' }, categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } } }, { kind = 'skill', id = 249, name = 'Netherspikes', summary = 'Netherspikes: Bind', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 251, name = 'Aegis Schism', summary = 'Aegis Schism: Defense down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Defense down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 252, name = 'Dancing Chains', summary = 'Dancing Chains: Drown', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Drown' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: 10 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Drown: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'area around the monster', effect_radius = 10.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Drown', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 253, name = 'Barbed Crescent', summary = 'Barbed Crescent: Accuracy down', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Accuracy down' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } } } } }, { kind = 'spell', id = 370, name = 'Foe Requiem III', summary = 'Foe Requiem III: Requiem', notes = {  }, categories = { 'debuff' }, effects = { 'Requiem' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Requiem: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 16.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Requiem', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 37, 46 } } }, { kind = 'spell', id = 376, name = 'Horde Lullaby', summary = 'Horde Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Base casting range: 16 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: 4 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'The area spell removes Utsusemi and Blink before its effect check.' }, unknown = {  }, activation_range = 16.0, shape = 'area around the target', effect_radius = 4.0, shadows = { { mode = 'wipe' } } }, level_ranges = { { 27, 255 } } }, { kind = 'spell', id = 421, name = 'Battlefield Elegy', summary = 'Battlefield Elegy: Elegy', notes = {  }, categories = { 'debuff' }, effects = { 'Elegy' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Elegy: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Elegy', options = { 'Erase (one random eligible timed ailment)' } } } }, level_ranges = { { 39, 58 } } }, { kind = 'spell', id = 462, name = 'Magic Finale', summary = 'Magic Finale: Buff removal', notes = {  }, categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[65], level_ranges = { { 33, 255 } } }, { kind = 'spell', id = 463, name = 'Foe Lullaby', summary = 'Foe Lullaby: Sleep', notes = {  }, categories = { 'debuff' }, effects = { 'Sleep' }, details = danger[65], level_ranges = { { 16, 255 } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[28] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
