-- Dynamis-Windurst (zone 187).
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
        [1] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Loo Hepe the Eyepiercer',
                          'Maa Febi the Steadfast', 'Manifest Icon', 'Muu Febi the Steadfast', 'Tzee Xicu Idol',
                          'Vanguard Assassin', 'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter',
                          'Vanguard Liberator', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Persecutor', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager',
                          'Vanguard Sentinel', 'Vanguard Skirmisher', 'Vanguard Visionary',
                          'Wuu Qoho the Razorclaw', 'Xoo Kaza the Solemn' },
        },
        [2] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Loo Hepe the Eyepiercer',
                          'Maa Febi the Steadfast', 'Manifest Icon', 'Muu Febi the Steadfast', 'Tzee Xicu Idol',
                          'Vanguard Assassin', 'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter',
                          'Vanguard Liberator', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Persecutor', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager',
                          'Vanguard Sentinel', 'Vanguard Skirmisher', 'Vanguard Visionary', 'Xoo Kaza the Solemn' },
        },
        [3] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Loo Hepe the Eyepiercer', 'Maa Febi the Steadfast',
                          'Manifest Icon', 'Muu Febi the Steadfast', 'Tzee Xicu Idol', 'Vanguard Assassin',
                          'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter', 'Vanguard Liberator',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Persecutor',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Skirmisher', 'Vanguard Visionary', 'Wuu Qoho the Razorclaw',
                          'Xoo Kaza the Solemn' },
        },
        [4] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Loo Hepe the Eyepiercer',
                          'Maa Febi the Steadfast', 'Manifest Icon', 'Muu Febi the Steadfast', 'Tzee Xicu Idol',
                          'Vanguard Assassin', 'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter',
                          'Vanguard Liberator', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Persecutor', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager',
                          'Vanguard Sentinel', 'Vanguard Skirmisher', 'Vanguard Visionary',
                          'Wuu Qoho the Razorclaw' },
        },
        [5] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Maa Febi the Steadfast',
                          'Manifest Icon', 'Muu Febi the Steadfast', 'Tzee Xicu Idol', 'Vanguard Assassin',
                          'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter', 'Vanguard Liberator',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Persecutor',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Skirmisher', 'Vanguard Visionary', 'Wuu Qoho the Razorclaw',
                          'Xoo Kaza the Solemn' },
        },
        [6] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Loo Hepe the Eyepiercer',
                          'Maa Febi the Steadfast', 'Manifest Icon', 'Muu Febi the Steadfast', 'Vanguard Assassin',
                          'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter', 'Vanguard Liberator',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Persecutor',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Skirmisher', 'Vanguard Visionary', 'Wuu Qoho the Razorclaw',
                          'Xoo Kaza the Solemn' },
        },
        [7] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Loo Hepe the Eyepiercer',
                          'Manifest Icon', 'Muu Febi the Steadfast', 'Tzee Xicu Idol', 'Vanguard Assassin',
                          'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter', 'Vanguard Liberator',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Persecutor',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Skirmisher', 'Vanguard Visionary', 'Wuu Qoho the Razorclaw',
                          'Xoo Kaza the Solemn' },
        },
        [8] = {
            true_both = { 'Avatar Icon', 'Avatar Idol', 'Haa Pevi the Stentorian', 'Loo Hepe the Eyepiercer',
                          'Maa Febi the Steadfast', 'Manifest Icon', 'Tzee Xicu Idol', 'Vanguard Assassin',
                          'Vanguard Chanter', 'Vanguard Exemplar', 'Vanguard Inciter', 'Vanguard Liberator',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Persecutor',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Skirmisher', 'Vanguard Visionary', 'Wuu Qoho the Razorclaw',
                          'Xoo Kaza the Solemn' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Avatar Icon'] = { id = 205, name = 'Statue' },
        ['Avatar Idol'] = { id = 205, name = 'Statue' },
        ['Haa Pevi the Stentorian'] = { id = 74, name = 'Yagudo' },
        ['Loo Hepe the Eyepiercer'] = { id = 74, name = 'Yagudo' },
        ['Maa Febi the Steadfast'] = { id = 74, name = 'Yagudo' },
        ['Manifest Icon'] = { id = 205, name = 'Statue' },
        ['Muu Febi the Steadfast'] = { id = 74, name = 'Yagudo' },
        ['Tzee Xicu Idol'] = { id = 205, name = 'Statue' },
        ['Vanguard Assassin'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Chanter'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Exemplar'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Inciter'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Liberator'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Ogresoother'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Oracle'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Partisan'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Persecutor'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Prelate'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Priest'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Salvager'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Sentinel'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Skirmisher'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Visionary'] = { id = 74, name = 'Yagudo' },
        ['Wuu Qoho the Razorclaw'] = { id = 74, name = 'Yagudo' },
        ['Xoo Kaza the Solemn'] = { id = 74, name = 'Yagudo' },
    },
    monsters = {
        {
            name   = 'Avatar Icon',
            ids    = { 1, 4, 7, 13, 14, 16, 25, 30, 31, 41, 44, 47, 50, 59, 65, 76, 79, 84, 88, 91, 93, 109, 119,
                       126, 132, 134, 136, 138, 141, 145, 152, 163, 164, 165, 172, 176, 179, 190, 192, 194, 196,
                       217, 219, 221, 227, 231, 238, 239, 241, 242, 248, 251, 257, 260, 261, 267, 274, 276, 282,
                       284, 286, 289, 296, 315, 317, 322, 323, 328, 329, 347, 348, 349, 352, 353, 357, 377, 385,
                       396, 405, 420, 424, 467, 485 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [65] = { acc = 272, eva = 238, agi = 90, int = 102, mnd = 80, chr = 84, dex = 90, def = 259,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 100, item = 1474 },  -- infinity core
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Yagudo Statue (ID 481); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Exemplar',
            ids    = { 2, 39, 40, 89, 106, 148, 149, 185, 225, 256, 287, 313, 386, 411, 444, 475, 486, 493 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 77, mnd = 103, chr = 103, dex = 89, def = 379,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 310, agi = 78, int = 78, mnd = 104, chr = 104, dex = 90, def = 385,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Inciter',
            ids    = { 3, 42, 45, 85, 92, 107, 177, 178, 220, 252, 253, 279, 290, 340, 379, 391, 412, 453, 476,
                       487 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 313, agi = 95, int = 103, mnd = 77, chr = 77, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 319, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Normal attacks: HP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } } }, coverage = 'partial', incomplete = true, reasons = danger[2], general_notes = danger[3] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Priest',
            ids    = { 5, 48, 49, 90, 133, 142, 154, 180, 208, 246, 283, 285, 291, 299, 375, 402, 443, 459, 468 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 322, eva = 287, agi = 89, int = 89, mnd = 115, chr = 103, dex = 82, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 292, agi = 90, int = 90, mnd = 117, chr = 104, dex = 84, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Prelate',
            ids    = { 6, 51, 77, 78, 94, 135, 146, 183, 184, 195, 197, 249, 250, 288, 300, 305, 318, 333, 336, 364,
                       368, 395, 406, 430, 447, 463, 495 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Visionary',
            ids    = { 8, 57, 105, 115, 116, 174, 175, 218, 240, 243, 247, 293, 294, 316, 332, 335, 383, 390, 407,
                       418, 448, 489 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Chanter',
            ids    = { 9, 66, 86, 137, 181, 226, 278, 295, 314, 339, 380, 403, 438, 460, 477, 488 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 299, agi = 82, int = 95, mnd = 95, chr = 107, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 304, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Manifest Icon',
            ids    = { 10, 19, 38, 56, 62, 69, 95, 99, 104, 114, 131, 140, 147, 156, 159, 166, 171, 182, 187, 205,
                       211, 216, 224, 234, 254, 255, 262, 269, 277, 292, 302, 306, 311, 319, 325, 326, 331, 334,
                       341, 344, 354, 363, 367, 372, 373, 374, 381, 389, 401, 410, 414, 427, 431, 436, 441, 446,
                       454, 461, 473, 478, 491, 497 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [65] = { acc = 272, eva = 238, agi = 90, int = 102, mnd = 80, chr = 84, dex = 90, def = 259,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Yagudo Statue (ID 481); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 10000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Persecutor',
            ids    = { 11, 43, 46, 61, 103, 155, 167, 271, 307, 369, 397, 428, 442, 464, 481, 499 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 321, agi = 95, int = 89, mnd = 89, chr = 95, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 327, agi = 96, int = 90, mnd = 90, chr = 96, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Assassin',
            ids    = { 12, 26, 27, 63, 64, 108, 157, 158, 186, 230, 233, 268, 304, 345, 346, 382, 413, 425, 440,
                       445, 458, 490 },
            nm     = true,
            job    = 'nin/war',
            levels = {
                [75] = { acc = 328, eva = 330, agi = 105, int = 90, mnd = 78, chr = 84, dex = 105, def = 329,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 336, agi = 106, int = 91, mnd = 79, chr = 84, dex = 106, def = 334,
                         attack_skill = 261 },
                [77] = { acc = 340, eva = 342, agi = 108, int = 92, mnd = 80, chr = 86, dex = 108, def = 339,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { virus = 25, bind = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Salvager',
            ids    = { 15, 80, 81, 87, 98, 191, 193, 235, 236, 275, 310, 361, 362, 394, 404, 417, 435, 482, 496 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 376, eva = 300, agi = 115, int = 89, mnd = 95, chr = 89, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 382, eva = 305, agi = 117, int = 90, mnd = 96, chr = 90, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Sentinel',
            ids    = { 17, 18, 67, 101, 150, 151, 237, 264, 298, 303, 365, 378, 398, 423, 426, 455, 474, 492 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 315, agi = 82, int = 77, mnd = 95, chr = 89, dex = 107, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 321, agi = 84, int = 78, mnd = 96, chr = 90, dex = 110, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4180, [76] = 4180, [77] = 4180 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Partisan',
            ids    = { 20, 22, 72, 74, 120, 122, 124, 161, 228, 272, 350, 387, 392, 432, 449, 465, 504 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Wyvern',
            ids    = { 21, 23, 73, 75, 121, 123, 125, 162, 229, 273, 351, 388, 393, 433, 450, 466, 505 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Shadow Wyvern (ID 237); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Skirmisher',
            ids    = { 24, 32, 33, 60, 82, 83, 100, 153, 160, 168, 232, 258, 259, 263, 297, 324, 327, 330, 366, 384,
                       429, 437, 462, 479, 494 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Liberator',
            ids    = { 28, 29, 58, 68, 96, 97, 102, 110, 111, 139, 173, 270, 301, 312, 342, 343, 376, 419, 434, 439,
                       480, 498 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 338, eva = 384, agi = 107, int = 103, mnd = 77, chr = 77, dex = 115, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 344, eva = 391, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Ogresoother',
            ids    = { 34, 36, 70, 117, 127, 129, 222, 265, 308, 355, 370, 399, 415, 451, 456, 471, 502 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 307, agi = 82, int = 89, mnd = 89, chr = 115, dex = 103, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 313, agi = 84, int = 90, mnd = 90, chr = 117, dex = 104, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Crow',
            ids    = { 35, 37, 71, 118, 128, 130, 223, 266, 309, 356, 371, 400, 416, 452, 457, 472, 503 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 15 },
            weapon_dmg = { piercing = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bird / Bird', notes = { 'Source species: Bird (ID 175); family ID 78.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Oracle',
            ids    = { 52, 54, 112, 143, 188, 201, 203, 206, 209, 212, 214, 280, 320, 408, 421, 469, 483, 500 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 290, agi = 95, int = 107, mnd = 107, chr = 107, dex = 89, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 295, agi = 96, int = 110, mnd = 110, chr = 110, dex = 90, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Avatar',
            ids    = { 53, 55, 113, 144, 189, 200, 202, 204, 207, 210, 213, 215, 281, 321, 409, 422, 470, 484,
                       501 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 302,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 307,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 312,
                         attack_skill = 266 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            links  = 1,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Avatar Idol',
            ids    = { 169, 198, 244, 337 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Yagudo Statue (ID 481); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 1000 }, mp = { [80] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Wuu Qoho the Razorclaw',
            ids    = { 170 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [80] = { acc = 357, eva = 336, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 354,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8180 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Haa Pevi the Stentorian',
            ids    = { 199 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [80] = { acc = 347, eva = 310, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2402 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Xoo Kaza the Solemn',
            ids    = { 245 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Loo Hepe the Eyepiercer',
            ids    = { 338 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [80] = { acc = 350, eva = 323, agi = 93, int = 106, mnd = 106, chr = 99, dex = 99, def = 340,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 10, item = 1466 },  -- pile of relic iron
                { rate = 10, item = 1464 },  -- lancewood log
                { rate = 10, item = 1518 },  -- colossal skull
                { rate = 10, group = {  -- one of
                    { 18260, 1 },  -- relic knuckles
                    { 18266, 1 },  -- relic dagger
                    { 18272, 1 },  -- relic sword
                    { 18320, 1 },  -- relic maul
                } },
                { rate = 50, group = {  -- one of
                    { 15072, 1 },  -- warriors mask
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15084, 1 },  -- koga hatsuburi
                    { 15105, 1 },  -- sorcerers gloves
                    { 15109, 1 },  -- abyss gauntlets
                    { 15112, 1 },  -- scouts bracers
                    { 15128, 1 },  -- saotome haidate
                    { 15131, 1 },  -- summoners spats
                    { 15134, 1 },  -- clerics duckbills
                    { 15138, 1 },  -- valor leggings
                } },
                { rate = 10, group = { { 11382, 1 }, { 15031, 1 } } },  -- one of mirage charuqs, pantin dastanas
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Tzee Xicu Idol',
            ids    = { 358 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [85] = { acc = 387, eva = 339, agi = 112, int = 127, mnd = 99, chr = 105, dex = 112, def = 363,
                         attack_skill = 311 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 150, item = 1450 },  -- lungo-nango jadeshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1474 },  -- infinity core
                { rate = 10, item = 748 },  -- gold beastcoin
                { rate = 50, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 1470 },  -- sparkling stone
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Yagudo Statue (ID 481); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [85] = 12500 }, mp = { [85] = 12500 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Maa Febi the Steadfast',
            ids    = { 359 },
            nm     = true,
            job    = 'pld/sam',
            levels = {
                [80] = { acc = 349, eva = 337, agi = 86, int = 84, mnd = 102, chr = 104, dex = 97, def = 399,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { sleep = 25, blind = 25 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Muu Febi the Steadfast',
            ids    = { 360 },
            nm     = true,
            job    = 'pld/sam',
            levels = {
                [80] = { acc = 349, eva = 337, agi = 86, int = 84, mnd = 102, chr = 104, dex = 97, def = 399,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { sleep = 25, blind = 25 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 8,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
