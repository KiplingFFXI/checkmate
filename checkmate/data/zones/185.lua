-- Dynamis-San dOria (zone 185).
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
            true_both = { 'Battlechoir Gitchfotch', 'Overlords Tombstone', 'Reapertongue Gadgquok',
                          'Serjeant Tombstone', 'Soulsender Fugbrag', 'Vanguard Amputator', 'Vanguard Backstabber',
                          'Vanguard Bugler', 'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler',
                          'Vanguard Gutslasher', 'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer',
                          'Vanguard Neckchopper', 'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper',
                          'Vanguard Vexer', 'Voidstreaker Butchnotch', 'Warchief Tombstone',
                          'Wyrmgnasher Bjakdek' },
        },
        [2] = {
            true_both = { 'Battlechoir Gitchfotch', 'Overlords Tombstone', 'Reapertongue Gadgquok',
                          'Serjeant Tombstone', 'Soulsender Fugbrag', 'Vanguard Amputator', 'Vanguard Backstabber',
                          'Vanguard Bugler', 'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler',
                          'Vanguard Gutslasher', 'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer',
                          'Vanguard Neckchopper', 'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper',
                          'Vanguard Vexer', 'Voidstreaker Butchnotch', 'Warchief Tombstone' },
        },
        [3] = {
            true_both = { 'Battlechoir Gitchfotch', 'Reapertongue Gadgquok', 'Serjeant Tombstone',
                          'Soulsender Fugbrag', 'Vanguard Amputator', 'Vanguard Backstabber', 'Vanguard Bugler',
                          'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher',
                          'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer', 'Vanguard Neckchopper',
                          'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper', 'Vanguard Vexer',
                          'Voidstreaker Butchnotch', 'Warchief Tombstone', 'Wyrmgnasher Bjakdek' },
        },
        [4] = {
            true_both = { 'Overlords Tombstone', 'Reapertongue Gadgquok', 'Serjeant Tombstone',
                          'Soulsender Fugbrag', 'Vanguard Amputator', 'Vanguard Backstabber', 'Vanguard Bugler',
                          'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher',
                          'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer', 'Vanguard Neckchopper',
                          'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper', 'Vanguard Vexer',
                          'Voidstreaker Butchnotch', 'Warchief Tombstone', 'Wyrmgnasher Bjakdek' },
        },
        [5] = {
            true_both = { 'Battlechoir Gitchfotch', 'Overlords Tombstone', 'Reapertongue Gadgquok',
                          'Serjeant Tombstone', 'Vanguard Amputator', 'Vanguard Backstabber', 'Vanguard Bugler',
                          'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher',
                          'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer', 'Vanguard Neckchopper',
                          'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper', 'Vanguard Vexer',
                          'Voidstreaker Butchnotch', 'Warchief Tombstone', 'Wyrmgnasher Bjakdek' },
        },
        [6] = {
            true_both = { 'Battlechoir Gitchfotch', 'Overlords Tombstone', 'Serjeant Tombstone',
                          'Soulsender Fugbrag', 'Vanguard Amputator', 'Vanguard Backstabber', 'Vanguard Bugler',
                          'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher',
                          'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer', 'Vanguard Neckchopper',
                          'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper', 'Vanguard Vexer',
                          'Voidstreaker Butchnotch', 'Warchief Tombstone', 'Wyrmgnasher Bjakdek' },
        },
        [7] = {
            true_both = { 'Battlechoir Gitchfotch', 'Overlords Tombstone', 'Reapertongue Gadgquok',
                          'Serjeant Tombstone', 'Soulsender Fugbrag', 'Vanguard Amputator', 'Vanguard Backstabber',
                          'Vanguard Bugler', 'Vanguard Dollmaster', 'Vanguard Footsoldier', 'Vanguard Grappler',
                          'Vanguard Gutslasher', 'Vanguard Hawker', 'Vanguard Impaler', 'Vanguard Mesmerizer',
                          'Vanguard Neckchopper', 'Vanguard Pillager', 'Vanguard Predator', 'Vanguard Trooper',
                          'Vanguard Vexer', 'Warchief Tombstone', 'Wyrmgnasher Bjakdek' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Battlechoir Gitchfotch'] = { id = 63, name = 'Orc' },
        ['Overlords Tombstone'] = { id = 205, name = 'Statue' },
        ['Reapertongue Gadgquok'] = { id = 63, name = 'Orc' },
        ['Serjeant Tombstone'] = { id = 205, name = 'Statue' },
        ['Soulsender Fugbrag'] = { id = 63, name = 'Orc' },
        ['Vanguard Amputator'] = { id = 63, name = 'Orc' },
        ['Vanguard Backstabber'] = { id = 63, name = 'Orc' },
        ['Vanguard Bugler'] = { id = 63, name = 'Orc' },
        ['Vanguard Dollmaster'] = { id = 63, name = 'Orc' },
        ['Vanguard Footsoldier'] = { id = 63, name = 'Orc' },
        ['Vanguard Grappler'] = { id = 63, name = 'Orc' },
        ['Vanguard Gutslasher'] = { id = 63, name = 'Orc' },
        ['Vanguard Hawker'] = { id = 63, name = 'Orc' },
        ['Vanguard Impaler'] = { id = 63, name = 'Orc' },
        ['Vanguard Mesmerizer'] = { id = 63, name = 'Orc' },
        ['Vanguard Neckchopper'] = { id = 63, name = 'Orc' },
        ['Vanguard Pillager'] = { id = 63, name = 'Orc' },
        ['Vanguard Predator'] = { id = 63, name = 'Orc' },
        ['Vanguard Trooper'] = { id = 63, name = 'Orc' },
        ['Vanguard Vexer'] = { id = 63, name = 'Orc' },
        ['Voidstreaker Butchnotch'] = { id = 63, name = 'Orc' },
        ['Warchief Tombstone'] = { id = 205, name = 'Statue' },
        ['Wyrmgnasher Bjakdek'] = { id = 63, name = 'Orc' },
    },
    monsters = {
        {
            name   = 'Serjeant Tombstone',
            ids    = { 1, 4, 6, 8, 10, 12, 14, 16, 18, 24, 25, 28, 34, 42, 45, 50, 54, 58, 59, 60, 67, 69, 71, 74,
                       77, 80, 83, 92, 95, 98, 99, 100, 102, 105, 107, 109, 114, 118, 121, 127, 129, 131, 149, 171,
                       172, 175, 180, 185, 190, 193, 196, 199, 202, 207, 212, 213, 214, 217, 222, 227, 231, 234,
                       251, 254, 257, 258, 259, 261, 270, 283, 293, 298, 301, 305, 309, 313, 323, 330, 335, 340,
                       341, 343, 352, 360, 368, 370, 373, 376, 380, 384, 388, 392, 396, 400, 404, 408, 415, 419,
                       423, 427, 432, 439, 444, 451, 457, 464, 469, 475, 481, 488, 494, 501 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [65] = { acc = 272, eva = 238, agi = 90, int = 102, mnd = 80, chr = 84, dex = 90, def = 259,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
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
                family = { value = 'Statue / Weapons', notes = { 'Source species: Orc Statue (ID 479); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
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
            name   = 'Vanguard Footsoldier',
            ids    = { 2, 3, 29, 30, 116, 117, 120, 123, 318, 319, 328, 329, 336, 337, 377, 378, 379, 465, 466 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Grappler',
            ids    = { 5, 9, 15, 19, 21, 22, 23, 55, 119, 122, 228, 229, 249, 250, 381, 382, 383, 470, 471, 472 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4389, [76] = 4389, [77] = 4389 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Gutslasher',
            ids    = { 7, 11, 62, 63, 132, 133, 150, 151, 235, 236, 244, 350, 351, 424, 425, 426, 458, 459, 495,
                       496 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vexer',
            ids    = { 13, 17, 32, 33, 252, 253, 271, 272, 294, 295, 317, 333, 334, 393, 394, 395, 460, 461, 497,
                       498 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Warchief Tombstone',
            ids    = { 20, 31, 39, 61, 64, 87, 101, 112, 113, 124, 134, 139, 144, 152, 153, 157, 164, 173, 174, 237,
                       243, 246, 260, 264, 267, 273, 278, 286, 291, 292, 316, 320, 345, 346, 349, 357, 365 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [65] = { acc = 269, eva = 246, agi = 80, int = 90, mnd = 90, chr = 84, dex = 84, def = 262,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Orc Statue (ID 479); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
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
            name   = 'Vanguard Trooper',
            ids    = { 26, 51, 110, 111, 115, 299, 300, 306, 307, 308, 338, 339, 366, 367, 401, 402, 403, 489, 490,
                       491 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Neckchopper',
            ids    = { 27, 90, 91, 215, 216, 262, 263, 310, 311, 312, 314, 315, 331, 332, 405, 406, 407, 476, 477,
                       478 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Normal attacks: HP drain', notes = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, entries = { { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' }, categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } } }, coverage = 'partial', incomplete = true, reasons = danger[2], general_notes = danger[3] },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Impaler',
            ids    = { 35, 37, 158, 160, 162, 218, 220, 324, 326, 353, 355, 361, 363, 433, 435, 437, 502, 504,
                       506 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Wyvern',
            ids    = { 36, 38, 89, 159, 161, 163, 219, 221, 325, 327, 354, 356, 362, 364, 434, 436, 438, 503, 505,
                       507 },
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
            name   = 'Vanguard Amputator',
            ids    = { 40, 41, 72, 96, 97, 106, 108, 128, 130, 238, 239, 268, 269, 385, 386, 387, 467, 468, 473,
                       474 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Pillager',
            ids    = { 43, 44, 68, 70, 75, 78, 81, 84, 85, 103, 104, 397, 398, 399, 452, 453, 454, 492, 493 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Hawker',
            ids    = { 46, 135, 137, 145, 147, 223, 225, 274, 276, 279, 281, 284, 287, 289, 409, 411, 413, 482, 484,
                       486 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Hecteyes',
            ids    = { 47, 136, 138, 146, 148, 224, 226, 275, 277, 280, 282, 285, 288, 290, 410, 412, 414, 483, 485,
                       487 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 307, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 312, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 317, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            resist = { silence = 15 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Hecteyes / Amorph', notes = { 'Source species: Hecteye (ID 7); family ID 4.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Mesmerizer',
            ids    = { 48, 49, 56, 57, 73, 255, 256, 265, 266, 296, 297, 389, 390, 391, 462, 463, 479, 480 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Predator',
            ids    = { 52, 53, 93, 94, 125, 126, 191, 192, 200, 201, 240, 241, 242, 302, 303, 304, 358, 359, 420,
                       421, 422 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Backstabber',
            ids    = { 65, 66, 194, 195, 197, 198, 232, 233, 245, 347, 348, 371, 372, 374, 375, 428, 429, 430,
                       431 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 336, agi = 107, int = 95, mnd = 77, chr = 82, dex = 107, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 343, agi = 110, int = 96, mnd = 78, chr = 84, dex = 110, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Bugler',
            ids    = { 76, 79, 82, 86, 230, 321, 322, 342, 344, 416, 417, 418, 449, 450, 455, 456, 499, 500 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Wyrmgnasher Bjakdek',
            ids    = { 88 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [80] = { acc = 372, eva = 343, agi = 99, int = 85, mnd = 93, chr = 106, dex = 99, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8400 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Dollmaster',
            ids    = { 140, 142, 165, 167, 169, 176, 178, 181, 183, 186, 188, 203, 205, 208, 210, 440, 442, 445,
                       447 },
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
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Avatar',
            ids    = { 141, 143, 166, 168, 170, 177, 179, 182, 184, 187, 189, 204, 206, 209, 211, 248, 441, 443,
                       446, 448 },
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
            name   = 'Overlords Tombstone',
            ids    = { 154 },
            nm     = true,
            job    = 'rdm/blm',
            levels = {
                [65] = { acc = 270, eva = 247, agi = 83, int = 94, mnd = 87, chr = 84, dex = 86, def = 261,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 150, item = 1453 },  -- montiont silverpiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1474 },  -- infinity core
                { rate = 50, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Orc Statue (ID 479); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 12500 }, mp = { [65] = 12500 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Battlechoir Gitchfotch',
            ids    = { 155 },
            nm     = true,
            job    = 'brd/war',
            levels = {
                [80] = { acc = 351, eva = 332, agi = 92, int = 94, mnd = 94, chr = 106, dex = 101, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { silence = 25, virus = 25 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8400 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Soulsender Fugbrag',
            ids    = { 156 },
            nm     = true,
            job    = 'brd/war',
            levels = {
                [80] = { acc = 351, eva = 332, agi = 92, int = 94, mnd = 94, chr = 106, dex = 101, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { silence = 25, virus = 25 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8400 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Reapertongue Gadgquok',
            ids    = { 247 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [80] = { acc = 347, eva = 310, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8400 }, mp = { [80] = 2402 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Voidstreaker Butchnotch',
            ids    = { 369 },
            nm     = true,
            job    = 'nin/war',
            levels = {
                [80] = { acc = 356, eva = 358, agi = 110, int = 94, mnd = 81, chr = 88, dex = 110, def = 356,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { virus = 25, bind = 25 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 10, item = 1516 },  -- griffon hide
                { rate = 10, item = 1517 },  -- giant frozen head
                { rate = 10, item = 1519 },  -- fresh orc liver
                { rate = 10, group = {  -- one of
                    { 18290, 1 },  -- relic bhuj
                    { 18296, 1 },  -- relic lance
                    { 18308, 1 },  -- ihintanto
                    { 18332, 1 },  -- relic gun
                } },
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15108, 1 },  -- valor gauntlets
                    { 15118, 1 },  -- melee hose
                    { 15125, 1 },  -- monster trousers
                    { 15127, 1 },  -- scouts braccae
                    { 15129, 1 },  -- koga hakama
                    { 15132, 1 },  -- warriors calligae
                    { 15136, 1 },  -- duelists boots
                    { 15145, 1 },  -- wyrm greaves
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15025, 1 },  -- mirage bazubands
                    { 16349, 1 },  -- commodore trews
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8400 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
