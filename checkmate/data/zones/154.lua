-- Dragons Aery (zone 154).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[2] = { danger[1] };
danger[3] = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' };
danger[4] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[5] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' };
danger[6] = { notes = danger[5], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } };
danger[7] = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Poison: Poisona, Antidote, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[8] = { notes = danger[7], unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } } } };
danger[9] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[10] = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The damage step removes Utsusemi and Blink without letting them absorb it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[11] = { notes = danger[10], unknown = {  }, activation_range = 30.0, shape = 'area around the monster', effect_radius = 30.0, shadows = { { mode = 'wipe', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } };
danger[12] = { 'Can hit from behind while grounded. Its skill check also excludes several special buffs. Source targeting: area around the target.' };
danger[13] = { 'Normal activation range: 30 yalms. This is the move selection limit, not its affected area.', 'Area: 30 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' };
danger[14] = { notes = danger[13], unknown = {  }, activation_range = 30.0, shape = 'area around the target', effect_radius = 30.0, shadows = { { mode = 'absorb', per_hit = true, count = 3 } } };
danger[15] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[16] = { 'Normal activation range: 18 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[17] = { notes = danger[16], unknown = {  }, activation_range = 18.0, shape = 'single target', shadows = { { mode = 'ignore' } } };
danger[18] = { kind = 'skill', id = 957, name = 'Absolute Terror', summary = 'Absolute Terror: Terror', notes = danger[15], categories = { 'debuff' }, effects = { 'Terror' }, details = danger[17] };
danger[19] = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.' };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Bark Tarantula' } },
        [2] = { sound = { 'Darter' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Bark Tarantula'] = { id = 195, name = 'Spider' },
        ['Darter'] = { id = 188, name = 'Fly' },
    },
    monsters = {
        {
            name   = 'Demonic Pugil',
            ids    = { 1, 2, 3, 4, 5 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57, dex = 73, def = 289,
                         attack_skill = 233 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60, dex = 75, def = 293,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 60, dex = 75, def = 298,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60, dex = 76, def = 305,
                         attack_skill = 246 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60, dex = 77, def = 310,
                         attack_skill = 251 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62, dex = 77, def = 315,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [70] = 4191, [71] = 4275, [72] = 4359, [73] = 4443, [74] = 4527, [75] = 4611 }, mp = { [70] = 0, [71] = 0, [72] = 0, [73] = 0, [74] = 0, [75] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Water crystal (conditional)', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Intimidate: Slow; Aqua Ball: STR down; Screwdriver: can crit', notes = { 'Intimidate: Slow. The gaze effect requires the target to face the monster. Source targeting: cone.', 'Aqua Ball: STR down. Source targeting: area around the target.', 'Screwdriver: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 449, name = 'Intimidate', summary = 'Intimidate: Slow', notes = { 'The gaze effect requires the target to face the monster. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 10 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 10 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 10.0, shape = 'front cone', cone_length = 10.0, shadows = { { mode = 'ignore' } }, removals = danger[2] } }, { kind = 'skill', id = 450, name = 'Aqua Ball', summary = 'Aqua Ball: STR down', notes = { 'Source targeting: area around the target.' }, categories = { 'debuff' }, effects = { 'STR down' }, details = { notes = { 'Normal activation range: 12 yalms. This is the move selection limit, not its affected area.', 'Area: 8 yalms radius, area around the target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: STR down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 12.0, shape = 'area around the target', effect_radius = 8, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'STR down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 452, name = 'Screwdriver', summary = 'Screwdriver: can crit', notes = danger[3], categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 9 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 9.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'Screwdriver', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 519, name = 'Screwdriver', level = 26, min_skill = 50, skill_ids = { 452 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Bark Tarantula',
            ids    = { 6, 7, 8, 15, 16, 17, 26, 27, 28, 29, 30, 31 },
            levels = {
                [77] = { acc = 330, eva = 311, agi = 80, int = 65, mnd = 65, chr = 58, dex = 89, def = 323,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 65, mnd = 65, chr = 60, dex = 89, def = 328,
                         attack_skill = 271 },
                [79] = { acc = 341, eva = 322, agi = 82, int = 66, mnd = 66, chr = 60, dex = 91, def = 334,
                         attack_skill = 276 },
                [80] = { acc = 346, eva = 327, agi = 82, int = 66, mnd = 66, chr = 60, dex = 91, def = 339,
                         attack_skill = 281 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 100, item = 838 },  -- spider web
            },
            steal  = { 838 },  -- spider web
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
            info = {
                family = { value = 'Spider / Vermin', notes = { 'Source species: Spider (ID 464); family ID 195.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4779, [78] = 4863, [79] = 4947, [80] = 5031 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Sickle Slash: can crit; Acid Spray: Poison; Spider Web: Slow', notes = { 'Sickle Slash: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Acid Spray: Poison. Source targeting: cone.', 'Spider Web: Slow. Source targeting: area around the monster.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 810, name = 'Sickle Slash', summary = 'Sickle Slash: can crit', notes = danger[3], categories = { 'crit' }, effects = {  }, details = danger[6] }, { kind = 'skill', id = 811, name = 'Acid Spray', summary = 'Acid Spray: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[8] }, { kind = 'skill', id = 812, name = 'Spider Web', summary = 'Spider Web: Slow', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = danger[2] } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'Sickle Slash', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 545, name = 'Sickle Slash', level = 48, min_skill = 116, skill_ids = { 810 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Darter',
            ids    = { 9, 10, 11, 12, 13, 20, 21, 22, 23, 24, 25 },
            levels = {
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66, dex = 80, def = 320,
                         attack_skill = 261 },
                [77] = { acc = 326, eva = 313, agi = 85, int = 60, mnd = 60, chr = 66, dex = 80, def = 325,
                         attack_skill = 266 },
                [78] = { acc = 331, eva = 318, agi = 85, int = 60, mnd = 60, chr = 68, dex = 80, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 337, eva = 324, agi = 87, int = 61, mnd = 61, chr = 69, dex = 82, def = 336,
                         attack_skill = 276 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [76] = 4695, [77] = 4779, [78] = 4863, [79] = 4947 }, mp = { [76] = 0, [77] = 0, [78] = 0, [79] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Venom: Poison', notes = { 'Venom: Poison. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 660, name = 'Venom', summary = 'Venom: Poison', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Poison' }, details = danger[8] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'Cursed Sphere', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 544, name = 'Cursed Sphere', level = 18, min_skill = 26, skill_ids = { 659 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Demonic Rose',
            ids    = { 14 },
            levels = {
                [77] = { acc = 330, eva = 311, agi = 80, int = 60, mnd = 56, chr = 66, dex = 89, def = 325,
                         attack_skill = 266 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 60, mnd = 57, chr = 68, dex = 89, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 341, eva = 322, agi = 82, int = 61, mnd = 57, chr = 69, dex = 91, def = 336,
                         attack_skill = 276 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 50, item = 1446 },  -- lacquer tree log
            },
            steal  = { 920 },  -- malboro vine
            aggro  = true,
            detects = { 'sound' },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [77] = 4779, [78] = 4863, [79] = 4947 }, mp = { [77] = 0, [78] = 0, [79] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'EXP modifier +23%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 16 minutes', notes = { 'Base respawn delay: 16 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Impale Bind: Bind; Vampiric Lash: HP drain; Bad Breath: many ailments; Sweet Breath: Sleep', notes = { 'Impale Bind: Bind. Source targeting: single target.', 'Vampiric Lash: HP drain. Source targeting: single target.', 'Bad Breath: many ailments. Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.', 'Sweet Breath: Sleep. Random effects may not all happen on the same use. Source targeting: cone.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 316, name = 'Impale Bind', summary = 'Impale Bind: Bind', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Bind' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'ignore' } }, removals = { danger[9] } } }, { kind = 'skill', id = 317, name = 'Vampiric Lash', summary = 'Vampiric Lash: HP drain', notes = { 'Source targeting: single target.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = danger[6] }, { kind = 'skill', id = 319, name = 'Bad Breath', summary = 'Bad Breath: many ailments', notes = { 'Earth breath damage. On a successful damage result it attempts Slow, Poison, Silence, Paralysis, Bind, Blindness and Weight. Ignores shadows. Source targeting: cone. Possible effects: Bind, Blindness, Paralysis, Poison, Silence, Slow, Weight.' }, categories = { 'debuff' }, effects = { 'Bind', 'Blindness', 'Paralysis', 'Poison', 'Silence', 'Slow', 'Weight' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind, Slow, Weight: Erase (one random eligible timed ailment), Panacea; Blindness: Blindna, Eye Drops, Remedy; Paralysis: Paralyna, Remedy; Poison: Poisona, Antidote, Remedy; Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.', 'Paralysis can interrupt Remedy before it cures you.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { danger[9], { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } }, { effect = 'Paralysis', options = { 'Paralyna', 'Remedy' } }, { effect = 'Poison', options = { 'Poisona', 'Antidote', 'Remedy' } }, { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } }, danger[1], { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 320, name = 'Sweet Breath', summary = 'Sweet Breath: Sleep', notes = { 'Random effects may not all happen on the same use. Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Sleep' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'Bad Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 604, name = 'Bad Breath', level = 61, min_skill = 176, skill_ids = { 319 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fafnir',
            ids    = { 18 },
            nm     = true,
            levels = {
                [90] = { acc = 414, eva = 385, agi = 102, int = 85, mnd = 60, chr = 87, dex = 107, def = 397,
                         attack_skill = 341 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, light = -2, paralyze = 11, bind = 11, poison = -2,
                       stun = 10 },
            immune = { 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 903 },  -- dragon talon
                { rate = 150, item = 13914 },  -- aegishjalmr
                { rate = 240, item = 867 },  -- handful of dragon scales
                { rate = 240, item = 867 },  -- handful of dragon scales
                { rate = 150, item = 4486 },  -- dragon heart
                { rate = 100, item = 16942 },  -- balmung
                { rate = 100, item = 17653 },  -- hrotti
                { rate = 100, item = 3340 },  -- cup of sweet tea
                { rate = 1000, group = { { 14075, 9500 }, { 16555, 500 } } },  -- one of andvaranauts, ridill
                { rate = 1000, group = {  -- one of
                    { 1339, 3100 },  -- neptunal abjuration head
                    { 1328, 2300 },  -- aquarian abjuration feet
                    { 1326, 2300 },  -- aquarian abjuration hands
                    { 1321, 2300 },  -- earthen abjuration hands
                } },
                { rate = 100, group = {  -- one of
                    { 1339, 3100 },  -- neptunal abjuration head
                    { 1328, 2300 },  -- aquarian abjuration feet
                    { 1326, 2300 },  -- aquarian abjuration hands
                    { 1321, 2300 },  -- earthen abjuration hands
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wyrm / Dragon', notes = { 'Source species: Black Wyrm (ID 226); family ID 98.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [90] = 60000 }, mp = { [90] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10; Regain 100; Regen 20', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 90 seconds; Conditional draw-in', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 90 seconds. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Hurricane Wing: Blindness; Spike Flail: rear attack; Absolute Terror: Terror; Horrid Roar 1: Buff removal', notes = { 'Hurricane Wing: Blindness. Source targeting: area around the monster.', 'Spike Flail: rear attack. Can hit from behind while grounded. Its skill check also excludes several special buffs. Source targeting: area around the target.', 'Absolute Terror: Terror. Random effects may not all happen on the same use. Source targeting: single target.', 'Horrid Roar 1: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 951, name = 'Hurricane Wing', summary = 'Hurricane Wing: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[11] }, { kind = 'skill', id = 952, name = 'Spike Flail', summary = 'Spike Flail: rear attack', notes = danger[12], categories = { 'other' }, effects = {  }, details = danger[14] }, danger[18], { kind = 'skill', id = 958, name = 'Horrid Roar 1', summary = 'Horrid Roar 1: Buff removal', notes = danger[19], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[17] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Nidhogg',
            ids    = { 19 },
            nm     = true,
            levels = {
                [90] = { acc = 497, eva = 378, agi = 102, int = 85, mnd = 60, chr = 87, dex = 107, def = 397,
                         attack_skill = 341 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, light = -2, paralyze = 11, bind = 11, poison = -2,
                       stun = 10 },
            immune = { 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 4486 },  -- dragon heart
                { rate = 240, item = 1133 },  -- vial of dragon blood
                { rate = 240, item = 1133 },  -- vial of dragon blood
                { rate = 50, item = 4272 },  -- slice of dragon meat
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 240, item = 1526 },  -- wyrm beard
                { rate = 1000, group = {  -- one of
                    { 1320, 3100 },  -- earthen abjuration body
                    { 1325, 2300 },  -- aquarian abjuration body
                    { 1330, 2300 },  -- martial abjuration body
                    { 1342, 2300 },  -- neptunal abjuration legs
                } },
                { rate = 100, group = {  -- one of
                    { 1320, 3100 },  -- earthen abjuration body
                    { 1325, 2300 },  -- aquarian abjuration body
                    { 1330, 2300 },  -- martial abjuration body
                    { 1342, 2300 },  -- neptunal abjuration legs
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Wyrm / Dragon', notes = { 'Source species: Black Wyrm (ID 226); family ID 98.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [90] = 60000 }, mp = { [90] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Double Attack 10; Regain 100; Regen 20', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 90 seconds; Conditional draw-in', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 90 seconds. This is not its remaining lifetime.', 'Its fight script draws targets in under position or encounter conditions. Distance alone does not establish safety.' } },
                dangers = { value = 'Absolute Terror: Terror; Hurricane Wing: Blindness; Spike Flail: rear attack; Horrid Roar 2: Buff removal', notes = { 'Absolute Terror: Terror. Random effects may not all happen on the same use. Source targeting: single target.', 'Hurricane Wing: Blindness. Source targeting: area around the monster.', 'Spike Flail: rear attack. Can hit from behind while grounded. Its skill check also excludes several special buffs. Source targeting: area around the target.', 'Horrid Roar 2: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[18], { kind = 'skill', id = 1039, name = 'Hurricane Wing', summary = 'Hurricane Wing: Blindness', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = danger[11] }, { kind = 'skill', id = 1040, name = 'Spike Flail', summary = 'Spike Flail: rear attack', notes = danger[12], categories = { 'other' }, effects = {  }, details = danger[14] }, { kind = 'skill', id = 1046, name = 'Horrid Roar 2', summary = 'Horrid Roar 2: Buff removal', notes = danger[19], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[17] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
