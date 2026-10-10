-- Dynamis-Bastok (zone 186).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[2] = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[3] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[4] = { value = 'Move list unresolved', notes = danger[1], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[2], general_notes = danger[3] };
danger[5] = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[6] = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' };
danger[7] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = danger[6], categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } };
danger[8] = { danger[7] };
danger[9] = { value = 'Normal attacks: HP drain', notes = danger[5], entries = danger[8], coverage = 'partial', incomplete = true, reasons = danger[2], general_notes = danger[3] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield',
                          'GiPha Manameister', 'GuDha Effigy', 'GuNhi Noondozer', 'KoDho Cannonball',
                          'Vanguard Beasttender', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper',
                          'Vanguard Hatamoto', 'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant',
                          'Vanguard Minstrel', 'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge',
                          'Vanguard Undertaker', 'Vanguard Vigilante', 'Vanguard Vindicator',
                          'ZeVho Fallsplitter' },
        },
        [2] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield',
                          'GiPha Manameister', 'GuDha Effigy', 'GuNhi Noondozer', 'KoDho Cannonball',
                          'Vanguard Beasttender', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper',
                          'Vanguard Hatamoto', 'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant',
                          'Vanguard Minstrel', 'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge',
                          'Vanguard Undertaker', 'Vanguard Vigilante', 'Vanguard Vindicator' },
        },
        [3] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield',
                          'GiPha Manameister', 'GuDha Effigy', 'GuNhi Noondozer', 'Vanguard Beasttender',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper', 'Vanguard Hatamoto',
                          'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant', 'Vanguard Minstrel',
                          'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge', 'Vanguard Undertaker',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'ZeVho Fallsplitter' },
        },
        [4] = {
            true_both = { 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield', 'GiPha Manameister',
                          'GuDha Effigy', 'GuNhi Noondozer', 'KoDho Cannonball', 'Vanguard Beasttender',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper', 'Vanguard Hatamoto',
                          'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant', 'Vanguard Minstrel',
                          'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge', 'Vanguard Undertaker',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'ZeVho Fallsplitter' },
        },
        [5] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'Effigy Shield', 'GiPha Manameister',
                          'GuDha Effigy', 'GuNhi Noondozer', 'KoDho Cannonball', 'Vanguard Beasttender',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper', 'Vanguard Hatamoto',
                          'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant', 'Vanguard Minstrel',
                          'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge', 'Vanguard Undertaker',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'ZeVho Fallsplitter' },
        },
        [6] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield',
                          'GiPha Manameister', 'GuDha Effigy', 'KoDho Cannonball', 'Vanguard Beasttender',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper', 'Vanguard Hatamoto',
                          'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant', 'Vanguard Minstrel',
                          'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge', 'Vanguard Undertaker',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'ZeVho Fallsplitter' },
        },
        [7] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield',
                          'GuDha Effigy', 'GuNhi Noondozer', 'KoDho Cannonball', 'Vanguard Beasttender',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper', 'Vanguard Hatamoto',
                          'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant', 'Vanguard Minstrel',
                          'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge', 'Vanguard Undertaker',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'ZeVho Fallsplitter' },
        },
        [8] = {
            true_both = { 'AaNyu Dismantler', 'Adamantking Effigy', 'BeEbo Tortoisedriver', 'Effigy Shield',
                          'GiPha Manameister', 'GuNhi Noondozer', 'KoDho Cannonball', 'Vanguard Beasttender',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Drakekeeper', 'Vanguard Hatamoto',
                          'Vanguard Kusa', 'Vanguard Mason', 'Vanguard Militant', 'Vanguard Minstrel',
                          'Vanguard Protector', 'Vanguard Purloiner', 'Vanguard Thaumaturge', 'Vanguard Undertaker',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'ZeVho Fallsplitter' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['AaNyu Dismantler'] = { id = 67, name = 'Quadav' },
        ['Adamantking Effigy'] = { id = 205, name = 'Statue' },
        ['BeEbo Tortoisedriver'] = { id = 67, name = 'Quadav' },
        ['Effigy Shield'] = { id = 67, name = 'Quadav' },
        ['GiPha Manameister'] = { id = 67, name = 'Quadav' },
        ['GuDha Effigy'] = { id = 205, name = 'Statue' },
        ['GuNhi Noondozer'] = { id = 67, name = 'Quadav' },
        ['KoDho Cannonball'] = { id = 67, name = 'Quadav' },
        ['Vanguard Beasttender'] = { id = 67, name = 'Quadav' },
        ['Vanguard Constable'] = { id = 67, name = 'Quadav' },
        ['Vanguard Defender'] = { id = 67, name = 'Quadav' },
        ['Vanguard Drakekeeper'] = { id = 67, name = 'Quadav' },
        ['Vanguard Hatamoto'] = { id = 67, name = 'Quadav' },
        ['Vanguard Kusa'] = { id = 67, name = 'Quadav' },
        ['Vanguard Mason'] = { id = 67, name = 'Quadav' },
        ['Vanguard Militant'] = { id = 67, name = 'Quadav' },
        ['Vanguard Minstrel'] = { id = 67, name = 'Quadav' },
        ['Vanguard Protector'] = { id = 67, name = 'Quadav' },
        ['Vanguard Purloiner'] = { id = 67, name = 'Quadav' },
        ['Vanguard Thaumaturge'] = { id = 67, name = 'Quadav' },
        ['Vanguard Undertaker'] = { id = 67, name = 'Quadav' },
        ['Vanguard Vigilante'] = { id = 67, name = 'Quadav' },
        ['Vanguard Vindicator'] = { id = 67, name = 'Quadav' },
        ['ZeVho Fallsplitter'] = { id = 67, name = 'Quadav' },
    },
    monsters = {
        {
            name   = 'Adamantking Effigy',
            ids    = { 1, 4, 5, 8, 13, 17, 24, 25, 26, 30, 33, 36, 37, 38, 42, 46, 50, 53, 56, 59, 60, 62, 67, 70,
                       72, 76, 79, 80, 81, 82, 83, 86, 87, 91, 95, 99, 103, 107, 111, 116, 119, 122, 125, 126, 127,
                       128, 135, 136, 137, 138, 145, 146, 147, 148, 155, 156, 157, 158, 165, 168, 171, 174, 177,
                       181, 184, 187, 190, 193, 197, 200, 204, 207, 208, 212, 215, 218, 222, 225, 226, 230, 235,
                       237, 241, 245, 249, 253, 256, 259, 262, 266, 270, 274, 277, 280, 285, 288, 291, 294, 295,
                       297, 298, 300, 301, 305, 309, 313, 314, 317, 320, 323, 327, 330, 333, 334, 337, 342, 347,
                       352, 355, 358, 361, 364, 367, 369, 370, 371, 372, 373, 374, 383, 389, 398, 399, 403, 407,
                       411, 415, 419, 424, 429, 434, 441, 445, 449, 453, 460, 465, 470, 474, 478, 482, 487, 491,
                       495, 498, 501, 505, 512, 516, 519, 522, 526, 531 },
            nm     = true,
            levels = {
                [65] = { acc = 272, eva = 259, agi = 90, int = 74, mnd = 74, chr = 80, dex = 90, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
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
                family = { value = 'Statue / Weapons', notes = { 'Source species: Quadav Statue (ID 480); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'ZeVho Fallsplitter',
            ids    = { 2 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 7200 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Constable',
            ids    = { 3, 7, 12, 18, 85, 102, 106, 110, 115, 121, 221, 224, 290, 326, 332, 375, 425, 426, 427, 428,
                       450, 513, 530 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Defender',
            ids    = { 6, 34, 39, 54, 63, 92, 104, 169, 185, 205, 209, 242, 263, 267, 316, 420, 421, 422, 423, 446,
                       496, 520 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Drakekeeper',
            ids    = { 9, 47, 73, 112, 178, 194, 201, 231, 271, 281, 306, 435, 437, 439, 479, 488, 527, 532 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Wyvern',
            ids    = { 10, 48, 74, 113, 179, 195, 202, 232, 272, 282, 307, 395, 436, 438, 440, 480, 489, 528, 533 },
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
            info_by_index = {
                [395] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
            },
        },
        {
            name   = 'Vanguard Purloiner',
            ids    = { 11, 58, 75, 89, 118, 170, 172, 243, 255, 261, 276, 296, 335, 368, 430, 431, 432, 433, 443,
                       499, 525 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Militant',
            ids    = { 14, 15, 21, 40, 44, 97, 101, 105, 109, 114, 196, 210, 239, 251, 264, 329, 408, 409, 410, 452,
                       481, 503 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3762, [76] = 3762, [77] = 3762 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vigilante',
            ids    = { 16, 27, 43, 57, 64, 77, 96, 108, 182, 227, 238, 254, 278, 310, 324, 362, 412, 413, 414, 447,
                       497, 521 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vindicator',
            ids    = { 19, 31, 51, 88, 100, 117, 188, 246, 250, 260, 275, 302, 319, 331, 359, 400, 401, 402, 442,
                       502, 535 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Mason',
            ids    = { 20, 23, 68, 69, 71, 328, 416, 417, 418, 451, 490, 494, 517 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Thaumaturge',
            ids    = { 22, 41, 45, 49, 94, 173, 199, 206, 244, 258, 279, 304, 312, 322, 354, 366, 404, 405, 406,
                       448, 514, 534 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Hatamoto',
            ids    = { 28, 78, 93, 180, 191, 228, 247, 257, 283, 286, 292, 318, 356, 365, 376, 461, 462, 463, 464,
                       492, 504, 529 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Minstrel',
            ids    = { 29, 52, 98, 176, 183, 189, 229, 265, 273, 284, 287, 293, 321, 357, 363, 444, 466, 467, 468,
                       469, 500, 523 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Kusa',
            ids    = { 32, 35, 55, 61, 166, 175, 198, 233, 236, 268, 289, 303, 311, 315, 325, 353, 471, 472, 473,
                       493, 518 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Beasttender',
            ids    = { 65, 129, 131, 139, 141, 149, 151, 159, 161, 338, 340, 343, 345, 348, 350, 506, 508, 510 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Scorpion',
            ids    = { 66, 130, 132, 134, 140, 142, 144, 150, 152, 154, 160, 162, 164, 339, 341, 344, 346, 349, 351,
                       397, 507, 509, 511 },
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
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            resist = { silence = 15 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
            info_by_index = {
                [397] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
            },
        },
        {
            name   = 'KoDho Cannonball',
            ids    = { 84 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [80] = { acc = 357, eva = 336, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 354,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 7362 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Protector',
            ids    = { 90, 167, 186, 192, 203, 211, 234, 240, 248, 252, 269, 299, 308, 336, 360, 475, 476, 477, 515,
                       524 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'AaNyu Dismantler',
            ids    = { 120 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 7200 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 265', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Undertaker',
            ids    = { 123, 213, 216, 454, 456, 458, 483, 485 },
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
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Avatar',
            ids    = { 124, 214, 217, 220, 392, 455, 457, 459, 484, 486 },
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
            info_by_index = {
                [392] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
            },
        },
        {
            name   = 'BeEbo Tortoisedriver',
            ids    = { 133, 143, 153, 163 },
            nm     = true,
            job    = 'bst/war',
            levels = {
                [80] = { acc = 354, eva = 332, agi = 92, int = 90, mnd = 90, chr = 111, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 25, slow = 25 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 7200 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 265 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'GuNhi Noondozer',
            ids    = { 219 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [80] = { acc = 347, eva = 310, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 7200 }, mp = { [80] = 2402 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'GiPha Manameister',
            ids    = { 223 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 7200 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'GuDha Effigy',
            ids    = { 377 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [65] = { acc = 272, eva = 238, agi = 90, int = 102, mnd = 80, chr = 84, dex = 90, def = 259,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 150, item = 1456 },  -- one hundred byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1474 },  -- infinity core
                { rate = 50, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 8,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Quadav Statue (ID 480); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
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
            name   = 'Effigy Shield',
            ids    = { 378 },
            nm     = true,
            levels = {
                [65] = { acc = 272, eva = 259, agi = 90, int = 74, mnd = 74, chr = 80, dex = 90, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 379 },
            nm     = true,
            job    = 'whm/war',
            levels = {
                [65] = { acc = 266, eva = 255, agi = 83, int = 78, mnd = 93, chr = 87, dex = 79, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 20000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 380 },
            nm     = true,
            job    = 'mnk/war',
            levels = {
                [65] = { acc = 273, eva = 259, agi = 79, int = 70, mnd = 81, chr = 80, dex = 93, def = 280,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7308 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 381 },
            nm     = true,
            job    = 'blm/war',
            levels = {
                [65] = { acc = 272, eva = 259, agi = 90, int = 93, mnd = 78, chr = 83, dex = 90, def = 270,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 20000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 382 },
            nm     = true,
            job    = 'thf/war',
            levels = {
                [65] = { acc = 276, eva = 309, agi = 93, int = 85, mnd = 70, chr = 72, dex = 98, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20, gravity = 15 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 384 },
            nm     = true,
            job    = 'drk/war',
            levels = {
                [65] = { acc = 272, eva = 257, agi = 86, int = 85, mnd = 70, chr = 72, dex = 90, def = 276,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { paralyze = 20, virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 20000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 385 },
            nm     = true,
            job    = 'pld/war',
            levels = {
                [65] = { acc = 268, eva = 251, agi = 75, int = 70, mnd = 85, chr = 87, dex = 83, def = 305,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { sleep = 20, virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 20000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 386 },
            nm     = true,
            job    = 'brd/war',
            levels = {
                [65] = { acc = 270, eva = 253, agi = 79, int = 81, mnd = 81, chr = 90, dex = 86, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { silence = 25, virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 387 },
            nm     = true,
            job    = 'nin/war',
            levels = {
                [65] = { acc = 273, eva = 274, agi = 93, int = 81, mnd = 70, chr = 76, dex = 93, def = 276,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20, bind = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 388 },
            nm     = true,
            job    = 'sam/war',
            levels = {
                [65] = { acc = 272, eva = 263, agi = 86, int = 78, mnd = 78, chr = 83, dex = 90, def = 276,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { blind = 25, virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 20', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 390 },
            nm     = true,
            job    = 'rng/war',
            levels = {
                [65] = { acc = 305, eva = 263, agi = 98, int = 78, mnd = 81, chr = 80, dex = 86, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { poison = 20, virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 391 },
            nm     = true,
            job    = 'smn/war',
            levels = {
                [65] = { acc = 268, eva = 257, agi = 86, int = 88, mnd = 88, chr = 90, dex = 83, def = 270,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20, slow = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 20040 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 393 },
            nm     = true,
            job    = 'rdm/war',
            levels = {
                [65] = { acc = 270, eva = 255, agi = 83, int = 85, mnd = 85, chr = 83, dex = 86, def = 272,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20, petrify = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 20000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 394 },
            nm     = true,
            job    = 'drg/war',
            levels = {
                [65] = { acc = 292, eva = 263, agi = 86, int = 74, mnd = 78, chr = 87, dex = 86, def = 276,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Effigy Shield',
            ids    = { 396 },
            nm     = true,
            job    = 'bst/war',
            levels = {
                [65] = { acc = 272, eva = 253, agi = 79, int = 78, mnd = 78, chr = 95, dex = 90, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 20, slow = 20 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 10, item = 1469 },  -- chunk of wootz ore
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1521 },  -- vial of slime juice
                { rate = 10, group = {  -- one of
                    { 18278, 1 },  -- relic blade
                    { 18284, 1 },  -- relic axe
                    { 18302, 1 },  -- relic scythe
                    { 18314, 1 },  -- ito
                } },
                { rate = 50, group = {  -- one of
                    { 15078, 1 },  -- valor coronet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15106, 1 },  -- duelists gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15116, 1 },  -- summoners bracers
                    { 15120, 1 },  -- sorcerers tonban
                    { 15130, 1 },  -- wyrm brais
                    { 15133, 1 },  -- melee gaiters
                    { 15139, 1 },  -- abyss sollerets
                } },
                { rate = 10, group = { { 11385, 1 }, { 16346, 1 } } },  -- one of commodore bottes, mirage shalwar
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 7200 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
