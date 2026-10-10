-- Leujaoam Sanctum (zone 69).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[2] = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[3] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[4] = { value = 'Move list unresolved', notes = danger[1], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[2], general_notes = danger[3] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Leujaoam Worm' } },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Leujaoam Worm'] = { id = 10, name = 'Worm' },
    },
    monsters = {
        {
            name   = 'Leujaoam Worm',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
            job    = 'blm/blm',
            levels = {
                [51] = { acc = 186, eva = 158, agi = 56, int = 69, mnd = 47, chr = 48, dex = 56, def = 173,
                         attack_skill = 151 },
                [52] = { acc = 191, eva = 163, agi = 56, int = 69, mnd = 47, chr = 48, dex = 56, def = 178,
                         attack_skill = 156 },
                [53] = { acc = 196, eva = 167, agi = 57, int = 70, mnd = 48, chr = 49, dex = 57, def = 184,
                         attack_skill = 161 },
                [61] = { acc = 240, eva = 208, agi = 66, int = 80, mnd = 55, chr = 57, dex = 66, def = 225,
                         attack_skill = 199 },
                [62] = { acc = 245, eva = 213, agi = 66, int = 80, mnd = 55, chr = 57, dex = 66, def = 230,
                         attack_skill = 203 },
                [63] = { acc = 250, eva = 217, agi = 66, int = 82, mnd = 55, chr = 57, dex = 66, def = 235,
                         attack_skill = 207 },
                [71] = { acc = 293, eva = 257, agi = 75, int = 92, mnd = 63, chr = 64, dex = 75, def = 276,
                         attack_skill = 237 },
                [72] = { acc = 298, eva = 262, agi = 75, int = 92, mnd = 63, chr = 64, dex = 75, def = 281,
                         attack_skill = 241 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 93, mnd = 64, chr = 66, dex = 76, def = 287,
                         attack_skill = 246 },
                [76] = { acc = 321, eva = 283, agi = 80, int = 97, mnd = 66, chr = 68, dex = 80, def = 301,
                         attack_skill = 261 },
                [77] = { acc = 326, eva = 287, agi = 80, int = 98, mnd = 66, chr = 68, dex = 80, def = 307,
                         attack_skill = 266 },
                [78] = { acc = 331, eva = 292, agi = 80, int = 98, mnd = 68, chr = 69, dex = 80, def = 312,
                         attack_skill = 271 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            links  = 1,
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [51] = 2722, [52] = 2814, [53] = 2905, [61] = 3637, [62] = 3728, [63] = 3820, [71] = 4552, [72] = 4645, [73] = 4737, [76] = 5013, [77] = 5106, [78] = 5197 }, mp = { [51] = 9999, [52] = 9999, [53] = 9999, [61] = 9999, [62] = 9999, [63] = 9999, [71] = 9999, [72] = 9999, [73] = 9999, [76] = 9999, [77] = 9999, [78] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Qiqirn Miner',
            ids    = { 16, 17, 18, 19, 20, 21, 22, 23 },
            job    = 'thf/thf',
            levels = {},
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            info = {
                family = { value = 'Qiqirn / Beastmen', notes = { 'Source species: Qiqirn (ID 147); family ID 66.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.', 'No stored level is available for a maximum estimate.' }, hp = {  }, mp = {  }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = true, mp_unknown = true },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'Scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Water, Deodorize and weather that disables scent can break scent tracking.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Drops gil; Mug purse set at spawn', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.', 'Gil drops require an eligible kill without Call for Help. Server settings can prevent them; party size and player bonuses change the amount.', 'The source gil multiplier is 150% before party distribution.', 'Mug uses the unknown remaining purse; your modifiers can change the payout. This is not a guaranteed amount.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Mineral Eater',
            ids    = { 24, 25, 26, 27, 28, 29, 30, 31, 32, 33 },
            job    = 'blm/rdm',
            levels = {
                [77] = { acc = 324, eva = 299, agi = 75, int = 94, mnd = 71, chr = 68, dex = 77, def = 308,
                         attack_skill = 266 },
                [78] = { acc = 329, eva = 305, agi = 76, int = 94, mnd = 72, chr = 69, dex = 77, def = 314,
                         attack_skill = 271 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 4331, [78] = 4408 }, mp = { [77] = 9999, [78] = 9999 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Earth crystal (conditional)', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'No-drops settings, region control and party conditions can prevent the reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Seals require an eligible zone and EXP-awarding kill, drops enabled, and the party reward cooldown.', 'With Abyssea disabled, levels below 50 can give Beastmen\'s Seals; level 50+ can also give Kindred\'s Seals.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
