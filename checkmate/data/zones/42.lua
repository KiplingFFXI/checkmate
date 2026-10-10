-- Dynamis-Tavnazia (zone 42).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[2] = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[3] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[4] = { value = 'Move list unresolved', notes = danger[1], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[2], general_notes = danger[3] };
danger[5] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[6] = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[7] = { value = 'Move list unresolved', notes = danger[5], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[6], general_notes = danger[3] };
danger[8] = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[9] = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' };
danger[10] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = danger[9], categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } };
danger[11] = { danger[10] };
danger[12] = { value = 'Normal attacks: HP drain', notes = danger[8], entries = danger[11], coverage = 'partial', incomplete = true, reasons = danger[2], general_notes = danger[3] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            true_both = { 'Ambusher Antlion', 'Diabolos Club', 'Diabolos Diamond', 'Diabolos Heart',
                          'Diabolos Spade', 'Hydra Bard', 'Hydra Beastmaster', 'Hydra Black Mage',
                          'Hydra Dark Knight', 'Hydra Dragoon', 'Hydra Monk', 'Hydra Ninja', 'Hydra Paladin',
                          'Hydra Ranger', 'Hydra Red Mage', 'Hydra Samurai', 'Hydra Summoner', 'Hydra Thief',
                          'Hydra Warrior', 'Hydra White Mage', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'Nightmare Cluster', 'Nightmare Hornet', 'Nightmare Leech',
                          'Nightmare Makara', 'Nightmare Taurus', 'Nightmare Worm', 'Vanguard Eye' },
        },
        [2] = {
            true_both = { 'Ambusher Antlion', 'Diabolos Club', 'Diabolos Diamond', 'Diabolos Heart',
                          'Diabolos Spade', 'Hydra Bard', 'Hydra Beastmaster', 'Hydra Black Mage',
                          'Hydra Dark Knight', 'Hydra Dragoon', 'Hydra Monk', 'Hydra Ninja', 'Hydra Paladin',
                          'Hydra Ranger', 'Hydra Red Mage', 'Hydra Samurai', 'Hydra Summoner', 'Hydra Thief',
                          'Hydra Warrior', 'Hydra White Mage', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'Nightmare Bugard', 'Nightmare Cluster', 'Nightmare Hornet',
                          'Nightmare Leech', 'Nightmare Makara', 'Nightmare Taurus', 'Nightmare Worm',
                          'Vanguard Eye' },
        },
        [3] = {
            true_both = { 'Ambusher Antlion', 'Diabolos Club', 'Diabolos Diamond', 'Diabolos Heart', 'Hydra Bard',
                          'Hydra Beastmaster', 'Hydra Black Mage', 'Hydra Dark Knight', 'Hydra Dragoon',
                          'Hydra Monk', 'Hydra Ninja', 'Hydra Paladin', 'Hydra Ranger', 'Hydra Red Mage',
                          'Hydra Samurai', 'Hydra Summoner', 'Hydra Thief', 'Hydra Warrior', 'Hydra White Mage',
                          'Kindred Bard', 'Kindred Beastmaster', 'Kindred Black Mage', 'Kindred Dark Knight',
                          'Kindred Dragoon', 'Kindred Monk', 'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger',
                          'Kindred Red Mage', 'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief',
                          'Kindred Warrior', 'Kindred White Mage', 'Nightmare Bugard', 'Nightmare Cluster',
                          'Nightmare Hornet', 'Nightmare Leech', 'Nightmare Makara', 'Nightmare Taurus',
                          'Nightmare Worm', 'Vanguard Eye' },
        },
        [4] = {
            true_both = { 'Ambusher Antlion', 'Diabolos Club', 'Diabolos Diamond', 'Diabolos Spade', 'Hydra Bard',
                          'Hydra Beastmaster', 'Hydra Black Mage', 'Hydra Dark Knight', 'Hydra Dragoon',
                          'Hydra Monk', 'Hydra Ninja', 'Hydra Paladin', 'Hydra Ranger', 'Hydra Red Mage',
                          'Hydra Samurai', 'Hydra Summoner', 'Hydra Thief', 'Hydra Warrior', 'Hydra White Mage',
                          'Kindred Bard', 'Kindred Beastmaster', 'Kindred Black Mage', 'Kindred Dark Knight',
                          'Kindred Dragoon', 'Kindred Monk', 'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger',
                          'Kindred Red Mage', 'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief',
                          'Kindred Warrior', 'Kindred White Mage', 'Nightmare Bugard', 'Nightmare Cluster',
                          'Nightmare Hornet', 'Nightmare Leech', 'Nightmare Makara', 'Nightmare Taurus',
                          'Nightmare Worm', 'Vanguard Eye' },
        },
        [5] = {
            true_both = { 'Ambusher Antlion', 'Diabolos Club', 'Diabolos Heart', 'Diabolos Spade', 'Hydra Bard',
                          'Hydra Beastmaster', 'Hydra Black Mage', 'Hydra Dark Knight', 'Hydra Dragoon',
                          'Hydra Monk', 'Hydra Ninja', 'Hydra Paladin', 'Hydra Ranger', 'Hydra Red Mage',
                          'Hydra Samurai', 'Hydra Summoner', 'Hydra Thief', 'Hydra Warrior', 'Hydra White Mage',
                          'Kindred Bard', 'Kindred Beastmaster', 'Kindred Black Mage', 'Kindred Dark Knight',
                          'Kindred Dragoon', 'Kindred Monk', 'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger',
                          'Kindred Red Mage', 'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief',
                          'Kindred Warrior', 'Kindred White Mage', 'Nightmare Bugard', 'Nightmare Cluster',
                          'Nightmare Hornet', 'Nightmare Leech', 'Nightmare Makara', 'Nightmare Taurus',
                          'Nightmare Worm', 'Vanguard Eye' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Ambusher Antlion'] = { id = 180, name = 'Antlion' },
        ['Diabolos Club'] = { id = 102, name = 'Avatar' },
        ['Diabolos Diamond'] = { id = 102, name = 'Avatar' },
        ['Diabolos Heart'] = { id = 102, name = 'Avatar' },
        ['Diabolos Spade'] = { id = 102, name = 'Avatar' },
        ['Hydra Bard'] = { id = 172, name = 'Fomor' },
        ['Hydra Beastmaster'] = { id = 172, name = 'Fomor' },
        ['Hydra Black Mage'] = { id = 172, name = 'Fomor' },
        ['Hydra Dark Knight'] = { id = 172, name = 'Fomor' },
        ['Hydra Dragoon'] = { id = 172, name = 'Fomor' },
        ['Hydra Monk'] = { id = 172, name = 'Fomor' },
        ['Hydra Ninja'] = { id = 172, name = 'Fomor' },
        ['Hydra Paladin'] = { id = 172, name = 'Fomor' },
        ['Hydra Ranger'] = { id = 172, name = 'Fomor' },
        ['Hydra Red Mage'] = { id = 172, name = 'Fomor' },
        ['Hydra Samurai'] = { id = 172, name = 'Fomor' },
        ['Hydra Summoner'] = { id = 172, name = 'Fomor' },
        ['Hydra Thief'] = { id = 172, name = 'Fomor' },
        ['Hydra Warrior'] = { id = 172, name = 'Fomor' },
        ['Hydra White Mage'] = { id = 172, name = 'Fomor' },
        ['Kindred Bard'] = { id = 88, name = 'Demon' },
        ['Kindred Beastmaster'] = { id = 88, name = 'Demon' },
        ['Kindred Black Mage'] = { id = 88, name = 'Demon' },
        ['Kindred Dark Knight'] = { id = 88, name = 'Demon' },
        ['Kindred Dragoon'] = { id = 88, name = 'Demon' },
        ['Kindred Monk'] = { id = 88, name = 'Demon' },
        ['Kindred Ninja'] = { id = 88, name = 'Demon' },
        ['Kindred Paladin'] = { id = 88, name = 'Demon' },
        ['Kindred Ranger'] = { id = 88, name = 'Demon' },
        ['Kindred Red Mage'] = { id = 88, name = 'Demon' },
        ['Kindred Samurai'] = { id = 88, name = 'Demon' },
        ['Kindred Summoner'] = { id = 88, name = 'Demon' },
        ['Kindred Thief'] = { id = 88, name = 'Demon' },
        ['Kindred Warrior'] = { id = 88, name = 'Demon' },
        ['Kindred White Mage'] = { id = 88, name = 'Demon' },
        ['Nightmare Bugard'] = { id = 123, name = 'Bugard' },
        ['Nightmare Cluster'] = { id = 25, name = 'Cluster' },
        ['Nightmare Hornet'] = { id = 181, name = 'Bee' },
        ['Nightmare Leech'] = { id = 5, name = 'Leech' },
        ['Nightmare Makara'] = { id = 16, name = 'Pugil' },
        ['Nightmare Taurus'] = { id = 94, name = 'Taurus' },
        ['Nightmare Worm'] = { id = 10, name = 'Worm' },
        ['Vanguard Eye'] = { id = 87, name = 'Ahriman' },
    },
    monsters = {
        {
            name   = 'Nightmare Bugard',
            ids    = { 1 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 410,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 417,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 423,
                         attack_skill = 281 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2036, 1 },  -- warriors cuisses -1
                    { 2041, 1 },  -- melee hose -1
                    { 2046, 1 },  -- clerics pantaloons -1
                    { 2051, 1 },  -- sorcerers tonban -1
                    { 2056, 1 },  -- duelists tights -1
                    { 2061, 1 },  -- assassins culotte -1
                    { 2066, 1 },  -- valor breeches -1
                    { 2071, 1 },  -- abyss flanchard -1
                    { 2076, 1 },  -- monster trousers -1
                    { 2081, 1 },  -- bards cannions -1
                    { 2086, 1 },  -- scouts braccae -1
                    { 2091, 1 },  -- saotome haidate -1
                    { 2096, 1 },  -- koga hakama -1
                    { 2101, 1 },  -- wyrm brais -1
                    { 2106, 1 },  -- summoners spats -1
                } },
                { rate = 10, group = {  -- one of
                    { 2665, 1 },  -- mirage shalwar -1
                    { 2670, 1 },  -- commodore trews -1
                    { 2675, 1 },  -- pantin churidars -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bugard / Lizard', notes = { 'Source species: Bugard (ID 302); family ID 123.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 300 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Worm',
            ids    = { 2, 3, 4, 5, 6 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [78] = { acc = 343, eva = 304, agi = 104, int = 117, mnd = 92, chr = 96, dex = 104, def = 326,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 309, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 331,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2036, 1 },  -- warriors cuisses -1
                    { 2041, 1 },  -- melee hose -1
                    { 2046, 1 },  -- clerics pantaloons -1
                    { 2051, 1 },  -- sorcerers tonban -1
                    { 2056, 1 },  -- duelists tights -1
                    { 2061, 1 },  -- assassins culotte -1
                    { 2066, 1 },  -- valor breeches -1
                    { 2071, 1 },  -- abyss flanchard -1
                    { 2076, 1 },  -- monster trousers -1
                    { 2081, 1 },  -- bards cannions -1
                    { 2086, 1 },  -- scouts braccae -1
                    { 2091, 1 },  -- saotome haidate -1
                    { 2096, 1 },  -- koga hakama -1
                    { 2101, 1 },  -- wyrm brais -1
                    { 2106, 1 },  -- summoners spats -1
                } },
                { rate = 10, group = {  -- one of
                    { 2665, 1 },  -- mirage shalwar -1
                    { 2670, 1 },  -- commodore trews -1
                    { 2675, 1 },  -- pantin churidars -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            aggro_note = 'underground',
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Worm / Amorph', notes = { 'Source species: Worm (ID 23); family ID 10.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 0', notes = { 'Source base speed is 0; the ordinary monster default is 40. Animation speed is 0.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ambusher Antlion',
            ids    = { 7, 8, 9, 10 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 410,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 417,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 423,
                         attack_skill = 281 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2034, 1 },  -- warriors lorica -1
                    { 2039, 1 },  -- melee cyclas -1
                    { 2044, 1 },  -- clerics bliaut -1
                    { 2049, 1 },  -- sorcerers coat -1
                    { 2054, 1 },  -- duelists tabard -1
                    { 2059, 1 },  -- assassins vest -1
                    { 2064, 1 },  -- valor surcoat -1
                    { 2069, 1 },  -- abyss cuirass -1
                    { 2074, 1 },  -- monster jackcoat -1
                    { 2079, 1 },  -- bards justaucorps -1
                    { 2084, 1 },  -- scouts jerkin -1
                    { 2089, 1 },  -- saotome domaru -1
                    { 2094, 1 },  -- koga chainmail -1
                    { 2099, 1 },  -- wyrm mail -1
                    { 2104, 1 },  -- summoners doublet -1
                } },
                { rate = 10, group = {  -- one of
                    { 2663, 1 },  -- mirage jubbah -1
                    { 2668, 1 },  -- commodore frac -1
                    { 2673, 1 },  -- pantin tobe -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            ambush = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Antlion / Vermin', notes = { 'Source species: Antlion (ID 422); family ID 180.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 16000, [79] = 16000, [80] = 16000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Diabolos Club',
            ids    = { 11, 12, 13, 14 },
            nm     = true,
            job    = 'smn/blm',
            levels = {
                [82] = { acc = 363, eva = 322, agi = 104, int = 117, mnd = 108, chr = 110, dex = 100, def = 338,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Diabolos (ID 245); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 2466 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[7],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Diabolos Spade',
            ids    = { 15 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 354,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Diabolos (ID 245); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[7],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Diabolos Heart',
            ids    = { 16 },
            nm     = true,
            job    = 'drk/blm',
            levels = {
                [82] = { acc = 367, eva = 347, agi = 104, int = 113, mnd = 86, chr = 88, dex = 109, def = 345,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Diabolos (ID 245); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[7],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Diabolos Diamond',
            ids    = { 17 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 339,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Diabolos (ID 245); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[7],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Diabolos Club',
            ids    = { 18 },
            nm     = true,
            job    = 'smn/blm',
            levels = {
                [82] = { acc = 363, eva = 322, agi = 104, int = 117, mnd = 108, chr = 110, dex = 100, def = 338,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Diabolos (ID 245); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 2466 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[7],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Diaboloss Shard',
            ids    = { 19, 20 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 354,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Diabolos (ID 245); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 9000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[7],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
            info_by_index = {
                [20] = { vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 9000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false }, rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } } },
            },
        },
        {
            name   = 'Nightmare Hornet',
            ids    = { 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43,
                       44, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230,
                       231, 232, 233, 234, 235, 236 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2036, 1 },  -- warriors cuisses -1
                    { 2041, 1 },  -- melee hose -1
                    { 2046, 1 },  -- clerics pantaloons -1
                    { 2051, 1 },  -- sorcerers tonban -1
                    { 2056, 1 },  -- duelists tights -1
                    { 2061, 1 },  -- assassins culotte -1
                    { 2066, 1 },  -- valor breeches -1
                    { 2071, 1 },  -- abyss flanchard -1
                    { 2076, 1 },  -- monster trousers -1
                    { 2081, 1 },  -- bards cannions -1
                    { 2086, 1 },  -- scouts braccae -1
                    { 2091, 1 },  -- saotome haidate -1
                    { 2096, 1 },  -- koga hakama -1
                    { 2101, 1 },  -- wyrm brais -1
                    { 2106, 1 },  -- summoners spats -1
                } },
                { rate = 10, group = {  -- one of
                    { 2665, 1 },  -- mirage shalwar -1
                    { 2670, 1 },  -- commodore trews -1
                    { 2675, 1 },  -- pantin churidars -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bee / Vermin', notes = { 'Source species: Yellow Bee (ID 428); family ID 181.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Eye',
            ids    = { 45, 49, 54, 60, 67, 71, 78, 83, 89, 95, 100, 104, 111, 116, 121, 126, 237, 241, 247, 251,
                       255, 261, 267, 273, 277, 282, 286, 292, 297, 302, 309, 314, 319, 326, 333, 337, 344, 349,
                       352, 356 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [70] = { acc = 297, eva = 275, agi = 91, int = 103, mnd = 87, chr = 89, dex = 93, def = 285,
                         attack_skill = 233 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, light = -1, dark = 7,
                       paralyze = 1, bind = 1, silence = 11, slow = 1, poison = 1, light_sleep = -1, dark_sleep = 7,
                       blind = 7, stun = 1, gravity = 1 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'elegy' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 50, item = 4248 },  -- copy of ginuvas battle theory
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Ahriman / Demon', notes = { 'Source species: Dynamis Ahriman (ID 500); family ID 87.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 2000 }, mp = { [70] = 2000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Warrior',
            ids    = { 46, 79, 96, 122 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Red Mage',
            ids    = { 47, 70, 98, 127 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [82] = { acc = 363, eva = 333, agi = 95, int = 109, mnd = 109, chr = 101, dex = 101, def = 350,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Ranger',
            ids    = { 48, 87, 92, 118 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Monk',
            ids    = { 50, 80, 90, 112 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [82] = { acc = 370, eva = 347, agi = 88, int = 82, mnd = 101, chr = 95, dex = 115, def = 364,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5680 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Bard',
            ids    = { 51, 86, 107, 114 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [82] = { acc = 363, eva = 330, agi = 88, int = 101, mnd = 101, chr = 115, dex = 101, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Samurai',
            ids    = { 52, 82, 108, 125 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [82] = { acc = 367, eva = 353, agi = 101, int = 95, mnd = 95, chr = 101, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Ninja',
            ids    = { 53, 88, 103, 115 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [82] = { acc = 370, eva = 370, agi = 115, int = 101, mnd = 82, chr = 88, dex = 115, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Dark Knight',
            ids    = { 55, 85, 102, 124 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 367, eva = 345, agi = 101, int = 109, mnd = 82, chr = 82, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Beastmaster',
            ids    = { 56, 72, 105, 129 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [82] = { acc = 367, eva = 339, agi = 88, int = 95, mnd = 95, chr = 122, dex = 109, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydras Hound',
            ids    = { 57, 73, 106, 130 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [82] = { acc = 363, eva = 333, agi = 95, int = 109, mnd = 109, chr = 101, dex = 101, def = 341,
                         attack_skill = 293 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            resist = { silence = 15 },
            weapon_dmg = { slashing = 12.5 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Hound / Undead', notes = { 'Source species: Hound (ID 409); family ID 174.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 3300 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Summoner',
            ids    = { 58, 76, 93, 119 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [82] = { acc = 360, eva = 320, agi = 101, int = 115, mnd = 115, chr = 115, dex = 95, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 2466 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydras Avatar',
            ids    = { 59, 77, 94, 120 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 338,
                         attack_skill = 293 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            links  = 2,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 3300 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Hydra White Mage',
            ids    = { 61, 68, 97, 113 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Black Mage',
            ids    = { 62, 69, 101, 117 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Thief',
            ids    = { 63, 81, 99, 128 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [82] = { acc = 374, eva = 418, agi = 115, int = 109, mnd = 82, chr = 82, dex = 122, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Paladin',
            ids    = { 64, 84, 91, 123 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 412,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydra Dragoon',
            ids    = { 65, 74, 109, 131 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 385, eva = 353, agi = 101, int = 88, mnd = 95, chr = 109, dex = 101, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15088, 1 },  -- melee cyclas
                    { 15089, 1 },  -- clerics bliaut
                    { 15090, 1 },  -- sorcerers coat
                    { 15091, 1 },  -- duelists tabard
                    { 15094, 1 },  -- abyss cuirass
                    { 15096, 1 },  -- bards justaucorps
                    { 15098, 1 },  -- saotome domaru
                    { 15099, 1 },  -- koga chainmail
                    { 15100, 1 },  -- wyrm mail
                    { 15101, 1 },  -- summoners doublet
                    { 15117, 1 },  -- warriors cuisses
                    { 15122, 1 },  -- assassins culottes
                    { 15123, 1 },  -- valor breeches
                    { 15140, 1 },  -- monster gaiters
                    { 15142, 1 },  -- scouts socks
                } },
                { rate = 10, group = {  -- one of
                    { 11292, 1 },  -- mirage jubbah
                    { 11295, 1 },  -- commodore frac
                    { 11298, 1 },  -- pantin tobe
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fomor / Undead', notes = { 'Source species: Hydra Fomor (ID 404); family ID 172.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Hydras Wyvern',
            ids    = { 66, 75, 110, 132 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 385, eva = 353, agi = 101, int = 88, mnd = 95, chr = 109, dex = 101, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Blue Wyvern (ID 236); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 3300 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Nightmare Leech',
            ids    = { 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150,
                       151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168,
                       169, 170, 171, 172 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2034, 1 },  -- warriors lorica -1
                    { 2039, 1 },  -- melee cyclas -1
                    { 2044, 1 },  -- clerics bliaut -1
                    { 2049, 1 },  -- sorcerers coat -1
                    { 2054, 1 },  -- duelists tabard -1
                    { 2059, 1 },  -- assassins vest -1
                    { 2064, 1 },  -- valor surcoat -1
                    { 2069, 1 },  -- abyss cuirass -1
                    { 2074, 1 },  -- monster jackcoat -1
                    { 2079, 1 },  -- bards justaucorps -1
                    { 2084, 1 },  -- scouts jerkin -1
                    { 2089, 1 },  -- saotome domaru -1
                    { 2094, 1 },  -- koga chainmail -1
                    { 2099, 1 },  -- wyrm mail -1
                    { 2104, 1 },  -- summoners doublet -1
                } },
                { rate = 10, group = {  -- one of
                    { 2663, 1 },  -- mirage jubbah -1
                    { 2668, 1 },  -- commodore frac -1
                    { 2673, 1 },  -- pantin tobe -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Leech / Amorph', notes = { 'Source species: Leech (ID 8); family ID 5.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Nightmare Makara',
            ids    = { 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190,
                       191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208,
                       209, 210, 211, 212 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2036, 1 },  -- warriors cuisses -1
                    { 2041, 1 },  -- melee hose -1
                    { 2046, 1 },  -- clerics pantaloons -1
                    { 2051, 1 },  -- sorcerers tonban -1
                    { 2056, 1 },  -- duelists tights -1
                    { 2061, 1 },  -- assassins culotte -1
                    { 2066, 1 },  -- valor breeches -1
                    { 2071, 1 },  -- abyss flanchard -1
                    { 2076, 1 },  -- monster trousers -1
                    { 2081, 1 },  -- bards cannions -1
                    { 2086, 1 },  -- scouts braccae -1
                    { 2091, 1 },  -- saotome haidate -1
                    { 2096, 1 },  -- koga hakama -1
                    { 2101, 1 },  -- wyrm brais -1
                    { 2106, 1 },  -- summoners spats -1
                } },
                { rate = 10, group = {  -- one of
                    { 2665, 1 },  -- mirage shalwar -1
                    { 2670, 1 },  -- commodore trews -1
                    { 2675, 1 },  -- pantin churidars -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Pugil / Aquan', notes = { 'Source species: Pugil (ID 38); family ID 16.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Nightmare Taurus',
            ids    = { 238, 242, 248, 252, 256, 262, 274, 275, 276, 293, 294, 295, 298, 299, 303, 304, 310, 311,
                       315, 316, 320, 321, 327, 328, 334, 335, 336, 350, 353, 357 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [78] = { acc = 346, eva = 326, agi = 84, int = 78, mnd = 96, chr = 92, dex = 110, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 352, eva = 331, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 349,
                         attack_skill = 276 },
                [80] = { acc = 357, eva = 336, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 354,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15262, 1 },  -- hydra salade
                    { 14517, 1 },  -- hydra haubert
                    { 14926, 1 },  -- hydra moufles
                    { 15597, 1 },  -- hydra brayettes
                    { 15682, 1 },  -- hydra sollerets
                } },
                { rate = 50, group = {  -- one of
                    { 15261, 1 },  -- hydra tiara
                    { 14516, 1 },  -- hydra harness
                    { 14925, 1 },  -- hydra mittens
                    { 15596, 1 },  -- hydra tights
                    { 15681, 1 },  -- hydra spats
                } },
                { rate = 50, group = {  -- one of
                    { 15260, 1 },  -- hydra beret
                    { 14515, 1 },  -- hydra doublet
                    { 14924, 1 },  -- hydra gloves
                    { 15595, 1 },  -- hydra brais
                    { 15680, 1 },  -- hydra gaiters
                } },
                { rate = 50, group = {  -- one of
                    { 15263, 1 },  -- hydra cap
                    { 14927, 1 },  -- hydra bracers
                    { 14518, 1 },  -- hydra jupon
                    { 15598, 1 },  -- hydra hose
                    { 15683, 1 },  -- hydra boots
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Taurus / Demon', notes = { 'Source species: Taurus (ID 217); family ID 94.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 10180, [79] = 10180, [80] = 10180 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Warrior',
            ids    = { 239, 278, 300, 345 },
            nm     = true,
            levels = {
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Thief',
            ids    = { 240, 288, 301, 354 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [77] = { acc = 344, eva = 391, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 327,
                         attack_skill = 266 },
                [78] = { acc = 349, eva = 396, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 356, eva = 402, agi = 112, int = 106, mnd = 79, chr = 79, dex = 120, def = 338,
                         attack_skill = 276 },
                [80] = { acc = 361, eva = 407, agi = 112, int = 106, mnd = 79, chr = 79, dex = 120, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Black Mage',
            ids    = { 243, 268, 305, 351 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 321,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 304, agi = 104, int = 117, mnd = 92, chr = 96, dex = 104, def = 326,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 309, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 331,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Beastmaster',
            ids    = { 244, 289, 306, 338 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [77] = { acc = 338, eva = 313, agi = 84, int = 90, mnd = 90, chr = 117, dex = 104, def = 327,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 318, agi = 84, int = 92, mnd = 92, chr = 117, dex = 104, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 323, agi = 85, int = 93, mnd = 93, chr = 120, dex = 106, def = 338,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 328, agi = 85, int = 93, mnd = 93, chr = 120, dex = 106, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindreds Vouivre',
            ids    = { 245, 290, 307, 339 },
            nm     = true,
            levels = {
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 3300, [78] = 3300, [79] = 3300, [80] = 3300 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Ninja',
            ids    = { 246, 279, 308, 362 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [77] = { acc = 341, eva = 343, agi = 110, int = 96, mnd = 78, chr = 84, dex = 110, def = 331,
                         attack_skill = 266 },
                [78] = { acc = 346, eva = 348, agi = 110, int = 96, mnd = 78, chr = 84, dex = 110, def = 336,
                         attack_skill = 271 },
                [79] = { acc = 352, eva = 354, agi = 112, int = 99, mnd = 79, chr = 85, dex = 112, def = 342,
                         attack_skill = 276 },
                [80] = { acc = 357, eva = 359, agi = 112, int = 99, mnd = 79, chr = 85, dex = 112, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Ranger',
            ids    = { 249, 285, 312, 348 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [77] = { acc = 382, eva = 305, agi = 117, int = 90, mnd = 96, chr = 90, dex = 96, def = 327,
                         attack_skill = 266 },
                [78] = { acc = 387, eva = 310, agi = 117, int = 92, mnd = 96, chr = 92, dex = 96, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 393, eva = 316, agi = 120, int = 93, mnd = 99, chr = 93, dex = 99, def = 338,
                         attack_skill = 276 },
                [80] = { acc = 398, eva = 321, agi = 120, int = 93, mnd = 99, chr = 93, dex = 99, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Samurai',
            ids    = { 250, 291, 313, 355 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [77] = { acc = 338, eva = 327, agi = 96, int = 90, mnd = 90, chr = 96, dex = 104, def = 331,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 332, agi = 96, int = 92, mnd = 92, chr = 96, dex = 104, def = 336,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 338, agi = 99, int = 93, mnd = 93, chr = 99, dex = 106, def = 342,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 343, agi = 99, int = 93, mnd = 93, chr = 99, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Monk',
            ids    = { 253, 296, 317, 358 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [77] = { acc = 341, eva = 321, agi = 84, int = 78, mnd = 96, chr = 90, dex = 110, def = 337,
                         attack_skill = 266 },
                [78] = { acc = 346, eva = 326, agi = 84, int = 78, mnd = 96, chr = 92, dex = 110, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 352, eva = 331, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 349,
                         attack_skill = 276 },
                [80] = { acc = 357, eva = 336, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 354,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5680, [78] = 5680, [79] = 5680, [80] = 5680 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred White Mage',
            ids    = { 254, 287, 318, 346 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [77] = { acc = 328, eva = 292, agi = 90, int = 90, mnd = 117, chr = 104, dex = 84, def = 327,
                         attack_skill = 266 },
                [78] = { acc = 333, eva = 298, agi = 92, int = 92, mnd = 117, chr = 104, dex = 84, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 338, eva = 302, agi = 93, int = 93, mnd = 120, chr = 106, dex = 85, def = 338,
                         attack_skill = 276 },
                [80] = { acc = 343, eva = 307, agi = 93, int = 93, mnd = 120, chr = 106, dex = 85, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Paladin',
            ids    = { 257, 269, 322, 360 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [77] = { acc = 331, eva = 310, agi = 78, int = 78, mnd = 104, chr = 104, dex = 90, def = 385,
                         attack_skill = 266 },
                [78] = { acc = 337, eva = 315, agi = 78, int = 78, mnd = 104, chr = 104, dex = 92, def = 390,
                         attack_skill = 271 },
                [79] = { acc = 342, eva = 320, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 397,
                         attack_skill = 276 },
                [80] = { acc = 347, eva = 325, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 402,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Dark Knight',
            ids    = { 258, 284, 323, 361 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [77] = { acc = 338, eva = 319, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 331,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 324, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 336,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 330, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 342,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Summoner',
            ids    = { 259, 271, 324, 342 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [77] = { acc = 331, eva = 295, agi = 96, int = 110, mnd = 110, chr = 110, dex = 90, def = 321,
                         attack_skill = 266 },
                [78] = { acc = 337, eva = 300, agi = 96, int = 110, mnd = 110, chr = 110, dex = 92, def = 326,
                         attack_skill = 271 },
                [79] = { acc = 342, eva = 305, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 331,
                         attack_skill = 276 },
                [80] = { acc = 347, eva = 310, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 2305, [78] = 2337, [79] = 2369, [80] = 2402 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindreds Avatar',
            ids    = { 260, 272, 325, 343 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 312,
                         attack_skill = 266 },
                [78] = { acc = 343, eva = 304, agi = 104, int = 117, mnd = 92, chr = 96, dex = 104, def = 317,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 309, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 322,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 327,
                         attack_skill = 281 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            links  = 2,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 3300, [78] = 3300, [79] = 3300, [80] = 3300 }, mp = { [77] = 1000, [78] = 1000, [79] = 1000, [80] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'EXP modifier -100%', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Red Mage',
            ids    = { 263, 283, 329, 359 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
                [78] = { acc = 339, eva = 313, agi = 92, int = 104, mnd = 104, chr = 96, dex = 96, def = 330,
                         attack_skill = 271 },
                [79] = { acc = 345, eva = 318, agi = 93, int = 106, mnd = 106, chr = 99, dex = 99, def = 335,
                         attack_skill = 276 },
                [80] = { acc = 350, eva = 323, agi = 93, int = 106, mnd = 106, chr = 99, dex = 99, def = 340,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 2245, [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Bard',
            ids    = { 264, 270, 330, 347 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [77] = { acc = 334, eva = 304, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 327,
                         attack_skill = 266 },
                [78] = { acc = 339, eva = 309, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 345, eva = 314, agi = 85, int = 99, mnd = 99, chr = 112, dex = 99, def = 338,
                         attack_skill = 276 },
                [80] = { acc = 350, eva = 319, agi = 85, int = 99, mnd = 99, chr = 112, dex = 99, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Dragoon',
            ids    = { 265, 280, 331, 340 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
                [78] = { acc = 361, eva = 332, agi = 96, int = 84, mnd = 92, chr = 104, dex = 96, def = 336,
                         attack_skill = 271 },
                [79] = { acc = 367, eva = 338, agi = 99, int = 85, mnd = 93, chr = 106, dex = 99, def = 342,
                         attack_skill = 276 },
                [80] = { acc = 372, eva = 343, agi = 99, int = 85, mnd = 93, chr = 106, dex = 99, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15073, 1 },  -- melee crown
                    { 15075, 1 },  -- sorcerers petasos
                    { 15076, 1 },  -- duelists chapeau
                    { 15079, 1 },  -- abyss burgeonet
                    { 15083, 1 },  -- saotome kabuto
                    { 15085, 1 },  -- wyrm armet
                    { 15086, 1 },  -- summoners horn
                    { 15087, 1 },  -- warriors lorica
                    { 15093, 1 },  -- valor surcoat
                    { 15097, 1 },  -- scouts jerkin
                    { 15104, 1 },  -- clerics mitts
                    { 15107, 1 },  -- assassins armlets
                    { 15110, 1 },  -- monster gloves
                    { 15114, 1 },  -- koga tekko
                    { 15126, 1 },  -- bards cannions
                } },
                { rate = 10, group = {  -- one of
                    { 11465, 1 },  -- mirage keffiyeh
                    { 11468, 1 },  -- commodore tricorne
                    { 11471, 1 },  -- pantin taj
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 5500, [78] = 5500, [79] = 5500, [80] = 5500 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindreds Wyvern',
            ids    = { 266, 281, 332, 341 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
                [78] = { acc = 361, eva = 332, agi = 96, int = 84, mnd = 92, chr = 104, dex = 96, def = 336,
                         attack_skill = 271 },
                [79] = { acc = 367, eva = 338, agi = 99, int = 85, mnd = 93, chr = 106, dex = 99, def = 342,
                         attack_skill = 276 },
                [80] = { acc = 372, eva = 343, agi = 99, int = 85, mnd = 93, chr = 106, dex = 99, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Shadow Wyvern (ID 237); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [77] = 3300, [78] = 3300, [79] = 3300, [80] = 3300 }, mp = { [77] = 0, [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Nightmare Cluster',
            ids    = { 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380,
                       381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398,
                       399, 400, 401, 402, 403, 404 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2034, 1 },  -- warriors lorica -1
                    { 2039, 1 },  -- melee cyclas -1
                    { 2044, 1 },  -- clerics bliaut -1
                    { 2049, 1 },  -- sorcerers coat -1
                    { 2054, 1 },  -- duelists tabard -1
                    { 2059, 1 },  -- assassins vest -1
                    { 2064, 1 },  -- valor surcoat -1
                    { 2069, 1 },  -- abyss cuirass -1
                    { 2074, 1 },  -- monster jackcoat -1
                    { 2079, 1 },  -- bards justaucorps -1
                    { 2084, 1 },  -- scouts jerkin -1
                    { 2089, 1 },  -- saotome domaru -1
                    { 2094, 1 },  -- koga chainmail -1
                    { 2099, 1 },  -- wyrm mail -1
                    { 2104, 1 },  -- summoners doublet -1
                } },
                { rate = 10, group = {  -- one of
                    { 2663, 1 },  -- mirage jubbah -1
                    { 2668, 1 },  -- commodore frac -1
                    { 2673, 1 },  -- pantin tobe -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Cluster / Arcana', notes = { 'Source species: Cluster (ID 59); family ID 25.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
