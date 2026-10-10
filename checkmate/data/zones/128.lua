-- Valley of Sorrows (zone 128).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Stun: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[2] = { { effect = 'Stun', options = { 'Erase (one random eligible timed ailment)' } } };
danger[3] = { notes = danger[1], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[2] };
danger[4] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[5] = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.' };
danger[6] = { notes = danger[5], unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } } };
danger[7] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.' };
danger[8] = { 'Random effects may not all happen on the same use. Source targeting: single target.' };
danger[9] = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Bind: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[10] = { effect = 'Bind', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[11] = { danger[10] };
danger[12] = { notes = danger[9], unknown = {  }, activation_range = 8.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[11] };
danger[13] = { 'Tortoise Song: Buff removal. Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.', 'Head Butt Turtle: Accuracy down. Random effects may not all happen on the same use. Source targeting: single target.', 'Tortoise Stomp: Defense down. Random effects may not all happen on the same use. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[14] = { 'Only effects allowed by the move\'s dispel checks can be removed. Source targeting: area around the monster.' };
danger[15] = { 'Normal activation range: 20 yalms. This is the move selection limit, not its affected area.', 'Area: 20 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.' };
danger[16] = { notes = danger[15], unknown = {  }, activation_range = 20.0, shape = 'area around the monster', effect_radius = 20.0, shadows = { { mode = 'ignore' } } };
danger[17] = { kind = 'skill', id = 804, name = 'Tortoise Song', summary = 'Tortoise Song: Buff removal', notes = danger[14], categories = { 'dispel' }, effects = { 'Buff removal' }, details = danger[16] };
danger[18] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Accuracy down: Erase (one random eligible timed ailment).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[19] = { effect = 'Accuracy down', options = { 'Erase (one random eligible timed ailment)' } };
danger[20] = { danger[19] };
danger[21] = { notes = danger[18], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[20] };
danger[22] = { kind = 'skill', id = 805, name = 'Head Butt Turtle', summary = 'Head Butt Turtle: Accuracy down', notes = danger[8], categories = { 'debuff' }, effects = { 'Accuracy down' }, details = danger[21] };
danger[23] = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Defense down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' };
danger[24] = { effect = 'Defense down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } };
danger[25] = { danger[24] };
danger[26] = { notes = danger[23], unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = danger[25] };
danger[27] = { kind = 'skill', id = 806, name = 'Tortoise Stomp', summary = 'Tortoise Stomp: Defense down', notes = danger[8], categories = { 'debuff' }, effects = { 'Defense down' }, details = danger[26] };
danger[28] = { danger[17], danger[22], danger[27] };
danger[29] = { value = 'Tortoise Song: Buff removal; Head Butt Turtle: Accuracy down; Tortoise Stomp: Defense down', notes = danger[13], entries = danger[28], coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Velociraptor',
            ids    = { 1, 2, 4, 5, 7, 8, 11, 13, 15, 16, 19, 23, 24, 25, 26, 31 },
            levels = {
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58, dex = 70, def = 265,
                         attack_skill = 218 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59, dex = 71, def = 271,
                         attack_skill = 221 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60, dex = 71, def = 277,
                         attack_skill = 225 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, dex = 72, def = 282,
                         attack_skill = 229 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3857, [67] = 3941, [68] = 4024, [69] = 4108 }, mp = { [66] = 0, [67] = 0, [68] = 0, [69] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 220 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Foul Breath: Disease; Chomp Rush: Slow; Scythe Tail: Stun', notes = { 'Foul Breath: Disease. Source targeting: cone.', 'Chomp Rush: Slow. Source targeting: single target.', 'Scythe Tail: Stun. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 376, name = 'Foul Breath', summary = 'Foul Breath: Disease', notes = { 'Source targeting: cone.' }, categories = { 'debuff' }, effects = { 'Disease' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 15 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Disease: Viruna, Remedy (can fail).', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'front cone', cone_length = 15.0, shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Disease', options = { 'Viruna', 'Remedy (can fail)' } } } } }, { kind = 'skill', id = 379, name = 'Chomp Rush', summary = 'Chomp Rush: Slow', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Slow' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 3 images per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Slow: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 3 } }, removals = { { effect = 'Slow', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 380, name = 'Scythe Tail', summary = 'Scythe Tail: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[3] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Peryton',
            ids    = { 3, 6, 9, 12, 14, 17, 20, 27, 32 },
            levels = {
                [69] = { acc = 284, eva = 271, agi = 77, int = 59, mnd = 59, chr = 65, dex = 77, def = 293,
                         attack_skill = 229 },
                [70] = { acc = 289, eva = 276, agi = 77, int = 59, mnd = 59, chr = 65, dex = 77, def = 298,
                         attack_skill = 233 },
                [71] = { acc = 296, eva = 282, agi = 80, int = 60, mnd = 60, chr = 68, dex = 80, def = 303,
                         attack_skill = 237 },
                [72] = { acc = 301, eva = 287, agi = 80, int = 60, mnd = 60, chr = 68, dex = 80, def = 308,
                         attack_skill = 241 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            weapon_dmg = { slashing = -25, piercing = 25, blunt = -25 },
            drops  = {
                { rate = 150, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Greater Bird / Bird', notes = { 'Source species: Roc (ID 190); family ID 84.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [69] = 4108, [70] = 4191, [71] = 4275, [72] = 4359 }, mp = { [69] = 0, [70] = 0, [71] = 0, [72] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Light crystal (conditional)', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Blind Vortex: Blindness; Dread Dive: Stun', notes = { 'Blind Vortex: Blindness. Source targeting: single target.', 'Dread Dive: Stun. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 399, name = 'Blind Vortex', summary = 'Blind Vortex: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 7 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 7.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 401, name = 'Dread Dive', summary = 'Dread Dive: Stun', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Stun' }, details = danger[3] } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'Feather Barrier', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 574, name = 'Feather Barrier', level = 56, min_skill = 152, skill_ids = { 402 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 10, 21 },
            job    = 'blm/rdm',
            levels = {
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3477, [67] = 3555, [68] = 3632 }, mp = { [66] = 1894, [67] = 1926, [68] = 1957 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Fire crystal (conditional)', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Fire weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Flare: Water magic evasion down', notes = { 'Flare: Water magic evasion down.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 204, name = 'Flare', summary = 'Flare: Water magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Water magic evasion down' }, details = danger[6], level_ranges = { { 60, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[7] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 18, 22 },
            job    = 'blm/rdm',
            levels = {
                [66] = { acc = 265, eva = 244, agi = 66, int = 77, mnd = 62, chr = 62, dex = 67, def = 253,
                         attack_skill = 218 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65, dex = 69, def = 258,
                         attack_skill = 221 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65, dex = 69, def = 263,
                         attack_skill = 225 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [66] = 3477, [67] = 3555, [68] = 3632 }, mp = { [66] = 1894, [67] = 1926, [68] = 1957 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Wind weather; Respawn 5 minutes', notes = { 'An unowned elemental requires weather matching its source element. Weather ending can make it despawn.', 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Silence: silence; Tornado: Ice magic evasion down; Gravity: Weight', notes = { 'Silence: silence. Possible effects: Silence.', 'Tornado: Ice magic evasion down.', 'Gravity: Weight.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Listed spells can depend on the monster\'s level; explicit scripted casts have separate conditions.', 'The assigned TP-move list is missing from the source tables.' }, entries = { { kind = 'spell', id = 59, name = 'Silence', summary = 'Silence: silence', notes = { 'Possible effects: Silence.' }, categories = { 'debuff' }, effects = { 'Silence' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Silence: Silena, Echo Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Silence', options = { 'Silena', 'Echo Drops', 'Remedy' } } } }, level_ranges = { { 15, 255 } } }, { kind = 'spell', id = 208, name = 'Tornado', summary = 'Tornado: Ice magic evasion down', notes = {  }, categories = { 'debuff' }, effects = { 'Ice magic evasion down' }, details = danger[6], level_ranges = { { 52, 255 } } }, { kind = 'spell', id = 216, name = 'Gravity', summary = 'Gravity: Weight', notes = {  }, categories = { 'debuff' }, effects = { 'Weight' }, details = { notes = { 'Base casting range: 20 yalms. Normal selection adds both hitboxes; monster casts also have a 28.5-yalm limit.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'One Utsusemi image can absorb the spell. Blink absorption can fail.', 'Reviewed removal options: Weight: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 20.0, shape = 'single target', shadows = { { mode = 'absorb', count = 1, per_hit = false } }, removals = { { effect = 'Weight', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } }, level_ranges = { { 21, 255 } } } }, coverage = 'partial', incomplete = true, reasons = { 'The assigned TP-move list is missing from the source tables.' }, general_notes = danger[7] },
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.' }, incomplete = true },
            },
        },
        {
            name   = 'Valley Manticore',
            ids    = { 28, 29, 30 },
            levels = {
                [71] = { acc = 292, eva = 278, agi = 72, int = 55, mnd = 55, chr = 55, dex = 72, def = 297,
                         attack_skill = 237 },
                [72] = { acc = 297, eva = 283, agi = 72, int = 55, mnd = 55, chr = 55, dex = 72, def = 302,
                         attack_skill = 241 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 58, mnd = 58, chr = 56, dex = 72, def = 309,
                         attack_skill = 246 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 58, mnd = 58, chr = 56, dex = 73, def = 314,
                         attack_skill = 251 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
            info = {
                family = { value = 'Manticore / Beast', notes = { 'Source species: Manticore (ID 98); family ID 46.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [71] = 6412, [72] = 6538, [73] = 6664, [74] = 6790 }, mp = { [71] = 0, [72] = 0, [73] = 0, [74] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Wind crystal (conditional)', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                spawn = { value = 'Respawn 5 minutes', notes = { 'Base respawn delay: 5 minutes after despawn. Spawn waves can shift this time; other conditions can delay the next appearance.', 'Source rules only; no remaining time or open spawn window is known.' } },
                dangers = { value = 'Deadly Hold: can crit; Tail Swing: Bind; Tail Smash: Bind; Heat Breath: fire breath; Riddle: Max MP down; Great Sandstorm: Blindness; Great Whirlwind: Choke', notes = { 'Deadly Hold: can crit. This move can crit. Its current critical chance is not known. Source targeting: single target.', 'Tail Swing: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Tail Smash: Bind. Random effects may not all happen on the same use. Source targeting: single target.', 'Heat Breath: fire breath. Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply. Source targeting: cone.', 'Riddle: Max MP down. Source targeting: area around the monster.', 'Great Sandstorm: Blindness. Source targeting: single target.', 'Great Whirlwind: Choke. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { { kind = 'skill', id = 797, name = 'Deadly Hold', summary = 'Deadly Hold: can crit', notes = { 'This move can crit. Its current critical chance is not known. Source targeting: single target.' }, categories = { 'crit' }, effects = {  }, details = { notes = { 'Normal activation range: 8 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Shadow check: 1 image per hit. Too few images do not fully block it.', 'Blink absorption can fail.' }, unknown = {  }, activation_range = 8.0, shape = 'single target', shadows = { { mode = 'absorb', per_hit = true, count = 1 } } } }, { kind = 'skill', id = 798, name = 'Tail Swing', summary = 'Tail Swing: Bind', notes = danger[8], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[12] }, { kind = 'skill', id = 799, name = 'Tail Smash', summary = 'Tail Smash: Bind', notes = danger[8], categories = { 'debuff' }, effects = { 'Bind' }, details = danger[12] }, { kind = 'skill', id = 800, name = 'Heat Breath', summary = 'Heat Breath: fire breath', notes = { 'Fire breath damage based on the monster\'s HP at move start. Ignores shadows; resistance and damage reductions still apply. Source targeting: cone.' }, categories = { 'other' }, effects = {  }, details = { notes = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: front cone, 17 yalms source length. The cone uses a 45-degree triangle; the primary target is handled separately.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'Area and cone damage removes Blink. Physical and ranged area checks can consume fewer Utsusemi images through mitigation.' }, unknown = {  }, activation_range = 17.0, shape = 'front cone', cone_length = 17.0, shadows = { { mode = 'ignore', per_hit = false } } } }, { kind = 'skill', id = 801, name = 'Riddle', summary = 'Riddle: Max MP down', notes = { 'Source targeting: area around the monster.' }, categories = { 'debuff' }, effects = { 'Max MP down' }, details = { notes = { 'Normal activation range: 15 yalms. This is the move selection limit, not its affected area.', 'Area: 15 yalms radius, area around the monster.', 'These source distances do not establish a safe place to stand.', 'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Max MP down: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 15.0, shape = 'area around the monster', effect_radius = 15.0, shadows = { { mode = 'ignore' } }, removals = { { effect = 'Max MP down', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } }, { kind = 'skill', id = 802, name = 'Great Sandstorm', summary = 'Great Sandstorm: Blindness', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Blindness' }, details = { notes = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Blindness: Blindna, Eye Drops, Remedy.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 17.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Blindness', options = { 'Blindna', 'Eye Drops', 'Remedy' } } } } }, { kind = 'skill', id = 803, name = 'Great Whirlwind', summary = 'Great Whirlwind: Choke', notes = { 'Source targeting: single target.' }, categories = { 'debuff' }, effects = { 'Choke' }, details = { notes = { 'Normal activation range: 17 yalms. This is the move selection limit, not its affected area.', 'Area: single target.', 'These source distances do not establish a safe place to stand.', 'Utsusemi and Blink do not absorb the damage step.', 'The damage shadow rule does not establish whether every additional effect is blocked.', 'Reviewed removal options: Choke: Erase (one random eligible timed ailment), Panacea.', 'These are selected options, not a complete cure list. The spell or item must be usable; this does not check supplies, recasts or whether you can act.' }, unknown = {  }, activation_range = 17.0, shape = 'single target', shadows = { { mode = 'ignore', per_hit = false } }, removals = { { effect = 'Choke', options = { 'Erase (one random eligible timed ailment)', 'Panacea' } } } } } }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'Heat Breath', notes = { 'Possible lessons from moves this monster can use. It must actually use the move before defeat; learning is not guaranteed.' }, spells = { { id = 591, name = 'Heat Breath', level = 71, min_skill = 225, skill_ids = { 800 } } }, requirements = { 'The learner must be an eligible main-job Blue Mage, alive and within 100 yalms in the same zone, with enough current Blue Magic skill and an unlearned spell. Call for Help excludes learning.', 'Equipment skill bonuses count. The spell\'s casting level is not a minimum learning level.', 'The learner must belong to the party or alliance receiving kill credit, or receive solo kill credit. Only one eligible spell gets a learning attempt per defeat.' }, incomplete = false },
            },
        },
        {
            name   = 'Adamantoise',
            ids    = { 33 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [70] = { acc = 281, eva = 262, agi = 49, int = 61, mnd = 85, chr = 85, dex = 61, def = 5001,
                         attack_skill = 233 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            magic_dmg = { all = -35 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'slow', 'elegy', 'poison', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 646 },  -- chunk of adaman ore
                { rate = 240, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 100, item = 12361 },  -- sipar
                { rate = 50, item = 13794 },  -- heavy cuirass
                { rate = 100, item = 3344 },  -- clump of red pondweed
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Adamantoise / Lizard', notes = { 'Source species: Adamantoise (ID 298); family ID 122.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 10000 }, mp = { [70] = 2021 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regain 150', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Rage 30 minutes; Idle despawn 90 seconds; Draw-in', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 90 seconds. This is not its remaining lifetime.', 'The draw-in mixin checks the current target at twice the monster\'s melee range or farther.' } },
                dangers = danger[29],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Aspidochelone',
            ids    = { 34 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [85] = { acc = 368, eva = 339, agi = 59, int = 74, mnd = 102, chr = 102, dex = 74, def = 921,
                         attack_skill = 311 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            resist = { curse = 100 },
            magic_dmg = { all = -30 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'slow', 'elegy', 'poison', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 646 },  -- chunk of adaman ore
                { rate = 240, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 908 },  -- adamantoise shell
                { rate = 240, item = 1525 },  -- adamantoise egg
                { rate = 100, item = 12361 },  -- sipar
                { rate = 50, item = 13794 },  -- heavy cuirass
                { rate = 1000, group = {  -- one of
                    { 1325, 3100 },  -- aquarian abjuration body
                    { 1318, 2300 },  -- dryadic abjuration feet
                    { 1333, 2300 },  -- martial abjuration feet
                    { 1335, 2300 },  -- wyrmal abjuration body
                } },
                { rate = 100, group = {  -- one of
                    { 1325, 3100 },  -- aquarian abjuration body
                    { 1318, 2300 },  -- dryadic abjuration feet
                    { 1333, 2300 },  -- martial abjuration feet
                    { 1335, 2300 },  -- wyrmal abjuration body
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Adamantoise / Lizard', notes = { 'Source species: Adamantoise (ID 298); family ID 122.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Eligibility can change', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.', 'A script or loaded override changes the eligibility rules.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [85] = 20000 }, mp = { [85] = 2504 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.', 'Scripted encounter or loaded module rules can change rewards.' } },
                traits = { value = 'Regain 150', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                fight = { value = 'Rage 1 hour; Idle despawn 90 seconds; Draw-in', notes = { 'Rage starts counting on engagement. This source removes its applied boost on disengage; elapsed engagement time is unseen.', 'Source idle-despawn delay: 90 seconds. This is not its remaining lifetime.', 'The draw-in mixin checks the current target at twice the monster\'s melee range or farther.' } },
                dangers = danger[29],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Skahnowa',
            ids    = { 35 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 8, mnd = 8, chr = 9, dex = 9, def = 20,
                        attack_skill = 0 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            info = {
                family = { value = 'Adamantoise / Lizard', notes = { 'Source species: Adamantoise (ID 298); family ID 122.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.' }, hp = { [1] = 33 }, mp = { [1] = 0 }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 0', notes = { 'Base attack delay 0 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[29],
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
        {
            name   = 'Tolba',
            ids    = { 37 },
            nm     = true,
            levels = {},
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            info = {
                family = { value = 'Adamantoise / Lizard', notes = { 'Source species: Adamantoise (ID 298); family ID 122.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = false, hp_uncertain = false, mp_uncertain = false, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Notorious monsters do not give the ordinary seal reward; the NM flag alone does not block crystals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Tortoise Stomp: Defense down', notes = { 'Tortoise Stomp: Defense down. Random effects may not all happen on the same use. Source targeting: single target.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' }, entries = { danger[27] }, coverage = 'resolved', incomplete = false, reasons = {  }, general_notes = danger[4] },
                blue = { value = 'No learnable Blue spells', notes = { 'No enabled Blue Magic lesson is mapped to the usable source moves for this monster.' } },
            },
        },
    },
    by_name = {},
}
